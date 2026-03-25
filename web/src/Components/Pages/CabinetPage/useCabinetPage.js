import {useSelector} from "react-redux";


const useCabinetPage = () => {
    const {userData} = useSelector((state) => state.auth);

    return {
        userData
    };
};

export default useCabinetPage;