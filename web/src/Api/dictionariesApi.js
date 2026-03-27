import { createApi } from "@reduxjs/toolkit/query/react";
import { baseQueryWithAuth } from "./baseQuery.js";

export const dictionariesApi = createApi({
    reducerPath: "dictionariesApi",
    baseQuery: baseQueryWithAuth,
    // В dictionariesApi.js пути теперь должны быть такими:
    endpoints: (builder) => ({
        getEmploymentTypes: builder.query({ query: () => "/vacancies/dictionaries/employment-types" }),
        getExperienceLevels: builder.query({ query: () => "/vacancies/dictionaries/experience-levels" }),
        getWorkFormats: builder.query({ query: () => "/vacancies/dictionaries/work-formats" }),
    }),
});

export const {
    useGetEmploymentTypesQuery,
    useGetExperienceLevelsQuery,
    useGetWorkFormatsQuery
} = dictionariesApi;