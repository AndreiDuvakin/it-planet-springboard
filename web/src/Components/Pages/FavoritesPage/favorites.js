import { getOpportunities, bumpStore } from '../../../local/tramplinStore.js'

const STORAGE_KEY = 'tramplin_favorites_v1'
const COMPANIES_KEY = 'tramplin_favorite_companies_v1'

function readIds() {
  try {
    const raw = localStorage.getItem(STORAGE_KEY)
    if (!raw) return []
    const parsed = JSON.parse(raw)
    if (!Array.isArray(parsed)) return []
    return parsed.filter((x) => typeof x === 'string')
  } catch {
    return []
  }
}

function rebuildFavoriteCompanies(favoriteIds) {
  const ids = new Set(favoriteIds.map(String))
  const set = new Set()
  try {
    const opps = getOpportunities()
    opps.forEach((o) => {
      if (ids.has(String(o.id)) && o.company) set.add(o.company.trim())
    })
  } catch {
    /* ignore */
  }
  localStorage.setItem(COMPANIES_KEY, JSON.stringify(Array.from(set)))
}

export function getFavoriteIds() {
  return readIds()
}

export function getFavoriteCompanyNames() {
  try {
    const raw = localStorage.getItem(COMPANIES_KEY)
    if (!raw) return []
    const parsed = JSON.parse(raw)
    if (!Array.isArray(parsed)) return []
    return parsed.filter((x) => typeof x === 'string')
  } catch {
    return []
  }
}

export function isFavoriteCompanyName(name) {
  const n = (name || '').trim().toLowerCase()
  if (!n) return false
  return getFavoriteCompanyNames().some((c) => c.trim().toLowerCase() === n)
}

export function isFavorite(id) {
  return getFavoriteIds().includes(String(id))
}

export function toggleFavorite(id) {
  const strId = String(id)
  const current = new Set(getFavoriteIds())
  if (current.has(strId)) {
    current.delete(strId)
  } else {
    current.add(strId)
  }
  const next = Array.from(current)
  localStorage.setItem(STORAGE_KEY, JSON.stringify(next))
  rebuildFavoriteCompanies(next)
  bumpStore()
  return next
}
