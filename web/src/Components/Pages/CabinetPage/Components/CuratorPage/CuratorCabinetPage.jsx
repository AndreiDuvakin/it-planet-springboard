import React from 'react';
import {Card, Tabs, Typography, Spin, Layout} from 'antd';
import useCuratorCabinet from './useCuratorCabinet';

import AccountTab from './Components/AccountTab/AccountTab';
import ModerationTab from './Components/ModerationTab/ModerationTab';
import UsersTab from './Components/UsersTab/UsersTab';
import VerificationTab from './Components/VerificationTab/VerificationTab';

const {Title} = Typography;
const {Content} = Layout;

function CuratorCabinetPage() {
    const {
        isAdmin,
        contextHolder,
        loading,
        moderationRows,
        users,
        verificationQueue,
        refresh
    } = useCuratorCabinet();

    const items = [
        {
            key: 'account',
            label: 'Личные данные',
            children: <AccountTab/>
        },
        {
            key: 'moderation',
            label: 'Модерация возможностей',
            children: <ModerationTab data={moderationRows} onRefresh={refresh}/>
        },
        {
            key: 'users',
            label: 'Пользователи',
            children: <UsersTab data={users} onRefresh={refresh}/>
        },
        {
            key: 'verification',
            label: `Верификация (${verificationQueue.length})`,
            children: <VerificationTab data={verificationQueue} onRefresh={refresh}/>
        },
    ];

    return (
        <Layout style={{minHeight: '100vh', padding: '24px'}}>
            <Content>
                {contextHolder}
                <div style={{maxWidth: 1200, margin: '0 auto', display: 'grid', gap: 16}}>
                    <Card style={{borderRadius: 14, boxShadow: '0 2px 8px rgba(0,0,0,0.05)'}}>
                        <Title level={2} style={{margin: 0}}>Кабинет куратора</Title>
                    </Card>

                    <Spin spinning={loading} tip="Загрузка данных...">
                        <Card style={{borderRadius: 14, boxShadow: '0 2px 8px rgba(0,0,0,0.05)'}}>
                            <Tabs
                                defaultActiveKey="account"
                                items={items}
                                destroyInactiveTabPane={true}
                            />
                        </Card>
                    </Spin>
                </div>
            </Content>
        </Layout>
    );
}

export default CuratorCabinetPage;