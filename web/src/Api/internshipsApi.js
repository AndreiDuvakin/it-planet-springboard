import { createApi } from '@reduxjs/toolkit/query/react';
import { baseQueryWithAuth } from "./baseQuery.js";

export const internshipsApi = createApi({
    reducerPath: 'internshipsApi',
    baseQuery: baseQueryWithAuth,
    tagTypes: ['Internship'],
    endpoints: (builder) => ({
        // Получение списка стажировок с фильтрацией
        getInternships: builder.query({
            query: (params = {}) => ({
                url: '/internships',
                method: 'GET',
                params: params,
            }),
            providesTags: ['Internship'],
        }),
        // Получение конкретной стажировки по ID
        getInternshipById: builder.query({
            query: (id) => `/internships/${id}`,
            providesTags: (result, error, id) => [{ type: 'Internship', id }],
        }),
        // Создание стажировки
        createInternship: builder.mutation({
            query: (data) => ({
                url: '/internships',
                method: 'POST',
                body: data,
            }),
            invalidatesTags: ['Internship'],
        }),
        // Обновление стажировки
        updateInternship: builder.mutation({
            query: ({ id, ...data }) => ({
                url: `/internships/${id}`,
                method: 'PUT',
                body: data,
            }),
            invalidatesTags: (result, error, { id }) => [{ type: 'Internship', id }],
        }),
        // Удаление стажировки
        deleteInternship: builder.mutation({
            query: (id) => ({
                url: `/internships/${id}`,
                method: 'DELETE',
            }),
            invalidatesTags: ['Internship'],
        }),
    }),
});

export const {
    useGetInternshipsQuery,
    useGetInternshipByIdQuery,
    useCreateInternshipMutation,
    useUpdateInternshipMutation,
    useDeleteInternshipMutation,
} = internshipsApi;