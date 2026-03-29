import { useState } from 'react';
import { notification } from 'antd';
import { useUpdateUserMutation } from '../../../../../../../Api/usersApi.js';

const useUsersTab = (onRefresh) => {
    const [actionLoading, setActionLoading] = useState(false);
    const [updateUser] = useUpdateUserMutation();

    const handleStatus = async (userId, statusData) => {
        setActionLoading(true);
        try {
            await updateUser({ userId, ...statusData }).unwrap();
            notification.success({
                message: 'Статус пользователя обновлен',
            });
            if (onRefresh) onRefresh();
        } catch (error) {
            const msg = error?.data?.detail || 'Ошибка при обновлении статуса';
            notification.error({ message: msg });
        } finally {
            setActionLoading(false);
        }
    };

    return { actionLoading, handleStatus };
};

export default useUsersTab;