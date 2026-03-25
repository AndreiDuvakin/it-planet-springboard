import {createApi} from "@reduxjs/toolkit/query/react";
import {baseQueryWithAuth} from "./baseQuery.js";


export const applicantEducationsApi = createApi({
    reducerPath: "applicantEducationsApi",
    baseQuery: baseQueryWithAuth,
    tagTypes: ["applicantEducations"],
    endpoints: (builder) => ({
        getApplicantEducationsByApplicantId: builder.query({
            query: (applicantId) => `/applicant_educations/${applicantId}/`,
            providesTags: ["applicantEducations"],
        }),
        replaceApplicantEducations: builder.mutation({
            query: ({applicantId, applicantEducations}) => ({
                url: `/applicant_educations/${applicantId}/`,
                method: "POST",
                body: applicantEducations,
            }),
            invalidatesTags: ["applicantEducations"],
        }),
    }),
});

export const {
    useGetApplicantEducationsByApplicantIdQuery,
    useReplaceApplicantEducationsMutation
} = applicantEducationsApi;