import {message, notification} from 'antd'
import {useNavigate} from 'react-router-dom'
import {useLoginMutation} from "../../../Api/authApi.js";
import {useDispatch, useSelector} from "react-redux";
import {checkAuth, setError, setUser} from "../../../Redux/Slices/authSlice.js";
import {useEffect, useRef} from "react";

export default function useLogin() {
    const navigate = useNavigate();
    const dispatch = useDispatch();
    const { user, userData } = useSelector((state) => state.auth);
    const hasRedirected = useRef(false);

    const [loginUser, {isLoading}] = useLoginMutation();

    useEffect(() => {
        if (user && userData && !isLoading && !hasRedirected.current) {
            hasRedirected.current = true;
            navigate("/");
        }
        document.title = "Платформа для поиска работы \"Трамплин\" - Аутентификация";
    }, [user, userData, isLoading, navigate]);

    const onFinish = async (loginData) => {
        try {
            const response = await loginUser(loginData).unwrap();
            const token = response.access_token || response.token;
            if (!token) {
                throw new Error("Сервер не вернул токен авторизации");
            }
            localStorage.setItem("access_token", token);
            dispatch(setUser({token}));

            await dispatch(checkAuth()).unwrap();
            message.success('Вход выполнен')
            navigate('/')

        } catch (error) {
            const errorMessage = error?.data?.detail || "Не удалось войти. Проверьте логин и пароль.";
            console.error(error);
            dispatch(setError(errorMessage));
            notification.error({
                title: "Ошибка при входе",
                description: errorMessage,
                placement: "topRight",
            });
        }

    }

    const goToRegister = () => {
        navigate('/register')
    }

    const goToMainPage = () => {
        navigate('/')
    };

    return {
        onFinish,
        goToRegister,
        goToMainPage,
    }
}