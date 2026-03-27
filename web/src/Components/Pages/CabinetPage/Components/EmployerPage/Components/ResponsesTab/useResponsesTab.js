import { notification } from 'antd';

function useResponsesTab(onRefresh) {
    const handleStatusChange = async (id, newStatus) => {
        notification.success({ message: 'Статус обновлен' });
        if (onRefresh) onRefresh();
    };

    const handleNoteBlur = async (id, note) => {
        notification.success({ message: 'Заметка сохранена' });
    };

    return { handleStatusChange, handleNoteBlur };
}

export default useResponsesTab;