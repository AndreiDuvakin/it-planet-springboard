import { configureStore } from "@reduxjs/toolkit";
import authReducer from "./Slices/authSlice.js";
import userReducer from "./Slices/usersSlice.js";
import {authApi} from "../Api/authApi.js";
import {usersApi} from "../Api/usersApi.js";
import {rolesApi} from "../Api/rolesApi.js";
import {universitiesApi} from "../Api/universitiesApi.js";
import {applicantEducationsApi} from "../Api/applicantEducationsApi.js";
import {applicantProfilesApi} from "../Api/applicantProfilesApi.js";
import {applicantSkillsApi} from "../Api/applicantSkillsApi.js";
import {applicantSkillTagsApi} from "../Api/applicantSkillTagsApi.js";
import {experienceLevelsApi} from "../Api/experienceLevelsApi.js";
// Добавляем новые API
import { companyApi } from "../Api/companyApi.js";
import { industriesApi } from "../Api/industriesApi.js";
import {vacanciesApi } from "../Api/vacanciesApi.js";
import {dictionariesApi } from "../Api/dictionariesApi.js";
import { internshipsApi } from '../Api/internshipsApi'; // путь к твоему новому API

export const store = configureStore({
    reducer: {
        auth: authReducer,
        [authApi.reducerPath]: authApi.reducer,

        users: userReducer,
        [usersApi.reducerPath]: usersApi.reducer,

        [rolesApi.reducerPath]: rolesApi.reducer,
        [universitiesApi.reducerPath]: universitiesApi.reducer,
        [applicantEducationsApi.reducerPath]: applicantEducationsApi.reducer,
        [applicantProfilesApi.reducerPath]: applicantProfilesApi.reducer,

        [applicantSkillsApi.reducerPath]: applicantSkillsApi.reducer,

        [applicantSkillTagsApi.reducerPath]: applicantSkillTagsApi.reducer,

        [experienceLevelsApi.reducerPath]: experienceLevelsApi.reducer,

        // Регистрируем новые редьюсеры
        [companyApi.reducerPath]: companyApi.reducer,
        [industriesApi.reducerPath]: industriesApi.reducer,
        [vacanciesApi.reducerPath]: vacanciesApi.reducer,
        [dictionariesApi.reducerPath]: dictionariesApi.reducer,
        [internshipsApi.reducerPath]: internshipsApi.reducer, // ДОБАВИТЬ ЭТО
    },
    middleware: (getDefaultMiddleware) => (
        getDefaultMiddleware().concat(
            authApi.middleware,
            usersApi.middleware,
            rolesApi.middleware,
            universitiesApi.middleware,
            applicantEducationsApi.middleware,
            applicantProfilesApi.middleware,
            // Регистрируем новый middleware
            companyApi.middleware,
            industriesApi.middleware,
            vacanciesApi.middleware,
            dictionariesApi.middleware,
            internshipsApi.middleware, // ДОБАВИТЬ ЭТО
            applicantSkillsApi.middleware,
            applicantSkillTagsApi.middleware,
            experienceLevelsApi.middleware,
        )
    ),
});

export default store;