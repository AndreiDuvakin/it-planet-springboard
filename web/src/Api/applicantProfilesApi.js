import {createApi} from "@reduxjs/toolkit/query/react";
import {baseQueryWithAuth} from "./baseQuery.js";


export const applicantProfilesApi = createApi({
   reducerPath: "applicantProfilesApi",
   baseQuery: baseQueryWithAuth,
   tagTypes: ["applicantProfilesApi"],
   endpoints: (builder) => ({
       updateApplicantProfile: builder.mutation({
           query: ({applicantId, ...data}) => ({
               url: `/applicant_profiles/${applicantId}/`,
               method: "PUT",
               body: data,
           }),
           invalidatesTags: ["applicant_profiles", "user"],
       })
   }),
});

export const {
    useUpdateApplicantProfileMutation
} = applicantProfilesApi;