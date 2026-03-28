import { Form, notification } from 'antd'
import { useSelector } from 'react-redux'
import { useEffect } from 'react'
import { getPrivacy, setPrivacy } from '../../../../../../../local/tramplinStore.js'

const usePrivacyTab = () => {
  const [form] = Form.useForm()
  const { userData } = useSelector((s) => s.auth)
  const userId = userData?.id

  useEffect(() => {
    if (userId == null) return
    form.setFieldsValue(getPrivacy(userId))
  }, [userId, form])

  const onFinish = (values) => {
    if (userId == null) return
    setPrivacy(userId, values)
    notification.success({ message: 'Настройки сохранены' })
  }

  return { form, onFinish }
}

export default usePrivacyTab
