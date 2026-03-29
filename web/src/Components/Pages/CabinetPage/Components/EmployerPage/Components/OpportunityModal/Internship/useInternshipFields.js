import {
    useGetExperienceLevelsQuery,
    useGetWorkFormatsQuery
} from '../../../../../../../../Api/dictionariesApi.js';

const useInternshipFields = () => {
    const expRes = useGetExperienceLevelsQuery();
    const workRes = useGetWorkFormatsQuery();

    const dictionaries = {
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

    return { dictionaries, isLoading, isError };
};

export default useInternshipFields;
