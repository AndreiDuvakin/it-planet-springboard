import {useState, useEffect} from 'react';
import {notification} from 'antd';

const useCuratorCabinet = () => {
    const [api, contextHolder] = notification.useNotification();
    const [loading, setLoading] = useState(false);
    const [isAdmin, setIsAdmin] = useState(true);

    const [moderationRows, setModerationRows] = useState([]);
    const [verificationQueue, setVerificationQueue] = useState([]);

    const openNotification = (msg, desc, type = 'success') => {
        api[type]({message: msg, description: desc, placement: 'topRight'});
    };


    return {
        loading,
        isAdmin,
        contextHolder,
        moderationRows,
        users,
        verificationQueue,
        refresh: fetchData
    };
};

export default useCuratorCabinet;