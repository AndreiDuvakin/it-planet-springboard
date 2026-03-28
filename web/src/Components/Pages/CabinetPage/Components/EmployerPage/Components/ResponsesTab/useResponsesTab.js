import { notification } from 'antd'
import { useState } from 'react'
import { updateApplication } from '../../../../../../../local/tramplinStore.js'

function useResponsesTab(onRefresh) {
  const [loading, setLoading] = useState(false)

  const handleStatusChange = async (id, newStatus) => {
    setLoading(true)
    try {
      updateApplication(id, { status: newStatus })
      notification.success({ message: 'Статус обновлён' })
      if (onRefresh) onRefresh()
    } catch (error) {
      notification.error({ message: 'Не удалось обновить статус' })
    } finally {
      setLoading(false)
    }
  }

  const handleNoteBlur = async (id, note) => {
    updateApplication(id, { note })
    notification.success({ message: 'Заметка сохранена' })
  }

  return { handleStatusChange, handleNoteBlur, loading }
}

export default useResponsesTab
