import React from 'react';
import { Table, Tag, Button, Space } from 'antd';
import { Link } from 'react-router-dom';
import useApplicationsTab from './useApplicationsTab';

function ApplicationsTab({ data, onRefresh }) {
    const { loading, cancelApplication } = useApplicationsTab(onRefresh);

    const columns = [
        {
            title: 'Возможность',
            dataIndex: 'opportunityTitle',
            render: (text, record) => <Link to={`/opportunities/${record.opportunityId}`}>{text}</Link>
        },
        { title: 'Дата', dataIndex: 'date' },
        {
            title: 'Статус',
            dataIndex: 'status',
            render: (status) => (
                <Tag color={status === 'Принят' ? 'green' : 'blue'}>{status.toUpperCase()}</Tag>
            )
        },
        {
            title: 'Действие',
            render: (_, record) => (
                <Button danger size="small" loading={loading} onClick={() => cancelApplication(record.id)}>
                    Отозвать
                </Button>
            )
        }
    ];

    return <Table rowKey="id" columns={columns} dataSource={data} pagination={{ pageSize: 8 }} />;
}

export default ApplicationsTab;