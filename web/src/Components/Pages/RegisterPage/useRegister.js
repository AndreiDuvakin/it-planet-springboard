import {Form, message, notification} from 'antd';
import {useNavigate} from 'react-router-dom';
import {useEffect} from "react";
import {useSelector} from "react-redux";
import {useGetAllRolesForRegisterQuery} from "../../../Api/rolesApi.js";
import {useRegisterUserMutation} from "../../../Api/usersApi.js";
import {ROLES_MAP} from "../../../Core/constants.js";

export default function useRegister() {
    const navigate = useNavigate();
    const [form] = Form.useForm();

    const {user, userData} = useSelector((state) => state.auth);

    const [
        createUser,
        {
            isLoading,
        }
    ] = useRegisterUserMutation();

    const {
        data: roles = [],
        isLoading: isLoadingRoles,
    } = useGetAllRolesForRegisterQuery(undefined, {
        pollingInterval: 60000,
    });

    useEffect(() => {
        if (user && userData) {
            navigate("/");
        }
        document.title = "Платформа для поиска работы \"Трамплин\" - Регистрация";
    }, [user, userData, navigate]);

    const onFinish = async (values) => {
        const payload = {
            ...values,
            birthdate: values.birthdate
                ? values.birthdate.format("YYYY-MM-DD")
                : null,
        };

        try {
            const resp = await createUser(payload);

            console.log(resp);
            if (resp?.status !== 200) {
                notification.error({
                    title: "Ошибка",
                    description: resp?.error?.data?.detail || "Пользователь не создан",
                    duration: 30000
                })
                return;
            }
            notification.success({
                title: "Успешно",
                description: "Пользователь успешно создан",
                placement: "topRight",
            })
            navigate('/login');
        } catch {
            notification.error({
                title: "Ошибка",
                description: "Пользователь не создан",
                placement: "topRight",
            })
        }
    };

    const goToLogin = () => {
        navigate('/login');
    };

    const radioOptions = roles.map((role, idx) => (
        {
            value: role.id,
            className: `role-${idx}`,
            label: ROLES_MAP[role.title],
        }
    ));

    const defaultRoleValue = roles[0]?.id;

    useEffect(() => {
        if (roles.length > 0) {
            form.setFieldsValue({
                role_id: defaultRoleValue,
            });
        }
    }, [roles, form, defaultRoleValue]);

    return {
        form,
        defaultRoleValue,
        isLoading: isLoadingRoles | isLoading,
        radioOptions,
        onFinish,
        goToLogin,
    };
}