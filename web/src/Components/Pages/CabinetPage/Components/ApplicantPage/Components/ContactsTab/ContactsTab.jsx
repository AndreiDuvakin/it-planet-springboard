import React, { useState } from 'react'
import { List, Avatar, Button, Tag, Modal, Form, Input } from 'antd'
import { UserOutlined, MessageOutlined, DeleteOutlined, UserAddOutlined } from '@ant-design/icons'
import { useSelector } from 'react-redux'
import useContactsTab from './useContactsTab'
import { addContact } from '../../../../../../../local/tramplinStore.js'

function ContactsTab({ data, onRefresh }) {
  const { loading, removeContact } = useContactsTab(onRefresh)
  const { userData } = useSelector((s) => s.auth)
  const [open, setOpen] = useState(false)
  const [form] = Form.useForm()

  const handleAdd = async () => {
    const v = await form.validateFields()
    addContact(userData?.id, {
      userId: v.email,
      name: v.name,
      university: v.university || '',
      skills: (v.skills || '').split(',').map((s) => s.trim()).filter(Boolean),
    })
    form.resetFields()
    setOpen(false)
    if (onRefresh) onRefresh()
  }

  return (
    <>
      <Button type="primary" icon={<UserAddOutlined />} onClick={() => setOpen(true)} style={{ marginBottom: 12 }}>
        Добавить контакт
      </Button>
      <List
        loading={loading}
        dataSource={data}
        renderItem={(contact) => (
          <List.Item
            actions={[
              <Button key="msg" size="small" icon={<MessageOutlined />}>
                Написать
              </Button>,
              <Button
                key="del"
                size="small"
                danger
                icon={<DeleteOutlined />}
                onClick={() => removeContact(contact.id)}
              />,
            ]}
          >
            <List.Item.Meta
              avatar={<Avatar icon={<UserOutlined />} />}
              title={contact.name}
              description={
                <div>
                  <span>{contact.university}</span>
                  <div style={{ marginTop: 4 }}>
                    {contact.skills?.map((skill) => (
                      <Tag key={skill} style={{ fontSize: '10px' }}>
                        {skill}
                      </Tag>
                    ))}
                  </div>
                </div>
              }
            />
          </List.Item>
        )}
      />
      <Modal title="Новый контакт" open={open} onCancel={() => setOpen(false)} onOk={handleAdd} okText="Добавить">
        <Form form={form} layout="vertical">
          <Form.Item name="name" label="Имя" rules={[{ required: true }]}>
            <Input placeholder="Как обращаться" />
          </Form.Item>
          <Form.Item name="university" label="Вуз / контекст">
            <Input placeholder="МГТУ им. Баумана" />
          </Form.Item>
          <Form.Item name="email" label="Условный ID / email">
            <Input placeholder="contact@example.com" />
          </Form.Item>
          <Form.Item name="skills" label="Навыки через запятую">
            <Input placeholder="Python, SQL" />
          </Form.Item>
        </Form>
      </Modal>
    </>
  )
}

export default ContactsTab
