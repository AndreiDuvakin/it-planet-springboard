import {createApi} from "@reduxjs/toolkit/query/react";
import {baseQueryWithAuth} from "./baseQuery.js";


export const experienceLevelsApi = createApi({
   reducerPath: "experienceLevelsApi",
   baseQuery: baseQueryWithAuth,
   tagTypes: ["experienceLevels"],
   endpoints: (builder) => ({
       getAllExperienceLevels: builder.query({
           query: () => "/experience_levels/",
           providesTags: ["experienceLevels"],
       }),
   }),
});

export const {
    useGetAllExperienceLevelsQuery,
} = experienceLevelsApi;