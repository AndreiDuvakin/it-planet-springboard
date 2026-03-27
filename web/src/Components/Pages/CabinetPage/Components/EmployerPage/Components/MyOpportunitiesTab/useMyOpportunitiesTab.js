import { useState, useEffect } from 'react';

const useMyOpportunitiesTab = (notify) => {
    const [opportunities, setOpportunities] = useState([]);
    const [isLoading, setIsLoading] = useState(false);

    useEffect(() => {
        const fetchOpportunities = async () => {
            setIsLoading(true);
            try {
            } catch (error) {
                notify('Ошибка', 'Не удалось загрузить возможности', 'error');
            } finally {
                setIsLoading(false);
            }
        };
        fetchOpportunities();
    }, []);

    return { opportunities, isLoading };
};

export default useMyOpportunitiesTab;
