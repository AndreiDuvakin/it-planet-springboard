import { useState, useEffect } from 'react';

const useEventFields = (notification, onRefresh) => {
    const [eventTypes, setEventTypes] = useState([]);
    const [isLoading, setIsLoading] = useState(false);

    const fetchEventTypes = async () => {
        setIsLoading(true);
        try {
            if (onRefresh) onRefresh();
        } catch (e) {
            if (notification) {
                notification.error({
                    message: 'Ошибка сервера',
                    description: 'Не удалось загрузить типы мероприятий'
                });
            }
        } finally {
            setIsLoading(false);
        }
    };

    useEffect(() => {
        fetchEventTypes();
    }, []);

    return {
        eventTypes,
        isLoading,
        refresh: fetchEventTypes
    };
};

export default useEventFields;