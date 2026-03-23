import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    selectedUserToUpdate: null,
    openModalCreateUser: false,
    isUpdatingUser: false,
};

const usersSlice = createSlice({
    name: "users",
    initialState,
    reducers: {
        setSelectedUserToUpdate(state, action) {
            state.selectedUserToUpdate = action.payload;
        },
        setOpenModalCreateUser(state, action) {
            state.openModalCreateUser = action.payload;
        },
        setUpdatingUser(state, action) {
            state.updatingUser = action.payload;
        }
    },
});

export const {
    setSelectedUserToUpdate,
    setOpenModalCreateUser,
    setUpdatingUser,
} = usersSlice.actions;

export default usersSlice.reducer;