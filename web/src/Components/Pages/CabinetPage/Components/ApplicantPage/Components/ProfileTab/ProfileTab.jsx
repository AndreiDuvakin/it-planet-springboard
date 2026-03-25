import React from 'react';
import {
    Form,
    Row,
    Col,
    Input,
    DatePicker,
    Divider,
    Button,
    Select,
    Switch,
    Card,
    Typography,
    Spin,
    InputNumber
} from 'antd';
import {DeleteOutlined, PlusOutlined} from '@ant-design/icons';
import JoditEditor from "jodit-react";
import useProfileTab from './useProfileTab';
import dayjs from "dayjs";

const {Text} = Typography;

function ProfileTab({initialData, onRefresh}) {
    const {
        form,
        isSaving,
        handleSave,
        editorRef,
        joditConfig,
        universitiesOptions,
        applicantSkillTagsOptions,
        experienceLevelsOptions,
    } = useProfileTab(initialData, onRefresh);

    return (
        <div style={{padding: '10px 0'}}>
            <Spin spinning={isSaving}>
                <Form
                    form={form}
                    layout="vertical"
                    onFinish={handleSave}
                    requiredMark={false}
                >
                    <Divider titlePlacement="left">Личные данные</Divider>
                    <Row gutter={24}>
                        <Col xs={24} md={8}>
                            <Form.Item label="Фамилия" name="last_name"
                                       rules={[{required: true, message: 'Обязательное поле'}]}>
                                <Input placeholder="Введите фамилию" size="large"/>
                            </Form.Item>
                        </Col>
                        <Col xs={24} md={8}>
                            <Form.Item label="Имя" name="first_name"
                                       rules={[{required: true, message: 'Обязательное поле'}]}>
                                <Input placeholder="Введите имя" size="large"/>
                            </Form.Item>
                        </Col>
                        <Col xs={24} md={8}>
                            <Form.Item label="Отчество" name="patronymic">
                                <Input placeholder="Введите отчество" size="large"/>
                            </Form.Item>
                        </Col>
                    </Row>

                    <Row gutter={24}>
                        <Col xs={24} md={8}>
                            <Form.Item label="Дата рождения" name="birthdate"
                                       rules={[{required: true, message: 'Укажите дату'}]}>
                                <DatePicker style={{width: '100%'}} format="DD.MM.YYYY" size="large"/>
                            </Form.Item>
                        </Col>
                        <Col xs={24} md={8}>
                            <Form.Item label="Email" name="email"
                                       rules={[{type: 'email', message: 'Некорректный email'}]}>
                                <Input placeholder="example@mail.com" size="large"/>
                            </Form.Item>
                        </Col>
                        <Col xs={24} md={8}>
                            <Form.Item label="Логин" name="login">
                                <Input disabled size="large"/>
                            </Form.Item>
                        </Col>
                    </Row>

                    {/*<Divider titlePlacement="left">Безопасность</Divider>*/}
                    {/* TODO перенести сброс пароля*/}
                    {/*<Row gutter={24}>*/}
                    {/*    <Col xs={24} md={12}>*/}
                    {/*        <Form.Item*/}
                    {/*            label="Новый пароль"*/}
                    {/*            name="password"*/}
                    {/*            extra="Оставьте пустым, если не хотите менять"*/}
                    {/*        >*/}
                    {/*            <Input.Password placeholder="Введите новый пароль" size="large"/>*/}
                    {/*        </Form.Item>*/}
                    {/*    </Col>*/}
                    {/*    <Col xs={24} md={12}>*/}
                    {/*        <Form.Item*/}
                    {/*            label="Подтверждение пароля"*/}
                    {/*            name="repeat_password"*/}
                    {/*            dependencies={['password']}*/}
                    {/*            rules={[*/}
                    {/*                ({getFieldValue}) => ({*/}
                    {/*                    validator(_, value) {*/}
                    {/*                        if (!value || getFieldValue('password') === value) {*/}
                    {/*                            return Promise.resolve();*/}
                    {/*                        }*/}
                    {/*                        return Promise.reject(new Error('Пароли не совпадают'));*/}
                    {/*                    },*/}
                    {/*                }),*/}
                    {/*            ]}*/}
                    {/*        >*/}
                    {/*            <Input.Password placeholder="Повторите пароль" size="large"/>*/}
                    {/*        </Form.Item>*/}
                    {/*    </Col>*/}
                    {/*</Row>*/}

                    <Divider titlePlacement="left">Образование</Divider>
                    <Form.List name="educations">
                        {(fields, {add, remove}) => (
                            <>
                                {fields.map(({key, name, ...restField}) => (
                                    <Card
                                        key={key}
                                        size="small"
                                        style={{marginBottom: 20, borderRadius: 12, border: '1px solid #f0f0f0'}}
                                        styles={{
                                            body: {padding: '20px'}
                                        }}
                                    >
                                        <Row gutter={24} align="bottom">
                                            <Col flex="auto">
                                                <Form.Item
                                                    rules={[{required: true}]}
                                                    {...restField}
                                                    name={[name, 'university_id']}
                                                    label="Учебное заведение"
                                                    style={{marginBottom: 16}}>
                                                    <Select
                                                        size="large"
                                                        placeholder="Выберите ВУЗ"
                                                        options={universitiesOptions}
                                                        showSearch={{
                                                            filterOption: (input, option) =>
                                                                (option?.label ?? '').toLowerCase().includes(input.toLowerCase()),
                                                        }}
                                                    />
                                                </Form.Item>
                                            </Col>
                                            <Col style={{marginBottom: 16}}>
                                                <Button type="text" danger icon={<DeleteOutlined/>}
                                                        onClick={() => remove(name)}/>
                                            </Col>
                                        </Row>
                                        <Row gutter={24}>
                                            <Col xs={24} md={12}>
                                                <Form.Item
                                                    {...restField}
                                                    name={[name, 'specialization']}
                                                    label="Специальность"
                                                    rules={[{required: true}]}
                                                >
                                                    <Input size="large" placeholder="Название специальности"/>
                                                </Form.Item>
                                            </Col>
                                            <Col xs={12} md={6}>
                                                <Form.Item
                                                    rules={[{required: true}]}
                                                    {...restField} name={[name, 'start_education_year']}
                                                    label="Год поступления">
                                                    <InputNumber max={dayjs().year()} size="large" placeholder="ГГГГ"/>
                                                </Form.Item>
                                            </Col>
                                            <Col xs={12} md={6}>
                                                <Form.Item {...restField} name={[name, 'end_education_year']}
                                                           label="Год выпуска">
                                                    <InputNumber size="large" placeholder="ГГГГ"/>
                                                </Form.Item>
                                            </Col>
                                        </Row>
                                        <Row align="middle" style={{marginBottom: 0}}>
                                            <Col>
                                                <Form.Item
                                                    {...restField}
                                                    name={[name, 'is_in_the_learning']}
                                                    valuePropName="checked"
                                                    style={{marginBottom: 0}}
                                                >
                                                    <Switch size="small"/>
                                                </Form.Item>
                                            </Col>
                                            <Col>
                                                <Text type="secondary" style={{marginLeft: 8}}>
                                                    Обучаюсь в настоящее время
                                                </Text>
                                            </Col>
                                        </Row>
                                    </Card>
                                ))}
                                <Button type="dashed" onClick={() => add()} block icon={<PlusOutlined/>} size="large"
                                        style={{marginBottom: 24}}>
                                    Добавить место учёбы
                                </Button>
                            </>
                        )}
                    </Form.List>

                    <Divider titlePlacement="left">Навыки</Divider>
                    <Form.List name="skills">
                        {(fields, {add, remove}) => (
                            <>
                                {fields.map(({key, name, ...restField}) => (
                                    <Row key={key} gutter={24} align="bottom" style={{marginBottom: 16}}>
                                        <Col flex="auto">
                                            <Form.Item
                                                {...restField}
                                                name={[name, 'tag_id']}
                                                label={name === 0 ? "Навык" : ""}
                                                style={{marginBottom: 0}}
                                                rules={[{required: true}]}
                                            >
                                                <Select
                                                    size="large"
                                                    placeholder="Выберите навык"
                                                    options={applicantSkillTagsOptions}
                                                    showSearch={{
                                                        filterOption: (input, option) =>
                                                            (option?.label ?? '').toLowerCase().includes(input.toLowerCase()),
                                                    }}
                                                />
                                            </Form.Item>
                                        </Col>
                                        <Col xs={24} md={8}>
                                            <Form.Item
                                                {...restField}
                                                name={[name, 'level_id']}
                                                label={name === 0 ? "Уровень" : ""}
                                                style={{marginBottom: 0}}
                                                rules={[{required: true}]}
                                            >
                                                <Select
                                                    size="large"
                                                    placeholder="Ваш уровень"
                                                    options={experienceLevelsOptions || []}
                                                />
                                            </Form.Item>
                                        </Col>
                                        <Col style={{marginBottom: 4}}>
                                            <Button type="text" danger icon={<DeleteOutlined/>}
                                                    onClick={() => remove(name)}/>
                                        </Col>
                                    </Row>
                                ))}
                                <Button type="dashed" onClick={() => add()} block icon={<PlusOutlined/>} size="large"
                                        style={{marginTop: 8, marginBottom: 24}}>
                                    Добавить навык
                                </Button>
                            </>
                        )}
                    </Form.List>

                    <Divider titlePlacement="left">Резюме</Divider>
                    <Form.Item
                        name="resume_url"
                        label="Ссылка на внешнее резюме"
                        rules={[
                            {type: "url", message: "Введите корректный URL"},
                        ]}
                    >
                        <Input placeholder="https://example.com"/>
                    </Form.Item>

                    <div style={{marginBottom: 32, border: "1px solid #d9d9d9", borderRadius: 8, overflow: 'hidden'}}>
                        <JoditEditor ref={editorRef} config={joditConfig}/>
                    </div>

                    <Button
                        type="primary"
                        htmlType="submit"
                        size="large"
                        loading={isSaving}
                        style={{padding: '0 40px'}}
                    >
                        Сохранить профиль
                    </Button>
                </Form>
            </Spin>
        </div>
    );
};

export default ProfileTab;