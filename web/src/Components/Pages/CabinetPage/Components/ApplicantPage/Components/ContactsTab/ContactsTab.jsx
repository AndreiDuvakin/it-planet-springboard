import React from 'react';
import { List, Avatar, Button, Tag } from 'antd';
import { UserOutlined, MessageOutlined, DeleteOutlined } from '@ant-design/icons';
import useContactsTab from './useContactsTab';

function ContactsTab({ data, onRefresh }) {
    const { loading, removeContact } = useContactsTab(onRefresh);

    return (
        <List
            loading={loading}
            dataSource={data}
            renderItem={(contact) => (
                <List.Item
                    actions={[
                        <Button key="msg" size="small" icon={<MessageOutlined />}>Написать</Button>,
                        <Button key="del" size="small" danger icon={<DeleteOutlined />} onClick={() => removeContact(contact.id)} />
                    ]}
                >
                    <List.Item.Meta
                        avatar={<Avatar icon={<UserOutlined />} />}
                        title={contact.name}
                        description={
                            <div>
                                <span>{contact.university}</span>
                                <div style={{ marginTop: 4 }}>
                                    {contact.skills?.map(skill => (
                                        <Tag key={skill} style={{ fontSize: '10px' }}>{skill}</Tag>
                                    ))}
                                </div>
                            </div>
                        }
                    />
                </List.Item>
            )}
        />
    );
}

export default ContactsTab;