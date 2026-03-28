import React from 'react';
import { Card, Tabs, Typography } from 'antd';
import { useEmployerCabinet } from './useEmployerCabinet';

import AccountTab from './Components/AccountTab/AccountTab';
import CompanyTab from './Components/CompanyTab/CompanyTab';
import MyOpportunitiesTab from './Components/MyOpportunitiesTab/MyOpportunitiesTab';
import ResponsesTab from './Components/ResponsesTab/ResponsesTab';
import OpportunityModal from './Components/OpportunityModal/OpportunityModal';

const { Title } = Typography;

function EmployerPage() {
    const {
        contextHolder,
        notify,
        form,
        modalState,
        openCreate,
        openEdit,
        closeModal,
        responsesTable,
        refreshResponses,
    } = useEmployerCabinet();

    const tabItems =[
        { key: 'account', label: 'Личные данные', children: <AccountTab notify={notify} /> },
        { key: 'company', label: 'Компания', children: <CompanyTab notify={notify} /> },
        {
            key: 'my',
            label: 'Мои возможности',
            children: <MyOpportunitiesTab openCreate={openCreate} openEdit={openEdit} notify={notify} />
        },
        { key: 'responses', label: 'Отклики', children: <ResponsesTab data={responsesTable} onRefresh={refreshResponses} notify={notify} /> },
    ];

    return (
        <div style={{ display: 'grid', gap: 12 }}>
            {contextHolder}

            <Card style={{ borderRadius: 14 }}>
                <Title level={2} style={{ marginTop: 0, marginBottom: 6 }}>
                    Кабинет работодателя
                </Title>
            </Card>

            <Card style={{ borderRadius: 14 }}>
                <Tabs items={tabItems} />
            </Card>

            <OpportunityModal
                isOpen={modalState.isOpen}
                mode={modalState.mode}
                kind={modalState.kind}
                editingId={modalState.editingId}
                form={form}
                onClose={closeModal}
                notify={notify}
            />
        </div>
    );
}

export default EmployerPage;