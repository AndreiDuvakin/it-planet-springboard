import {
  Button,
  Card,
  Col,
  Empty,
  Flex,
  Form,
  Input,
  Row,
  Space,
  Tag,
  Typography,
  notification,
} from 'antd'
import {
  ArrowLeftOutlined,
  EnvironmentOutlined,
  HeartFilled,
  HeartOutlined,
  LinkOutlined,
  MailOutlined,
} from '@ant-design/icons'
import { useOpportunityPage } from './useOpportunityPage.js'
import { WORK_FORMATS } from '../../../mock/opportunities.js'
import { salaryText, TYPE_COLORS } from '../HomePage/useHomePage.js'

const { Title, Text, Paragraph } = Typography

const TYPE_LABEL = {
  vacancy: 'Вакансия',
  vacancy_junior: 'Вакансия (стажёрская/Junior)',
  internship: 'Стажировка',
  mentor: 'Менторская программа',
  mentorship: 'Менторская программа',
  event: 'Карьерное мероприятие',
}

export default function OpportunityPage() {
  const { opportunity, mapSrc, canApply, onApply, navigate, isFavorite, onToggleFav, userData } =
    useOpportunityPage()
  const [form] = Form.useForm()

  if (!opportunity) {
    return (
      <Card>
        <Empty description="Возможность не найдена">
          <Button type="primary" onClick={() => navigate('/')}>
            На главную
          </Button>
        </Empty>
      </Card>
    )
  }

  const sal = salaryText(opportunity)
  const wf = WORK_FORMATS.find((f) => f.value === opportunity.format)?.label || opportunity.format

  const submitApply = async (values) => {
    if (!canApply) {
      notification.info({ message: 'Войдите как соискатель, чтобы откликнуться' })
      return
    }
    
    onApply(values.coverLetter)
    
    notification.success({
      message: 'Отклик отправлен',
      description: 'Работодатель увидит ваше сообщение. Статус можно отследить в ЛК.',
    })
    form.resetFields()
  }

  return (
    <div style={{ display: 'grid', gap: 16 }}>
      <Button type="link" icon={<ArrowLeftOutlined />} onClick={() => navigate(-1)} style={{ padding: 0 }}>
        Назад
      </Button>

      <Card
        style={{
          borderRadius: 14,
          background:
            'linear-gradient(135deg, rgba(30,136,229,0.08) 0%, rgba(46,196,182,0.06) 100%, #fff 100%)',
        }}
      >
        <Flex justify="space-between" align="flex-start" gap={12} wrap="wrap">
          <div style={{ flex: 1, minWidth: 0 }}>
            <Title level={2} style={{ marginTop: 0 }}>
              {opportunity.title}
            </Title>
            <Text type="secondary" style={{ fontSize: 15 }}>
              {opportunity.company}
            </Text>
            <Flex wrap="wrap" gap={6} style={{ marginTop: 10 }}>
              <Tag color={TYPE_COLORS[opportunity.type] || 'default'}>
                {TYPE_LABEL[opportunity.type] || opportunity.type}
              </Tag>
              <Tag icon={<EnvironmentOutlined />}>
                {opportunity.format === 'remote'
                  ? `${opportunity.city || '—'} · удалённо`
                  : opportunity.address || opportunity.city}
              </Tag>
              {wf && <Tag>{wf}</Tag>}
              {sal && <Tag color="geekblue">{sal}</Tag>}
            </Flex>
          </div>
          <Button
            size="large"
            onClick={onToggleFav}
            icon={isFavorite ? <HeartFilled style={{ color: '#e53935' }} /> : <HeartOutlined />}
          >
            {isFavorite ? 'В избранном' : 'В избранное'}
          </Button>
        </Flex>
      </Card>

      <Row gutter={[16, 16]}>
        <Col xs={24} lg={14}>
          <Card title="Описание" variant="outlined" style={{ borderRadius: 14 }}>
            <Paragraph style={{ whiteSpace: 'pre-wrap', marginBottom: 12 }}>{opportunity.description}</Paragraph>
            <Text type="secondary">
              Опубликовано: {opportunity.publishedAt || '—'} · Срок / дата: {opportunity.expiresAt || '—'}
            </Text>
            <div style={{ marginTop: 12 }}>
              <Text strong>Теги: </Text>
              <Flex wrap="wrap" gap={4} style={{ marginTop: 6 }}>
                {(opportunity.tags || []).map((t) => (
                  <Tag key={t}>{t}</Tag>
                ))}
              </Flex>
            </div>
          </Card>


          <Card title="Контакты и ссылки" variant="outlined" style={{ borderRadius: 14, marginTop: 16 }}>
            <Space direction="vertical" size={8} style={{ width: '100%' }}>
              {opportunity.contacts?.site && (
                <a href={opportunity.contacts.site} target="_blank" rel="noreferrer">
                  <LinkOutlined /> Сайт
                </a>
              )}
              {opportunity.contacts?.email && (
                <Text>
                  <MailOutlined /> {opportunity.contacts.email}
                </Text>
              )}
              {opportunity.contacts?.telegram && <Text>Telegram: {opportunity.contacts.telegram}</Text>}
              {!opportunity.contacts?.site && !opportunity.contacts?.email && <Text type="secondary">Контакты не указаны</Text>}
            </Space>
          </Card>

          {canApply && (
            <Card title="Отклик" variant="outlined" style={{ borderRadius: 14, marginTop: 16 }}>
              <Form form={form} layout="vertical" onFinish={submitApply}>
                <Form.Item
                  name="coverLetter"
                  label="Сопроводительное письмо"
                  rules={[{ required: true, message: 'Кратко опишите мотивацию' }]}
                >
                  <Input.TextArea rows={5} placeholder="Почему вам интересна эта возможность..." />
                </Form.Item>
                <Button type="primary" htmlType="submit" size="large">
                  Откликнуться
                </Button>
              </Form>
            </Card>
          )}

          {!userData && (
            <Card size="small" style={{ marginTop: 16, borderRadius: 12 }}>
              <Text type="secondary">
                Войдите как соискатель, чтобы откликнуться. Без авторизации доступен просмотр карточки и карты.
              </Text>
            </Card>
          )}
        </Col>

        <Col xs={24} lg={10}>
          <Card title="Карта (Яндекс)" variant="outlined" style={{ borderRadius: 14 }}>
            <div
              style={{
                borderRadius: 12,
                overflow: 'hidden',
                border: '1px solid #f0f0f0',
                minHeight: 320,
              }}
            >
              <iframe title="Yandex map" src={mapSrc} width="100%" height="320" style={{ border: 'none' }} />
            </div>
            <Text type="secondary" style={{ display: 'block', marginTop: 8, fontSize: 12 }}>
              Для офлайн-адреса показывается поиск по адресу; для удалённых — по городу работодателя.
            </Text>
          </Card>
        </Col>
      </Row>
    </div>
  )
}
