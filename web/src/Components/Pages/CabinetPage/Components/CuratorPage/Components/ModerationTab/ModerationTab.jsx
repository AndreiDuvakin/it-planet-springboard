import React, { useEffect, useState } from 'react'
import {
    Badge, Button, Descriptions, Drawer, Empty, Flex,
    Input, Select, Space, Table, Tag, Typography, notification,
} from 'antd'
import { CheckOutlined, CloseOutlined, EyeOutlined, SearchOutlined } from '@ant-design/icons'
import { getOpportunities, patchOpportunity } from '../../../../../../../local/tramplinStore.js'
import { TYPE_COLORS, salaryText } from '../../../../../HomePage/useHomePage.js'

const { Text } = Typography

const TYPE_LABEL = {
    vacancy: 'Вакансия', vacancy_junior: 'Вакансия (Junior)', internship: 'Стажировка',
    mentor: 'Менторство', mentorship: 'Менторство', event: 'Мероприятие',
}

export default function ModerationTab() {
    const [items, setItems] = useState([])
    const [statusFilter, setStatusFilter] = useState('pending')
    const [search, setSearch] = useState('')
    const [drawer, setDrawer] = useState(null)

    const load = () => setItems(getOpportunities())
    useEffect(() => { load() }, [])
    useEffect(() => {
        const fn = () => load()
        window.addEventListener('tramplin-store-changed', fn)
        return () => window.removeEventListener('tramplin-store-changed', fn)
    }, [])

    const pendingCount = items.filter(o => o.moderationStatus === 'pending').length

    const filtered = items.filter(o => {
        const byStatus = statusFilter === 'all' || o.moderationStatus === statusFilter
        const s = search.toLowerCase()
        return byStatus && (!s || o.title?.toLowerCase().includes(s) || o.company?.toLowerCase().includes(s))
    })

    const handleDecision = (id, status) => {
        patchOpportunity(id, { moderationStatus: status })
        notification.success({ message: status === 'approved' ? 'Карточка одобрена' : 'Карточка отклонена' })
        setDrawer(null)
        load()
    }

    const columns = [
        {
            title: 'Название', key: 'title',
            render: (_, r) => (
                <div>
                    <Text strong style={{ fontSize: 13 }}>{r.title}</Text><br />
                    <Text type="secondary" style={{ fontSize: 12 }}>{r.company}</Text>
                </div>
            ),
        },
        {
            title: 'Тип', dataIndex: 'type', key: 'type', width: 130,
            render: t => <Tag color={TYPE_COLORS[t]}>{TYPE_LABEL[t] || t}</Tag>,
        },
        {
            title: 'Статус', dataIndex: 'moderationStatus', key: 'status', width: 130,
            render: s => (
                <Tag color={s === 'approved' ? 'success' : s === 'rejected' ? 'error' : 'processing'}>
                    {s === 'approved' ? 'Одобрено' : s === 'rejected' ? 'Отклонено' : 'На модерации'}
                </Tag>
            ),
        },
        {
            title: 'Дата', dataIndex: 'publishedAt', key: 'date', width: 100,
            render: d => <Text type="secondary" style={{ fontSize: 12 }}>{d || '—'}</Text>,
        },
        {
            title: '', key: 'actions', width: 160,
            render: (_, r) => (
                <Space size={4}>
                    <Button size="small" icon={<EyeOutlined />} onClick={() => setDrawer(r)}>Просмотр</Button>
                    {r.moderationStatus !== 'approved' && (
                        <Button size="small" type="primary" icon={<CheckOutlined />}
                                onClick={() => handleDecision(r.id, 'approved')} />
                    )}
                    {r.moderationStatus !== 'rejected' && (
                        <Button size="small" danger icon={<CloseOutlined />}
                                onClick={() => handleDecision(r.id, 'rejected')} />
                    )}
                </Space>
            ),
        },
    ]

    return (
        <div>
            <Flex gap={12} style={{ marginBottom: 16 }} wrap="wrap" align="center">
                <Badge count={pendingCount} offset={[4, 0]}>
                    <Select value={statusFilter} onChange={setStatusFilter} style={{ width: 180 }}
                            options={[
                                { value: 'all', label: 'Все' },
                                { value: 'pending', label: 'На модерации' },
                                { value: 'approved', label: 'Одобрено' },
                                { value: 'rejected', label: 'Отклонено' },
                            ]} />
                </Badge>
                <Input placeholder="Поиск по названию / компании" prefix={<SearchOutlined />}
                       value={search} onChange={e => setSearch(e.target.value)} allowClear style={{ width: 280 }} />
                <Text type="secondary">Показано: {filtered.length}</Text>
            </Flex>

            {filtered.length === 0
                ? <Empty description={statusFilter === 'pending' ? 'Нет карточек на модерации' : 'Ничего не найдено'} />
                : <Table dataSource={filtered} columns={columns} rowKey="id" size="small" pagination={{ pageSize: 15 }} />
            }

            <Drawer
                title={drawer?.title}
                open={!!drawer} onClose={() => setDrawer(null)} width={520}
                extra={drawer && (
                    <Space>
                        <Button type="primary" icon={<CheckOutlined />}
                                onClick={() => handleDecision(drawer.id, 'approved')}
                                disabled={drawer.moderationStatus === 'approved'}>Одобрить</Button>
                        <Button danger icon={<CloseOutlined />}
                                onClick={() => handleDecision(drawer.id, 'rejected')}
                                disabled={drawer.moderationStatus === 'rejected'}>Отклонить</Button>
                    </Space>
                )}
            >
                {drawer && (
                    <Descriptions column={1} bordered size="small">
                        <Descriptions.Item label="Компания">{drawer.company}</Descriptions.Item>
                        <Descriptions.Item label="Тип">
                            <Tag color={TYPE_COLORS[drawer.type]}>{TYPE_LABEL[drawer.type] || drawer.type}</Tag>
                        </Descriptions.Item>
                        <Descriptions.Item label="Город">{drawer.city}</Descriptions.Item>
                        <Descriptions.Item label="Адрес">{drawer.address || '—'}</Descriptions.Item>
                        <Descriptions.Item label="Зарплата">{salaryText(drawer) || '—'}</Descriptions.Item>
                        <Descriptions.Item label="Действует до">{drawer.expiresAt || '—'}</Descriptions.Item>
                        <Descriptions.Item label="Теги">
                            {(drawer.tags || []).map(t => <Tag key={t}>{t}</Tag>)}
                        </Descriptions.Item>
                        <Descriptions.Item label="Описание">
                            <Text style={{ whiteSpace: 'pre-wrap', fontSize: 12 }}>{drawer.description}</Text>
                        </Descriptions.Item>
                        <Descriptions.Item label="Контакты">
                            {drawer.contacts?.email && <div>Email: {drawer.contacts.email}</div>}
                            {drawer.contacts?.site && <div>Сайт: <a href={drawer.contacts.site} target="_blank" rel="noreferrer">{drawer.contacts.site}</a></div>}
                            {drawer.contacts?.telegram && <div>Telegram: {drawer.contacts.telegram}</div>}
                        </Descriptions.Item>
                    </Descriptions>
                )}
            </Drawer>
        </div>
    )
}