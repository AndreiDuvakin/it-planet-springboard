import React from 'react'
import { Modal, Form, Input, Divider, Select, notification } from 'antd'
import useOpportunityModal from './useOpportunityModal.js'
import InternshipFields from './Internship/InternshipFields.jsx'
import VacancyFields from './Vacancy/VacancyFields.jsx'
import EventFields from './Event/EventFields.jsx'
import MentorshipFields from './Mentorship/MentorshipFields.jsx'

const OpportunityModal = ({ isOpen, mode, kind, editingId, form, onClose }) => {
  const { isSubmitting, handleSubmit, tagsDictionary } = useOpportunityModal(
    form,
    mode,
    kind,
    editingId,
    onClose,
    notification
  )

  const titles = {
    vacancy: mode === 'edit' ? 'Редактировать вакансию' : 'Новая вакансия',
    internship: mode === 'edit' ? 'Редактировать стажировку' : 'Новая стажировка',
    event: mode === 'edit' ? 'Редактировать мероприятие' : 'Новое мероприятие',
    mentorship: mode === 'edit' ? 'Редактировать менторство' : 'Менторская программа',
  }

  return (
    <Modal
      title={titles[kind] || 'Добавление возможности'}
      open={isOpen}
      onCancel={() => {
        form.resetFields()
        onClose()
      }}
      onOk={handleSubmit}
      confirmLoading={isSubmitting}
      okText={mode === 'edit' ? 'Сохранить' : 'Опубликовать'}
      cancelText="Отмена"
      width={720}
      destroyOnClose
    >
      <Form form={form} layout="vertical" preserve={false}>
        <Form.Item label="Название" name="title" rules={[{ required: true, message: 'Введите название' }]}>
          <Input placeholder="Напр: Frontend Developer" />
        </Form.Item>

        <Form.Item
          label="Описание и требования"
          name="description"
          rules={[{ required: true, message: 'Введите описание' }]}
        >
          <Input.TextArea rows={4} placeholder="Задачи, требования, медиа (ссылки можно в тексте)..." />
        </Form.Item>

        {kind === 'vacancy' && <VacancyFields />}
        {kind === 'internship' && <InternshipFields />}
        {kind === 'event' && <EventFields />}
        {kind === 'mentorship' && <MentorshipFields />}

        <Divider style={{ marginBlock: 12 }} />

        <Form.Item
          label="Теги / стек (локально для карточки)"
          name="local_tags"
          tooltip="Сохраняются в карточке и в каталоге; расширяйте список, вводя новый тег и нажимая Enter"
        >
          <Select
            mode="tags"
            options={tagsDictionary || []}
            placeholder="Например: Python, Junior"
            filterOption={(input, option) =>
              (option?.label ?? '').toLowerCase().includes(input.toLowerCase())
            }
          />
        </Form.Item>
      </Form>
    </Modal>
  )
}

export default OpportunityModal
