import React, { useEffect, useState } from 'react'
import { Avatar, Empty, Flex, Select, Space, Table, Tag, Typography, notification } from 'antd'
import { UserOutlined } from '@ant-design/icons'
import { useSelector } from 'react-redux'
import {
    getApplicationsForEmployer,
    updateApplication,
    getOpportunities
} from '../../../../../../../local/tramplinStore.js'

const { Text } = Typography

const STATUS_OPTIONS = [
    { value: 'Новый', label: 'Новый' },
    { value: 'accepted', label: 'Принят' },
    { value: 'rejected', label: 'Отклонён' },
    { value: 'reserve', label: 'В резерве' },
]

const STATUS_COLORS = {
    'Новый': 'blue',
    accepted: 'success',
    rejected: 'error',
    reserve: 'warning',
    pending: 'processing'
}

export default function ResponsesTab() {
    const { userData } = useSelector(s => s.auth)
    const [applications, setApplications] = useState([])
    const [myOpps, setMyOpps] = useState([])
    const [filterOpp, setFilterOpp] = useState('all')
    const [filterStatus, setFilterStatus] = useState('all')

    const companyName = userData?.company?.title || userData?.name || ''

    const load = () => {
    const allOpps = getOpportunities().filter(
        o => String(o.ownerUserId) === String(userData?.id)
    )
    setMyOpps(allOpps)

    const allApps = JSON.parse(localStorage.getItem('tramplin_applications_v1') || '[]')
    const myApps = allApps.filter(a => String(a.ownerUserId) === String(userData?.id))
    
    setApplications(myApps)
}
    useEffect(() => { load() }, [userData, companyName])

    useEffect(() => {
        const fn = () => load()
        window.addEventListener('tramplin-store-changed', fn)
        return () => window.removeEventListener('tramplin-store-changed', fn)
    }, [userData, companyName])

    const filtered = applications.filter(a => {
        const byOpp = filterOpp === 'all' || String(a.opportunityId) === filterOpp
        const byStatus = filterStatus === 'all' || a.status === filterStatus
        return byOpp && byStatus
    })

    const columns = [
        {
            title: 'Соискатель', key: 'applicant',
            render: (_, r) => (
                <Flex align="center" gap={8}>
                    <Avatar icon={<UserOutlined />} size={32} />
                    <div>
                        <Text strong style={{ fontSize: 13 }}>{r.applicantName || 'Соискатель'}</Text><br />
                        <Text type="secondary" style={{ fontSize: 11 }}>
                            {r.applicantEmail || `ID пользователя: ${r.applicantUserId}`}
                        </Text>
                    </div>
                </Flex>
            ),
        },
        {
            title: 'Вакансия', key: 'opp',
            render: (_, r) => (
                <div>
                    <Text style={{ fontSize: 13 }}>{r.opportunityTitle}</Text>
                </div>
            ),
        },
        {
            title: 'Сопр. письмо', dataIndex: 'coverLetter', key: 'letter', width: 200,
            render: text => (
                <Text style={{ fontSize: 12 }} ellipsis={{ tooltip: text }}>{text || '—'}</Text>
            ),
        },
        {
            title: 'Дата', dataIndex: 'date', key: 'date', width: 100,
            render: d => (
                <Text type="secondary" style={{ fontSize: 12 }}>
                    {d || '—'}
                </Text>
            ),
        },
        {
            title: 'Статус', key: 'status', width: 160,
            render: (_, r) => (
                <Select
                    value={r.status || 'Новый'}
                    size="small"
                    style={{ width: 150 }}
                    options={STATUS_OPTIONS}
                    onChange={val => {
                        updateApplication(r.id, { status: val })
                        notification.success({ message: 'Статус обновлён' })
                    }}
                    optionRender={opt => (
                        <Space>
                            <Tag color={STATUS_COLORS[opt.value] || 'default'} style={{ marginRight: 0 }}>
                                {opt.label}
                            </Tag>
                        </Space>
                    )}
                />
            ),
        },
    ]

    return (
        <div>
            <Flex gap={12} style={{ marginBottom: 16 }} wrap="wrap">
                <Select
                    value={filterOpp}
                    onChange={setFilterOpp}
                    style={{ width: 220 }}
                    placeholder="Фильтр по вакансии"
                    options={[
                        { value: 'all', label: 'Все вакансии' },
                        ...myOpps.map(o => ({ value: String(o.id), label: o.title }))
                    ]}
                />
                <Select
                    value={filterStatus}
                    onChange={setFilterStatus}
                    style={{ width: 180 }}
                    placeholder="Фильтр по статусу"
                    options={[{ value: 'all', label: 'Все статусы' }, ...STATUS_OPTIONS]}
                />
            </Flex>

            {filtered.length === 0
                ? <Empty description="Откликов на ваши предложения пока нет" />
                : <Table
                    dataSource={filtered}
                    columns={columns}
                    rowKey="id"
                    size="small"
                    pagination={{ pageSize: 10 }}
                />
            }
        </div>
    )
}