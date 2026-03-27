import { useEffect } from 'react';
import { Form, notification } from 'antd';
import { useGetProfileQuery, useCreateOrUpdateCompanyMutation } from "../../../../../../../Api/companyApi";
import { useGetAllIndustriesQuery } from "../../../../../../../Api/industriesApi";

const useCompanyTab = () => {
    const [form] = Form.useForm();
    const { data: industries = [], isLoading: isDictLoading } = useGetAllIndustriesQuery();
    const { data: companyData, isLoading: isFetching } = useGetProfileQuery();
    const [saveCompany, { isLoading: isSaving }] = useCreateOrUpdateCompanyMutation();

    useEffect(() => {
        if (companyData) {
            form.setFieldsValue({
                name: companyData.title,
                inn: companyData.inn,
                about: companyData.description,
                area: companyData.industry_id,
                corporate_email: companyData.corporate_email,
                site: companyData.website_url,
                video_url: companyData.video_url,
                socials: companyData.socials || [],

                // Сохраняем ID для отправки
                logo_id: companyData.logo?.id,
                official_photo_id: companyData.official_photo?.id,

                // Формируем fileList для отображения превью в компоненте Upload
                logo_file: companyData.logo ? [{
                    uid: '-1',
                    name: companyData.logo.filename,
                    status: 'done',
                    url: `http://localhost:5000${companyData.logo.url}`,
                }] : [],
                photo_file: companyData.official_photo ? [{
                    uid: '-2',
                    name: companyData.official_photo.filename,
                    status: 'done',
                    url: `http://localhost:5000${companyData.official_photo.url}`,
                }] : [],
            });
        }
    }, [companyData, form]);

    const handleSave = async (values) => {
        try {
            const payload = {
                title: values.name,
                description: values.about,
                inn: values.inn,
                website_url: values.site,
                corporate_email: values.corporate_email,
                video_url: values.video_url,
                industry_id: Number(values.area),
                socials: (values.socials || []).map(s => ({ title: s.title, link: s.link })),
                logo_id: values.logo_id,
                official_photo_id: values.official_photo_id,
            };

            await saveCompany(payload).unwrap();
            notification.success({ message: 'Успешно', description: 'Профиль компании обновлен' });
        } catch (error) {
            notification.error({
                message: 'Ошибка',
                description: error.data?.detail?.[0]?.msg || 'Не удалось сохранить данные',
            });
        }
    };

    return {
        form,
        isLoading: isDictLoading || isFetching,
        isSaving,
        handleSave,
        dictionaries: industries,
    };
};

export default useCompanyTab;