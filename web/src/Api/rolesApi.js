import {createApi} from "@reduxjs/toolkit/query/react";
import {baseQuery} from "./baseQuery.js";


export const rolesApi = createApi({
    reducerPath: "rolesApi",
    baseQuery: baseQuery,
    tagTypes: ["roles"],
    endpoints: (builder) => ({
        getAllRoles: builder.query({
            query: () => ({
                url: "/roles/",
                method: "GET",
            }),
            providesTags: ["role"],
        }),
        getAllRolesForRegister: builder.query({
            query: () => "/roles/for-register/",
            providesTags: ["roles"],
        }),
    }),
});

export const {
    useGetAllRolesQuery,
    useGetAllRolesForRegisterQuery,
} = rolesApi;
