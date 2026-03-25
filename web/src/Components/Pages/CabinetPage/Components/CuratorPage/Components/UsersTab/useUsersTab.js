import { useState } from 'react';
import { notification } from 'antd';

const useUsersTab = () => {
    const [actionLoading, setActionLoading] = useState(false);

    const handleUserStatus = async (userId, newStatus) => {
        setActionLoading(true);
        try {
            notification.success({
                message: 'Статус обновлен',
                description: `Пользователь теперь: ${newStatus}`
            });
        } catch (error) {
            notification.error({ message: 'Ошибка управления пользователем' });
        } finally {
            setActionLoading(false);
        }
    };

    return { actionLoading, handleUserStatus };
};

export default useUsersTab;