import React from 'react';
import { Card, Tabs, Typography, Spin } from 'antd';
import useApplicantCabinet from './useApplicantCabinet.jsx';

import ProfileTab from './Components/ProfileTab/ProfileTab';
import ApplicationsTab from './Components/ApplicationsTab/ApplicationsTab';
import ContactsTab from './Components/ContactsTab/ContactsTab';
import RecommendationsTab from './Components/RecommendationsTab/RecommendationsTab';

const { Title } = Typography;

function ApplicantCabinetPage() {
    const { loading, contextHolder, applications, contacts, recommendations, refresh } = useApplicantCabinet();

    const items = [
        {
            key: 'profile',
            label: 'Мой профиль',
            children: <ProfileTab/>
        },
        {
            key: 'applications',
            label: `Мои отклики (${applications.length})`,
            children: <ApplicationsTab data={applications} onRefresh={refresh} />
        },
        {
            key: 'recommendations',
            label: 'Рекомендации',
            children: <RecommendationsTab data={recommendations} onRefresh={refresh} />
        },
        {
            key: 'contacts',
            label: 'Контакты',
            children: <ContactsTab data={contacts} onRefresh={refresh} />
        }
    ];

    return (
        <div style={{ display: 'grid', gap: 16, padding: '24px', maxWidth: 1200, margin: '0 auto' }}>
            {contextHolder}
            <Card style={{ borderRadius: 14 }}>
                <Title level={2} style={{ margin: 0 }}>Личный кабинет</Title>
            </Card>

            <Spin spinning={loading}>
                <Card style={{ borderRadius: 14 }}>
                    <Tabs items={items} destroyOnHidden />
                </Card>
            </Spin>
        </div>
    );
}

export default ApplicantCabinetPage;