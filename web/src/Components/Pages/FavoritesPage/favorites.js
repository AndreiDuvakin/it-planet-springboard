// TODO убрать константу
const STORAGE_KEY = 'tramplin_favorites_v1'

export function getFavoriteIds() {
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
    return next
}

