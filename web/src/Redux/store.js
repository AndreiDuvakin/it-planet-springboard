import {configureStore} from "@reduxjs/toolkit";
import authReducer from "./Slices/authSlice.js";
import userReducer from "./Slices/usersSlice.js";
import {authApi} from "../Api/authApi.js";
import {usersApi} from "../Api/usersApi.js";
import {rolesApi} from "../Api/rolesApi.js";

export const store = configureStore({
    reducer: {
        auth: authReducer,
        [authApi.reducerPath]: authApi.reducer,

        users: userReducer,
        [usersApi.reducerPath]: usersApi.reducer,

        [rolesApi.reducerPath]: rolesApi.reducer,

    },
    middleware: (getDefaultMiddleware) => (
        getDefaultMiddleware().concat(
            authApi.middleware,
            usersApi.middleware,
            rolesApi.middleware,
        )
    ),
});

export default store;