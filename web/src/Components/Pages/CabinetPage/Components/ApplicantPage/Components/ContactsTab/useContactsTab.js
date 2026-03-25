import { useState } from 'react';
import { notification } from 'antd';

const useContactsTab = (onRefresh) => {
    const [loading, setLoading] = useState(false);

    const removeContact = async (id) => {
        setLoading(true);
        try {
            notification.success({ message: 'Контакт удален' });
            if (onRefresh) onRefresh();
        } catch (e) {
            notification.error({ message: 'Не удалось удалить контакт' });
        } finally {
            setLoading(false);
        }
    };

    return { loading, removeContact };
};

export default useContactsTab;