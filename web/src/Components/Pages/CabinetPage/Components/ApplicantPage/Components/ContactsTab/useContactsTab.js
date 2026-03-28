import { useState } from 'react'
import { notification } from 'antd'
import { removeContact as removeContactStore } from '../../../../../../../local/tramplinStore.js'

const useContactsTab = (onRefresh) => {
  const [loading, setLoading] = useState(false)

  const removeContact = async (id) => {
    setLoading(true)
    try {
      removeContactStore(id)
      notification.success({ message: 'Контакт удалён' })
      if (onRefresh) onRefresh()
    } catch {
      notification.error({ message: 'Не удалось удалить контакт' })
    } finally {
      setLoading(false)
    }
  }

  return { loading, removeContact }
}

export default useContactsTab
