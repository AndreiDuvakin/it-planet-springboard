import { createApi } from '@reduxjs/toolkit/query/react';
import { baseQueryWithAuth } from "./baseQuery.js";

export const industriesApi = createApi({
    reducerPath: 'industriesApi',
    baseQuery: baseQueryWithAuth,
    endpoints: (builder) => ({
        getAllIndustries: builder.query({
            query: () => '/company_profiles/industries/',
            transformResponse: (response) =>
                response.map(item => ({
                    label: item.title,
                    value: item.id
                })),
        }),
    }),
});

export const { useGetAllIndustriesQuery } = industriesApi;