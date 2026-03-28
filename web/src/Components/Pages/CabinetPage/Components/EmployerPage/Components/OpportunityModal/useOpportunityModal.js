import { useCreateVacancyMutation } from '../../../../../../../Api/vacanciesApi.js'
import { useCreateInternshipMutation } from '../../../../../../../Api/internshipsApi.js'
import { useGetProfileQuery } from '../../../../../../../Api/companyApi.js'
import {
  useGetWorkFormatsQuery,
  useGetExperienceLevelsQuery,
} from '../../../../../../../Api/dictionariesApi.js'
import { useSelector } from 'react-redux'
import {
  recordServerOpportunity,
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

function dateToIso(v) {
  if (!v) return null
  if (typeof v.toDate === 'function') return v.toDate().toISOString()
  if (typeof v.toISOString === 'function') return v.toISOString()
  return null
}

const useOpportunityModal = (form, mode, kind, editingId, onClose, notificationApi) => {
  const [createVacancy, { isLoading: isVacancyCreating }] = useCreateVacancyMutation()
  const [createInternship, { isLoading: isInternshipCreating }] = useCreateInternshipMutation()
  const { data: companyProfile } = useGetProfileQuery()
  const { data: workFormats = [] } = useGetWorkFormatsQuery()
  const { data: experienceLevels = [] } = useGetExperienceLevelsQuery()
  const { userData } = useSelector((s) => s.auth)

  const tagsDictionary = getTagRegistry().map((t) => ({ value: t.title, label: t.title }))

  const handleSubmit = async () => {
    try {
      const values = await form.validateFields()
      const localTags = (values.local_tags || []).map((t) => String(t).trim()).filter(Boolean)
      localTags.forEach((t) => addTagTitle(t))

      const companyTitle = companyProfile?.title || 'Компания'
      const ownerUserId = userData?.id
      const vStatus = ownerUserId != null ? getEmployerVerificationStatus(ownerUserId) : 'none'

      if (mode === 'edit' && editingId) {
        const existing = getOpportunityById(editingId)
        const base = {
          title: values.title,
          description: values.description,
          tags: localTags.length ? localTags : existing?.tags || [],
        }
        if (values.expires_at) base.expiresAt = values.expires_at.format?.('YYYY-MM-DD') || values.expires_at
        patchOpportunity(editingId, base)
        notificationApi.success({ message: 'Сохранено' })
        onClose()
        form.resetFields()
        return
      }

      // create
      if ((kind === 'vacancy' || kind === 'internship') && vStatus !== 'approved') {
        notificationApi.warning({
          message: 'Верификация компании',
          description:
            'Для публикации вакансий и стажировок через платформу компания должна быть верифицирована куратором. Отправьте данные во вкладке «Компания».',
        })
        return
      }

      if (kind === 'vacancy') {
        const payload = {
          title: values.title,
          description: values.description,
          address: values.address,
          salary_min: values.salary_min ? Number(values.salary_min) : null,
          salary_max: values.salary_max ? Number(values.salary_max) : null,
          expires_at: dateToIso(values.expires_at),
          employment_type_id: values.employment_type_id,
          experience_level_id: values.experience_level_id,
          work_format_id: values.work_format_id,
          tag_ids: [],
          media_url: values.media_url || null,
        }
        const created = await createVacancy(payload).unwrap()
        const wf = workFormats.find((w) => w.id === values.work_format_id)
        const ef = experienceLevels.find((e) => e.id === values.experience_level_id)
        const loc = created.location
        recordServerOpportunity({
          serverId: created.id,
          kind: 'vacancy',
          ownerUserId,
          companyTitle,
          localTags,
          moderationStatus: 'pending',
          extra: {
            title: created.title,
            description: values.description,
            address: values.address,
            city: values.address?.split(',')[0]?.trim() || '',
            salaryFrom: payload.salary_min,
            salaryTo: payload.salary_max,
            expiresAt: values.expires_at ? values.expires_at.format('YYYY-MM-DD') : null,
            publishedAt: new Date().toISOString().slice(0, 10),
            format: mapWorkFormatTitleToSlug(wf?.title),
            experienceLevel: mapExpTitleToSlug(ef?.title),
            employmentType: 'full',
            contacts: {
              site: companyProfile?.website_url,
              email: companyProfile?.corporate_email,
            },
            location:
              loc && loc.latitude != null && loc.longitude != null
                ? { lat: Number(loc.latitude), lng: Number(loc.longitude) }
                : { lat: 55.75, lng: 37.61 },
          },
        })
        notificationApi.success({ message: 'Вакансия отправлена на модерацию' })
        onClose()
        form.resetFields()
        return
      }

      if (kind === 'internship') {
        const payload = {
          title: values.title,
          description: values.description,
          address: values.address,
          duration_months: Number(values.duration_months) || 0,
          experience_level_id: values.experience_level_id,
          work_format_id: values.work_format_id,
          expires_at: dateToIso(values.expires_at),
          is_paid: !!values.is_paid,
          mentorship_available: !!values.mentorship_available,
          tag_ids: [],
          media_url: values.media_url || null,
        }
        const created = await createInternship(payload).unwrap()
        const wf = workFormats.find((w) => w.id === values.work_format_id)
        const ef = experienceLevels.find((e) => e.id === values.experience_level_id)
        const loc2 = created.location
        recordServerOpportunity({
          serverId: created.id,
          kind: 'internship',
          ownerUserId,
          companyTitle,
          localTags,
          moderationStatus: 'pending',
          extra: {
            title: created.title,
            description: values.description,
            address: values.address,
            city: values.address?.split(',')[0]?.trim() || '',
            salaryFrom: null,
            salaryTo: null,
            expiresAt: values.expires_at ? values.expires_at.format('YYYY-MM-DD') : null,
            publishedAt: new Date().toISOString().slice(0, 10),
            format: mapWorkFormatTitleToSlug(wf?.title),
            experienceLevel: mapExpTitleToSlug(ef?.title),
            contacts: {
              site: companyProfile?.website_url,
              email: companyProfile?.corporate_email,
            },
            location:
              loc2 && loc2.latitude != null && loc2.longitude != null
                ? { lat: Number(loc2.latitude), lng: Number(loc2.longitude) }
                : { lat: 55.75, lng: 37.61 },
          },
        })
        notificationApi.success({ message: 'Стажировка отправлена на модерацию' })
        onClose()
        form.resetFields()
        return
      }

      // Локальные типы: мероприятие, менторство
      const id = `local_${Date.now()}`
      if (kind === 'event') {
        upsertExtraOpportunity({
          id,
          title: values.title,
          company: companyTitle,
          type: 'event',
          kind: 'event',
          format: values.is_online ? 'remote' : 'office',
          city: (values.address || '').split(',')[0]?.trim() || 'Москва',
          address: values.address,
          salaryFrom: null,
          salaryTo: null,
          publishedAt: new Date().toISOString().slice(0, 10),
          expiresAt: values.event_date ? values.event_date.format('YYYY-MM-DD') : null,
          tags: localTags,
          description: values.description,
          contacts: {
            site: values.registration_link || companyProfile?.website_url,
            email: companyProfile?.corporate_email,
          },
          location: { lat: 55.75, lng: 37.61 },
          status: 'active',
          ownerUserId,
          source: 'local',
          moderationStatus: 'pending',
          isOnline: !!values.is_online,
          employmentType: 'project',
          experienceLevel: 'junior',
        })
        notificationApi.success({ message: 'Мероприятие создано (локально), на модерации' })
        onClose()
        form.resetFields()
        return
      }

      if (kind === 'mentorship') {
        upsertExtraOpportunity({
          id,
          title: values.title,
          company: companyTitle,
          type: 'mentor',
          kind: 'mentorship',
          format: 'remote',
          city: (values.address || 'Онлайн').split(',')[0]?.trim() || 'Онлайн',
          address: values.address || 'Онлайн',
          salaryFrom: null,
          salaryTo: null,
          publishedAt: new Date().toISOString().slice(0, 10),
          expiresAt: null,
          tags: [...localTags, values.focus_area].filter(Boolean),
          description: [values.description, values.selection_criteria && `Отбор: ${values.selection_criteria}`]
            .filter(Boolean)
            .join('\n\n'),
          contacts: {
            site: companyProfile?.website_url,
            email: companyProfile?.corporate_email,
          },
          location: { lat: 59.93, lng: 30.36 },
          status: 'active',
          ownerUserId,
          source: 'local',
          moderationStatus: 'pending',
          employmentType: 'part',
          experienceLevel: 'middle',
        })
        notificationApi.success({ message: 'Программа менторства создана (локально), на модерации' })
        onClose()
        form.resetFields()
      }
    } catch (error) {
      const desc =
        error?.data?.detail?.[0]?.msg ||
        error?.data?.detail ||
        error?.message ||
        'Проверьте поля формы'
      notificationApi.error({
        message: 'Ошибка сохранения',
        description: typeof desc === 'string' ? desc : JSON.stringify(desc),
      })
    }
  }

  return {
    handleSubmit,
    isSubmitting: isVacancyCreating || isInternshipCreating,
    tagsDictionary,
  }
}

export default useOpportunityModal
