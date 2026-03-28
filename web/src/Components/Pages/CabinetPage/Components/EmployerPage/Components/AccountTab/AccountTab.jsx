import React from 'react';
import {Form, Input, Button, DatePicker, Row, Col, Skeleton, Divider} from 'antd';
import useAccountTab from './useAccountTab';
import {LockOutlined} from "@ant-design/icons";

const AccountTab = ({notify}) => {
    const {
        form,
        passwordForm,
        isLoading,
        isSaving,
        handleSave,
        handlePasswordFinish,
    } = useAccountTab(notify);

    if (isLoading) return <Skeleton active/>;

    return (
        <div style={{padding: '10px 0'}}>

            <Form
                form={form}
                layout="vertical"
                onFinish={handleSave}
                requiredMark={false}
            >
                <Divider titlePlacement="left">Личные данные</Divider>
                <Row gutter={24}>
                    <Col xs={24} md={8}>
                        <Form.Item label="Фамилия" name="last_name"
                                   rules={[{required: true, message: 'Обязательное поле'}]}>
                            <Input placeholder="Введите фамилию" size="large"/>
                        </Form.Item>
                    </Col>
                    <Col xs={24} md={8}>
                        <Form.Item label="Имя" name="first_name"
                                   rules={[{required: true, message: 'Обязательное поле'}]}>
                            <Input placeholder="Введите имя" size="large"/>
                        </Form.Item>
                    </Col>
                    <Col xs={24} md={8}>
                        <Form.Item label="Отчество" name="patronymic">
                            <Input placeholder="Введите отчество" size="large"/>
                        </Form.Item>
                    </Col>
                </Row>

                <Row gutter={24}>
                    <Col xs={24} md={8}>
                        <Form.Item label="Дата рождения" name="birthdate"
                                   rules={[{required: true, message: 'Укажите дату'}]}>
                            <DatePicker style={{width: '100%'}} format="DD.MM.YYYY" size="large"/>
                        </Form.Item>
                    </Col>
                    <Col xs={24} md={8}>
                        <Form.Item label="Email" name="email"
                                   rules={[{type: 'email', message: 'Некорректный email'}]}>
                            <Input placeholder="example@mail.com" size="large"/>
                        </Form.Item>
                    </Col>
                    <Col xs={24} md={8}>
                        <Form.Item label="Логин" name="login">
                            <Input disabled size="large"/>
                        </Form.Item>
                    </Col>
                </Row>

                <Button type="primary" htmlType="submit" block size="large">
                    Сохранить изменения
                </Button>
            </Form>
            <Col span={24}>
                <Divider titlePlacement="left">Смена пароля</Divider>

                <Form form={passwordForm} layout="vertical" onFinish={handlePasswordFinish}>
                    <Row gutter={16}>
                        <Col xs={24} md={12}>
                            <Form.Item
                                name="password"
                                label="Новый пароль"
                                rules={[
                                    {required: true, message: "Введите пароль"},
                                    {min: 8, message: "Минимум 8 символов"},
                                ]}
                            >
                                <Input.Password prefix={<LockOutlined/>} size="large"
                                                placeholder="••••••••"/>
                            </Form.Item>
                        </Col>

                        <Col xs={24} md={12}>
                            <Form.Item
                                name="repeat_password"
                                label="Повторите пароль"
                                dependencies={["password"]}
                                rules={[
                                    {required: true, message: "Повторите пароль"},
                                    ({getFieldValue}) => ({
                                        validator(_, value) {
                                            if (!value || getFieldValue("password") === value) {
                                                return Promise.resolve();
                                            }
                                            return Promise.reject(new Error("Пароли не совпадают"));
                                        },
                                    }),
                                ]}
                            >
                                <Input.Password prefix={<LockOutlined/>} size="large"
                                                placeholder="••••••••"/>
                            </Form.Item>
                        </Col>
                    </Row>

                    <Form.Item style={{marginBottom: 0, textAlign: "right"}}>
                        <Button
                            type="primary"
                            htmlType="submit"
                            icon={<LockOutlined/>}
                            size="large"
                            block
                        >
                            Изменить пароль
                        </Button>
                    </Form.Item>
                </Form>
            </Col>
        </div>
    );
};

export default AccountTab;