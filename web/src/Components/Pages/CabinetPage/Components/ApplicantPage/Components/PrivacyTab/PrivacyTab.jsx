import { Card, Form, Radio, Switch, Button, Typography } from 'antd'
import usePrivacyTab from './usePrivacyTab.js'

const { Text } = Typography

export default function PrivacyTab() {
  const { form, onFinish } = usePrivacyTab()

  return (
    <Card title="Приватность и нетворкинг" variant="outlined" style={{ borderRadius: 14 }}>
      <Text type="secondary" style={{ display: 'block', marginBottom: 16 }}>
        Кто видит ваш профиль и отклики среди других соискателей
      </Text>
      <Form form={form} layout="vertical" onFinish={onFinish}>
        <Form.Item
          name="profileVisibility"
          label="Видимость профиля"
          rules={[{ required: true }]}
        >
          <Radio.Group>
            <Radio value="private">Только я</Radio>
            <Radio value="contacts">Мои контакты</Radio>
            <Radio value="all">Все авторизованные пользователи</Radio>
          </Radio.Group>
        </Form.Item>
        <Form.Item name="hideApplications" label="Скрыть отклики от других соискателей" valuePropName="checked">
          <Switch />
        </Form.Item>
        <Button type="primary" htmlType="submit">
          Сохранить
        </Button>
      </Form>
    </Card>
  )
}
