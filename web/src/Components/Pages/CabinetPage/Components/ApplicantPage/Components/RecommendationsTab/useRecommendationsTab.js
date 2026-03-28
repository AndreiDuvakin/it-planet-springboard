import { useState } from 'react'
import { notification } from 'antd'
import { setRecommendationState } from '../../../../../../../local/tramplinStore.js'

const useRecommendationsTab = (onRefresh) => {
  const [loading, setLoading] = useState(false)

  const handleAction = async (id, action) => {
    setLoading(true)
    try {
      setRecommendationState(id, action === 'accept' ? 'accepted' : 'declined')
      notification.success({
        message: action === 'accept' ? 'Рекомендация принята' : 'Скрыто',
      })
      if (onRefresh) onRefresh()
    } catch {
      notification.error({ message: 'Ошибка при обработке' })
    } finally {
      setLoading(false)
    }
  }

  return { loading, handleAction }
}

export default useRecommendationsTab
