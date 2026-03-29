import React, { useState, useEffect } from 'react'
import {
    Avatar, Badge, Button, Empty, Flex, Form, Input,
    List, Modal, Space, Tag, Typography, notification, Select,
} from 'antd'
import { DeleteOutlined, StarOutlined, UserAddOutlined, UserOutlined } from '@ant-design/icons'
import { useSelector } from 'react-redux'
import { Popconfirm } from 'antd'
import {
    getContactsForUser,
    addContact,
    removeContact,
    getOpportunities,
    addRecommendation,
    getPrivacy,
} from '../../../../../../../local/tramplinStore.js'

const { Text, Title } = Typography

function RecommendModal({ contact, open, onClose, currentUser }) {
    const [form] = Form.useForm()
    const [opps, setOpps] = useState([])

    useEffect(() => {
        if (open) {
            setOpps(getOpportunities().filter(o => o.moderationStatus === 'approved'))
        }
    }, [open])

    const handleSubmit = async () => {
        try {
            const v = await form.validateFields()
            const selectedOpp = opps.find(o => String(o.id) === String(v.opportunityId))

            addRecommendation({
                fromUserId: currentUser?.id,
                toUserId: contact.userId,
                fromName: currentUser?.name || 'Коллега',
                opportunityTitle: selectedOpp?.title || 'Вакансия',
            })

            notification.success({ message: `Рекомендация отправлена: ${contact.name}` })
            form.resetFields()
            onClose()
        } catch (e) {
            console.error(e)
        }
    }

    return (
        <Modal title={`Рекомендовать: ${contact?.name}`} open={open} onCancel={onClose}
               onOk={handleSubmit} okText="Отправить" destroyOnClose>
            <Form form={form} layout="vertical">
                <Form.Item name="opportunityId" label="Вакансия / мероприятие"
                           rules={[{ required: true, message: 'Выберите вакансию' }]}>
                    <Select placeholder="— Выберите —">
                        {opps.map(o => (
                            <Select.Option key={o.id} value={o.id}>
                                {o.title} ({o.company})
                            </Select.Option>
                        ))}
                    </Select>
                </Form.Item>
            </Form>
        </Modal>
    )
}

export default function ContactsTab() {
    const { userData } = useSelector(s => s.auth)
    const [contacts, setContacts] = useState([])
    const [addOpen, setAddOpen] = useState(false)
    const [recContact, setRecContact] = useState(null)
    const [form] = Form.useForm()
    const userId = userData?.id

    const load = () => {
        if (userId) setContacts(getContactsForUser(userId))
    }

    useEffect(() => {
        load()
    }, [userId])

    useEffect(() => {
        const fn = () => load()
        window.addEventListener('tramplin-store-changed', fn)
        return () => window.removeEventListener('tramplin-store-changed', fn)
    }, [userId])

    const handleAdd = async () => {
        const v = await form.validateFields()
        addContact(userId, {
            userId: v.email || `user_${Date.now()}`,
            name: v.name,
            university: v.university || '',
            skills: (v.skills || '').split(',').map(s => s.trim()).filter(Boolean),
        })
        form.resetFields()
        setAddOpen(false)
        notification.success({ message: 'Контакт добавлен' })
    }

    const enriched = contacts.map(c => {
        const privacy = c.userId ? getPrivacy(c.userId) : {}
        return {
            ...c,
            isOpen: privacy.profileVisibility === 'public' || privacy.profileVisibility === 'contacts'
        }
    })

    return (
        <div>
            <Flex justify="space-between" align="center" style={{ marginBottom: 16 }}>
                <Title level={5} style={{ margin: 0 }}>
                    Профессиональные контакты ({contacts.length})
                </Title>
                <Button type="primary" icon={<UserAddOutlined />} onClick={() => setAddOpen(true)}>
                    Добавить контакт
                </Button>
            </Flex>

            {contacts.length === 0
                ? <Empty description="Список контактов пуст" />
                : (
                    <List
                        dataSource={enriched}
                        renderItem={contact => (
                            <List.Item
                                actions={[
                                    <Button key="rec" size="small" icon={<StarOutlined />}
                                            onClick={() => setRecContact(contact)}>
                                        Рекомендовать
                                    </Button>,
                                    <Popconfirm
                                        key="del"
                                        title="Удалить контакт?"
                                        onConfirm={() => {
                                            removeContact(contact.id)
                                            notification.success({ message: 'Контакт удалён' })
                                        }}
                                    >
                                        <Button size="small" danger icon={<DeleteOutlined />} />
                                    </Popconfirm>
                                ]}
                            >
                                <List.Item.Meta
                                    avatar={
                                        <Badge dot={contact.isOpen} color="green" offset={[-2, 32]}>
                                            <Avatar icon={<UserOutlined />} size={40} />
                                        </Badge>
                                    }
                                    title={
                                        <Space>
                                            <Text strong>{contact.name}</Text>
                                            {contact.isOpen &&
                                                <Tag color="blue" style={{ fontSize: 10 }}>Виден вам</Tag>}
                                        </Space>
                                    }
                                    description={
                                        <div>
                                            <Text type="secondary" style={{ fontSize: 12 }}>
                                                {contact.university || 'Вуз не указан'}
                                            </Text>
                                            <div style={{ marginTop: 4 }}>
                                                {(contact.skills || []).map(s =>
                                                    <Tag key={s} style={{ fontSize: 10 }}>{s}</Tag>
                                                )}
                                            </div>
                                        </div>
                                    }
                                />
                            </List.Item>
                        )}
                    />
                )
            }

            <Modal title="Добавить контакт" open={addOpen} onCancel={() => setAddOpen(false)}
                   onOk={() => form.submit()} okText="Добавить">
                <Form form={form} layout="vertical" onFinish={handleAdd}>
                    <Form.Item name="name" label="Имя" rules={[{ required: true }]}>
                        <Input placeholder="Иван Петров" />
                    </Form.Item>
                    <Form.Item name="university" label="Вуз / Организация">
                        <Input placeholder="МГТУ им. Баумана" />
                    </Form.Item>
                    <Form.Item name="email" label="Email / ID">
                        <Input placeholder="contact@example.com" />
                    </Form.Item>
                    <Form.Item name="skills" label="Навыки (через запятую)">
                        <Input placeholder="Python, SQL, React" />
                    </Form.Item>
                </Form>
            </Modal>

            <RecommendModal
                contact={recContact}
                open={!!recContact}
                onClose={() => setRecContact(null)}
                currentUser={userData}
            />
        </div>
    )
}
