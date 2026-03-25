import React from 'react';
import { Table, Select, Tag, Space, Typography } from 'antd';
import useUsersTab from './useUsersTab';

const { Text } = Typography;

function UsersTab({ data, onRefresh }) {
    const { handleStatus, loading } = useUsersTab(onRefresh);

    const columns = [
        {
            title: 'Роль',
            dataIndex: 'role',
            key: 'role',
            render: (role) => {
                let color = role === 'Работодатель' ? 'orange' : 'cyan';
                return <Tag color={color}>{role.toUpperCase()}</Tag>;
            }
        },
        {
            title: 'Пользователь',
            dataIndex: 'name',
            key: 'name',
            render: (name, record) => (
                <Space direction="vertical" size={0}>
                    <Text strong>{name}</Text>
                    <Text type="secondary" style={{ fontSize: '12px' }}>{record.email}</Text>
                </Space>
            )
        },
        {
            title: 'Статус аккаунта',
            dataIndex: 'status',
            key: 'status',
            width: 220,
            render: (status, record) => (
                <Select
                    value={status}
                    style={{ width: '100%' }}
                    loading={loading}
                    onChange={(val) => handleStatus(record.id, val)}
                    options={[
                        { value: 'active', label: 'Активен' },
                        { value: 'blocked', label: 'Заблокирован' },
                        { value: 'pending', label: 'Ожидает верификацию' },
                    ]}
                />
            )
        }
    ];

    return (
        <Table
            columns={columns}
            dataSource={data}
            rowKey="id"
            pagination={{ pageSize: 10 }}
        />
    );
}

export default UsersTab;