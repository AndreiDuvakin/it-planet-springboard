import React from 'react';
import { Card, Form, Row, Col, Input, Button, Typography, Divider } from 'antd';
import useCuratorsTab from './useCuratorsTab';

const { Text, Title } = Typography;

function CuratorsTab() {
    const { form, loading, handleCreateCurator } = useCuratorsTab();

    return (
        <div style={{ padding: '10px 0' }}>
            <Card
                size="small"
                style={{ maxWidth: 600, border: '1px solid #f0f0f0', borderRadius: 12 }}
                title="Добавить куратора"
            >
                <Form
                    form={form}
                    layout="vertical"
                    onFinish={handleCreateCurator}
                >
                    <Row gutter={12}>
                        <Col span={12}>
                            <Form.Item label="Фамилия" name="lastName" rules={[{ required: true }]}>
                                <Input placeholder="Иванов" />
                            </Form.Item>
                        </Col>
                        <Col span={12}>
                            <Form.Item label="Имя" name="firstName" rules={[{ required: true }]}>
                                <Input placeholder="Иван" />
                            </Form.Item>
                        </Col>
                    </Row>

                    <Form.Item
                        label="Email"
                        name="email"
                        rules={[{ required: true, type: 'email' }]}
                    >
                        <Input placeholder="curator@university.ru" />
                    </Form.Item>

                    <Form.Item
                        label="Временный пароль"
                        name="password"
                        rules={[{ required: true, min: 6 }]}
                        extra="Пароль должен содержать не менее 6 символов"
                    >
                        <Input.Password placeholder="******" />
                    </Form.Item>

                    <Divider />

                    <Button
                        type="primary"
                        htmlType="submit"
                        loading={loading}
                        block
                        size="large"
                    >
                        Создать учетную запись
                    </Button>
                </Form>
            </Card>
        </div>
    );
}

export default CuratorsTab;