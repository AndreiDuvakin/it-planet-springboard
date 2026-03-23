import {useActivateUserMutation, useGetAllUsersQuery, useGetAuthenticatedUserDataQuery} from "../../../Api/usersApi.js";
import {useGetAllRolesQuery} from "../../../Api/rolesApi.js";
import {useEffect, useMemo, useState} from "react";
import {useDispatch, useSelector} from "react-redux";
import {setOpenModalCreateUser, setSelectedUserToUpdate} from "../../../Redux/Slices/usersSlice.js";
import {notification} from "antd";


const useAdminPage = () => {
    const dispatch = useDispatch();
    const {
        data: currentUser = {},
    } = useGetAuthenticatedUserDataQuery(undefined);

    const [
        setActivateUser,
        {
            isLoading: isActivatingUser,
        }
    ] = useActivateUserMutation();

    const {isUpdatingUser} = useSelector((state) => state.users);

    const [
        searchString,
        setSearchString,
    ] = useState("");

    useEffect(() => {
        document.title = "Платформа для поиска работы \"Трамплин\" - Панель администратора";
    }, []);

    const {
        data: usersData = [],
    } = useGetAllUsersQuery(undefined, {
        pollingInterval: 20000,
    });

    const {
        data: rolesData = [],
    } = useGetAllRolesQuery(undefined, {
        pollingInterval: 20000,
    });

    const handleSearch = (e) => {
        setSearchString(e.target.value);
    };

    const filteredUsers = useMemo(() => {
        return usersData.filter((user) => {
            return Object.entries(user).some(([key, value]) => {
                if (typeof value === "string") {
                    return value.toString().toLowerCase().includes(searchString.toLowerCase());
                }
            });
        });
    }, [usersData, searchString]);

    const handleSelectUserToEdit = (user) => {
        dispatch(setSelectedUserToUpdate(user));
    };

    const openCreateModal = () => {
        dispatch(setOpenModalCreateUser(true));
    };

    const handleActivateUser = async (user, isActivated) => {
        try {
            await setActivateUser({user_id: user, is_activated: isActivated}).unwrap();

            notification.success({
                title: "Успех",
                description: isActivated
                    ? "Пользователь успешно активирован"
                    : "Пользователь успешно дезактивирован",
                placement: "topRight",
            })
        } catch (error) {
            notification.error({
                title: "Ошибка",
                description: error?.data?.detail ? error?.data?.detail : isActivated
                    ? "Не удалось активировать пользователя"
                    : "Не удалось дезактивировать пользователя",
                placement: "topRight",
            })
        }
    };

    return {
        handleSelectUserToEdit,
        rolesData,
        filteredUsers,
        handleSearch,
        isUpdatingUser,
        handleActivateUser,
        openCreateModal,
        currentUser,
    };
};

export default useAdminPage;