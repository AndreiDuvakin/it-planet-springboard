import { useGetProfileQuery } from '../../../../../../../Api/companyApi.js'
import {
  useGetWorkFormatsQuery,
  useGetExperienceLevelsQuery,
} from '../../../../../../../Api/dictionariesApi.js'
import { useSelector } from 'react-redux'
import {
  upsertExtraOpportunity,
  patchOpportunity,
  getOpportunityById,
  getEmployerVerificationStatus,
  getTagRegistry,
  addTagTitle,
} from '../../../../../../../local/tramplinStore.js'


function mapWorkFormatTitleToSlug(title) {
  const t = (title || '').toLowerCase()
  if (t.includes('удал')) return 'remote'
  if (t.includes('гибрид')) return 'hybrid'
  return 'office'
}

function mapExpTitleToSlug(title) {
  const t = (title || '').toLowerCase()
  if (t.includes('стаж')) return 'intern'
  if (t.includes('junior')) return 'junior'
  if (t.includes('middle')) return 'middle'
  if (t.includes('senior')) return 'senior'
  return 'junior'
}

const useOpportunityModal = (form, mode, kind, editingId, onClose, notificationApi) => {
  const { data: companyProfile } = useGetProfileQuery()
  const { data: workFormats = [] } = useGetWorkFormatsQuery()
  const { data: experienceLevels = [] } = useGetExperienceLevelsQuery()
  const { userData } = useSelector((s) => s.auth)
  const tagRegistry = getTagRegistry()

  const tagsDictionary = tagRegistry.map((t) => ({ value: t.title, label: t.title }))

  const handleSubmit = async () => {
    try {
      const values = await form.validateFields()
      
      const localTags = (values.local_tags || []).map((t) => String(t).trim()).filter(Boolean)
      localTags.forEach((t) => addTagTitle(t))

      const companyTitle = companyProfile?.title || 'Компания'
      const ownerUserId = userData?.id
            if (mode === 'edit' && editingId) {
        const existing = getOpportunityById(editingId)
        const base = {
          title: values.title,
          description: values.description,
          tags: localTags.length ? localTags : existing?.tags || [],
        }
        if (values.expires_at) {
            base.expiresAt = values.expires_at.format ? values.expires_at.format('YYYY-MM-DD') : values.expires_at
        }
        
        patchOpportunity(editingId, base)
        notificationApi.success({ message: 'Изменения сохранены' })
        onClose()
        form.resetFields()
        return
      }

      const localId = `local_${Date.now()}`
      
      const commonData = {
        id: localId,
        ownerUserId,
        company: companyTitle,
        title: values.title,
        description: values.description,
        address: values.address || '',
        city: (values.address || '').split(',')[0]?.trim() || 'Москва',
        publishedAt: new Date().toISOString().slice(0, 10),
        tags: localTags,
        moderationStatus: 'pending', 
        source: 'local'
      }

      const wf = workFormats.find((w) => w.id === values.work_format_id)
      const ef = experienceLevels.find((e) => e.id === values.experience_level_id)

      if (kind === 'vacancy') {
        upsertExtraOpportunity({
          ...commonData,
          type: 'vacancy',
          kind: 'vacancy',
          salaryFrom: values.salary_min ? Number(values.salary_min) : null,
          salaryTo: values.salary_max ? Number(values.salary_max) : null,
          format: mapWorkFormatTitleToSlug(wf?.title),
          experienceLevel: mapExpTitleToSlug(ef?.title),
          employmentType: 'full',
          expiresAt: values.expires_at ? values.expires_at.format('YYYY-MM-DD') : null,
        })
        notificationApi.success({ message: 'Вакансия создана' })
      } 
      
      else if (kind === 'internship') {
        upsertExtraOpportunity({
          ...commonData,
          type: 'internship',
          kind: 'internship',
          format: mapWorkFormatTitleToSlug(wf?.title),
          experienceLevel: mapExpTitleToSlug(ef?.title),
          duration: values.duration_months,
          isPaid: !!values.is_paid,
          expiresAt: values.expires_at ? values.expires_at.format('YYYY-MM-DD') : null,
        })
        notificationApi.success({ message: 'Стажировка создана' })
      } 
      
      else if (kind === 'event') {
        upsertExtraOpportunity({
          ...commonData,
          type: 'event',
          kind: 'event',
          format: values.is_online ? 'remote' : 'office',
          isOnline: !!values.is_online,
          expiresAt: values.event_date ? values.event_date.format('YYYY-MM-DD') : null,
          contacts: {
            site: values.registration_link || '',
          }
        })
        notificationApi.success({ message: 'Мероприятие создано' })
      } 
      
      else if (kind === 'mentor') {
        upsertExtraOpportunity({
          ...commonData,
          type: 'mentor',
          kind: 'mentorship',
          format: 'remote',
          experienceLevel: 'middle',
          description: [
            values.description,
            values.selection_criteria && `Критерии отбора: ${values.selection_criteria}`,
          ].filter(Boolean).join('\n\n'),
        })
        notificationApi.success({ message: 'Программа менторства создана' })
      }

      onClose()
      form.resetFields()

    } catch (error) {
      console.error("Ошибка формы:", error)
      notificationApi.error({ 
        message: 'Ошибка сохранения', 
        description: 'Пожалуйста, проверьте правильность заполнения всех обязательных полей.' 
      })
    }
  }

  return {
    handleSubmit,
    isSubmitting: false, 
    tagsDictionary,
  }
}

export default useOpportunityModal