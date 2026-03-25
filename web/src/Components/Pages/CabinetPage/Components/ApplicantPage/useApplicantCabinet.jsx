import {useState, useEffect} from 'react';
import {notification} from 'antd';
import {useSelector} from "react-redux";

const useApplicantCabinet = () => {
    const [api, contextHolder] = notification.useNotification();
    const [loading, setLoading] = useState(false);

    const [applications, setApplications] = useState([]);
    const [contacts, setContacts] = useState([]);
    const [recommendations, setRecommendations] = useState([]);

    const openNotification = (msg, desc, type = 'success') => {
        api[type]({message: msg, description: desc, placement: 'topRight'});
    };

    return {
        loading,
        contextHolder,
        applications,
        contacts,
        recommendations,
    };
};

export default useApplicantCabinet;