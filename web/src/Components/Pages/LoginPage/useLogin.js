import { message } from 'antd'
import { useNavigate } from 'react-router-dom'

export default function useLogin() {
    const navigate = useNavigate()

    const onFinish = (values) => {
        console.log('Данные формы:', values)

        message.success('Вход выполнен')
        navigate('/cabinet/candidate')
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