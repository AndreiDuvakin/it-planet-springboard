import {Form, message} from 'antd';
import {useNavigate} from 'react-router-dom';

export default function useRegister() {
    const navigate = useNavigate();
    const [form] = Form.useForm();

    const role = Form.useWatch('role', form);

    const onFinish = (values) => {
        console.log('Регистрационные данные:', values);

        message.success('Регистрация выполнена');
        navigate('/login');
    };

    const goToLogin = () => {
        navigate('/login');
    };

    const validateConfirmPassword = ({getFieldValue}) => ({
        validator(_, value) {
            if (!value || getFieldValue('password') === value) {
                return Promise.resolve();
            }
            return Promise.reject(new Error('Пароли не совпадают'));
        },
    });

    return {
        form,
        role,
        onFinish,
        goToLogin,
        validateConfirmPassword,
    };
}