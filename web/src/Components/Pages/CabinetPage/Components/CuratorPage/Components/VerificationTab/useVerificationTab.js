import { notification } from 'antd'
import { useState } from 'react'
import { setVerificationRequestStatus } from '../../../../../../../local/tramplinStore.js'

const useVerificationTab = (onRefresh) => {
  const [loading, setLoading] = useState(false)

  const handleDecision = async (id, decision) => {
    setLoading(true)
    try {
      if (decision === 'approve') {
        setVerificationRequestStatus(id, 'approved')
        notification.success({ message: 'Компания верифицирована' })
      } else if (decision === 'reject') {
        setVerificationRequestStatus(id, 'rejected')
        notification.warning({ message: 'Заявка отклонена' })
      } else {
        setVerificationRequestStatus(id, 'clarify')
        notification.info({ message: 'Запрошено уточнение' })
      }
      if (onRefresh) onRefresh()
    } catch (error) {
      notification.error({ message: 'Ошибка' })
    } finally {
      setLoading(false)
    }
  }

  return { loading, handleDecision }
}

export default useVerificationTab
