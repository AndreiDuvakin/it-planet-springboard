import React from 'react';
import { Card, Form, Row, Col, Input, Button, Typography, Divider, Table, Tag, Space, Avatar, Badge, Empty } from 'antd';
import { UserOutlined } from '@ant-design/icons';
import useCuratorsTab from './useCuratorsTab';

const { Text, Title } = Typography;

function CuratorsTab() {
    const { form, loading, handleCreateCurator, curators, usersLoading } = useCuratorsTab();

    const columns = [
        {
            title: 'Куратор',
            key: 'curator',
            render: (record) => (
                <Space>
                    <Avatar icon={<UserOutlined />} style={{ backgroundColor: '#87d068' }} />
                    <div>
                        <Text strong>{record.last_name} {record.first_name}</Text><br />
                        <Text type="secondary" style={{ fontSize: 12 }}>{record.email}</Text>
                    </div>
                </Space>
            ),
        },
        {
            title: 'Статус',
            dataIndex: 'is_active',
            key: 'status',
            width: 120,
            render: (isActive) => (
                <Tag color={isActive ? 'success' : 'default'}>
                    {isActive ? 'Активен' : 'Неактивен'}
                </Tag>
            ),
        },
        {
            title: 'Дата создания',
            dataIndex: 'created_at',
            key: 'created',
            width: 150,
            render: (date) => (
                <Text type="secondary" style={{ fontSize: 12 }}>
                    {date ? new Date(date).toLocaleDateString('ru') : '—'}
                </Text>
            ),
        },
    ];

    return (
        <div style={{ padding: '10px 0' }}>
            <Card
                size="small"
                style={{ marginBottom: 24, border: '1px solid #f0f0f0', borderRadius: 12 }}
                title="Добавить куратора"
            >
                <Form
                    form={form}
                    layout="vertical"
                    onFinish={handleCreateCurator}
                >
                    <Row gutter={12}>
                        <Col span={12}>
                            <Form.Item label="Фамилия" name="lastName" rules={[{ required: true, message: 'Введите фамилию' }]}>
                                <Input placeholder="Иванов" />
                            </Form.Item>
                        </Col>
                        <Col span={12}>
                            <Form.Item label="Имя" name="firstName" rules={[{ required: true, message: 'Введите имя' }]}>
                                <Input placeholder="Иван" />
                            </Form.Item>
                        </Col>
                    </Row>

                    <Form.Item
                        label="Email"
                        name="email"
                        rules={[
                            { required: true, message: 'Введите email' },
                            { type: 'email', message: 'Введите корректный email' }
                        ]}
                    >
                        <Input placeholder="curator@university.ru" />
                    </Form.Item>

                    <Form.Item
                        label="Временный пароль"
                        name="password"
                        rules={[
                            { required: true, message: 'Введите пароль' },
                            { min: 6, message: 'Пароль должен содержать не менее 6 символов' }
                        ]}
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

            <Card
                size="small"
                style={{ border: '1px solid #f0f0f0', borderRadius: 12 }}
                title={
                    <Space>
                        <Title level={5} style={{ margin: 0 }}>Список кураторов</Title>
                        {!usersLoading && curators.length > 0 && (
                            <Badge count={curators.length} style={{ backgroundColor: '#52c41a' }} />
                        )}
                    </Space>
                }
            >
                {usersLoading ? (
                    <Empty description="Загрузка..." />
                ) : curators.length === 0 ? (
                    <Empty description="Кураторы не найдены" />
                ) : (
                    <Table
                        dataSource={curators}
                        columns={columns}
                        rowKey="id"
                        size="small"
                        pagination={false}
                    />
                )}
            </Card>
        </div>
    );
}

export default CuratorsTab;