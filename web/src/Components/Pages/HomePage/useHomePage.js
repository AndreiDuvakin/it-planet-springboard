import { useMemo, useState, useCallback, useEffect } from 'react'
import { notification } from 'antd'
import { useNavigate } from 'react-router-dom'
import { OPPORTUNITY_TYPES, WORK_FORMATS } from '../../../mock/opportunities.js'
import { getFavoriteIds, toggleFavorite, getFavoriteCompanyNames } from '../FavoritesPage/favorites.js'
import { getOpportunities, getTagRegistry } from '../../../local/tramplinStore.js'

export { OPPORTUNITY_TYPES, WORK_FORMATS }

export const EMPLOYMENT_TYPES = [
  { value: 'full', label: 'Полная занятость' },
  { value: 'part', label: 'Частичная занятость' },
  { value: 'project', label: 'Проектная работа' },
]

export const EXPERIENCE_LEVELS = [
  { value: 'intern', label: 'Стажёр' },
  { value: 'junior', label: 'Junior' },
  { value: 'middle', label: 'Middle' },
  { value: 'senior', label: 'Senior' },
]

export const TYPE_COLORS = {
  vacancy: 'blue',
  internship: 'cyan',
  mentor: 'purple',
  mentorship: 'purple',
  event: 'orange',
}

export function salaryText(item) {
  if (item.salaryFrom && item.salaryTo)
    return `${item.salaryFrom.toLocaleString('ru')}–${item.salaryTo.toLocaleString('ru')} ₽`
  if (item.salaryFrom) return `от ${item.salaryFrom.toLocaleString('ru')} ₽`
  return null
}

export function getMapQuery(item) {
  if (!item) return 'Россия'
  const isRemote = item.format === 'remote' || item.isOnline === true
  return isRemote ? item.city || 'Россия' : item.address || item.city || 'Россия'
}

export function buildYandexMapsEmbedQuery(item) {
  const q = getMapQuery(item)
  return `https://yandex.ru/map-widget/v1/?mode=search&text=${encodeURIComponent(q)}&z=12`
}

export function useHomePage() {
  const navigate = useNavigate()
  const [api, contextHolder] = notification.useNotification()
  const [storeVersion, setStoreVersion] = useState(0)

  useEffect(() => {
    const fn = () => setStoreVersion((v) => v + 1)
    window.addEventListener('tramplin-store-changed', fn)
    return () => window.removeEventListener('tramplin-store-changed', fn)
  }, [])

  const [search, setSearch] = useState('')
  const [types, setTypes] = useState([])
  const [formats, setFormats] = useState([])
  const [tags, setTags] = useState([])
  const [salary, setSalary] = useState([0, 250000])
  const [experienceLevels, setExperienceLevels] = useState([])
  const [employmentTypes, setEmploymentTypes] = useState([])
  const [favoriteIds, setFavoriteIds] = useState(() => getFavoriteIds())
  const [selectedId, setSelectedId] = useState(null)

  const allOpportunities = useMemo(() => getOpportunities(), [storeVersion])

  const allSkillTags = useMemo(() => getTagRegistry(), [storeVersion])

  const openNotification = useCallback(
    (msg) => {
      api.success({ message: msg, placement: 'topRight', duration: 2 })
    },
    [api]
  )

  const favoriteCompanyNames = useMemo(
    () => getFavoriteCompanyNames(),
    [favoriteIds, storeVersion]
  )

  const filtered = useMemo(() => {
    const s = search.trim().toLowerCase()
    return allOpportunities.filter((o) => {
      const bySearch =
        !s ||
        o.title.toLowerCase().includes(s) ||
        o.company.toLowerCase().includes(s) ||
        (o.city || '').toLowerCase().includes(s)
      const byType = types.length === 0 || types.includes(o.type)
      const byFormat = formats.length === 0 || formats.includes(o.format)
      const byTags =
        tags.length === 0 ||
        tags.every((t) => (o.tags || []).includes(t))
      const byExp = experienceLevels.length === 0 || experienceLevels.includes(o.experienceLevel)
      const byEmp = employmentTypes.length === 0 || employmentTypes.includes(o.employmentType)
      const salaryFrom = o.salaryFrom ?? 0
      const salaryOk =
        (o.salaryFrom == null && o.salaryTo == null) ||
        (salaryFrom >= salary[0] && salaryFrom <= salary[1])
      return bySearch && byType && byFormat && byTags && salaryOk && byExp && byEmp
    })
  }, [
    allOpportunities,
    search,
    types,
    formats,
    tags,
    salary,
    experienceLevels,
    employmentTypes,
  ])

  const selectedItem = useMemo(() => {
    if (selectedId) {
      const found = filtered.find((o) => String(o.id) === String(selectedId))
      if (found) return found
    }
    return filtered[0] ?? null
  }, [filtered, selectedId])

  const mapSrc = useMemo(() => buildYandexMapsEmbedQuery(selectedItem), [selectedItem])

  function onSelectMapItem(id) {
    setSelectedId(id)
  }

  function onToggleFavorite(id) {
    const next = toggleFavorite(id)
    setFavoriteIds(next)
    openNotification(next.includes(String(id)) ? 'Добавлено в избранное' : 'Убрано из избранного')
  }

  return {
    navigate,
    contextHolder,
    search,
    setSearch,
    types,
    setTypes,
    formats,
    setFormats,
    tags,
    setTags,
    salary,
    setSalary,
    experienceLevels,
    setExperienceLevels,
    employmentTypes,
    setEmploymentTypes,
    favoriteIds,
    favoriteCompanyNames,
    filtered,
    selectedItem,
    selectedId: selectedItem?.id ?? null,
    mapSrc,
    onSelectMapItem,
    onToggleFavorite,
    allSkillTags,
  }
}
