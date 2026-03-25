import {useEffect} from 'react';
import {Form, notification} from 'antd';
import useEditor from "../../../../../../../Hook/useEditor.js";
import {useSelector} from "react-redux";
import dayjs from "dayjs";
import {useGetAllUniversitiesQuery} from "../../../../../../../Api/universitiesApi.js";
import {
    useGetApplicantEducationsByApplicantIdQuery,
    useReplaceApplicantEducationsMutation
} from "../../../../../../../Api/applicantEducationsApi.js";
import {useUpdateUserMutation} from "../../../../../../../Api/usersApi.js";
import {useUpdateApplicantProfileMutation} from "../../../../../../../Api/applicantProfilesApi.js";
import {
    useGetApplicantSkillsByApplicantIdQuery,
    useReplaceApplicantSkillsMutation
} from "../../../../../../../Api/applicantSkillsApi.js";
import {useGetAllApplicantSkillTagsQuery} from "../../../../../../../Api/applicantSkillTagsApi.js";
import {useGetAllExperienceLevelsQuery} from "../../../../../../../Api/experienceLevelsApi.js";

const useProfileTab = () => {
    const [form] = Form.useForm();
    const {editorRef, joditConfig, getContent, setContent} = useEditor();
    const {userData} = useSelector((state) => state.auth);

    const {
        data: universities = [],
    } = useGetAllUniversitiesQuery();

    const {
        data: skillTags = [],
    } = useGetAllApplicantSkillTagsQuery();

    const {
        data: experienceLevels = [],
    } = useGetAllExperienceLevelsQuery();

    const {
        data: educationsData = [],
        isLoading: educationsLoading,
    } = useGetApplicantEducationsByApplicantIdQuery(userData?.applicant_profile?.id, {
        skip: !userData?.applicant_profile?.id,
    });

    const {
        data: skillsData = [],
        isLoading: skillsLoading,
    } = useGetApplicantSkillsByApplicantIdQuery(userData?.applicant_profile?.id, {
        skip: !userData?.applicant_profile?.id,
    })

    const [updateUser, {isLoading: updatingUser}] = useUpdateUserMutation();
    const [replaceEducations, {isLoading: updatingEducations}] = useReplaceApplicantEducationsMutation();
    const [replaceSkills, {isLoading: updatingSkills}] = useReplaceApplicantSkillsMutation();
    const [updateApplicantProfile, {isLoading: updatingApplicantProfile}] = useUpdateApplicantProfileMutation();

    useEffect(() => {
        if (userData) {
            const values = {...userData, resume_url: userData?.applicant_profile?.resume_url};

            if (values.birthdate) {
                values.birthdate = dayjs(values.birthdate);
            }

            values.educations = educationsData.map((edu) => ({
                university_id: edu.university_id,
                specialization: edu.specialization,
                start_education_year: edu.start_education_year,
                end_education_year: edu.end_education_year,
                is_in_the_learning: edu.is_in_the_learning,
            }));

            values.skills = skillsData.map((skill) => ({
                level_id: skill.level_id,
                tag_id: skill.tag_id,
            }))

            form.setFieldsValue(values);

            if (userData.applicant_profile) {
                values.resume_url = userData.applicant_profile.resume_url || '';

                const resumeHtml = userData.applicant_profile.resume_html;
                if (resumeHtml !== undefined) {
                    setContent(resumeHtml || '');
                }
            }
        }
    }, [userData, educationsData, form, setContent, skillsData]);

    const handleSave = async (values) => {
        try {
            const applicantId = userData?.applicant_profile?.id;
            const userId = userData?.id;

            const userPayload = {
                first_name: values.first_name,
                last_name: values.last_name,
                patronymic: values.patronymic,
                birthdate: values.birthdate ? values.birthdate.format('YYYY-MM-DD') : null,
                email: values.email,
            };

            const applicantProfilePayload = {
                resume_url: values.resume_url,
                resume_html: getContent(),
            };

            const educationsPayload = values.educations || [];

            const skillsPayload = values.skills || [];

            await Promise.all([
                updateUser({userId, ...userPayload}).unwrap(),
                replaceEducations({applicantId: applicantId, applicantEducations: educationsPayload}).unwrap(),
                updateApplicantProfile({applicantId: applicantId, ...applicantProfilePayload}).unwrap(),
                replaceSkills({applicantId: applicantId, applicantSkills: skillsPayload}).unwrap(),
            ]);

            notification.success({
                title: 'Успешно',
                description: 'Профиль и образование обновлены',
            });

        } catch (err) {
            console.error(err);
            notification.error({
                title: 'Ошибка',
                description: 'Не удалось сохранить изменения',
            });
        }
    };

    const universitiesOptions = universities.map((item) => ({
        value: item.id,
        label: item.title,
    }));

    const applicantSkillTagsOptions = skillTags.map((item) => ({
        value: item.id,
        label: item.title,
    }));

    const experienceLevelsOptions = experienceLevels.map((item) => ({
        value: item.id,
        label: item.title,
    }))

    return {
        form,
        isSaving: updatingUser || updatingEducations || updatingApplicantProfile || educationsLoading || skillsLoading || updatingSkills,
        handleSave,
        editorRef,
        joditConfig,
        universitiesOptions,
        applicantSkillTagsOptions,
        experienceLevelsOptions,
    };
};

export default useProfileTab;