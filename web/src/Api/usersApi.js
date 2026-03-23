import {baseQueryWithAuth} from "./baseQuery.js";
import {createApi} from "@reduxjs/toolkit/query/react";


export const usersApi = createApi({
    reducerPath: "usersApi",
    baseQuery: baseQueryWithAuth,
    tagTypes: ["user"],
    endpoints: (builder) => ({
        getAuthenticatedUserData: builder.query({
            query: () => "/users/me/",
            providesTags: ["user"],
        }),
        registerUser: builder.mutation({
            query: (data) => ({
                url: "/users/register/",
                method: "POST",
                body: data,
            }),
            invalidatesTags: ["user"],
        }),
    }),
});

export const {
    useGetAuthenticatedUserDataQuery,
    useRegisterUserMutation,
} = usersApi;