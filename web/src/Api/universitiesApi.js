import {createApi} from "@reduxjs/toolkit/query/react";
import {baseQueryWithAuth} from "./baseQuery.js";


export const universitiesApi = createApi({
   reducerPath: "universitiesApi",
   baseQuery: baseQueryWithAuth,
   tagTypes: ["universities"],
   endpoints: (builder) => ({
       getAllUniversities: builder.query({
           query: () => "/universities/",
           providesTags: ["universities"],
       }),
   }),
});

export const {
    useGetAllUniversitiesQuery
} = universitiesApi;