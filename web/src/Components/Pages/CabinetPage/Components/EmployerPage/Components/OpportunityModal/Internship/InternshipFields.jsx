// Internship/InternshipFields.jsx
import React from 'react';
import { Form, Input, Select, DatePicker, Row, Col, Switch } from 'antd';
import useInternshipFields from './useInternshipFields';

const InternshipFields = () => {
    const { dictionaries, isLoading } = useInternshipFields();

    return (
        <>
            <Row gutter={12}>
                <Col span={12}>
                    <Form.Item label="Формат" name="work_format_id" rules={[{ required: true, message: 'Выберите формат' }]}>
                        <Select
                            loading={isLoading}
                            options={dictionaries.workFormats}
                            placeholder="Выберите формат"
                            // fieldNames УДАЛЕН, так как в хуке уже есть label/value
                        />
                    </Form.Item>
                </Col>
                <Col span={12}>
                    <Form.Item label="Уровень опыта" name="experience_level_id" rules={[{ required: true, message: 'Выберите уровень' }]}>
                        <Select
                            loading={isLoading}
                            options={dictionaries.experienceLevels}
                            placeholder="Выберите уровень"
                        />
                    </Form.Item>
                </Col>
            </Row>
            {/* Остальные поля без изменений */}
            <Row gutter={12}>
                <Col span={12}>
                    <Form.Item label="Адрес / город" name="address" rules={[{ required: true, message: 'Введите адрес' }]}>
                        <Input placeholder="Москва, ул. Тверская, 1" />
                    </Form.Item>
                </Col>
                <Col span={12}>
                    <Form.Item label="Продолжительность (мес.)" name="duration_months" rules={[{ required: true }]}>
                        <Input type="number" min={1} placeholder="3" />
                    </Form.Item>
                </Col>
            </Row>
            <Row gutter={12}>
                <Col span={12}>
                    <Form.Item label="Оплачиваемая" name="is_paid" valuePropName="checked" initialValue={false}>
                        <Switch />
                    </Form.Item>
                </Col>
                <Col span={12}>
                    <Form.Item label="Наставничество" name="mentorship_available" valuePropName="checked" initialValue={false}>
                        <Switch />
                    </Form.Item>
                </Col>
            </Row>
            <Form.Item label="Дата окончания приёма заявок" name="expires_at">
                <DatePicker style={{ width: '100%' }} format="DD.MM.YYYY" />
            </Form.Item>
        </>
    );
};

export default InternshipFields;