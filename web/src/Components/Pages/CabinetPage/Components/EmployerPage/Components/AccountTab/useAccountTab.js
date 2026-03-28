import {useState, useEffect} from 'react'
import {Form, notification} from 'antd'
import dayjs from 'dayjs'
import {
    useGetAuthenticatedUserDataQuery,
    useUpdateUserMutation,
    useUpdateUserPasswordMutation
} from '../../../../../../../Api/usersApi.js'
import {useSelector} from "react-redux";

const useAccountTab = (notify) => {
    const [form] = Form.useForm()
    const [isSaving, setIsSaving] = useState(false)
    const {data: me, isLoading, refetch} = useGetAuthenticatedUserDataQuery(undefined, {
        pollingInterval: 60000,
    })
    const [passwordForm] = Form.useForm();

    const [updateUser] = useUpdateUserMutation()
    const [updatePassword] = useUpdateUserPasswordMutation()
    const {userData} = useSelector((state) => state.auth);


    const [
        changeUserPassword,
        {
            isLoading: isLoadingChangePassword,
            isError: isErrorChangePassword,
        }
    ] = useUpdateUserPasswordMutation();

    const handlePasswordFinish = async () => {
        const values = passwordForm.getFieldsValue();
        const payload = {
            ...values,
        };

        try {
            await changeUserPassword({userId: userData.id, ...payload}).unwrap();
            notification.success({
                title: "Пароль изменен",
                description: "Пароль успешно изменен",
                placement: "topRight",
            });
            passwordForm.resetFields();
        } catch (error) {
            notification.error({
                title: "Ошибка изменения пароля",
                description: error?.data?.detail || "Не удалось изменить пароль",
                placement: "topRight",
            });
        }
    };
    useEffect(() => {
        if (userData) {
            const values = {...userData, resume_url: userData?.applicant_profile?.resume_url};

            if (values.birthdate) {
                values.birthdate = dayjs(values.birthdate);
            }


            form.setFieldsValue(values);

        }
    }, [userData, form]);

    const handleSave = async (values) => {
        try {
            const userId = userData?.id;

            const userPayload = {
                first_name: values.first_name,
                last_name: values.last_name,
                patronymic: values.patronymic,
                birthdate: values.birthdate ? values.birthdate.format('YYYY-MM-DD') : null,
                email: values.email,
            };
            await updateUser({userId, ...userPayload}).unwrap();

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


    return {
        form,
        passwordForm,
        isLoading,
        isSaving,
        handleSave,
        handlePasswordFinish,
    }
}

export default useAccountTab
