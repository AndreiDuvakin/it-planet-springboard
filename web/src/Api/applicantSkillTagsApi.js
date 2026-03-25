import {createApi} from "@reduxjs/toolkit/query/react";
import {baseQueryWithAuth} from "./baseQuery.js";


export const applicantSkillTagsApi = createApi({
   reducerPath: "applicantSkillTagsApi",
   baseQuery: baseQueryWithAuth,
   tagTypes: ["applicantSkillTags"],
   endpoints: (builder) => ({
       getAllApplicantSkillTags: builder.query({
           query: () => "/applicant_skill_tags/",
           providesTags: ["applicantSkillTags"],
       }),
   }),
});

export const {
    useGetAllApplicantSkillTagsQuery,
} = applicantSkillTagsApi;