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
            render: (type) => <Tag color="blue">{type}</Tag>,
        },
        {
            title: 'Статус',
            dataIndex: 'status',
            key: 'status',
            width: 200,
            render: (status, record) => (
                <Select
                    value={status}
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
            dataIndex: 'comment',
            key: 'comment',
            render: (comment, record) => (
                <Input
                    defaultValue={comment}
                    placeholder="Причина отклонения..."
                    onBlur={(e) => updateOpportunity(record.id, { comment: e.target.value })}
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