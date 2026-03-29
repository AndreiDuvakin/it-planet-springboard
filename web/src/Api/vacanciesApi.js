// src/Api/vacanciesApi.js
import { createApi } from "@reduxjs/toolkit/query/react";
import { baseQueryWithAuth } from "./baseQuery.js";

export const vacanciesApi = createApi({
    reducerPath: "vacanciesApi",
    baseQuery: baseQueryWithAuth,
    tagTypes: ["vacancy"],
    endpoints: (builder) => ({
        // Получение списка вакансий с фильтрацией
        getVacancies: builder.query({
            query: (params = {}) => ({
                url: "/vacancies/",
                method: "GET",
                params: params,
            }),
            providesTags: ["vacancy"],
        }),
        // Получение конкретной вакансии по ID
        getVacancyById: builder.query({
            query: (id) => `/vacancies/${id}`,
            providesTags: (result, error, id) => [{ type: "vacancy", id }],
        }),
        // Создание новой вакансии
        createVacancy: builder.mutation({
            query: (data) => ({
                url: "/vacancies/",
                method: "POST",
                body: data,
            }),
            invalidatesTags: ["vacancy"],
        }),
        // Обновление вакансии
        updateVacancy: builder.mutation({
            query: ({ id, ...data }) => ({
                url: `/vacancies/${id}`,
                method: "PUT",
                body: data,
            }),
            invalidatesTags: (result, error, { id }) => [{ type: "vacancy", id }],
        }),
        // Удаление вакансии
        deleteVacancy: builder.mutation({
            query: (id) => ({
                url: `/vacancies/${id}`,
                method: "DELETE",
            }),
            invalidatesTags: ["vacancy"],
        }),
    }),
});

export const {
    useGetVacanciesQuery,
    useGetVacancyByIdQuery,
    useCreateVacancyMutation,
    useUpdateVacancyMutation,
    useDeleteVacancyMutation,
} = vacanciesApi;
