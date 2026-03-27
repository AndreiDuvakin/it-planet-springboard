import React from 'react';
import { Modal, Form, Input, Divider, Select, notification } from 'antd';
import useOpportunityModal from './useOpportunityModal';
import InternshipFields from './Internship/InternshipFields';

const OpportunityModal = ({ isOpen, mode, kind, editingId, form, onClose }) => {
    const { isSubmitting, handleSubmit, tagsDictionary } = useOpportunityModal(
        form, mode, kind, editingId, onClose, notification
    );

    const titles = {
        vacancy: mode === 'edit' ? 'Редактировать вакансию' : 'Новая вакансия',
        internship: mode === 'edit' ? 'Редактировать стажировку' : 'Новая стажировка',
    };

    return (
        <Modal
            title={titles[kind] || 'Добавление возможности'}
            open={isOpen}
            onCancel={() => { form.resetFields(); onClose(); }}
            onOk={handleSubmit}
            confirmLoading={isSubmitting}
            okText={mode === 'edit' ? 'Сохранить' : 'Опубликовать'}
            cancelText="Отмена"
            width={680}
            destroyOnClose
        >
            <Form form={form} layout="vertical" preserve={false}>
                <Form.Item label="Название" name="title" rules={[{ required: true, message: 'Введите название' }]}>
                    <Input placeholder="Напр: Frontend Developer" />
                </Form.Item>

                <Form.Item label="Краткое описание" name="description" rules={[{ required: true, message: 'Введите описание' }]}>
                    <Input.TextArea rows={3} placeholder="Расскажите об основных задачах..." />
                </Form.Item>

                {kind === 'internship' && <InternshipFields />}

                <Divider style={{ marginBlock: 12 }} />

                <Form.Item label="Теги / навыки" name="tags">
                    <Select
                        mode="multiple"
                        options={tagsDictionary || []}
                        placeholder="Выберите подходящие теги"
                        loading={!tagsDictionary?.length}
                    />
                </Form.Item>
            </Form>
        </Modal>
    );
};

export default OpportunityModal;