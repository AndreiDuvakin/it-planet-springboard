import {useMemo} from 'react';
import {useLocation, useNavigate} from 'react-router-dom';
import {getFavoriteIds} from "../../Pages/FavoritesPage/favorites.js";
import {UserOutlined} from "@ant-design/icons";

const CABINET_ITEMS = [
    {key: '/cabinet/candidate', label: 'Соискатель', icon: <UserOutlined/>},
    {key: '/cabinet/employer', label: 'Работодатель', icon: <UserOutlined/>},
    {key: '/cabinet/curator', label: 'Куратор', icon: <UserOutlined/>},
];

const useAppLayout = () => {
    const {pathname} = useLocation();
    const navigate = useNavigate();

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

    return {
        selectedKey,
        favoritesCount,
        cabinetItems: CABINET_ITEMS,
        handleLogoClick,
        handleLoginClick,
        handleFavoritesClick,
    };
};

export default useAppLayout;