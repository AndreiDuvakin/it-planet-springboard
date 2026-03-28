import { Card, Empty, Flex, List, Button, Tag, Typography } from 'antd'
import { useMemo, useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { getFavoriteIds } from './favorites.js'
import { getOpportunities } from '../../../local/tramplinStore.js'
import { salaryText, TYPE_COLORS } from '../HomePage/useHomePage.js'

const { Text } = Typography

const TYPE_LABEL = {
  vacancy: 'Вакансия',
  vacancy_junior: 'Вакансия (Junior)',
  internship: 'Стажировка',
  mentor: 'Менторство',
  mentorship: 'Менторство',
  event: 'Мероприятие',
}

export default function FavoritesPage() {
  const [v, setV] = useState(0)
  useEffect(() => {
    const fn = () => setV((x) => x + 1)
    window.addEventListener('tramplin-store-changed', fn)
    return () => window.removeEventListener('tramplin-store-changed', fn)
  }, [])
  const items = useMemo(() => {
    const ids = new Set(getFavoriteIds().map(String))
    return getOpportunities().filter((o) => ids.has(String(o.id)))
  }, [v])

  return (
    <div style={{ display: 'grid', gap: 16 }}>
      <Card style={{ borderRadius: 14 }}>
        <Typography.Title level={2} style={{ margin: 0 }}>
          Избранное
        </Typography.Title>
        <Text type="secondary">Сохраняется в браузере (ТЗ).</Text>
      </Card>

      {items.length === 0 ? (
        <Card>
          <Empty description="Пока ничего не добавлено">
            <Link to="/">
              <Button type="primary">На главную</Button>
            </Link>
          </Empty>
        </Card>
      ) : (
        <List
          dataSource={items}
          renderItem={(opp) => {
            const sal = salaryText(opp)
            return (
              <List.Item
                actions={[
                  <Link key="open" to={`/opportunities/${opp.id}`}>
                    <Button type="primary">Открыть</Button>
                  </Link>,
                ]}
              >
                <List.Item.Meta
                  title={
                    <Flex align="center" gap={8} wrap="wrap">
                      <Text strong>{opp.title}</Text>
                      <Tag color={TYPE_COLORS[opp.type] || 'default'} style={{ margin: 0 }}>
                        {TYPE_LABEL[opp.type] || opp.type}
                      </Tag>
                    </Flex>
                  }
                  description={
                    <Flex vertical gap={4}>
                      <Text type="secondary">{opp.company}</Text>
                      <Flex gap={4} wrap="wrap">
                        {sal && <Tag color="geekblue">{sal}</Tag>}
                      </Flex>
                    </Flex>
                  }
                />
              </List.Item>
            )
          }}
        />
      )}
    </div>
  )
}
