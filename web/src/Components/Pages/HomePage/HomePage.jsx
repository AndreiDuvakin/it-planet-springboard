import {
    Button, Card, Col, Empty, Flex, Input, List,
    Row, Select, Slider, Space, Tabs, Tag, Typography,
} from 'antd'
import {
    DollarOutlined, EnvironmentOutlined,
    HeartFilled, HeartOutlined, SearchOutlined,
} from '@ant-design/icons'
import { OPPORTUNITY_TYPES, WORK_FORMATS } from '../../../mock/opportunities.js'
import {
    EMPLOYMENT_TYPES, EXPERIENCE_LEVELS, TYPE_COLORS, salaryText, useHomePage,
} from './useHomePage'
import HomeMap from './HomeMap.jsx'

const { Title, Text } = Typography

const TYPE_LABEL = {
    vacancy: 'Вакансия',
    internship: 'Стажировка', mentor: 'Менторство',
    mentorship: 'Менторство', event: 'Мероприятие',
}

export default function HomePage() {
    const {
        navigate, contextHolder,
        search, setSearch, types, setTypes, formats, setFormats,
        tags, setTags, salary, setSalary,
        experienceLevels, setExperienceLevels,
        employmentTypes, setEmploymentTypes,
        favoriteIds, filtered, selectedItem, selectedId,
        onSelectMapItem, onToggleFavorite, allSkillTags, favoriteCompanyNames,
    } = useHomePage()

    return (
        <div style={{ display: 'grid', gap: 16, maxWidth: 1600, margin: '0 auto', width: '100%' }}>
            {contextHolder}

            <Card style={{
                borderRadius: 14,
                background: 'linear-gradient(135deg, rgba(30,136,229,0.10) 0%, rgba(46,196,182,0.08) 70%, rgba(255,255,255,1) 100%)',
            }}>
                <Row gutter={[12, 12]} align="middle">
                    <Col xs={24} md={14}>
                        <Space direction="vertical" size={4}>
                            <Title level={2} style={{ margin: 0 }}>Найдите первую работу или стажировку</Title>
                            <Text type="secondary">Вакансии, стажировки, менторские программы и карьерные мероприятия</Text>
                        </Space>
                    </Col>
                    <Col xs={24} md={10}>
                        <Space.Compact style={{ width: '100%' }}>
                            <Input
                                placeholder="Должность, компания или город"
                                value={search} onChange={e => setSearch(e.target.value)}
                                allowClear size="large"
                                prefix={<SearchOutlined style={{ color: '#bbb' }} />}
                            />
                            <Button type="primary" size="large">Найти</Button>
                        </Space.Compact>
                    </Col>
                </Row>
            </Card>

             <Row gutter={[12, 12]}>
                 <Col xs={24} lg={5}>
                     <Card title="Фильтры" variant="outlined" style={{ borderRadius: 14, position: 'sticky', top: 16 }}>
                        <Space direction="vertical" size={10} style={{ width: '100%' }}>
                            <Select mode="multiple" placeholder="Тип возможности" value={types} onChange={setTypes}
                                    options={OPPORTUNITY_TYPES} style={{ width: '100%' }} allowClear />
                            <Select mode="multiple" placeholder="Формат работы" value={formats} onChange={setFormats}
                                    options={WORK_FORMATS} style={{ width: '100%' }} allowClear />
                            <Select mode="multiple" placeholder="Уровень опыта" value={experienceLevels}
                                    onChange={setExperienceLevels} options={EXPERIENCE_LEVELS} style={{ width: '100%' }} allowClear />
                            <Select mode="multiple" placeholder="Тип занятости" value={employmentTypes}
                                    onChange={setEmploymentTypes} options={EMPLOYMENT_TYPES} style={{ width: '100%' }} allowClear />
                            <Select
                                mode="multiple" placeholder="Навыки / теги" value={tags} onChange={setTags}
                                options={allSkillTags.map(t => ({ value: t.id, label: t.title }))}
                                style={{ width: '100%' }} showSearch
                                filterOption={(input, opt) =>
                                    (opt?.label ?? '').toLowerCase().includes(input.toLowerCase())}
                                allowClear
                            />
                            <div>
                                <Flex justify="space-between" style={{ marginBottom: 2 }}>
                                    <Text type="secondary" style={{ fontSize: 12 }}>Зарплата</Text>
                                    <Text type="secondary" style={{ fontSize: 12 }}>
                                        {salary[0].toLocaleString('ru')} – {salary[1].toLocaleString('ru')} ₽
                                    </Text>
                                </Flex>
                                <Slider range min={0} max={600000} step={5000} value={salary} onChange={setSalary}
                                        tooltip={{ formatter: v => `${v.toLocaleString('ru')} ₽` }} />
                            </div>
                        </Space>
                    </Card>
                </Col>

                <Col xs={24} lg={19}>
                    <Card style={{ borderRadius: 14 }}>
                        <Tabs defaultActiveKey="map" items={[
                            {
                                key: 'map',
                                label: `Карта (${filtered.length})`,
                                children: filtered.length === 0
                                    ? <Empty description="Нет результатов по выбранным фильтрам" style={{ padding: 48 }} />
                                    : (
                                        <Row gutter={12} style={{ minHeight: 560 }}>
                                            <Col xs={24} md={8} style={{
                                                maxHeight: 560, overflowY: 'auto',
                                                paddingRight: 8, borderRight: '1px solid #f0f0f0',
                                            }}>
                                                {filtered.map(opp => {
                                                    const sal = salaryText(opp)
                                                    const isSelected = String(opp.id) === String(selectedId)
                                                    return (
                                                        <div key={opp.id} onClick={() => onSelectMapItem(opp.id)}
                                                             style={{
                                                                 padding: '10px 12px', marginBottom: 6, borderRadius: 10,
                                                                 cursor: 'pointer',
                                                                 border: `1.5px solid ${isSelected ? '#1677ff' : '#f0f0f0'}`,
                                                                 background: isSelected ? '#e6f4ff' : '#fafafa',
                                                                 transition: 'border-color 0.15s, background 0.15s',
                                                             }}>
                                                            <Flex justify="space-between" align="flex-start" gap={6}>
                                                                <Text strong style={{
                                                                    fontSize: 13, flex: 1,
                                                                    display: '-webkit-box', WebkitLineClamp: 2,
                                                                    WebkitBoxOrient: 'vertical', overflow: 'hidden',
                                                                }}>{opp.title}</Text>
                                                                <Tag color={TYPE_COLORS[opp.type]}
                                                                     style={{ fontSize: 11, margin: 0, flexShrink: 0 }}>
                                                                    {TYPE_LABEL[opp.type] || opp.type}
                                                                </Tag>
                                                            </Flex>
                                                            <Text type="secondary" style={{ fontSize: 12, display: 'block', marginTop: 2 }}>
                                                                {opp.company}
                                                            </Text>
                                                            <Flex wrap="wrap" gap={4} style={{ marginTop: 5 }}>
                                                                <Tag icon={<EnvironmentOutlined />} style={{ fontSize: 11, margin: 0 }}>
                                                                    {opp.format === 'remote' ? `${opp.city} · удалённо` : opp.city}
                                                                </Tag>
                                                                {sal && <Tag color="geekblue" style={{ fontSize: 11, margin: 0 }}>{sal}</Tag>}
                                                            </Flex>
                                                        </div>
                                                    )
                                                })}
                                            </Col>

                                            <Col xs={24} md={16} style={{ display: 'flex', flexDirection: 'column', gap: 8 }}>
                                                <div style={{
                                                    flex: 1, minHeight: 440, borderRadius: 12,
                                                    overflow: 'hidden', border: '1px solid #f0f0f0',
                                                }}>
                                                    <HomeMap items={filtered} selectedId={selectedId}
                                                             onSelect={onSelectMapItem} favoriteCompanyNames={favoriteCompanyNames} />
                                                </div>
                                                {selectedItem && (
                                                    <Card size="small" style={{
                                                        borderRadius: 10, border: '1px solid #e6f4ff', background: '#f8fbff',
                                                    }}>
                                                        <Flex justify="space-between" align="center" gap={8} wrap="wrap">
                                                            <div style={{ flex: 1, minWidth: 0 }}>
                                                                <Text strong ellipsis style={{ display: 'block' }}>{selectedItem.title}</Text>
                                                                <Text type="secondary" style={{ fontSize: 12 }}>
                                                                    {selectedItem.company} · {selectedItem.format === 'remote'
                                                                    ? `${selectedItem.city} (удалённо)`
                                                                    : selectedItem.address || selectedItem.city}
                                                                </Text>
                                                            </div>
                                                            <Space size={6}>
                                                                <Button size="middle" onClick={() => onToggleFavorite(selectedItem.id)}>
                                                                    {favoriteIds.includes(String(selectedItem.id))
                                                                        ? <HeartFilled style={{ color: '#e53935' }} />
                                                                        : <HeartOutlined />}
                                                                </Button>
                                                                <Button type="primary" size="middle"
                                                                        onClick={() => navigate(`/opportunities/${selectedItem.id}`)}>
                                                                    Открыть
                                                                </Button>
                                                            </Space>
                                                        </Flex>
                                                    </Card>
                                                )}
                                            </Col>
                                        </Row>
                                    ),
                            },
                            {
                                key: 'list',
                                label: `Лента (${filtered.length})`,
                                children: filtered.length === 0
                                    ? <Empty description="Нет результатов по выбранным фильтрам" style={{ padding: 48 }} />
                                    : (
                                        <List
                                            dataSource={filtered}
                                            renderItem={opp => {
                                                const sal = salaryText(opp)
                                                return (
                                                    <List.Item
                                                        style={{ padding: '12px 4px', alignItems: 'flex-start' }}
                                                        actions={[
                                                            <Button key="fav" size="middle" onClick={() => onToggleFavorite(opp.id)}>
                                                                {favoriteIds.includes(String(opp.id))
                                                                    ? <HeartFilled style={{ color: '#e53935' }} />
                                                                    : <HeartOutlined />}
                                                            </Button>,
                                                            <Button key="open" type="primary" size="middle"
                                                                    onClick={() => navigate(`/opportunities/${opp.id}`)}>
                                                                Открыть
                                                            </Button>,
                                                        ]}
                                                    >
                                                        <List.Item.Meta
                                                            title={
                                                                <Flex align="center" gap={8} wrap="wrap">
                                                                    <Text strong style={{ fontSize: 14 }}>{opp.title}</Text>
                                                                    <Tag color={TYPE_COLORS[opp.type] || 'default'} style={{ margin: 0 }}>
                                                                        {TYPE_LABEL[opp.type] || opp.type}
                                                                    </Tag>
                                                                    {favoriteIds.includes(String(opp.id)) &&
                                                                        <Tag color="blue" style={{ margin: 0 }}>Избранное</Tag>}
                                                                </Flex>
                                                            }
                                                            description={
                                                                <Space direction="vertical" size={4} style={{ marginTop: 2 }}>
                                                                    <Text type="secondary">{opp.company}</Text>
                                                                    <Flex wrap="wrap" gap={5}>
                                                                        <Tag icon={<EnvironmentOutlined />} style={{ margin: 0 }}>
                                                                            {opp.format === 'remote' ? `${opp.city} · удалённо` : opp.city}
                                                                        </Tag>
                                                                        {sal && <Tag icon={<DollarOutlined />} color="geekblue" style={{ margin: 0 }}>{sal}</Tag>}
                                                                        {opp.format && opp.format !== 'remote' && (
                                                                            <Tag style={{ margin: 0 }}>
                                                                                {WORK_FORMATS.find(f => f.value === opp.format)?.label || opp.format}
                                                                            </Tag>
                                                                        )}
                                                                        {opp.experienceLevel && (
                                                                            <Tag color="volcano" style={{ margin: 0 }}>
                                                                                {EXPERIENCE_LEVELS.find(e => e.value === opp.experienceLevel)?.label || opp.experienceLevel}
                                                                            </Tag>
                                                                        )}
                                                                        {(opp.tags || []).slice(0, 3).map(t => <Tag key={t} style={{ margin: 0 }}>{t}</Tag>)}
                                                                        {(opp.tags || []).length > 3 && (
                                                                            <Tag style={{ margin: 0, color: '#8c8c8c', borderStyle: 'dashed' }}>
                                                                                +{opp.tags.length - 3}
                                                                            </Tag>
                                                                        )}
                                                                    </Flex>
                                                                </Space>
                                                            }
                                                        />
                                                    </List.Item>
                                                )
                                            }}
                                        />
                                    ),
                            },
                        ]} />
                    </Card>
                </Col>
            </Row>
        </div>
    )
}