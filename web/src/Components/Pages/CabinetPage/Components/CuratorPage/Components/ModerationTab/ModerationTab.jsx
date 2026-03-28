import React from 'react';
import { Table, Tag, Select, Input, Space, Tooltip } from 'antd';
import { Link } from 'react-router-dom';
import useModerationTab from './useModerationTab';

function ModerationTab({ data, onRefresh }) {
    const { updateOpportunity, loading } = useModerationTab(onRefresh);

    const columns = [
        {
            title: 'Карточка',
            dataIndex: 'title',
            key: 'title',
            render: (text, record) => (
                <Link to={`/opportunities/${record.id}`} style={{ fontWeight: 500 }}>
                    {text}
                </Link>
            ),
        },
        {
            title: 'Компания',
            dataIndex: 'company',
            key: 'company',
        },
        {
            title: 'Тип',
            dataIndex: 'type',
            key: 'type',
            render: (type) => <Tag color="blue">{String(type)}</Tag>,
        },
        {
            title: 'Статус',
            dataIndex: 'moderationStatus',
            key: 'moderationStatus',
            width: 200,
            render: (status, record) => (
                <Select
                    value={status || 'pending'}
                    style={{ width: '100%' }}
                    loading={loading}
                    onChange={(val) => updateOpportunity(record.id, { status: val })}
                    options={[
                        { value: 'pending', label: 'На модерации' },
                        { value: 'approved', label: 'Одобрено' },
                        { value: 'rejected', label: 'Отклонено' },
                    ]}
                />
            ),
        },
        {
            title: 'Комментарий модератора',
            dataIndex: 'moderationComment',
            key: 'moderationComment',
            render: (comment, record) => (
                <Input
                    defaultValue={comment}
                    placeholder="Причина отклонения..."
                    onBlur={(e) => updateOpportunity(record.id, { moderationComment: e.target.value })}
                />
            ),
        },
    ];

    return (
        <Table
            columns={columns}
            dataSource={data}
            rowKey="id"
            pagination={{ pageSize: 8 }}
            scroll={{ x: 800 }}
        />
    );
}

export default ModerationTab;