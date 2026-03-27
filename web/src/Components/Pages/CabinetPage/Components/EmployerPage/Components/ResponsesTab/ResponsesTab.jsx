import React from 'react';
import { Table, Select, Input, Typography } from 'antd';
import { Link } from 'react-router-dom';
import useResponsesTab from './useResponsesTab';

const { Text } = Typography;

function ResponsesTab({ data, onRefresh }) {
    const { handleStatusChange, handleNoteBlur } = useResponsesTab(onRefresh);

    const columns = [
        {
            title: 'Соискатель',
            dataIndex: 'fullName',
            render: (text) => <Text strong>{text}</Text>,
        },
        { title: 'Вуз', dataIndex: 'university' },
        {
            title: 'Возможность',
            dataIndex: 'opportunityTitle',
            render: (text, record) => <Link to={`/opportunities/${record.opportunityId}`}>{text}</Link>,
        },
        {
            title: 'Сопроводительное письмо',
            dataIndex: 'coverLetter',
            render: (text) => <Text>{text}</Text>,
        },
        {
            title: 'Статус',
            dataIndex: 'status',
            width: 180,
            render: (status, record) => (
                <Select
                    defaultValue={status}
                    size="large"
                    style={{ width: '100%' }}
                    options={[
                        { value: 'Принят', label: 'Принят' },
                        { value: 'Отклонён', label: 'Отклонён' },
                        { value: 'В резерве', label: 'В резерве' },
                    ]}
                    onChange={(val) => handleStatusChange(record.id, val)}
                />
            ),
        },
        {
            title: 'Ваша заметка',
            width: 250,
            render: (_, record) => (
                <Input
                    placeholder="Только для вас"
                    defaultValue={record.note}
                    size="large"
                    onBlur={(e) => handleNoteBlur(record.id, e.target.value)}
                />
            ),
        },
    ];

    return (
        <div style={{ padding: '10px 0' }}>
            <Table rowKey="id" columns={columns} dataSource={data} pagination={{ pageSize: 10 }} />
        </div>
    );
}

export default ResponsesTab;