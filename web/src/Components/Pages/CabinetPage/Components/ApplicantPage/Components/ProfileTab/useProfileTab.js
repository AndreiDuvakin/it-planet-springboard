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

const useProfileTab = () => {
    const [form] = Form.useForm();
    const {editorRef, joditConfig, getContent, setContent} = useEditor();
    const {userData} = useSelector((state) => state.auth);

    const {
        data: universities = [],
    } = useGetAllUniversitiesQuery();

    const {
        data: educationsData = [],
        isLoading: educationsLoading,
    } = useGetApplicantEducationsByApplicantIdQuery(userData?.applicant_profile?.id, {
        skip: !userData?.applicant_profile?.id,
    });

    const [updateUser, {isLoading: updatingUser}] = useUpdateUserMutation();
    const [replaceEducations, {isLoading: updatingEducations}] = useReplaceApplicantEducationsMutation();
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

            form.setFieldsValue(values);

            if (userData.applicant_profile) {
                values.resume_url = userData.applicant_profile.resume_url || '';

                const resumeHtml = userData.applicant_profile.resume_html;
                if (resumeHtml !== undefined) {
                    setContent(resumeHtml || '');
                }
            }
        }
    }, [userData, educationsData, form, setContent]);

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
            }

            const educationsPayload = values.educations || [];

            await Promise.all([
                updateUser({userId, ...userPayload}).unwrap(),
                replaceEducations({applicantId: applicantId, applicantEducations: educationsPayload}).unwrap(),
                updateApplicantProfile({applicantId: applicantId, ...applicantProfilePayload}).unwrap(),
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
    }))

    return {
        form,
        isSaving: updatingUser || updatingEducations || updatingApplicantProfile || educationsLoading,
        handleSave,
        editorRef,
        joditConfig,
        universitiesOptions,
    };
};

export default useProfileTab;