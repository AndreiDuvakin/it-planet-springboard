import {createApi} from "@reduxjs/toolkit/query/react";
import {baseQueryWithAuth} from "./baseQuery.js";


export const applicantSkillsApi = createApi({
    reducerPath: "applicantSkillsApi",
    baseQuery: baseQueryWithAuth,
    tagTypes: ["applicantSkills"],
    endpoints: (builder) => ({
        getApplicantSkillsByApplicantId: builder.query({
            query: (applicantId) => `/applicant_skills/${applicantId}/`,
            providesTags: ["applicantSkills"],
        }),
        replaceApplicantSkills: builder.mutation({
            query: ({applicantId, applicantSkills}) => ({
                url: `/applicant_skills/${applicantId}/`,
                method: "POST",
                body: applicantSkills,
            }),
            invalidatesTags: ["applicantSkills"],
        }),
    }),
});

export const {
    useGetApplicantSkillsByApplicantIdQuery,
    useReplaceApplicantSkillsMutation
} = applicantSkillsApi;