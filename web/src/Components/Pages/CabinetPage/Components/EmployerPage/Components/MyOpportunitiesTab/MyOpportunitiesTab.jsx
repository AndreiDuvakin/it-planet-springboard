import React, { useState, useEffect } from 'react'
import {
    Button, Empty, Flex, Popconfirm, Select, Space, Table, Tag, Typography, notification,
} from 'antd'
import { DeleteOutlined, EditOutlined, PlusOutlined, ReloadOutlined } from '@ant-design/icons'
import { useSelector } from 'react-redux'

import {
    getOpportunities,
    upsertExtraOpportunity,
    patchOpportunity,
    getEmployerVerificationStatus,
    bumpStore,
} from '../../../../../../../local/tramplinStore.js'

import OpportunityModal from '../OpportunityModal/OpportunityModal.jsx'
import { salaryText, TYPE_COLORS } from '../../../../../HomePage/useHomePage.js'

const { Text } = Typography

const TYPE_LABEL = {
    vacancy: 'Вакансия',
    internship: 'Стажировка',
    mentor: 'Менторство',
    mentorship: 'Менторство',
    event: 'Мероприятие',
}

const STATUS_LABELS = {
    approved: { color: 'success', text: 'Опубликовано' },
    pending: { color: 'processing', text: 'На модерации' },
    rejected: { color: 'error', text: 'Отклонено' },
    draft: { color: 'default', text: 'Черновик' },
}

export default function MyOpportunitiesTab() {
    const { userData } = useSelector(s => s.auth)
    const [opportunities, setOpportunities] = useState([])
    const [modalOpen, setModalOpen] = useState(false)
    const [editItem, setEditItem] = useState(null)
    const [statusFilter, setStatusFilter] = useState('all')

    const companyName = userData?.company?.title || userData?.name || ''
    const isVerified = getEmployerVerificationStatus(userData?.id) === 'approved'

    const load = () => {
        const all = getOpportunities()
        const myOpps = all.filter(o =>
            String(o.ownerUserId) === String(userData?.id) ||
            (companyName && o.company === companyName)
        )
        setOpportunities(myOpps)
    }

    useEffect(() => {
        load()
        const handleStoreChange = () => load()
        window.addEventListener('tramplin-store-changed', handleStoreChange)
        return () => window.removeEventListener('tramplin-store-changed', handleStoreChange)
    }, [userData, companyName])

    const filtered = statusFilter === 'all'
        ? opportunities
        : opportunities.filter(o => o.moderationStatus === statusFilter)

    const handleSubmit = (values) => {
        if (editItem) {
            patchOpportunity(editItem.id, values)
            notification.success({ message: 'Изменения сохранены' })
        } else {
            upsertExtraOpportunity({
                ...values,
                id: `local_${Date.now()}`,
                ownerUserId: userData?.id,
                company: companyName,
                moderationStatus: 'pending',
                publishedAt: new Date().toISOString().slice(0, 10),
            })
            notification.success({ message: 'Отправлено на модерацию' })
        }
        setModalOpen(false)
        setEditItem(null)
    }

    const handleDelete = (id) => {
        const extras = JSON.parse(localStorage.getItem('tramplin_opp_extras_v1') || '[]')
        const filteredExtras = extras.filter(o => String(o.id) !== String(id))
        localStorage.setItem('tramplin_opp_extras_v1', JSON.stringify(filteredExtras))

        const patches = JSON.parse(localStorage.getItem('tramplin_opp_patches_v1') || '{}')
        patches[id] = { ...patches[id], moderationStatus: 'rejected' }
        localStorage.setItem('tramplin_opp_patches_v1', JSON.stringify(patches))

        bumpStore()
        notification.success({ message: 'Удалено' })
    }

    const columns = [
        {
            title: 'Название',
            key: 'title',
            render: (_, r) => (
                <div>
                    <Text strong style={{ fontSize: 13 }}>{r.title}</Text><br />
                    <Tag color={TYPE_COLORS[r.type]} style={{ fontSize: 11, margin: '2px 0 0' }}>
                        {TYPE_LABEL[r.type] || r.type}
                    </Tag>
                </div>
            ),
        },
        {
            title: 'Город',
            dataIndex: 'city',
            key: 'city',
            width: 110,
            render: (city, r) => (
                <Text type="secondary" style={{ fontSize: 12 }}>
                    {city}{r.format === 'remote' ? ' (удал.)' : ''}
                </Text>
            ),
        },
        {
            title: 'Зарплата',
            key: 'salary',
            width: 130,
            render: (_, r) => <Text style={{ fontSize: 12 }}>{salaryText(r) || '—'}</Text>,
        },
        {
            title: 'Статус',
            dataIndex: 'moderationStatus',
            key: 'status',
            width: 130,
            render: (s) => {
                const st = STATUS_LABELS[s] || { color: 'default', text: s || '—' }
                return <Tag color={st.color}>{st.text}</Tag>
            },
        },
        {
            title: 'Дата',
            dataIndex: 'publishedAt',
            key: 'date',
            width: 100,
            render: d => <Text type="secondary" style={{ fontSize: 12 }}>{d || '—'}</Text>,
        },
        {
            title: '',
            key: 'actions',
            width: 80,
            render: (_, r) => (
                <Space size={4}>
                    <Button
                        size="small"
                        icon={<EditOutlined />}
                        onClick={() => { setEditItem(r); setModalOpen(true) }}
                    />
                    <Popconfirm
                        title="Удалить эту запись?"
                        onConfirm={() => handleDelete(r.id)}
                        okText="Да"
                        cancelText="Нет"
                    >
                        <Button size="small" danger icon={<DeleteOutlined />} />
                    </Popconfirm>
                </Space>
            ),
        },
    ]

    return (
        <div>
            <Flex justify="space-between" align="center" style={{ marginBottom: 16 }} wrap="wrap" gap={8}>
                <Space>
                    <Select
                        value={statusFilter}
                        onChange={setStatusFilter}
                        style={{ width: 160 }}
                        options={[
                            { value: 'all', label: 'Все' },
                            { value: 'approved', label: 'Опубликованные' },
                            { value: 'pending', label: 'На модерации' },
                            { value: 'rejected', label: 'Отклонённые' },
                        ]}
                    />
                    <Button icon={<ReloadOutlined />} onClick={load}>Обновить</Button>
                </Space>
                <Button
                    type="primary"
                    icon={<PlusOutlined />}
                    onClick={() => { setEditItem(null); setModalOpen(true) }}
                    disabled={!isVerified} 
                >
                    Создать возможность
                </Button>
            </Flex>

            {!isVerified && (
                <div style={{
                    padding: '10px 14px', marginBottom: 16, borderRadius: 8,
                    background: '#fffbe6', border: '1px solid #ffe58f',
                }}>
                    <Text type="warning">
                        ⚠ Для публикации вакансий и стажировок требуется верификация компании.
                        Перейдите во вкладку «Компания», чтобы подать заявку.
                    </Text>
                </div>
            )}

            {filtered.length === 0
                ? <Empty description="У вас пока нет активных записей." />
                : <Table
                    dataSource={filtered}
                    columns={columns}
                    rowKey="id"
                    size="small"
                    pagination={{ pageSize: 10 }}
                />
            }

            <OpportunityModal
                open={modalOpen}
                onClose={() => { setModalOpen(false); setEditItem(null) }}
                onSubmit={handleSubmit}
                initial={editItem}
                companyName={companyName}
                notificationApi={notification}
            />
        </div>
    )
}