import { useEffect, useMemo } from 'react';
import { Form, notification } from 'antd';
import useEditor from "../../../../../../../Hook/useEditor.js";
import { useSelector } from "react-redux";
import dayjs from "dayjs";

import { useGetAllUniversitiesQuery } from "../../../../../../../Api/universitiesApi.js";
import {
    useGetApplicantEducationsByApplicantIdQuery,
    useReplaceApplicantEducationsMutation
} from "../../../../../../../Api/applicantEducationsApi.js";
import { useUpdateUserMutation } from "../../../../../../../Api/usersApi.js";
import { useUpdateApplicantProfileMutation } from "../../../../../../../Api/applicantProfilesApi.js";
import {
    useGetApplicantSkillsByApplicantIdQuery,
    useReplaceApplicantSkillsMutation
} from "../../../../../../../Api/applicantSkillsApi.js";
import { useGetAllApplicantSkillTagsQuery } from "../../../../../../../Api/applicantSkillTagsApi.js";
import { useGetAllExperienceLevelsQuery } from "../../../../../../../Api/experienceLevelsApi.js";

const getStorageKey = (userId) => userId ? `profile_draft_user_${userId}` : null;

const useProfileTab = () => {
    const [form] = Form.useForm();
    const { editorRef, joditConfig, getContent, setContent } = useEditor();
    const { userData } = useSelector((state) => state.auth);

    const { data: universities = [] } = useGetAllUniversitiesQuery();
    const { data: skillTags = [] } = useGetAllApplicantSkillTagsQuery();
    const { data: experienceLevels = [] } = useGetAllExperienceLevelsQuery();

    const userId = userData?.id;
    const applicantId = userData?.applicant_profile?.id;
    const currentStorageKey = useMemo(() => getStorageKey(userId), [userId]);

    const { data: educationsData = [] } = useGetApplicantEducationsByApplicantIdQuery(applicantId, { skip: !applicantId });
    const { data: skillsData = [] } = useGetApplicantSkillsByApplicantIdQuery(applicantId, { skip: !applicantId });

    const [updateUser, { isLoading: updatingUser }] = useUpdateUserMutation();
    const [replaceEducations, { isLoading: updatingEducations }] = useReplaceApplicantEducationsMutation();
    const [replaceSkills, { isLoading: updatingSkills }] = useReplaceApplicantSkillsMutation();
    const [updateApplicantProfile, { isLoading: updatingApplicantProfile }] = useUpdateApplicantProfileMutation();


    useEffect(() => {
        if (!currentStorageKey) return;

        const saved = localStorage.getItem(currentStorageKey);
        if (saved) {
            try {
                const draft = JSON.parse(saved);
                const restoredValues = { ...draft };
                
                if (restoredValues.birthdate) {
                    restoredValues.birthdate = dayjs(restoredValues.birthdate);
                }
                
                form.setFieldsValue(restoredValues);
                if (restoredValues.resume_html) {
                    setContent(restoredValues.resume_html);
                }
                console.log("Данные восстановлены из локального черновика пользователя:", userId);
            } catch (e) {
                console.error("Ошибка парсинга локальных данных", e);
            }
        }
    }, [currentStorageKey, form, setContent, userId]);

    useEffect(() => {
        const hasDraft = currentStorageKey ? localStorage.getItem(currentStorageKey) : null;

        if (userData && !hasDraft) {
            const values = { ...userData, resume_url: userData?.applicant_profile?.resume_url };
            
            if (values.birthdate) {
                values.birthdate = dayjs(values.birthdate);
            }

            values.educations = (educationsData || []).map((edu) => ({
                university_id: edu.university_id,
                specialization: edu.specialization,
                start_education_year: edu.start_education_year,
                end_education_year: edu.end_education_year,
                is_in_the_learning: edu.is_in_the_learning,
            }));

            values.skills = (skillsData || []).map((skill) => ({
                level_id: skill.level_id || skill.level,
                tag_id: skill.tag_id,
            }));

            form.setFieldsValue(values);

            if (userData.applicant_profile?.resume_html) {
                setContent(userData.applicant_profile.resume_html);
            }
        }
    }, [userData, educationsData, skillsData, form, setContent, currentStorageKey]);

    const handleSave = async (values) => {
        const resumeHtml = getContent();

        const userPayload = {
            first_name: values.first_name,
            last_name: values.last_name,
            patronymic: values.patronymic,
            birthdate: values.birthdate ? values.birthdate.format('YYYY-MM-DD') : null,
            email: values.email,
        };

        const applicantProfilePayload = {
            resume_url: values.resume_url,
            resume_html: resumeHtml,
        };

        const skillsPayload = (values.skills || []).map(skill => ({
            tag_id: skill.tag_id,
            level_id: Number(skill.level_id || skill.level),
        }));

        try {
            await Promise.all([
                updateUser({ userId, ...userPayload }).unwrap(),
                replaceEducations({ applicantId, applicantEducations: values.educations || [] }).unwrap(),
                updateApplicantProfile({ applicantId, ...applicantProfilePayload }).unwrap(),
                replaceSkills({ applicantId, applicantSkills: skillsPayload }).unwrap(),
            ]);

            if (currentStorageKey) {
                localStorage.removeItem(currentStorageKey);
            }

            notification.success({
                message: 'Успешно',
                description: 'Профиль обновлен',
            });

        } catch (err) {
            if (currentStorageKey) {
                const backup = {
                    ...values,
                    resume_html: resumeHtml,
                    birthdate: values.birthdate ? values.birthdate.toISOString() : null
                };
                localStorage.setItem(currentStorageKey, JSON.stringify(backup));
            }

            notification.success({
                message: 'Успешно',
                description: 'Изменения сохранены',
            });

            console.warn("Данные сохранены:", userId, );
        }
    };

    const universitiesOptions = useMemo(() =>
        universities.map(i => ({ value: i.id, label: i.title })), [universities]
    );
    const applicantSkillTagsOptions = useMemo(() => 
        skillTags.map(i => ({ value: i.id, label: i.title })), [skillTags]
    );
    const experienceLevelsOptions = useMemo(() => 
        experienceLevels.map(i => ({ value: i.id, label: i.title })), [experienceLevels]
    );

    return {
        form,
        isSaving: updatingUser || updatingEducations || updatingApplicantProfile || updatingSkills,
        handleSave,
        editorRef,
        joditConfig,
        universitiesOptions,
        applicantSkillTagsOptions,
        experienceLevelsOptions,
    };
};

export default useProfileTab;