import {Button, Card, Col, Flex, FloatButton, Input, Result, Row, Switch, Table, Tooltip, Typography} from "antd";
import {ControlOutlined, PlusOutlined} from "@ant-design/icons";
import useAdminPage from "./useAdminPage.js";
import LoadingIndicator from "../../Widgets/LoadingIndicator/LoadingIndicator.jsx";
import CreateUserModalForm from "./Components/CreateUserModalForm/CreateUserModalForm.jsx";
import UpdateUserModalForm from "./Components/UpdateUserModalForm/UpdateUserModalForm.jsx";
import {ROLES, ROLES_MAP} from "../../../Core/constants.js";

const {Title} = Typography;

const AdminPage = () => {
    const {
        handleSelectUserToEdit,
        rolesData,
        filteredUsers,
        handleSearch,
        isUpdatingUser,
        handleActivateUser,
        openCreateModal,
        currentUser,
    } = useAdminPage();

    const columns = [
        {
            title: "ID",
            dataIndex: "id",
            key: "id",
        },
        {
            title: "Фамилия",
            dataIndex: "last_name",
            key: "lastName",
            sorter: (a, b) => a.last_name.localeCompare(b.last_name),
        },
        {
            title: "Имя",
            dataIndex: "first_name",
            key: "firstName",
            sorter: (a, b) => a.first_name.localeCompare(b.first_name),
        },
        {
            title: "Отчество",
            dataIndex: "patronymic",
            key: "patronymic",
        },
        {
            title: "Роль",
            dataIndex: ["role", "title"],
            key: "role",
            filters: rolesData.map(role => ({text: ROLES_MAP[role.title], value: role.title})),
            onFilter: (value, record) => ROLES_MAP[record.role.title] === value,
            render: (value, record) => (
                <Typography.Text key={record.id}>{ROLES_MAP[record?.role?.title]}</Typography.Text>
            )
        },
        {
            title: "Активирован",
            dataIndex: ["is_activated"],
            key: "is_activated",
            render: (value, record) => (
                <Switch
                    disabled={currentUser.id === record.id || record?.role?.title === ROLES.MODERATOR}
                    loading={isUpdatingUser}
                    checked={value}
                    checkedChildren="Активирован"
                    unCheckedChildren="Не активирован"
                    onChange={(isActivated) => handleActivateUser(record.id, isActivated)}
                />
            ),
        },
        {
            title: "Действия",
            key: "actions",
            render: (_, record) => (
                (currentUser.id !== record.id ? (<Button type="link" onClick={() => handleSelectUserToEdit(record)}>
                    Редактировать
                </Button>) : null)
            ),
        },
    ];

    return (
        <Row>
            <Col style={{width: '100%'}}>
                <Card style={{borderRadius: 14, marginBottom: 10}}>
                    <Title level={2} style={{margin: 0}}>Панель администратора</Title>
                </Card>
                <Flex vertical>
                    <Input
                        placeholder="Введите фамилию, имя или отчество"
                        style={{marginBottom: 12, width: "100%"}}
                        allowClear
                        onChange={handleSearch}
                    />
                    <Table
                        columns={columns}
                        dataSource={filteredUsers}
                        rowKey="id"
                        pagination={{pageSize: 10}}
                    />
                </Flex>
                <Tooltip title="Добавить пользователя">
                    <FloatButton onClick={openCreateModal} icon={<PlusOutlined/>} type={"primary"}/>
                </Tooltip>
            </Col>

            <CreateUserModalForm/>
            <UpdateUserModalForm/>
        </Row>
    )
};

export default AdminPage;