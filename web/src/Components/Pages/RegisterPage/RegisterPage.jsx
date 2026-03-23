import React from 'react';
import {
    Button,
    Card,
    Flex,
    Form,
    Input,
    Radio,
    Space,
    Tooltip,
    Typography,
    Row,
    Col,
    DatePicker
} from 'antd';
import {
    InfoCircleOutlined,
    LockOutlined,
    MailOutlined,
    UserOutlined,
    CalendarOutlined,
} from '@ant-design/icons';
import AppLogoBlock from "../../Widgets/AppLogoBlock/AppLogoBlock.jsx";
import useRegister from "./useRegister.js";
import dayjs from "dayjs";

const {Title, Text} = Typography;

export default function RegisterPage() {
    const {
        form,
        defaultRoleValue,
        isLoading,
        radioOptions,
        onFinish,
        goToLogin,
    } = useRegister();

    return (
        <Flex vertical align="center" justify="center" style={{paddingBlock: 24}}>
            <AppLogoBlock/>
            <Card style={{width: 'min(620px, 100%)', borderRadius: 14}}>
                <Title level={2} style={{marginTop: 0}}>Регистрация</Title>
                <Text type="secondary" style={{display: 'block', marginBottom: 16}}>
                    Создайте аккаунт на платформе
                </Text>

                <Form
                    form={form}
                    name="register"
                    onFinish={onFinish}
                    layout="vertical"
                >
                    <Form.Item
                        label="Роль на платформе"
                        name="role_id"
                        rules={[{required: true, message: 'Выберите роль'}]}
                    >
                        <Radio.Group
                            options={radioOptions}
                        />
                    </Form.Item>

                    <Row gutter={16}>
                        <Col span={12}>
                            <Form.Item
                                label="Имя"
                                name="first_name"
                                rules={[{required: true, message: 'Введите имя'}]}
                            >
                                <Input prefix={<UserOutlined/>} placeholder="Иван" size="large"/>
                            </Form.Item>
                        </Col>
                        <Col span={12}>
                            <Form.Item
                                label="Фамилия"
                                name="last_name"
                                rules={[{required: true, message: 'Введите фамилию'}]}
                            >
                                <Input prefix={<UserOutlined/>} placeholder="Иванов" size="large"/>
                            </Form.Item>
                        </Col>
                    </Row>

                    <Form.Item label="Отчество" name="patronymic">
                        <Input prefix={<UserOutlined/>} placeholder="Иванович" size="large"/>
                    </Form.Item>

                    <Form.Item
                        label="Email"
                        name="email"
                        rules={[
                            {required: true, message: 'Введите email'},
                            {type: 'email', message: 'Введите корректный email'},
                        ]}
                    >
                        <Input prefix={<MailOutlined/>} placeholder="example@mail.com" size="large"/>
                    </Form.Item>

                    <Form.Item label="Логин" name="login" rules={[{required: true, message: "Введите логин"}]}>
                        <Input/>
                    </Form.Item>

                    <Form.Item
                        label="Дата рождения"
                        name="birthdate"
                        maxdate={dayjs()}
                        rules={[{required: true, message: 'Введите дату рождения'}]}
                    >
                        <DatePicker
                            prefix={<CalendarOutlined/>}
                            format="DD.MM.YYYY"
                            placeholder="01.01.2001"
                            size="large"
                            style={{width: '100%'}}
                        />
                    </Form.Item>

                    <Form.Item
                        label={
                            <Space size={4}>
                                Пароль
                                <Tooltip title="Не менее 8 символов, минимум одна буква и одна цифра">
                                    <InfoCircleOutlined style={{color: '#8c8c8c'}}/>
                                </Tooltip>
                            </Space>
                        }
                        name="password"
                        rules={[
                            {required: true, message: 'Введите пароль'},
                            {min: 8, message: 'Минимум 8 символов'},
                            {
                                pattern: /^(?=.*[A-Za-zА-Яа-я])(?=.*\d).+$/,
                                message: 'Добавьте хотя бы одну букву и одну цифру',
                            },
                        ]}
                    >
                        <Input.Password prefix={<LockOutlined/>} placeholder="Пароль" size="large"/>
                    </Form.Item>

                    <Form.Item
                        label="Подтверждение пароля"
                        name="repeat_password"
                        dependencies={['password']}
                        rules={[{required: true, message: "Подтвердите пароль"}, ({getFieldValue}) => ({
                            validator(_, value) {
                                if (!value || getFieldValue("password") === value) {
                                    return Promise.resolve();
                                }
                                return Promise.reject(new Error("Пароли не совпадают"));
                            },
                        }),]}
                    >
                        <Input.Password
                            prefix={<LockOutlined/>}
                            placeholder="Подтвердите пароль"
                            size="large"
                        />
                    </Form.Item>

                    <Space orientation="vertical" size={10} style={{width: '100%', marginTop: 12}}>
                        <Button type="primary" htmlType="submit" block size="large" loading={isLoading}>
                            Зарегистрироваться
                        </Button>
                        <Button block onClick={goToLogin}>
                            Уже есть аккаунт? Войти
                        </Button>
                    </Space>
                </Form>
            </Card>
        </Flex>
    );
}