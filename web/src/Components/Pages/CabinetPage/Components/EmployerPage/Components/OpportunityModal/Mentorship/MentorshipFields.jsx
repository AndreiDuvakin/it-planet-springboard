import React from 'react';
import { Form, Input, Row, Col } from 'antd';
import useMentorshipFields from './useMentorshipFields';

const MentorshipFields = () => {
    const {} = useMentorshipFields();

    return (
        <>
            <Row gutter={12}>
                <Col span={12}>
                    <Form.Item label="Имя ментора" name="mentor_name" rules={[{ required: true }]}>
                        <Input placeholder="Иван Иванов" />
                    </Form.Item>
                </Col>
                <Col span={12}>
                    <Form.Item label="Область фокуса" name="focus_area" rules={[{ required: true }]}>
                        <Input placeholder="Backend, System Design" />
                    </Form.Item>
                </Col>
            </Row>
            <Form.Item label="Критерии отбора" name="selection_criteria">
                <Input.TextArea rows={2} placeholder="Требования к кандидату..." />
            </Form.Item>
            <Form.Item label="Адрес / город" name="address">
                <Input placeholder="Москва или Онлайн" />
            </Form.Item>
        </>
    );
};

export default MentorshipFields;