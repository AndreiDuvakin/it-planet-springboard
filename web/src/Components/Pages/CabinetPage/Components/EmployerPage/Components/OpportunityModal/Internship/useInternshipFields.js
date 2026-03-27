import {
    useGetExperienceLevelsQuery,
    useGetWorkFormatsQuery
} from '../../../../../../../../Api/dictionariesApi.js';

const useInternshipFields = () => {
    // Вызываем хуки из твоего API справочников
    const expRes = useGetExperienceLevelsQuery();
    const workRes = useGetWorkFormatsQuery();

    const dictionaries = {
        // Мапим данные под формат Ant Design { label, value }
        // Используем item.title, как в твоем примере для вакансий
        experienceLevels: expRes.data?.map(item => ({
            label: item.title,
            value: item.id
        })) || [],
        workFormats: workRes.data?.map(item => ({
            label: item.title,
            value: item.id
        })) || [],
    };

    const isLoading = expRes.isLoading || workRes.isLoading;
    const isError = expRes.isError || workRes.isError;

    return {
        dictionaries,
        isLoading,
        isError
    };
};

export default useInternshipFields;