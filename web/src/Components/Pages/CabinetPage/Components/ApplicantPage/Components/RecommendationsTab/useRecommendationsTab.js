import { useState } from 'react';
import { notification } from 'antd';

const useRecommendationsTab = (onRefresh) => {
    const [loading, setLoading] = useState(false);

    const handleAction = async (id, action) => {
        setLoading(true);
        try {
            notification.success({ message: action === 'accept' ? 'Рекомендация принята' : 'Отклонено' });
            if (onRefresh) onRefresh();
        } catch (e) {
            notification.error({ message: 'Ошибка при обработке' });
        } finally {
            setLoading(false);
        }
    };

    return { loading, handleAction };
};

export default useRecommendationsTab;