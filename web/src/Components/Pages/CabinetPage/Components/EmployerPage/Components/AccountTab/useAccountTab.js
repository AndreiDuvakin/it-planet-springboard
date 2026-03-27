import { useState, useEffect } from 'react';
import { Form } from 'antd';

const useAccountTab = (notify) => {
    const [form] = Form.useForm();
    const [isLoading, setIsLoading] = useState(false);
    const [isSaving, setIsSaving] = useState(false);

    useEffect(() => {
        const fetchUserData = async () => {
            setIsLoading(true);
            try {
            } catch (error) {
                notify('Ошибка', 'Не удалось загрузить данные', 'error');
            } finally {
                setIsLoading(false);
            }
        };
        fetchUserData();
    },[form, notify]);

    const handleSave = async (values) => {
        setIsSaving(true);
        try {
            notify('Успешно', 'Личные данные сохранены');
        } catch (error) {
            notify('Ошибка', 'Не удалось сохранить данные', 'error');
        } finally {
            setIsSaving(false);
        }
    };

    return { form, isLoading, isSaving, handleSave };
};

export default useAccountTab;