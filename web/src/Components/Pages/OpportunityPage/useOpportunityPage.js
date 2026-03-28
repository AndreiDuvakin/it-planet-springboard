import { useMemo, useState, useCallback, useEffect } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { useSelector } from 'react-redux'
import { getOpportunityById, addApplication } from '../../../local/tramplinStore.js'
import { buildYandexMapsEmbedQuery } from '../HomePage/useHomePage.js'
import { isFavorite, toggleFavorite } from '../FavoritesPage/favorites.js'

export function useOpportunityPage() {
  const { id } = useParams()
  const navigate = useNavigate()
  const { userData } = useSelector((s) => s.auth)
  const [version, setVersion] = useState(0)
  const [fav, setFav] = useState(() => isFavorite(id))

  useEffect(() => {
    const fn = () => setVersion((v) => v + 1)
    window.addEventListener('tramplin-store-changed', fn)
    return () => window.removeEventListener('tramplin-store-changed', fn)
  }, [])

  const opportunity = useMemo(() => getOpportunityById(id), [id, version])

  const mapSrc = useMemo(
    () => (opportunity ? buildYandexMapsEmbedQuery(opportunity) : ''),
    [opportunity]
  )

  const canApply =
    !!userData &&
    userData?.role?.title === 'applicant' &&
    opportunity?.moderationStatus !== 'rejected'

  const onApply = useCallback(
    (coverLetter) => {
      if (!userData?.id || !opportunity) return
      addApplication({
        applicantUserId: userData.id,
        opportunityId: String(opportunity.id),
        opportunityTitle: opportunity.title,
        company: opportunity.company,
        coverLetter,
      })
    },
    [userData, opportunity]
  )

  const onToggleFav = useCallback(() => {
    const next = toggleFavorite(id)
    setFav(next.includes(String(id)))
  }, [id])

  return {
    navigate,
    opportunity,
    mapSrc,
    canApply,
    onApply,
    userData,
    isFavorite: fav,
    onToggleFav,
  }
}
