import {useMemo} from 'react';
import {useLocation, useNavigate} from 'react-router-dom';
import {getFavoriteIds} from "../../Pages/FavoritesPage/favorites.js";
import {UserOutlined} from "@ant-design/icons";
import useAuthUtils from "../../../Hook/useAuthUtils.js";
import {useSelector} from "react-redux";

const CABINET_ITEMS = [
    {key: '/cabinet/candidate', label: 'Соискатель', icon: <UserOutlined/>},
    {key: '/cabinet/employer', label: 'Работодатель', icon: <UserOutlined/>},
    {key: '/cabinet/curator', label: 'Куратор', icon: <UserOutlined/>},
];

const useAppLayout = () => {
    const {pathname} = useLocation();
    const navigate = useNavigate();
    const {logoutAndRedirect} = useAuthUtils();

    const {userData: user, isLoading: isUserLoading, error: isUserError} = useSelector((state) => state.auth);
    const getItem = (label, key, icon, children) => ({key, icon, children, label});

    const handleLogoutClick = ({key}) => {
        logoutAndRedirect();
        navigate(key);
    };

    const selectedKey = useMemo(() => {
        const known = [
            '/',
            '/login',
            '/register',
            ...CABINET_ITEMS.map((i) => i.key),
        ];
        if (known.includes(pathname)) return pathname;
        if (pathname.startsWith('/opportunities/')) return '/';
        return '';
    }, [pathname]);

    const favoritesCount = useMemo(() => getFavoriteIds().length, []);

    const handleLogoClick = () => navigate('/');
    const handleLoginClick = () => navigate('/login');
    const handleFavoritesClick = () => navigate('/favorites');
    const handleRegisterClick = () => navigate('/register');

    return {
        user,
        isUserLoading,
        getItem,
        selectedKey,
        favoritesCount,
        cabinetItems: CABINET_ITEMS,
        handleLogoClick,
        handleLoginClick,
        handleFavoritesClick,
        handleLogoutClick,
        handleRegisterClick,
    };
};

export default useAppLayout;