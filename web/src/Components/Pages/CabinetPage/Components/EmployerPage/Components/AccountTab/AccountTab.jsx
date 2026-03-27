import React from 'react';
import {Form, Input, Button, DatePicker, Row, Col, Skeleton, Divider} from 'antd';
import useAccountTab from './useAccountTab';

const AccountTab = ({ notify }) => {
    const { form, isLoading, isSaving, handleSave } = useAccountTab(notify);

    if (isLoading) return <Skeleton active />;

    return (
        <Form layout="vertical" form={form} onFinish={handleSave}>
            <Divider orientation="left">Личные данные</Divider>
            <Row gutter={24}>
                <Col xs={24} md={8}>
                    <Form.Item label="Фамилия" name="lastName" rules={[{ required: true, message: 'Обязательное поле' }]}>
                        <Input placeholder="Введите фамилию" size="large" />
                    </Form.Item>
                </Col>
                <Col xs={24} md={8}>
                    <Form.Item label="Имя" name="firstName" rules={[{ required: true, message: 'Обязательное поле' }]}>
                        <Input placeholder="Введите имя" size="large" />
                    </Form.Item>
                </Col>
                <Col xs={24} md={8}>
                    <Form.Item label="Отчество" name="middleName">
                        <Input placeholder="Введите отчество" size="large" />
                    </Form.Item>
                </Col>
            </Row>

            <Row gutter={24}>
                <Col xs={24} md={8}>
                    <Form.Item label="Дата рождения" name="birthdate" rules={[{ required: true, message: 'Укажите дату' }]}>
                        <DatePicker style={{ width: '100%' }} format="DD.MM.YYYY" size="large" />
                    </Form.Item>
                </Col>
                <Col xs={24} md={8}>
                    <Form.Item label="Email" name="email" rules={[{ type: 'email', message: 'Некорректный email' }]}>
                        <Input placeholder="example@mail.com" size="large" />
                    </Form.Item>
                </Col>
                <Col xs={24} md={8}>
                    <Form.Item label="Логин" name="login">
                        <Input size="large" />
                    </Form.Item>
                </Col>
            </Row>

            <Divider orientation="left">Безопасность</Divider>

            <Row gutter={24}>
                <Col xs={24} md={12}>
                    <Form.Item
                        label="Новый пароль"
                        name="password"
                        extra="Оставьте пустым, если не хотите менять"
                    >
                        <Input.Password placeholder="Введите новый пароль" size="large" />
                    </Form.Item>
                </Col>
                <Col xs={24} md={12}>
                    <Form.Item
                        label="Подтверждение пароля"
                        name="confirmPassword"
                        dependencies={['password']}
                        rules={[
                            ({ getFieldValue }) => ({
                                validator(_, value) {
                                    if (!value || getFieldValue('password') === value) {
                                        return Promise.resolve();
                                    }
                                    return Promise.reject(new Error('Пароли не совпадают'));
                                },
                            }),
                        ]}
                    >
                        <Input.Password placeholder="Повторите пароль" size="large" />
                    </Form.Item>
                </Col>
            </Row>
            <Button type="primary" htmlType="submit" loading={isSaving} size="large" style={{ minWidth: 150 }}>Сохранить</Button>
        </Form>
    );
};

export default AccountTab;