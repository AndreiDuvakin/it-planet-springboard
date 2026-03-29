import React from 'react';
import { Form, Input, Select, DatePicker, Row, Col, Skeleton, Alert, Switch } from 'antd';
import useInternshipFields from './useInternshipFields';

const InternshipFields = ({ allTags, setAllTags }) => {
    const { dictionaries, isLoading, isError } = useInternshipFields();

    if (isLoading) return <Skeleton active />;
    if (isError) return <Alert message="Ошибка загрузки справочников" type="error" showIcon />;

    return (
        <>
            <Row gutter={12}>
                <Col span={12}>
                    <Form.Item label="Уровень опыта" name="experience_level_id" rules={[{ required: true }]}>
                        <Select options={dictionaries.experienceLevels} placeholder="Напр: Junior" />
                    </Form.Item>
                </Col>
                <Col span={12}>
                    <Form.Item label="Формат работы" name="work_format_id" rules={[{ required: true }]}>
                        <Select options={dictionaries.workFormats} placeholder="Напр: Удаленно" />
                    </Form.Item>
                </Col>
            </Row>

            <Form.Item label="Адрес / город" name="address" rules={[{ required: true }]}>
                <Input placeholder="Город, улица, дом" />
            </Form.Item>

            <Row gutter={12}>
                <Col span={12}>
                    <Form.Item label="Длительность (мес)" name="duration_months" rules={[{ required: true }]}>
                        <Input type="number" placeholder="3" />
                    </Form.Item>
                </Col>
                <Col span={12}>
                    <Form.Item label="Срок подачи" name="expires_at">
                        <DatePicker style={{ width: '100%' }} />
                    </Form.Item>
                </Col>
            </Row>

            <Row gutter={24}>
                <Col span={12}>
                    <Form.Item label="Оплачиваемая" name="is_paid" valuePropName="checked">
                        <Switch />
                    </Form.Item>
                </Col>
                <Col span={12}>
                    <Form.Item label="Есть наставник" name="mentorship_available" valuePropName="checked">
                        <Switch />
                    </Form.Item>
                </Col>
            </Row>

            <Form.Item label="Теги (навыки, технологии)" name="local_tags">
                <Select
                    mode="multiple"
                    placeholder="Выберите или добавьте теги"
                    options={allTags.map(t => ({ value: t.title, label: t.title }))}
                    filterOption={(input, opt) =>
                        (opt?.label ?? '').toLowerCase().includes(input.toLowerCase())}
                    allowClear
                />
            </Form.Item>
        </>
    );
};

export default InternshipFields;
