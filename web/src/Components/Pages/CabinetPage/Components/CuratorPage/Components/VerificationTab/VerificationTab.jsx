import React, { useEffect, useState } from 'react'
import {
    Badge, Button, Descriptions, Drawer, Empty, Flex,
    Space, Table, Tag, Typography, notification,
} from 'antd'
import { CheckOutlined, CloseOutlined, EyeOutlined, QuestionCircleOutlined } from '@ant-design/icons'
import { getVerificationQueue, setVerificationRequestStatus } from '../../../../../../../local/tramplinStore.js'

const { Text } = Typography

const STATUS_COLOR = { pending: 'processing', approved: 'success', rejected: 'error', clarify: 'warning' }
const STATUS_LABEL = { pending: 'На проверке', approved: 'Верифицировано', rejected: 'Отклонено', clarify: 'Нужно уточнение' }

export default function VerificationTab() {
    const [requests, setRequests] = useState([])
    const [drawer, setDrawer] = useState(null)

    const load = () => setRequests(getVerificationQueue())
    useEffect(() => { load() }, [])
    useEffect(() => {
        const fn = () => load()
        window.addEventListener('tramplin-store-changed', fn)
        return () => window.removeEventListener('tramplin-store-changed', fn)
    }, [])

    const pending = requests.filter(r => r.status === 'pending').length

    const handleDecision = (id, decision) => {
        setVerificationRequestStatus(id, decision)
        const msgs = { approved: 'Компания верифицирована', rejected: 'Заявка отклонена', clarify: 'Запрошено уточнение' }
        notification.success({ message: msgs[decision] })
        setDrawer(null)
        load()
    }

    const columns = [
        {
            title: 'Компания', key: 'company',
            render: (_, r) => (
                <div>
                    <Text strong>{r.company}</Text><br />
                    <Text type="secondary" style={{ fontSize: 12 }}>ИНН: {r.inn}</Text>
                </div>
            ),
        },
        {
            title: 'Email', dataIndex: 'corporateEmail', key: 'email',
            render: e => <Text style={{ fontSize: 12 }}>{e}</Text>,
        },
        {
            title: 'Дата', dataIndex: 'submittedAt', key: 'date', width: 110,
            render: d => (
                <Text type="secondary" style={{ fontSize: 12 }}>
                    {d ? new Date(d).toLocaleDateString('ru') : '—'}
                </Text>
            ),
        },
        {
            title: 'Статус', dataIndex: 'status', key: 'status', width: 140,
            render: s => <Tag color={STATUS_COLOR[s]}>{STATUS_LABEL[s] || s}</Tag>,
        },
        {
            title: '', key: 'actions', width: 180,
            render: (_, r) => (
                <Space size={4}>
                    <Button size="small" icon={<EyeOutlined />} onClick={() => setDrawer(r)}>Детали</Button>
                    {r.status === 'pending' && (
                        <>
                            <Button size="small" type="primary" icon={<CheckOutlined />}
                                    onClick={() => handleDecision(r.id, 'approved')} />
                            <Button size="small" danger icon={<CloseOutlined />}
                                    onClick={() => handleDecision(r.id, 'rejected')} />
                            <Button size="small" icon={<QuestionCircleOutlined />}
                                    onClick={() => handleDecision(r.id, 'clarify')} />
                        </>
                    )}
                </Space>
            ),
        },
    ]

    return (
        <div>
            <Flex align="center" gap={8} style={{ marginBottom: 16 }}>
                <Text strong>Заявки на верификацию</Text>
                {pending > 0 && <Badge count={pending} style={{ backgroundColor: '#faad14' }} />}
            </Flex>

            {requests.length === 0
                ? <Empty description="Заявок на верификацию нет" />
                : <Table dataSource={requests} columns={columns} rowKey="id" size="small" pagination={{ pageSize: 15 }} />
            }

            <Drawer title="Заявка на верификацию" open={!!drawer} onClose={() => setDrawer(null)} width={460}
                    extra={drawer?.status === 'pending' && (
                        <Space>
                            <Button type="primary" icon={<CheckOutlined />}
                                    onClick={() => handleDecision(drawer.id, 'approved')}>Одобрить</Button>
                            <Button danger icon={<CloseOutlined />}
                                    onClick={() => handleDecision(drawer.id, 'rejected')}>Отклонить</Button>
                            <Button icon={<QuestionCircleOutlined />}
                                    onClick={() => handleDecision(drawer.id, 'clarify')}>Уточнить</Button>
                        </Space>
                    )}>
                {drawer && (
                    <Descriptions column={1} bordered size="small">
                        <Descriptions.Item label="Компания">{drawer.company}</Descriptions.Item>
                        <Descriptions.Item label="ИНН">{drawer.inn}</Descriptions.Item>
                        <Descriptions.Item label="Корп. почта">{drawer.corporateEmail}</Descriptions.Item>
                        <Descriptions.Item label="Ссылки">{drawer.links || '—'}</Descriptions.Item>
                        <Descriptions.Item label="ID пользователя">{drawer.userId}</Descriptions.Item>
                        <Descriptions.Item label="Дата подачи">
                            {drawer.submittedAt ? new Date(drawer.submittedAt).toLocaleString('ru') : '—'}
                        </Descriptions.Item>
                        <Descriptions.Item label="Статус">
                            <Tag color={STATUS_COLOR[drawer.status]}>{STATUS_LABEL[drawer.status]}</Tag>
                        </Descriptions.Item>
                    </Descriptions>
                )}
            </Drawer>
        </div>
    )
}