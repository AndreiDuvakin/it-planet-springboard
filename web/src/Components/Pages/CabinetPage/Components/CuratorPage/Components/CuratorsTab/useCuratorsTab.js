import { useState } from 'react';
import { Form, notification } from 'antd';

const useCuratorsTab = () => {
    const [form] = Form.useForm();
    const [loading, setLoading] = useState(false);

    const handleCreateCurator = async (values) => {
        setLoading(true);
        try {
            notification.success({
                message: 'Куратор создан',
                description: 'Доступ будет отправлен на указанную почту.'
            });
            form.resetFields();
        } catch (error) {
            notification.error({
                message: 'Ошибка создания',
                description: 'Возможно, такой email уже занят.'
            });
        } finally {
            setLoading(false);
        }
    };

    return { form, loading, handleCreateCurator };
};

export default useCuratorsTab;