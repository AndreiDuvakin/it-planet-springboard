import { useCreateVacancyMutation } from '../../../../../../../Api/vacanciesApi';
import { useCreateInternshipMutation } from '../../../../../../../Api/internshipsApi';
import { useGetProfileQuery } from '../../../../../../../Api/companyApi'; // Импортируем профиль

const useOpportunityModal = (form, mode, kind, editingId, onClose, notification) => {
    const [createVacancy, { isLoading: isVacancyCreating }] = useCreateVacancyMutation();
    const [createInternship, { isLoading: isInternshipCreating }] = useCreateInternshipMutation();

    // Получаем данные компании, чтобы знать company_id
    const { data: companyProfile } = useGetProfileQuery();

    const handleSubmit = async () => {
        try {
            const values = await form.validateFields();

            const payload = {
                ...values,
                expires_at: values.expires_at ? values.expires_at.toISOString() : null,
                tag_ids: values.tags || [],
                duration_months: Number(values.duration_months) || 0,
                is_paid: !!values.is_paid,
                mentorship_available: !!values.mentorship_available,
                // Теперь нам НЕ НУЖНО слать published_at и company_id вручную!
            };

            if (mode === 'create') {
                if (kind === 'vacancy') {
                    await createVacancy(payload).unwrap();
                } else if (kind === 'internship') {
                    await createInternship(payload).unwrap();
                }
            }

            // Используем нормальный вызов antd notification
            notification.success({ message: 'Стажировка успешно создана!' });
            onClose();
            form.resetFields();
        } catch (error) {
            console.error('Save error:', error);

            // Безопасный вызов уведомления об ошибке
            const desc = error.data?.detail?.[0]?.msg || 'Проверьте правильность заполнения полей';
            notification.error({
                message: 'Ошибка сохранения',
                description: desc
            });
        }
    };

    return {
        handleSubmit,
        isSubmitting: isVacancyCreating || isInternshipCreating,
    };
};

export default useOpportunityModal;