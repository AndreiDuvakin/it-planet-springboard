import {configureStore} from "@reduxjs/toolkit";
import authReducer from "./Slices/authSlice.js";
import {authApi} from "../Api/authApi.js";

export const store = configureStore({
    reducer: {
        auth: authReducer,
        [authApi.reducerPath]: authApi.reducer,
    },
    middleware: (getDefaultMiddleware) => (
        getDefaultMiddleware().concat(
            authApi.middleware,
        )
    ),
});

export default store;