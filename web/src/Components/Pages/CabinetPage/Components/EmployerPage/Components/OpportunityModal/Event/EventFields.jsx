import React from 'react';
import { Form, Input, Select, DatePicker, Row, Col, Switch } from 'antd';
import useEventFields from './useEventFields';

const EventFields = ({ allTags, setAllTags }) => {
    const { eventTypes } = useEventFields();

    return (
        <>
            <Row gutter={12}>
                <Col span={12}>
                    <Form.Item label="Тип мероприятия" name="event_type" rules={[{ required: true }]}>
                        <Select options={eventTypes} />
                    </Form.Item>
                </Col>
                <Col span={12}>
                    <Form.Item label="Дата проведения" name="event_date" rules={[{ required: true }]}>
                        <DatePicker showTime style={{ width: '100%' }} />
                    </Form.Item>
                </Col>
            </Row>

            <Row gutter={12}>
                <Col span={12}>
                    <Form.Item label="Адрес / город" name="address" rules={[{ required: true }]}>
                        <Input placeholder="Москва, ул. ..." />
                    </Form.Item>
                </Col>
                <Col span={12}>
                    <Form.Item label="Ссылка для регистрации" name="registration_link">
                        <Input placeholder="https://events.ru/..." />
                    </Form.Item>
                </Col>
            </Row>

            <Form.Item label="Онлайн-мероприятие" name="is_online" valuePropName="checked">
                <Switch />
            </Form.Item>

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

export default EventFields;
