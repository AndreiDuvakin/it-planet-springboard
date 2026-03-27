import {
    useGetEmploymentTypesQuery,
    useGetExperienceLevelsQuery,
    useGetWorkFormatsQuery
} from '../../../../../../../../Api/dictionariesApi.js';

const useVacancyFields = () => {
    // 3 отдельных вызова — в консоли (Network) будет 3 отдельных запроса
    const empRes = useGetEmploymentTypesQuery();
    const expRes = useGetExperienceLevelsQuery();
    const workRes = useGetWorkFormatsQuery();

    const dictionaries = {
        employmentTypes: empRes.data?.map(item => ({
            label: item.title,
            value: item.id
        })) || [],
        experienceLevels: expRes.data?.map(item => ({
            label: item.title,
            value: item.id
        })) || [],
        workFormats: workRes.data?.map(item => ({
            label: item.title,
            value: item.id
        })) || [],
    };

    const isLoading = empRes.isLoading || expRes.isLoading || workRes.isLoading;
    const isError = empRes.isError || expRes.isError || workRes.isError;

    return {
        dictionaries,
        isLoading,
        isError
    };
};

export default useVacancyFields;