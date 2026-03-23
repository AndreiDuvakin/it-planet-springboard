import { useDispatch } from "react-redux";
import { useNavigate } from "react-router-dom";
import { logout } from "../Redux/Slices/authSlice.js";

const useAuthUtils = () => {
    const dispatch = useDispatch();
    const navigate = useNavigate();

    const logoutAndRedirect = () => {
        localStorage.removeItem("access_token");
        dispatch(logout());
        window.location = "/login";
    };

    return { logoutAndRedirect };
};

export default useAuthUtils;