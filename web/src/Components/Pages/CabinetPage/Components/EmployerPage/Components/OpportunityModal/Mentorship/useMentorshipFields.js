import { useState, useEffect } from 'react';

const useMentorshipFields = (notification, onRefresh) => {
    const [isLoading, setIsLoading] = useState(false);

    const fetchMentorshipData = async () => {
        setIsLoading(true);
        try {
            if (onRefresh) onRefresh();
        } catch (e) {
            if (notification) {
                notification.error({
                    message: 'Ошибка загрузки',
                    description: 'Не удалось загрузить данные менторства'
                });
            }
        } finally {
            setIsLoading(false);
        }
    };

    useEffect(() => {
        fetchMentorshipData();
    }, []);

    return {
        isLoading,
        refresh: fetchMentorshipData
    };
};

export default useMentorshipFields;