const EVENT_TYPES = [
    { value: 'hackathon', label: 'Хакатон' },
    { value: 'meetup', label: 'Митап' },
    { value: 'conference', label: 'Конференция' },
    { value: 'workshop', label: 'Воркшоп' },
    { value: 'presentation', label: 'Презентация' },
    { value: 'career_fair', label: 'Ярмарка вакансий' },
];

const useEventFields = () => {
    return {
        eventTypes: EVENT_TYPES,
        isLoading: false,
        refresh: () => {}
    };
};

export default useEventFields;
