import React from 'react'
import {
    Button, Col, Divider, Form, Input, Row,
    Select, Skeleton, Space, Typography, Upload,
} from 'antd'
import { DeleteOutlined, PlusOutlined, UploadOutlined } from '@ant-design/icons'
import useCompanyTab from './useCompanyTab'

const { Title, Text } = Typography

const CompanyTab = () => {
    const {
        form, verForm, isLoading, isSaving, handleSave,
        dictionaries, verificationStatus, submitVerification,
        companyTitle,
    } = useCompanyTab()

    if (isLoading) return <Skeleton active paragraph={{ rows: 10 }} />

    return (
        <Space direction="vertical" size={16} style={{ width: '100%' }}>
            
            <div style={{
                padding: 16, borderRadius: 10,
                border: `1px solid ${verificationStatus === 'approved' ? '#b7eb8f' : verificationStatus === 'pending' ? '#ffe58f' : '#d9d9d9'}`,
                background: verificationStatus === 'approved' ? '#f6ffed' : verificationStatus === 'pending' ? '#fffbe6' : '#fafafa',
            }}>
                <Title level={5} style={{ marginTop: 0, marginBottom: 12 }}>Статус верификации компании</Title>
                <p style={{ marginBottom: 16 }}>
                    <strong>Текущий статус:</strong>{' '}
                    <Text type={verificationStatus === 'approved' ? 'success' : 'warning'}>
                        {verificationStatus === 'approved' ? 'Верифицирована ✓' :
                         verificationStatus === 'pending' ? 'На рассмотрении' :
                         verificationStatus === 'rejected' ? 'Отклонена — подайте повторно' :
                         'Не верифицирована'}
                    </Text>
                </p>
                {verificationStatus !== 'approved' && (
                    <Form layout="vertical" form={verForm} onFinish={submitVerification}>
                        <Form.Item label="Название компании" name="company_name" rules={[{ required: true, message: 'Введите название' }]}>
                            <Input placeholder="Как в профиле" />
                        </Form.Item>
                        <Row gutter={16}>
                            <Col xs={24} md={12}>
                                <Form.Item name="corporate_email" label="Корпоративная почта" rules={[{ required: true, type: 'email', message: 'Введите email' }]}>
                                    <Input placeholder="hr@company.ru" />
                                </Form.Item>
                            </Col>
                        </Row>
                        <Form.Item name="links" label="Ссылки (сайт, соцсети)">
                            <Input.TextArea rows={2} placeholder="https://..." />
                        </Form.Item>
                        <Button type="primary" htmlType="submit" disabled={verificationStatus === 'pending'}>
                            Отправить на проверку
                        </Button>
                    </Form>
                )}
            </div>

            <Form layout="vertical" form={form} onFinish={handleSave}>
                {/* Исправлено: orientation -> titlePlacement */}
                <Divider orientation="left" titlePlacement="left">Основная информация</Divider>
                
                <Row gutter={24}>
                    <Col xs={24} md={16}>
                        <Form.Item label="Наименование" name="name" rules={[{ required: true, message: 'Введите название' }]}>
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
                        <Form.Item label="Сфера деятельности" name="area" rules={[{ required: true, message: 'Выберите сферу деятельности' }]}>
                            <Select 
                                showSearch
                                options={dictionaries} 
                                placeholder="Выберите сферу" 
                                size="large" 
                                optionFilterProp="label"
                                filterOption={(input, option) =>
                                    (option?.label ?? '').toLowerCase().includes(input.toLowerCase())
                                }
                            />
                        </Form.Item>
                    </Col>
                    <Col xs={24} md={12}>
                        <Form.Item label="Корпоративный email" name="corporate_email" rules={[{ type: 'email' }]}>
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
                                <Row key={key} gutter={24} align="bottom" style={{ marginBottom: 12 }}>
                                    <Col xs={10} md={8}>
                                        <Form.Item {...restField} name={[name, 'title']}
                                                   label={name === 0 ? 'Название сети' : ''} style={{ marginBottom: 0 }}>
                                            <Input placeholder="ВКонтакте" size="large" />
                                        </Form.Item>
                                    </Col>
                                    <Col xs={11} md={14}>
                                        <Form.Item {...restField} name={[name, 'link']}
                                                   label={name === 0 ? 'Ссылка' : ''} style={{ marginBottom: 0 }}>
                                            <Input placeholder="https://vk.com/..." size="large" />
                                        </Form.Item>
                                    </Col>
                                    <Col xs={3} md={2}>
                                        <Button type="text" danger onClick={() => remove(name)}
                                                icon={<DeleteOutlined />} style={{ height: 40 }} />
                                    </Col>
                                </Row>
                            ))}
                            <Form.Item>
                                <Button type="dashed" onClick={() => add()} icon={<PlusOutlined />} block size="large">
                                    Добавить соцсеть
                                </Button>
                            </Form.Item>
                        </>
                    )}
                </Form.List>

                <Divider orientation="left">Медиа-файлы</Divider>
                <Row gutter={24}>
                    <Col xs={24} md={12}>
                        <Form.Item name="logo_id" hidden><Input /></Form.Item>
                        <Form.Item label="Логотип" name="logo_file" valuePropName="fileList"
                                    getValueFromEvent={e => Array.isArray(e) ? e : e?.fileList}>
                            <Upload action="http://localhost:5000/api/v1/company_profiles/files/upload-logo"
                                    headers={{ Authorization: `Bearer ${localStorage.getItem('access_token')}` }}
                                    onChange={(info) => {
                                        if (info.file.status === 'done') {
                                            form.setFieldValue('logo_id', info.file.response?.id);
                                        }
                                    }}
                                    listType="picture" maxCount={1} accept=".jpg,.jpeg,.png">
                                <Button icon={<UploadOutlined />} size="large" block>Загрузить логотип</Button>
                            </Upload>
                        </Form.Item>
                    </Col>
                    <Col xs={24} md={12}>
                        <Form.Item name="official_photo_id" hidden><Input /></Form.Item>
                        <Form.Item label="Фото офиса" name="photo_file" valuePropName="fileList"
                                    getValueFromEvent={e => Array.isArray(e) ? e : e?.fileList}>
                            <Upload action="http://localhost:5000/api/v1/company_profiles/files/upload-photo"
                                    headers={{ Authorization: `Bearer ${localStorage.getItem('access_token')}` }}
                                    onChange={(info) => {
                                        if (info.file.status === 'done') {
                                            form.setFieldValue('official_photo_id', info.file.response?.id);
                                        }
                                    }}
                                    listType="picture" maxCount={1} accept=".jpg,.jpeg,.png">
                                <Button icon={<UploadOutlined />} size="large" block>Загрузить фото</Button>
                            </Upload>
                        </Form.Item>
                    </Col>
                </Row>

                <Button type="primary" htmlType="submit" loading={isSaving} size="large" style={{ minWidth: 200, marginTop: 24, borderRadius: 8 }}>
                    Сохранить изменения
                </Button>
            </Form>
        </Space>
    )
}

export default CompanyTab