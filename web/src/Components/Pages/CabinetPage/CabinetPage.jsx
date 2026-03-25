import useCabinetPage from "./useCabinetPage.js";
import {ROLES} from "../../../Core/constants.js";
import CuratorCabinetPage from "./Components/CuratorPage/CuratorCabinetPage.jsx";
import EmployerPage from "./Components/EmployerPage/EmployerPage.jsx";
import LoadingIndicator from "../../Widgets/LoadingIndicator/LoadingIndicator.jsx";
import ApplicantCabinetPage from "./Components/ApplicantPage/ApplicantCabinetPage.jsx";


const CabinetPage = () => {
    const {
        userData
    } = useCabinetPage();

    let content;

    switch (userData?.role?.title) {
        case ROLES.MODERATOR: {
            content = <CuratorCabinetPage/>;
            break;
        }
        case ROLES.EMPLOYER: {
            content = <EmployerPage/>;
            break;
        }
        case ROLES.APPLICANT: {
            content = <ApplicantCabinetPage/>;
            break;
        }
        default: {
            content = <LoadingIndicator/>;
            break;
        }

    }

    return (
        content
    );
};

export default CabinetPage;