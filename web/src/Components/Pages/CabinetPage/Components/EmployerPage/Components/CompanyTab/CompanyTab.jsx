import React from 'react';
import { Form, Input, Button, Row, Col, Select, Divider, Upload, Skeleton, Alert, Space, Typography } from 'antd';
import { PlusOutlined, UploadOutlined, DeleteOutlined } from '@ant-design/icons';
import useCompanyTab from './useCompanyTab';

const CompanyTab = ({ notify }) => {
    const {
        form,
        verForm,
        isLoading,
        isSaving,
        handleSave,
        dictionaries,
        verificationStatus,
        submitVerification,
        markVerifiedDemo,
        companyTitle,
    } = useCompanyTab();

    if (isLoading) return <Skeleton active />;

    return (
        <Space orientation="vertical" size={16} style={{ width: '100%' }}>
            <Alert
                type={verificationStatus === 'approved' ? 'success' : verificationStatus === 'pending' ? 'warning' : 'info'}
                showIcon
                message={`Верификация компании: ${verificationStatus === 'approved' ? 'подтверждена' : verificationStatus === 'pending' ? 'на проверке' : verificationStatus === 'rejected' ? 'отклонена' : 'не пройдена'}`}
                description="Для публикации вакансий и стажировок через API нужна верификация. Мероприятия и менторство можно добавлять локально без API."
            />
            <Form layout="vertical" form={verForm} onFinish={submitVerification}>
                <Typography.Title level={5} style={{ marginTop: 0 }}>Заявка на верификацию</Typography.Title>
                <Form.Item label="Компания" name="company_name" initialValue={companyTitle} rules={[{ required: true }]}>
                    <Input placeholder="Как в профиле" size="large" />
                </Form.Item>
                <Row gutter={16}>
                    <Col xs={24} md={12}>
                        <Form.Item name="inn" label="ИНН" rules={[{ required: true }]}>
                            <Input placeholder="7707083893" />
                        </Form.Item>
                    </Col>
                    <Col xs={24} md={12}>
                        <Form.Item name="corporate_email" label="Корпоративная почта" rules={[{ required: true, type: 'email' }]}>
                            <Input placeholder="hr@company.ru" />
                        </Form.Item>
                    </Col>
                </Row>
                <Form.Item name="links" label="Ссылки (сайт, профили)">
                    <Input.TextArea rows={2} placeholder="https://..." />
                </Form.Item>
                <Space wrap>
                    <Button type="primary" htmlType="submit">Отправить на проверку</Button>
                    <Button onClick={markVerifiedDemo}>Демо: отметить верифицированной (локально)</Button>
                </Space>
            </Form>

            <Form layout="vertical" form={form} onFinish={handleSave}>
            <Divider orientation="left">Основная информация</Divider>

            <Row gutter={24}>
                <Col xs={24} md={16}>
                    <Form.Item label="Наименование" name="name" rules={[{ required: true, message: 'Введите название компании' }]}>
                        <Input placeholder="ООО «Ромашка»" size="large" />
                    </Form.Item>
                </Col>
                <Col xs={24} md={8}>
                    <Form.Item label="ИНН" name="inn" rules={[{ required: true, message: 'Введите ИНН' }]}>
                        <Input placeholder="7707083893" size="large" />
                    </Form.Item>
                </Col>
            </Row>

            <Form.Item label="Краткое описание" name="about">
                <Input.TextArea rows={4} placeholder="Расскажите о компании..." />
            </Form.Item>

            <Row gutter={24}>
                <Col xs={24} md={12}>
                    <Form.Item label="Сфера деятельности" name="area">
                        <Select options={dictionaries} placeholder="Выберите сферу" size="large" optionFilterProp="label" />
                    </Form.Item>
                </Col>
                <Col xs={24} md={12}>
                    <Form.Item label="Корпоративный email" name="corporate_email" rules={[{ type: 'email', message: 'Некорректный email' }]}>
                        <Input placeholder="hr@company.ru" size="large" />
                    </Form.Item>
                </Col>
            </Row>

            <Row gutter={24}>
                <Col xs={24} md={12}>
                    <Form.Item label="Сайт" name="site">
                        <Input placeholder="https://example.com" size="large" />
                    </Form.Item>
                </Col>
                <Col xs={24} md={12}>
                    <Form.Item label="Видеопрезентация (ссылка)" name="video_url">
                        <Input placeholder="https://youtube.com/..." size="large" />
                    </Form.Item>
                </Col>
            </Row>

            <Divider orientation="left">Социальные сети</Divider>
            <Form.List name="socials">
                {(fields, { add, remove }) => (
                    <>
                        {fields.map(({ key, name, ...restField }) => (
                            <Row key={key} gutter={24} align="bottom" style={{ marginBottom: 16 }}>
                                <Col xs={10} md={8}>
                                    <Form.Item {...restField} name={[name, 'title']} label={name === 0 ? 'Название сети' : ''} style={{ marginBottom: 0 }}>
                                        <Input placeholder="ВКонтакте" size="large" />
                                    </Form.Item>
                                </Col>
                                <Col xs={11} md={14}>
                                    <Form.Item {...restField} name={[name, 'link']} label={name === 0 ? 'Ссылка на профиль' : ''} style={{ marginBottom: 0 }}>
                                        <Input placeholder="https://vk.com/..." size="large" />
                                    </Form.Item>
                                </Col>
                                <Col xs={3} md={2}>
                                    <Button type="text" danger onClick={() => remove(name)} icon={<DeleteOutlined />} style={{ height: 40 }} />
                                </Col>
                            </Row>
                        ))}
                        <Form.Item>
                            <Button type="dashed" onClick={() => add()} icon={<PlusOutlined />} block size="large">Добавить соцсеть</Button>
                        </Form.Item>
                    </>
                )}
            </Form.List>

            <Divider orientation="left">Медиа-файлы</Divider>
            <Row gutter={24}>
                <Col xs={24} md={12}>
                    {/* Скрытое поле для ID */}
                    <Form.Item name="logo_id" hidden><Input /></Form.Item>
                    <Form.Item
                        label="Логотип компании"
                        name="logo_file"
                        valuePropName="fileList"
                        getValueFromEvent={(e) => {
                            if (Array.isArray(e)) return e;
                            if (e.file.status === 'done') {
                                form.setFieldValue('logo_id', e.file.response.id);
                            }
                            return e?.fileList;
                        }}
                    >
                        <Upload
                            action="http://localhost:5000/api/v1/company_profiles/files/upload-logo"
                            headers={{ Authorization: `Bearer ${localStorage.getItem('access_token')}` }}
                            listType="picture"
                            maxCount={1}
                            accept=".jpg,.jpeg,.png"
                        >
                            <Button icon={<UploadOutlined />} size="large" block>Загрузить логотип</Button>
                        </Upload>
                    </Form.Item>
                </Col>

                <Col xs={24} md={12}>
                    <Form.Item name="official_photo_id" hidden><Input /></Form.Item>
                    <Form.Item
                        label="Фото офиса"
                        name="photo_file"
                        valuePropName="fileList"
                        getValueFromEvent={(e) => {
                            if (Array.isArray(e)) return e;
                            if (e.file.status === 'done') {
                                form.setFieldValue('official_photo_id', e.file.response.id);
                            }
                            return e?.fileList;
                        }}
                    >
                        <Upload
                            action="http://localhost:5000/api/v1/company_profiles/files/upload-photo"
                            headers={{ Authorization: `Bearer ${localStorage.getItem('access_token')}` }}
                            listType="picture"
                            maxCount={1}
                            accept=".jpg,.jpeg,.png"
                        >
                            <Button icon={<UploadOutlined />} size="large" block>Загрузить фото</Button>
                        </Upload>
                    </Form.Item>
                </Col>
            </Row>

            <Button type="primary" htmlType="submit" loading={isSaving} size="large" style={{ minWidth: 150, marginTop: 24 }}>
                Сохранить данные
            </Button>
        </Form>
        </Space>
    );
};

export default CompanyTab;