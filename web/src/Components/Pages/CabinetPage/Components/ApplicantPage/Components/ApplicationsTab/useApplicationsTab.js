import { useState } from 'react';
import { notification } from 'antd';

const useApplicationsTab = (onRefresh) => {
    const [loading, setLoading] = useState(false);

    const cancelApplication = async (id) => {
        setLoading(true);
        try {
            notification.success({ message: 'Отклик отозван' });
            if (onRefresh) onRefresh();
        } catch (error) {
            notification.error({ message: 'Ошибка при отзыве' });
        } finally {
            setLoading(false);
        }
    };

    return { loading, cancelApplication };
};

export default useApplicationsTab;