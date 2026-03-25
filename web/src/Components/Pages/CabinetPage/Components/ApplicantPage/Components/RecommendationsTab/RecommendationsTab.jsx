import React from 'react';
import { List, Avatar, Button, Space, Typography } from 'antd';
import { UserOutlined, CheckOutlined, CloseOutlined } from '@ant-design/icons';
import useRecommendationsTab from './useRecommendationsTab';

const { Text } = Typography;

function RecommendationsTab({ data, onRefresh }) {
    const { loading, handleAction } = useRecommendationsTab(onRefresh);

    return (
        <List
            loading={loading}
            dataSource={data}
            renderItem={(item) => (
                <List.Item
                    actions={[
                        <Button key="ok" type="primary" size="small" icon={<CheckOutlined />} onClick={() => handleAction(item.id, 'accept')}>Принять</Button>,
                        <Button key="no" size="small" icon={<CloseOutlined />} onClick={() => handleAction(item.id, 'decline')}>Скрыть</Button>
                    ]}
                >
                    <List.Item.Meta
                        avatar={<Avatar icon={<UserOutlined />} />}
                        title={<Text strong>{item.fromName}</Text>}
                        description={
                            <div>
                                <Text type="secondary">Рекомендует вас на позицию: </Text>
                                <Text strong>{item.opportunityTitle}</Text>
                                <div style={{ fontSize: '12px', marginTop: 4 }}>Дата: {item.date}</div>
                            </div>
                        }
                    />
                </List.Item>
            )}
        />
    );
}

export default RecommendationsTab;