import { useState, useEffect, useCallback, useMemo } from 'react'
import { useSelector } from 'react-redux'
import { notification } from 'antd'
import { getVerificationQueue, getModerationQueue } from '../../../../../local/tramplinStore.js'

const useCuratorCabinet = () => {
  const [api, contextHolder] = notification.useNotification()
  const [loading, setLoading] = useState(false)
  const [version, setVersion] = useState(0)
  const { userData } = useSelector((s) => s.auth)

  const isAdmin = !!userData?.is_admin

  useEffect(() => {
    const fn = () => setVersion((v) => v + 1)
    window.addEventListener('tramplin-store-changed', fn)
    return () => window.removeEventListener('tramplin-store-changed', fn)
  }, [])

  const fetchData = useCallback(() => {
    setLoading(true)
    setTimeout(() => {
      setLoading(false)
      setVersion((v) => v + 1)
    }, 200)
  }, [])

  const moderationRows = useMemo(() => {
    return getModerationQueue().map((o) => ({
      id: o.id,
      title: o.title,
      company: o.company,
      type: o.type,
      moderationStatus: o.moderationStatus || 'pending',
      moderationComment: o.moderationComment || '',
    }))
  }, [version])

  const verificationQueue = useMemo(() => {
    return getVerificationQueue().filter((v) => v.status === 'pending')
  }, [version])

  const users = []

  const refresh = useCallback(() => {
    setVersion((v) => v + 1)
  }, [])

  return {
    loading,
    isAdmin,
    contextHolder,
    moderationRows,
    users,
    verificationQueue,
    refresh,
    fetchData,
  }
}

export default useCuratorCabinet
