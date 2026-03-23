import {useMemo} from 'react';
import {useLocation, useNavigate} from 'react-router-dom';
import {getFavoriteIds} from "../../Pages/FavoritesPage/favorites.js";
import useAuthUtils from "../../../Hook/useAuthUtils.js";
import {useSelector} from "react-redux";

const useAppLayout = () => {
    const {pathname} = useLocation();
    const navigate = useNavigate();
    const {logoutAndRedirect} = useAuthUtils();

    const {userData: user, isLoading: isUserLoading} = useSelector((state) => state.auth);
    const getItem = (label, key, icon, children) => ({key, icon, children, label});

    const handleLogoutClick = ({key}) => {
        logoutAndRedirect();
        navigate(key);
    };

    const favoritesCount = useMemo(() => getFavoriteIds().length, []);

    const handleLogoClick = () => navigate('/');
    const handleLoginClick = () => navigate('/login');
    const handleFavoritesClick = () => navigate('/favorites');
    const handleRegisterClick = () => navigate('/register');

    const handleMenuClick = ({key}) => {
        navigate(key);
    };

    return {
        user,
        isUserLoading,
        favoritesCount,
        pathname,
        getItem,
        handleLogoClick,
        handleLoginClick,
        handleFavoritesClick,
        handleLogoutClick,
        handleRegisterClick,
        handleMenuClick,
    };
};

export default useAppLayout;