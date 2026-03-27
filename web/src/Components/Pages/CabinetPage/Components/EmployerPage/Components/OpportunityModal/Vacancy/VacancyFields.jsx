import React from 'react';
import { Form, Input, Select, DatePicker, Row, Col, Skeleton, Alert } from 'antd';
import useVacancyFields from './useVacancyFields';

const VacancyFields = () => {
    const { dictionaries, isLoading, isError } = useVacancyFields();

    if (isLoading) return <Skeleton active paragraph={{ rows: 4 }} />;

    if (isError) return (
        <Alert
            message="Ошибка загрузки"
            description="Не удалось загрузить списки справочников."
            type="error"
            showIcon
        />
    );

    return (
        <>
            <Row gutter={12}>
                <Col span={12}>
                    <Form.Item
                        label="Тип занятости"
                        name="employment_type_id"
                        rules={[{ required: true, message: 'Выберите тип' }]}
                    >
                        <Select options={dictionaries.employmentTypes} placeholder="Выберите тип" />
                    </Form.Item>
                </Col>
                <Col span={12}>
                    <Form.Item
                        label="Уровень опыта"
                        name="experience_level_id"
                        rules={[{ required: true, message: 'Выберите уровень' }]}
                    >
                        <Select options={dictionaries.experienceLevels} placeholder="Выберите уровень" />
                    </Form.Item>
                </Col>
            </Row>

            <Row gutter={12}>
                <Col span={12}>
                    <Form.Item
                        label="Формат работы"
                        name="work_format_id"
                        rules={[{ required: true, message: 'Выберите формат' }]}
                    >
                        <Select options={dictionaries.workFormats} placeholder="Выберите формат" />
                    </Form.Item>
                </Col>
                <Col span={12}>
                    <Form.Item
                        label="Адрес / город"
                        name="address"
                        rules={[{ required: true, message: 'Введите адрес' }]}
                    >
                        <Input placeholder="Москва, ул. ..." />
                    </Form.Item>
                </Col>
            </Row>

            <Row gutter={12}>
                <Col span={12}>
                    <Form.Item label="Зарплата от (₽)" name="salary_min">
                        <Input type="number" placeholder="60000" />
                    </Form.Item>
                </Col>
                <Col span={12}>
                    <Form.Item label="Зарплата до (₽)" name="salary_max">
                        <Input type="number" placeholder="120000" />
                    </Form.Item>
                </Col>
            </Row>

            <Form.Item label="Срок действия вакансии" name="expires_at">
                <DatePicker style={{ width: '100%' }} placeholder="Выберите дату завершения" />
            </Form.Item>
        </>
    );
};

export default VacancyFields;