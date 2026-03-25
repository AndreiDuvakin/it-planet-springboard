import {Navigate, Outlet} from "react-router-dom";
import {useDispatch, useSelector} from "react-redux";
import LoadingIndicator from "../Components/Widgets/LoadingIndicator/LoadingIndicator.jsx";
import {useGetAuthenticatedUserDataQuery} from "../Api/usersApi.js";
import {useEffect} from "react";
import {setUserData} from "../Redux/Slices/authSlice.js";

const PrivateRoute = () => {
    const {
        data: userData,
    } = useGetAuthenticatedUserDataQuery(undefined, {
        pollingInterval: 10000,
    });
    
    const dispatch = useDispatch();
    
    useEffect(() => {
        dispatch(setUserData(userData));
    }, [dispatch, userData])
    
    const {user, isLoading} = useSelector((state) => state.auth);

    if (isLoading) {
        return <LoadingIndicator/>;
    }

    if (!user || !userData || !userData.is_activated ) {
        return <Navigate to="/login"/>;
    }

    return <Outlet/>;
};

export default PrivateRoute;