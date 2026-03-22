import { Badge, Button, Layout, Menu, Tooltip, Typography } from 'antd';
import { Link, Outlet } from 'react-router-dom';
import { HomeOutlined, HeartOutlined, UserOutlined } from '@ant-design/icons';
import useAppLayout from "./useAppLayout.jsx";

const { Header, Content, Footer } = Layout;

const AppLayout = () => {
    const {
        selectedKey,
        favoritesCount,
        cabinetItems,
        handleLoginClick,
        handleFavoritesClick,
    } = useAppLayout();

    const menuItems = [
        { key: '/', icon: <HomeOutlined />, label: <Link to="/">Главная</Link> },
        {
            key: 'cabinet',
            icon: <UserOutlined />,
            label: 'Личный кабинет',
            children: cabinetItems.map((i) => ({
                key: i.key,
                icon: i.icon,
                label: <Link to={i.key}>{i.label}</Link>,
            })),
        },
    ];

    return (
        <Layout style={{ minHeight: '100svh' }}>
            <Header
                style={{
                    background: '#fff',
                    borderBottom: '1px solid rgba(5, 5, 5, 0.06)',
                    position: 'sticky',
                    top: 0,
                    zIndex: 10,
                    display: 'flex',
                    alignItems: 'center',
                    gap: 16,
                    paddingInline: 16,
                }}
            >
                <Link to="/" style={{ display: 'inline-flex', alignItems: 'center', gap: 10, textDecoration: 'none' }}>
                    <img
                        src={"/logo-rounded.png"}
                        alt="Трамплин"
                        width={34}
                        height={34}
                        style={{ borderRadius: 10, objectFit: 'contain' }}
                    />
                    <Typography.Text strong style={{ fontSize: 16, color: 'rgba(0,0,0,0.88)' }}>
                        Трамплин
                    </Typography.Text>
                </Link>

                <Menu
                    mode="horizontal"
                    selectedKeys={selectedKey ? [selectedKey] : []}
                    style={{ flex: 1, minWidth: 0 }}
                    items={menuItems}
                />

                <Tooltip title="Избранное">
                    <Button type="text" onClick={handleFavoritesClick} style={{ paddingInline: 10 }}>
                        <Badge count={favoritesCount} overflowCount={99} size="small">
                            <HeartOutlined style={{ fontSize: 18 }} />
                        </Badge>
                    </Button>
                </Tooltip>

                <Button type="primary" onClick={handleLoginClick}>
                    Вход
                </Button>
            </Header>

            <Content style={{ padding: 16 }}>
                <div style={{ maxWidth: 1120, margin: '0 auto' }}>
                    <Outlet />
                </div>
            </Content>

            <Footer style={{ textAlign: 'center', color: 'rgba(0,0,0,0.65)' }}>
                Трамплин © {new Date().getFullYear()}
            </Footer>
        </Layout>
    );
};

export default AppLayout;