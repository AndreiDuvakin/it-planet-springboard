import React from 'react';
import { Table, Select, Tag, Typography, Card } from 'antd';
import useUsersTab from './useUsersTab';
import { ROLES_MAP } from '../../../../../../../Core/constants.js';

const { Text } = Typography;

function UsersTab() {
    const { usersData, handleStatus, actionLoading, isLoading } = useUsersTab();

    const columns = [
        {
            title: 'Роль',
            dataIndex: ['role', 'title'],
            key: 'role',
            width: 150,
            render: (title) => (
                <Tag color={title === 'employer' ? 'orange' : 'cyan'}>
                    {(ROLES_MAP[title] || title).toUpperCase()}
                </Tag>
            )
        },
        {
            title: 'Пользователь',
            key: 'user',
            render: (_, record) => (
                <div style={{ display: 'flex', flexDirection: 'column' }}>
                    <Text strong>
                        {`${record.last_name || ''} ${record.first_name || ''}`.trim() || 'Пользователь'}
                    </Text>
                    <Text type="secondary" style={{ fontSize: 12 }}>{record.email}</Text>
                </div>
            )
        },
        {
            title: 'Статус',
            dataIndex: 'is_activated',
            key: 'status',
            width: 180,
            render: (is_activated, record) => (
                <Select
                    value={is_activated ? 'active' : 'blocked'}
                    style={{ width: '100%' }}
                    loading={actionLoading}
                    onChange={(val) => handleStatus(record.id, val === 'active')}
                    options={[
                        { value: 'active', label: 'Активен' },
                        { value: 'blocked', label: 'Заблокирован' },
                    ]}
                />
            )
        }
    ];

    return (
        <Card style={{ borderRadius: 14, marginTop: 16 }}>
            <Table
                columns={columns}
                dataSource={usersData}
                loading={isLoading}
                rowKey="id"
                pagination={{ pageSize: 10 }}
                size="small"
            />
        </Card>
    );
}

export default UsersTab;