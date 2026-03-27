import { createApi } from '@reduxjs/toolkit/query/react';
import { baseQueryWithAuth } from "./baseQuery.js"; // Импортируем нашу готовую базу

export const industriesApi = createApi({
    reducerPath: 'industriesApi',
    // ОШИБКА БЫЛА ТУТ: передаем саму функцию, а не результат её вызова ()
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