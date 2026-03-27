// src/Api/vacanciesApi.js
import { createApi } from "@reduxjs/toolkit/query/react";
import { baseQueryWithAuth } from "./baseQuery.js";

export const vacanciesApi = createApi({
    reducerPath: "vacanciesApi",
    baseQuery: baseQueryWithAuth,
    tagTypes: ["vacancy"],
    endpoints: (builder) => ({
        createVacancy: builder.mutation({
            query: (data) => ({
                url: "/vacancies/", // Убедись, что путь совпадает с FastAPI
                method: "POST",
                body: data,
            }),
            invalidatesTags: ["vacancy"],
        }),
    }),
});

export const { useCreateVacancyMutation } = vacanciesApi;
