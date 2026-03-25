import React from 'react';
import { Table, Button, Space, Typography, Tag } from 'antd';
import useVerificationTab from './useVerificationTab';

const { Text } = Typography;

function VerificationTab({ data, onRefresh }) {
    const { handleDecision, loading } = useVerificationTab(onRefresh);

    const columns = [
        {
            title: 'Компания / ИНН',
            key: 'companyInfo',
            render: (_, record) => (
                <Space direction="vertical" size={0}>
                    <Text strong>{record.company}</Text>
                    <Text type="secondary" size="small">ИНН: {record.inn}</Text>
                </Space>
            )
        },
        {
            title: 'Контактная почта',
            dataIndex: 'corporateEmail',
            key: 'corporateEmail',
        },
        {
            title: 'Действия',
            key: 'actions',
            width: 300,
            render: (_, record) => (
                <Space>
                    <Button
                        type="primary"
                        onClick={() => handleDecision(record.id, 'approve')}
                        loading={loading}
                    >
                        Подтвердить
                    </Button>
                    <Button
                        onClick={() => handleDecision(record.id, 'clarify')}
                        loading={loading}
                    >
                        Уточнить
                    </Button>
                    <Button
                        danger
                        onClick={() => handleDecision(record.id, 'reject')}
                        loading={loading}
                    >
                        Отклонить
                    </Button>
                </Space>
            )
        }
    ];

    return (
        <Table
            columns={columns}
            dataSource={data}
            rowKey="id"
            locale={{ emptyText: 'Нет активных заявок на верификацию' }}
        />
    );
}

export default VerificationTab;