import { useState } from 'react';
import { notification } from 'antd';

const useModerationTab = () => {
    const [submitting, setSubmitting] = useState(false);

    const handleChangeStatus = async (id, status) => {
        setSubmitting(true);
        try {
            notification.success({ message: 'Статус карточки изменен' });
        } catch (error) {
            notification.error({ message: 'Ошибка при смене статуса' });
        } finally {
            setSubmitting(false);
        }
    };

    const handleSaveComment = async (id, comment) => {
        try {
            notification.info({ message: 'Комментарий обновлен' });
        } catch (error) {
            notification.error({ message: 'Не удалось сохранить комментарий' });
        }
    };

    return { submitting, handleChangeStatus, handleSaveComment };
};

export default useModerationTab;