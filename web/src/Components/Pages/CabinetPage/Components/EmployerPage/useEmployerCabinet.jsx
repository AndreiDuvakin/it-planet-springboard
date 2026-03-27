import { useState } from 'react';
import { Form, notification } from 'antd';

export const useEmployerCabinet = () => {
    const [api, contextHolder] = notification.useNotification();
    const [form] = Form.useForm();

    const[modalState, setModalState] = useState({
        isOpen: false,
        kind: null,
        mode: 'create',
        editingId: null,
    });

    const notify = (msg, desc = '', type = 'success') => {
        api[type]({ message: msg, description: desc, placement: 'topRight', duration: 3 });
    };

    const openCreate = (kind) => {
        form.resetFields();
        setModalState({ isOpen: true, kind, mode: 'create', editingId: null });
    };

    const openEdit = async (id, kind) => {
        setModalState({ isOpen: true, kind, mode: 'edit', editingId: id });
        form.setFieldsValue({
            title: 'Данные с бэкенда',
        });
    };

    const closeModal = () => {
        setModalState((prev) => ({ ...prev, isOpen: false }));
        form.resetFields();
    };

    return {
        contextHolder,
        notify,
        form,
        modalState,
        openCreate,
        openEdit,
        closeModal,
    };
};