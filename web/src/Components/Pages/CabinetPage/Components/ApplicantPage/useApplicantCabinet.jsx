import { useState, useEffect, useCallback, useMemo } from 'react'
import { notification } from 'antd'
import { useSelector } from 'react-redux'
import {
  getApplicationsForApplicant,
  getContactsForUser,
  getRecommendationsForUser,
} from '../../../../../local/tramplinStore.js'

const useApplicantCabinet = () => {
  const [api, contextHolder] = notification.useNotification()
  const [loading, setLoading] = useState(false)
  const [version, setVersion] = useState(0)
  const { userData } = useSelector((s) => s.auth)
  const userId = userData?.id

  useEffect(() => {
    const fn = () => setVersion((v) => v + 1)
    window.addEventListener('tramplin-store-changed', fn)
    return () => window.removeEventListener('tramplin-store-changed', fn)
  }, [])

  const refresh = useCallback(() => setVersion((v) => v + 1), [])

  const applications = useMemo(() => {
    if (userId == null) return []
    return getApplicationsForApplicant(userId).map((a) => ({
      id: a.id,
      opportunityTitle: a.opportunityTitle,
      opportunityId: a.opportunityId,
      date: a.date,
      status: a.status,
    }))
  }, [userId, version])

  const contacts = useMemo(() => {
    if (userId == null) return []
    return getContactsForUser(userId).map((c) => ({
      id: c.id,
      name: c.name,
      university: c.university,
      skills: c.skills,
    }))
  }, [userId, version])

  const recommendations = useMemo(() => {
    if (userId == null) return []
    return getRecommendationsForUser(userId).map((r) => ({
      id: r.id,
      fromName: r.fromName,
      opportunityTitle: r.opportunityTitle,
      date: r.date,
    }))
  }, [userId, version])

  return {
    loading,
    contextHolder,
    applications,
    contacts,
    recommendations,
    refresh,
  }
}

export default useApplicantCabinet
