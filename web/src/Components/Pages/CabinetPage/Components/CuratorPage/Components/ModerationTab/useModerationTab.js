import { notification } from 'antd'
import { useState } from 'react'
import { patchOpportunity } from '../../../../../../../local/tramplinStore.js'

const useModerationTab = (onRefresh) => {
  const [loading, setLoading] = useState(false)

  const updateOpportunity = async (id, partial) => {
    setLoading(true)
    try {
      const p = { ...partial }
      if (p.status) {
        p.moderationStatus = p.status
        delete p.status
      }
      patchOpportunity(id, p)
      notification.success({ message: 'Карточка обновлена' })
      if (onRefresh) onRefresh()
    } catch (error) {
      notification.error({ message: 'Ошибка' })
    } finally {
      setLoading(false)
    }
  }

  return { loading, updateOpportunity }
}

export default useModerationTab
