export const OPPORTUNITY_TYPES = [
    { value: 'internship', label: 'Стажировка' },
    { value: 'vacancy_junior', label: 'Вакансия (стажёрская/Junior)' },
    { value: 'vacancy', label: 'Вакансия (Junior+)' },
    { value: 'mentor', label: 'Менторская программа' },
    { value: 'event', label: 'Карьерное мероприятие' },
]

export const WORK_FORMATS = [
    { value: 'office', label: 'Офис' },
    { value: 'hybrid', label: 'Гибрид' },
    { value: 'remote', label: 'Удалённо' },
]

export const TAGS = [
    'JavaScript',
    'TypeScript',
    'React',
    'Node.js',
    'Python',
    'Java',
    'SQL',
    'DevOps',
    'QA',
    'UI/UX',
    'Junior',
    'Middle',
    'Full-time',
    'Part-time',
]

export const OPPORTUNITIES = [
    {
        id: '1',
        title: 'Стажёр Frontend (React)',
        company: 'КодИнсайт',
        type: 'internship',
        format: 'hybrid',
        city: 'Москва',
        address: 'Москва, ул. Тверская, 1',
        salaryFrom: 60000,
        salaryTo: 90000,
        publishedAt: '2026-03-12',
        expiresAt: '2026-04-10',
        tags: ['React', 'TypeScript', 'Junior', 'Full-time'],
        description:
            'Поможем быстро вырасти: наставник, код-ревью, понятные задачи. Требуется базовое знание JS/React.',
        contacts: {
            site: 'https://example.com',
            email: 'hr@example.com',
            telegram: '@hr_codeinsight',
        },
        location: { lat: 55.7558, lng: 37.6173 },
    },
    {
        id: '2',
        title: 'Вакансия Junior Backend (Python)',
        company: 'TechUni Hub',
        type: 'vacancy_junior',
        format: 'remote',
        city: 'Казань',
        address: 'Казань (удалённо)',
        salaryFrom: 80000,
        salaryTo: 130000,
        publishedAt: '2026-03-10',
        expiresAt: '2026-04-05',
        tags: ['Python', 'SQL', 'Junior', 'Full-time'],
        description:
            'API и интеграции для образовательных сервисов. Будет плюсом опыт с PostgreSQL и Docker.',
        contacts: {
            site: 'https://example.com',
            email: 'jobs@example.com',
            telegram: '@techuni_jobs',
        },
        location: { lat: 55.7961, lng: 49.1064 },
    },
    {
        id: '3',
        title: 'Менторская программа: System Design',
        company: 'CloudWorks',
        type: 'mentor',
        format: 'remote',
        city: 'Санкт-Петербург',
        address: 'Санкт-Петербург (онлайн)',
        salaryFrom: null,
        salaryTo: null,
        publishedAt: '2026-03-08',
        expiresAt: '2026-05-01',
        tags: ['DevOps', 'Middle'],
        description:
            '8 недель, практические задания и разбор архитектуры. Требуется базовое понимание сетей и бэкенда.',
        contacts: {
            site: 'https://example.com',
            email: 'mentor@example.com',
            telegram: '@cloudworks',
        },
        location: { lat: 59.9311, lng: 30.3609 },
    },
    {
        id: '4',
        title: 'Хакатон: AI для карьеры',
        company: 'Career Center',
        type: 'event',
        format: 'office',
        city: 'Новосибирск',
        address: 'Новосибирск, пр. Ленина, 10',
        salaryFrom: null,
        salaryTo: null,
        publishedAt: '2026-03-14',
        expiresAt: '2026-03-28',
        tags: ['AI', 'UI/UX'],
        description:
            'Очное мероприятие на 2 дня: команды, призы, общение с работодателями. Нужна регистрация.',
        contacts: {
            site: 'https://example.com',
            email: 'events@example.com',
            telegram: '@career_center',
        },
        location: { lat: 55.0084, lng: 82.9357 },
    },
]

