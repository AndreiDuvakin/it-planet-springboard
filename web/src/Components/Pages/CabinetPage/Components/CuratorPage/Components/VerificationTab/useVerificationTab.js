import { useState } from 'react';
import { notification } from 'antd';

const useVerificationTab = () => {
    const [loading, setLoading] = useState(false);

    const handleVerify = async (id, decision) => {
        setLoading(true);
        try {
            const messages = {
                approve: 'Компания верифицирована',
                reject: 'Заявка отклонена',
                clarify: 'Запрос на уточнение отправлен'
            };

            notification.success({ message: messages[decision] });
        } catch (error) {
            notification.error({ message: 'Ошибка обработки заявки' });
        } finally {
            setLoading(false);
        }
    };

    return { loading, handleVerify };
};

export default useVerificationTab;