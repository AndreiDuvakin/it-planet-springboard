import React from 'react';
import { Form, Row, Col, Input, Button, DatePicker, Divider, Typography } from 'antd';
import useAccountTab from './useAccountTab';

const { Text } = Typography;

function AccountTab() {
    const { form, loading, handleSave } = useAccountTab();

    return (
        <div style={{ padding: '10px 0' }}>
            <Form
                form={form}
                layout="vertical"
                onFinish={handleSave}
                requiredMark={false}
            >
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
                        <Form.Item label="Дата рождения" name="birthdate">
                            <DatePicker style={{ width: '100%' }} format="DD.MM.YYYY" size="large" />
                        </Form.Item>
                    </Col>
                    <Col xs={24} md={8}>
                        <Form.Item label="Email" name="email">
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

                <Button type="primary" htmlType="submit" loading={loading} size="large">
                    Сохранить изменения
                </Button>
            </Form>
        </div>
    );
}

export default AccountTab;