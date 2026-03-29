import { useState } from 'react';
import { Form, notification } from 'antd';
import { useGetAllUsersQuery } from '../../../../../../../Api/usersApi.js';
import { ROLES } from '../../../../../../../Core/constants.js';

const useCuratorsTab = () => {
    const [form] = Form.useForm();
    const [loading, setLoading] = useState(false);
    const { data: allUsers = [], isLoading: usersLoading } = useGetAllUsersQuery();

    const curators = allUsers.filter(user => user.role?.title === ROLES.MODERATOR);

    const handleCreateCurator = async (values) => {
        setLoading(true);
        try {
            notification.success({
                message: 'Куратор создан',
                description: 'Доступ будет отправлен на указанную почту.',
            });
            form.resetFields();
        } catch (error) {
            notification.error({
                message: 'Ошибка создания',
                description: 'Возможно, такой email уже занят.',
            });
        } finally {
            setLoading(false);
        }
    };

    return {
        form,
        loading,
        handleCreateCurator,
        curators,
        usersLoading,
    };
};

export default useCuratorsTab;