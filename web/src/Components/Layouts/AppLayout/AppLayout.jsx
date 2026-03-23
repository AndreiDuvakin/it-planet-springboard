import {Badge, Button, Layout, Menu, Space, Tooltip, Typography} from 'antd';
import {Link, Outlet} from 'react-router-dom';
import {HomeOutlined, HeartOutlined, UserOutlined, ControlOutlined} from '@ant-design/icons';
import useAppLayout from "./useAppLayout.js";
import LoadingIndicator from "../../Widgets/LoadingIndicator/LoadingIndicator.jsx";
import {ROLES} from "../../../Core/constants.js";

const {Header, Content, Footer} = Layout;

const AppLayout = () => {
    const {
        user,
        isUserLoading,
        favoritesCount,
        pathname,
        getItem,
        handleLoginClick,
        handleFavoritesClick,
        handleLogoutClick,
        handleRegisterClick,
        handleMenuClick,
    } = useAppLayout();

    const menuItems = [
        getItem("Главная", "/", <HomeOutlined/>),
    ];

    if (user) {
        menuItems.push(
            getItem("Личный кабинет", "/cabinet", <UserOutlined/>)
        )
    }

    if (user?.is_admin && user?.role?.title === ROLES.MODERATOR) {
        menuItems.push(
            getItem("Панель администратора", "/admin", <ControlOutlined/>)
        )
    }

    return (
        <Layout style={{minHeight: '100svh'}}>
            <Header
                style={{
                    borderBottom: '1px solid rgba(5, 5, 5, 0.06)',
                    position: 'sticky',
                    top: 0,
                    zIndex: 10,
                    display: 'flex',
                    alignItems: 'center',
                    gap: 16,
                    paddingInline: 16,
                    backgroundColor: '#fff'
                }}
            >
                <Link to="/" style={{display: 'inline-flex', alignItems: 'center', gap: 10, textDecoration: 'none'}}>
                    <img
                        src={"/logo-rounded.png"}
                        alt="Трамплин"
                        width={50}
                        height={50}
                        style={{borderRadius: 10, objectFit: 'contain'}}
                    />
                    <Typography.Text strong style={{fontSize: 16, color: 'rgba(0,0,0,0.88)'}}>
                        Трамплин
                    </Typography.Text>
                </Link>

                <Menu
                    mode="horizontal"
                    selectedKeys={pathname}
                    style={{flex: 1, minWidth: 0}}
                    items={menuItems}
                    onClick={handleMenuClick}
                />

                <Tooltip title="Избранное">
                    <Button type="text" onClick={handleFavoritesClick} style={{paddingInline: 10}}>
                        <Badge count={favoritesCount} overflowCount={99} size="small">
                            <HeartOutlined style={{fontSize: 18}}/>
                        </Badge>
                    </Button>
                </Tooltip>

                {user ? (
                    <Space
                        orientation={"horizontal"}
                    >
                        <Typography.Text strong>
                            {user.first_name}
                        </Typography.Text>
                        <Button
                            type={"default"}
                            onClick={handleLogoutClick}
                            danger
                        >
                            Выйти
                        </Button>
                    </Space>
                ) : (

                    <Space
                        orientation={"horizontal"}
                    >
                        <Button type="primary" onClick={handleLoginClick}>
                            Вход
                        </Button>
                        <Button type="default" onClick={handleRegisterClick}>
                            Регистрация
                        </Button>
                    </Space>
                )}
            </Header>

            <Content style={{
                padding: 16,
            }}>
                <div style={{maxWidth: 1120, margin: '0 auto'}}>
                    {isUserLoading ? (
                        <LoadingIndicator/>
                    ) : (
                        <Outlet/>
                    )}
                </div>
            </Content>

            <Footer style={{textAlign: 'center', color: 'rgba(0,0,0,0.65)'}}>
                Трамплин © {new Date().getFullYear()}
            </Footer>
        </Layout>
    );
};

export default AppLayout;