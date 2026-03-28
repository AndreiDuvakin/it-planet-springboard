import { useMemo, useState, useEffect } from 'react'
import { useSelector } from 'react-redux'
import { getEmployerOpportunities } from '../../../../../../../local/tramplinStore.js'

const useMyOpportunitiesTab = () => {
  const { userData } = useSelector((s) => s.auth)
  const [v, setV] = useState(0)
  const [statusFilter, setStatusFilter] = useState('all')

  useEffect(() => {
    const fn = () => setV((x) => x + 1)
    window.addEventListener('tramplin-store-changed', fn)
    return () => window.removeEventListener('tramplin-store-changed', fn)
  }, [])

  const opportunities = useMemo(() => {
    const list = getEmployerOpportunities(userData?.id)
    const mapped = list.map((o) => ({
      id: o.id,
      title: o.title,
      kind: o.kind || (o.type === 'mentor' ? 'mentorship' : o.type),
      status: o.status || 'active',
      moderationStatus: o.moderationStatus || 'approved',
    }))
    if (statusFilter === 'all') return mapped
    return mapped.filter((r) => r.status === statusFilter)
  }, [userData?.id, v, statusFilter])

  return { opportunities, isLoading: false, statusFilter, setStatusFilter }
}

export default useMyOpportunitiesTab
