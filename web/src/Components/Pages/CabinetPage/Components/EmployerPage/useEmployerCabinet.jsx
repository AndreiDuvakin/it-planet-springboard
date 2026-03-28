import { useState, useCallback, useMemo, useEffect } from 'react'
import { Form, notification } from 'antd'
import dayjs from 'dayjs'
import { useSelector } from 'react-redux'
import { useGetProfileQuery } from '../../../../../Api/companyApi.js'
import { getOpportunityById } from '../../../../../local/tramplinStore.js'
import { getApplicationsForEmployer } from '../../../../../local/tramplinStore.js'

export const useEmployerCabinet = () => {
  const [api, contextHolder] = notification.useNotification()
  const [form] = Form.useForm()
  const { userData } = useSelector((s) => s.auth)
  const { data: companyProfile } = useGetProfileQuery()
  const [storeV, setStoreV] = useState(0)

  useEffect(() => {
    const fn = () => setStoreV((v) => v + 1)
    window.addEventListener('tramplin-store-changed', fn)
    return () => window.removeEventListener('tramplin-store-changed', fn)
  }, [])

  const [modalState, setModalState] = useState({
    isOpen: false,
    kind: null,
    mode: 'create',
    editingId: null,
  })

  const companyName = (companyProfile?.title || '').trim()

  const responsesTable = useMemo(() => {
    const rows = getApplicationsForEmployer(companyName)
    return rows.map((a) => ({
      id: a.id,
      fullName: `Отклик #${a.id.slice(-6)}`,
      university: '—',
      opportunityTitle: a.opportunityTitle,
      opportunityId: a.opportunityId,
      coverLetter: a.coverLetter,
      status: a.status,
      note: a.note || '',
    }))
  }, [companyName, storeV, userData?.id])

  const notify = (msg, desc = '', type = 'success') => {
    api[type]({ message: msg, description: desc, placement: 'topRight', duration: 3 })
  }

  const openCreate = (kind) => {
    form.resetFields()
    setModalState({ isOpen: true, kind, mode: 'create', editingId: null })
  }

  const openEdit = useCallback(
    (id, kind) => {
      const opp = getOpportunityById(id)
      const k = kind || opp?.kind || 'vacancy'
      setModalState({ isOpen: true, kind: k, mode: 'edit', editingId: String(id) })
      form.setFieldsValue({
        title: opp?.title,
        description: opp?.description,
        local_tags: opp?.tags || [],
        address: opp?.address,
        expires_at: opp?.expiresAt ? dayjs(opp.expiresAt) : undefined,
        salary_min: opp?.salaryFrom,
        salary_max: opp?.salaryTo,
      })
    },
    [form]
  )

  const closeModal = () => {
    setModalState((prev) => ({ ...prev, isOpen: false }))
    form.resetFields()
  }

  const refreshResponses = useCallback(() => setStoreV((v) => v + 1), [])

  return {
    contextHolder,
    notify,
    form,
    modalState,
    openCreate,
    openEdit,
    closeModal,
    responsesTable,
    refreshResponses,
    companyProfile,
  }
}
