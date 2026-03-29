import { useState, useMemo } from 'react';
import { notification } from 'antd';
import { useActivateUserMutation, useGetAllUsersQuery } from '../../../../../../../Api/usersApi.js';

const useUsersTab = () => {
    const [actionLoading, setActionLoading] = useState(false);
    const [activateUser] = useActivateUserMutation();

    const { data: usersData = [], refetch, isLoading } = useGetAllUsersQuery(undefined, {
        pollingInterval: 30000,
    });

    const handleStatus = async (userId, isActivated) => {
        setActionLoading(true);
        try {
            await activateUser({ user_id: userId, is_activated: isActivated }).unwrap();
            notification.success({ message: 'Статус обновлен' });
            refetch();
        } catch (error) {
            notification.error({ message: error?.data?.detail || 'Ошибка обновления' });
        } finally {
            setActionLoading(false);
        }
    };

    return { 
        handleStatus, 
        actionLoading, 
        usersData,
        isLoading 
    };
};

export default useUsersTab;