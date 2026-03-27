import { createApi } from '@reduxjs/toolkit/query/react';
import { baseQueryWithAuth } from "./baseQuery.js"; // Используем твою обертку с авторизацией

export const internshipsApi = createApi({
    reducerPath: 'internshipsApi',
    baseQuery: baseQueryWithAuth, // Это самое важное изменение
    tagTypes: ['Internship'],
    endpoints: (builder) => ({
        createInternship: builder.mutation({
            query: (data) => ({
                url: '/internships', // Здесь НЕ НУЖЕН /api/v1, так как он уже есть в baseQuery
                method: 'POST',
                body: data,
            }),
            invalidatesTags: ['Internship'],
        }),
    }),
});

export const { useCreateInternshipMutation } = internshipsApi;