import React from 'react'
import {Button, Card, Flex, Form, Input, Space, Typography, Image} from 'antd'
import {LockOutlined, MailOutlined} from '@ant-design/icons'
import useLogin from "./useLogin.js";
import AppLogoBlock from "../../Widgets/AppLogoBlock/AppLogoBlock.jsx";

const {Title, Text} = Typography

export default function LoginPage() {
    const {
        onFinish,
        goToRegister,
        goToMainPage,
    } = useLogin()

    return (
        <Flex
            vertical
            align="center"
            justify="center"
            style={{
                height: '50rem',
            }}
        >
            <AppLogoBlock/>

            <Card style={{width: 'min(520px, 100%)', borderRadius: 12}}>
                <Title level={2} style={{marginTop: 0}}>
                    Вход
                </Title>
                <Text type="secondary">
                    Введите почту и пароль
                </Text>

                <Form
                    layout="vertical"
                    style={{marginTop: 18}}
                    onFinish={onFinish}
                >
                    <Form.Item
                        label="Логин"
                        name="login"
                        rules={[
                            {required: true, message: 'Введите логин или email'},
                            {type: 'string', message: 'Введите корректный логин или email'}
                        ]}
                    >
                        <Input prefix={<MailOutlined/>} placeholder="example@mail.com" size="large"/>
                    </Form.Item>

                    <Form.Item
                        label="Пароль"
                        name="password"
                        rules={[{required: true, message: 'Введите пароль'}]}
                    >
                        <Input.Password prefix={<LockOutlined/>} placeholder="Пароль" size="large"/>
                    </Form.Item>

                    <Space orientation="vertical" size={10} style={{width: '100%'}}>
                        <Button type="primary" htmlType="submit" block size="large">
                            Войти
                        </Button>
                        <Button block onClick={goToRegister}>
                            Нет аккаунта? Регистрация
                        </Button>
                        <Button block onClick={goToMainPage}>
                            Перейти на главную страницу
                        </Button>
                    </Space>
                </Form>
            </Card>
        </Flex>
    )
}