import { createApi } from '@reduxjs/toolkit/query/react';
import { baseQueryWithAuth } from "./baseQuery.js";

export const companyApi = createApi({
    reducerPath: 'companyApi',
    baseQuery: baseQueryWithAuth, // Просто ссылка на функцию
    tagTypes: ['Company'],
    endpoints: (builder) => ({
        getProfile: builder.query({
            query: () => '/company_profiles/me',
            providesTags: ['Company'],
        }),
        createOrUpdateCompany: builder.mutation({
            query: (data) => ({
                url: '/company_profiles/',
                method: 'POST',
                body: data,
            }),
            invalidatesTags: ['Company'],
        }),
    }),
});

export const { useGetProfileQuery, useCreateOrUpdateCompanyMutation } = companyApi;