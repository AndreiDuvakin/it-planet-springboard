import { useState } from 'react'
import { notification } from 'antd'
import { removeApplication } from '../../../../../../../local/tramplinStore.js'

const useApplicationsTab = (onRefresh) => {
  const [loading, setLoading] = useState(false)

  const cancelApplication = async (id) => {
    setLoading(true)
    try {
      removeApplication(id)
      notification.success({ message: 'Отклик отозван' })
      if (onRefresh) onRefresh()
    } catch (error) {
      notification.error({ message: 'Ошибка при отзыве' })
    } finally {
      setLoading(false)
    }
  }

  return { loading, cancelApplication }
}

export default useApplicationsTab
