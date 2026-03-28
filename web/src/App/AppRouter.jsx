import {Routes, Route, Navigate} from "react-router-dom";
import PrivateRoute from "./PrivateRoute.jsx";
import AdminRoute from "./AdminRoute.jsx";
import LoginPage from "../Components/Pages/LoginPage/LoginPage.jsx";
import RegisterPage from "../Components/Pages/RegisterPage/RegisterPage.jsx";
import HomePage from "../Components/Pages/HomePage/HomePage.jsx";
import AppLayout from "../Components/Layouts/AppLayout/AppLayout.jsx";
import CabinetPage from "../Components/Pages/CabinetPage/CabinetPage.jsx";
import AdminPage from "../Components/Pages/AdminPage/AdminPage.jsx";
import OpportunityPage from "../Components/Pages/OpportunityPage/OpportunityPage.jsx";
import FavoritesPage from "../Components/Pages/FavoritesPage/FavoritesPage.jsx";


const AppRouter = () => (
    <Routes>
        <Route path="/login" element={<LoginPage/>}/>
        <Route path="/register" element={<RegisterPage/>}/>
        <Route element={<AppLayout/>}>
            <Route path="/" element={<HomePage/>}/>
            <Route path="/opportunities/:id" element={<OpportunityPage/>}/>
            <Route path="/favorites" element={<FavoritesPage/>}/>

            <Route element={<PrivateRoute/>}>
                <Route path="/cabinet" element={<CabinetPage/>}/>
            </Route>

        </Route>

        <Route element={<AdminRoute/>}>
            <Route element={<AppLayout   />}>
                <Route path="/admin" element={<AdminPage />} />
            </Route>
        </Route>

        <Route path={"*"} element={<Navigate to={"/"} replace />}/>
    </Routes>
);

export default AppRouter;