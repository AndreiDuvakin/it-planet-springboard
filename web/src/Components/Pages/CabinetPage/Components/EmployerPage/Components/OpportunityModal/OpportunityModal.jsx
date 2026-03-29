import React, { useEffect, useState } from 'react'
import {
  Col, Divider, Form, Input, InputNumber, Modal, Row, Select, Typography,
} from 'antd'
import dayjs from 'dayjs'
import { getTagRegistry } from '../../../../../../../local/tramplinStore.js'
import { WORK_FORMATS, OPPORTUNITY_TYPES } from '../../../../../../../mock/opportunities.js'
import VacancyFields from './Vacancy/VacancyFields'
import InternshipFields from './Internship/InternshipFields'
import MentorshipFields from './Mentorship/MentorshipFields'
import EventFields from './Event/EventFields'
import useOpportunityModal from './useOpportunityModal'

const { Text } = Typography

function getTypeFields(type, allTags, setAllTags) {
  switch (type) {
    case 'vacancy': case 'vacancy_junior':
      return <VacancyFields allTags={allTags} setAllTags={setAllTags} />
    case 'internship':
      return <InternshipFields allTags={allTags} setAllTags={setAllTags} />
    case 'mentor': case 'mentorship':
      return <MentorshipFields allTags={allTags} setAllTags={setAllTags} />
    case 'event':
      return <EventFields allTags={allTags} setAllTags={setAllTags} />
    default:
      return null
  }
}

export default function OpportunityModal({ open, onClose, onSubmit, initial, companyName, notificationApi }) {
  const [form] = Form.useForm()
  const [type, setType] = useState(initial?.type || 'vacancy')
  const [allTags, setAllTags] = useState(getTagRegistry())

  const kindMap = {
    vacancy: 'vacancy', vacancy_junior: 'vacancy',
    internship: 'internship', mentor: 'mentor',
    mentorship: 'mentor', event: 'event',
  }
  const mode = initial ? 'edit' : 'create'
  const kind = kindMap[type] || 'vacancy'

  const { handleSubmit, isSubmitting } = useOpportunityModal(
    form, mode, kind, initial?.id, onClose, notificationApi
  )

  useEffect(() => {
    if (!open) return
    setAllTags(getTagRegistry())
    if (initial) {
      form.setFieldsValue({
        ...initial,
        expiresAt: initial.expiresAt ? dayjs(initial.expiresAt) : null,
        expires_at: initial.expiresAt ? dayjs(initial.expiresAt) : null,
        event_date: initial.expiresAt ? dayjs(initial.expiresAt) : null,
        lat: initial.location?.lat,
        lng: initial.location?.lng,
        local_tags: initial.tags || [],
      })
      setType(initial.type || 'vacancy')
    } else {
      form.resetFields()
      form.setFieldsValue({ type: 'vacancy', format: 'office' })
      setType('vacancy')
    }
  }, [open, initial, form])

  return (
    <Modal
      title={initial ? 'Редактировать возможность' : 'Новая возможность'}
      open={open}
      onCancel={onClose}
      onOk={handleSubmit}
      confirmLoading={isSubmitting}
      okText={initial ? 'Сохранить' : 'Создать'}
      cancelText="Отмена"
      width={700}
      destroyOnClose
    >
      <Form form={form} layout="vertical">
        <Row gutter={12}>
          <Col span={14}>
            <Form.Item label="Тип возможности" name="type" rules={[{ required: true }]}>
              <Select
                options={OPPORTUNITY_TYPES}
                onChange={val => { setType(val); form.setFieldsValue({ type: val }) }}
              />
            </Form.Item>
          </Col>
          <Col span={10}>
            <Form.Item label="Формат" name="format" rules={[{ required: true }]}>
              <Select options={WORK_FORMATS} />
            </Form.Item>
          </Col>
        </Row>

        <Form.Item
          label="Название позиции / мероприятия"
          name="title"
          rules={[{ required: true, message: 'Введите название' }]}
        >
          <Input placeholder="Frontend-разработчик / Хакатон 2026" size="large" />
        </Form.Item>

        <Form.Item label="Описание" name="description" rules={[{ required: true, message: 'Добавьте описание' }]}>
          <Input.TextArea rows={5} placeholder="Требования, условия, медиа-ссылки..." />
        </Form.Item>

        <Divider orientation="left">Контакты</Divider>
        <Row gutter={12}>
          <Col span={12}>
            <Form.Item label="Сайт" name={['contacts', 'site']}>
              <Input placeholder="https://example.com" />
            </Form.Item>
          </Col>
          <Col span={12}>
            <Form.Item label="Email" name={['contacts', 'email']}>
              <Input placeholder="hr@company.ru" />
            </Form.Item>
          </Col>
        </Row>
        <Form.Item label="Telegram" name={['contacts', 'telegram']}>
          <Input placeholder="@company_hr" />
        </Form.Item>

        <Divider orientation="left">Координаты на карте</Divider>
        <Text type="secondary" style={{ display: 'block', marginBottom: 8, fontSize: 12 }}>
          Для точного отображения на карте. Найти на maps.google.com (правая кнопка → «Что здесь?»)
        </Text>
        <Row gutter={12}>
          <Col span={12}>
            <Form.Item label="Широта (lat)" name="lat">
              <InputNumber style={{ width: '100%' }} placeholder="55.7522" step={0.0001} />
            </Form.Item>
          </Col>
          <Col span={12}>
            <Form.Item label="Долгота (lng)" name="lng">
              <InputNumber style={{ width: '100%' }} placeholder="37.6156" step={0.0001} />
            </Form.Item>
          </Col>
        </Row>

        <Divider />
        {getTypeFields(type, allTags, setAllTags)}
      </Form>
    </Modal>
  )
}
