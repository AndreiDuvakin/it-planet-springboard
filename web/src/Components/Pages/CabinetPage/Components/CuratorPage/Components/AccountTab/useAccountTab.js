import { useState, useEffect } from 'react';
import { Form, notification } from 'antd';

const useAccountTab = () => {
    const [form] = Form.useForm();
    const [loading, setLoading] = useState(false);

    const fetchProfile = async () => {
        setLoading(true);
        try {
        } catch (error) {
            notification.error({ message: 'Ошибка загрузки профиля' });
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => { fetchProfile(); }, []);

    const handleSave = async (values) => {
        setLoading(true);
        try {
            notification.success({ message: 'Данные успешно обновлены' });
        } catch (error) {
            notification.error({ message: 'Не удалось сохранить изменения' });
        } finally {
            setLoading(false);
        }
    };

    return { form, loading, handleSave };
};

export default useAccountTab;