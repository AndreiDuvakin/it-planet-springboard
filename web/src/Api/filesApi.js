import { createApi } from '@reduxjs/toolkit/query/react';
import { baseQueryWithAuth } from "./baseQuery.js";

export const filesApi = createApi({
    reducerPath: 'filesApi',
    baseQuery: baseQueryWithAuth,
    endpoints: (builder) => ({
        uploadLogo: builder.mutation({
            query: (file) => {
                const formData = new FormData();
                formData.append('file', file);
                return {
                    url: '/company_profiles/files/upload-logo',
                    method: 'POST',
                    body: formData,
                };
            },
        }),
        uploadPhoto: builder.mutation({
            query: (file) => {
                const formData = new FormData();
                formData.append('file', file);
                return {
                    url: '/company_profiles/files/upload-photo',
                    method: 'POST',
                    body: formData,
                };
            },
        }),
    }),
});

export const { useUploadLogoMutation, useUploadPhotoMutation } = filesApi;