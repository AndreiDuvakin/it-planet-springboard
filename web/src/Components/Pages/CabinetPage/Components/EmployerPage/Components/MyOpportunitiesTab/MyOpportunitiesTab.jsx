import React from 'react';
import { Table, Button, Flex, Typography, Dropdown, Space, Tag, Skeleton } from 'antd';
import {
    PlusOutlined,
    DownOutlined,
    ThunderboltOutlined,
    RocketOutlined,
    TeamOutlined,
    CalendarOutlined
} from '@ant-design/icons';
import { Link } from 'react-router-dom';
import useMyOpportunitiesTab from './useMyOpportunitiesTab';

const { Text } = Typography;

const OPPORTUNITY_KIND_LABELS = {
    vacancy: { label: 'Вакансия', color: 'blue', icon: <ThunderboltOutlined /> },
    internship: { label: 'Стажировка', color: 'cyan', icon: <RocketOutlined /> },
    mentorship: { label: 'Менторство', color: 'purple', icon: <TeamOutlined /> },
    event: { label: 'Мероприятие', color: 'orange', icon: <CalendarOutlined /> },
};

const addMenuItems = [
    { key: 'vacancy', label: <Space><ThunderboltOutlined />Вакансия</Space> },
    { key: 'internship', label: <Space><RocketOutlined />Стажировка</Space> },
    { key: 'mentorship', label: <Space><TeamOutlined />Менторская программа</Space> },
    { key: 'event', label: <Space><CalendarOutlined />Мероприятие</Space> },
];

const MyOpportunitiesTab = ({ openCreate, openEdit, notify }) => {
    const { opportunities, isLoading } = useMyOpportunitiesTab(notify);

    const columns = [
        {
            title: 'Возможность',
            dataIndex: 'title',
            render: (title, row) => <Link to={`/opportunities/${row.id}`}>{title}</Link>,
        },
        {
            title: 'Тип',
            dataIndex: 'kind',
            width: 140,
            render: (kind) => {
                const meta = OPPORTUNITY_KIND_LABELS[kind] || {};
                return <Tag color={meta.color}>{meta.icon} {meta.label}</Tag>;
            },
        },
        {
            title: 'Статус',
            dataIndex: 'status',
            width: 140,
            render: (status) => <Tag>{status}</Tag>,
        },
        {
            title: 'Действия',
            width: 140,
            render: (_, row) => (
                <Button onClick={() => openEdit(row.id, row.kind)}>Редактировать</Button>
            ),
        },
    ];

    if (isLoading) return <Skeleton active />;

    return (
        <div style={{ display: 'grid', gap: 12 }}>
            <Flex justify="space-between" align="center" wrap="wrap" gap={12}>
                <Text type="secondary">
                    Управляйте активными, закрытыми и запланированными возможностями
                </Text>
                <Dropdown
                    menu={{
                        items: addMenuItems,
                        onClick: ({ key }) => openCreate(key),
                    }}
                >
                    <Button type="primary" icon={<PlusOutlined />} size="large" style={{ minWidth: 150 }}>
                        Добавить <DownOutlined />
                    </Button>
                </Dropdown>
            </Flex>

            <Table
                rowKey="id"
                pagination={false}
                dataSource={opportunities}
                columns={columns}
            />
        </div>
    );
};

export default MyOpportunitiesTab;