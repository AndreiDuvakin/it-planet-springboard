/**
 * Локальный слой данных (localStorage) для прототипа без доработки API:
 * возможности, отклики, верификация работодателей, контакты, рекомендации, приватность, теги.
 */
import { OPPORTUNITIES as MOCK_OPPS, TAGS as MOCK_TAG_TITLES } from '../mock/opportunities.js'

const K = {
  PATCHES: 'tramplin_opp_patches_v1',
  EXTRAS: 'tramplin_opp_extras_v1',
  TAGS: 'tramplin_tag_registry_v1',
  APPLICATIONS: 'tramplin_applications_v1',
  VERIFICATIONS: 'tramplin_verifications_v1',
  EMPLOYER_STATUS: 'tramplin_employer_verified_v1',
  NETWORK_CONTACTS: 'tramplin_contacts_v1',
  NETWORK_RECS: 'tramplin_recommendations_v1',
  PRIVACY: 'tramplin_privacy_v1',
}

function safeParse(json, fallback) {
  try {
    return json ? JSON.parse(json) : fallback
  } catch {
    return fallback
  }
}

function uid(prefix = 'id') {
  return `${prefix}_${Date.now()}_${Math.random().toString(36).slice(2, 9)}`
}

export function bumpStore() {
  if (typeof window !== 'undefined') window.dispatchEvent(new Event('tramplin-store-changed'))
}

/** Стартовый реестр тегов (строки) — расширяется в UI */
export function getTagRegistry() {
  const raw = localStorage.getItem(K.TAGS)
  const parsed = safeParse(raw, null)
  if (parsed && Array.isArray(parsed) && parsed.length) {
    return parsed.map((t) => (typeof t === 'string' ? { id: t, title: t } : t))
  }
  const initial = MOCK_TAG_TITLES.map((t) => ({ id: t, title: t }))
  localStorage.setItem(K.TAGS, JSON.stringify(initial))
  return initial
}

export function addTagTitle(title) {
  const t = String(title || '').trim()
  if (!t) return getTagRegistry()
  const reg = getTagRegistry()
  if (reg.some((x) => x.title.toLowerCase() === t.toLowerCase())) return reg
  const next = [...reg, { id: t, title: t }]
  localStorage.setItem(K.TAGS, JSON.stringify(next))
  bumpStore()
  return next
}

function loadPatches() {
  return safeParse(localStorage.getItem(K.PATCHES), {})
}

function savePatches(p) {
  localStorage.setItem(K.PATCHES, JSON.stringify(p))
  bumpStore()
}

function loadExtras() {
  return safeParse(localStorage.getItem(K.EXTRAS), [])
}

function saveExtras(list) {
  localStorage.setItem(K.EXTRAS, JSON.stringify(list))
  bumpStore()
}

function normalizeOpp(o) {
  return {
    employmentType: o.employmentType || 'full',
    experienceLevel: o.experienceLevel || 'junior',
    moderationStatus: o.moderationStatus ?? 'approved',
    ...o,
    tags: Array.isArray(o.tags) ? o.tags : [],
  }
}

/** Все возможности для главной / карты / карточки */
export function getOpportunities() {
  const patches = loadPatches()
  const extras = loadExtras().map(normalizeOpp)
  const base = MOCK_OPPS.map((o) => normalizeOpp({ ...o, ...patches[o.id] }))
  const byId = new Map()
  ;[...base, ...extras].forEach((o) => byId.set(String(o.id), o))
  return Array.from(byId.values()).filter((o) => o.moderationStatus !== 'rejected')
}

export function getOpportunityById(id) {
  const all = getOpportunities()
  return all.find((o) => String(o.id) === String(id)) || null
}

export function patchOpportunity(id, partial) {
  const sid = String(id)
  const extras = loadExtras()
  const ix = extras.findIndex((o) => String(o.id) === sid)
  if (ix >= 0) {
    extras[ix] = normalizeOpp({ ...extras[ix], ...partial })
    saveExtras(extras)
    return extras[ix]
  }
  const patches = loadPatches()
  patches[sid] = { ...(patches[sid] || {}), ...partial }
  savePatches(patches)
  return getOpportunityById(sid)
}

export function upsertExtraOpportunity(opp) {
  const extras = loadExtras()
  const sid = String(opp.id)
  const ix = extras.findIndex((o) => String(o.id) === sid)
  const row = normalizeOpp(opp)
  if (ix >= 0) extras[ix] = row
  else extras.push(row)
  saveExtras(extras)
  return row
}

/** Записать возможность после успешного POST вакансии/стажировки + локальные теги */
export function recordServerOpportunity({
  serverId,
  kind,
  ownerUserId,
  companyTitle,
  localTags = [],
  moderationStatus = 'pending',
  extra = {},
}) {
  const id = String(serverId)
  return upsertExtraOpportunity({
    id,
    serverId,
    title: extra.title || 'Без названия',
    company: companyTitle || 'Компания',
    type: kind === 'internship' ? 'internship' : 'vacancy',
    kind,
    format: extra.format || 'office',
    city: extra.city || '',
    address: extra.address || '',
    salaryFrom: extra.salaryFrom ?? null,
    salaryTo: extra.salaryTo ?? null,
    publishedAt: extra.publishedAt || new Date().toISOString().slice(0, 10),
    expiresAt: extra.expiresAt || null,
    tags: localTags,
    description: extra.description || '',
    contacts: extra.contacts || {},
    location: extra.location || { lat: 55.75, lng: 37.61 },
    status: extra.status || 'active',
    ownerUserId,
    source: 'api',
    moderationStatus,
    employmentType: extra.employmentType || 'full',
    experienceLevel: extra.experienceLevel || 'junior',
  })
}

export function getEmployerOpportunities(userId) {
  if (userId == null) return []
  return getOpportunities().filter((o) => o.ownerUserId === userId)
}

// --- Отклики ---

function loadApplications() {
  return safeParse(localStorage.getItem(K.APPLICATIONS), [])
}

function saveApplications(list) {
  localStorage.setItem(K.APPLICATIONS, JSON.stringify(list))
  bumpStore()
}

export function getApplicationsForApplicant(userId) {
  return loadApplications().filter((a) => a.applicantUserId === userId)
}

export function getApplicationsForEmployer(companyName) {
  const cn = (companyName || '').trim().toLowerCase()
  if (!cn) return []
  return loadApplications().filter((a) => (a.company || '').trim().toLowerCase() === cn)
}

export function addApplication({
  applicantUserId,
  opportunityId,
  opportunityTitle,
  company,
  coverLetter,
}) {
  const list = loadApplications()
  const row = {
    id: uid('app'),
    applicantUserId,
    opportunityId: String(opportunityId),
    opportunityTitle,
    company,
    coverLetter: coverLetter || '',
    status: 'Новый',
    note: '',
    date: new Date().toISOString().slice(0, 10),
  }
  list.push(row)
  saveApplications(list)
  return row
}

export function updateApplication(id, partial) {
  const list = loadApplications()
  const ix = list.findIndex((a) => a.id === id)
  if (ix < 0) return null
  list[ix] = { ...list[ix], ...partial }
  saveApplications(list)
  return list[ix]
}

export function removeApplication(id) {
  const list = loadApplications().filter((a) => a.id !== id)
  saveApplications(list)
}

// --- Верификация работодателя ---

export function getVerificationQueue() {
  return safeParse(localStorage.getItem(K.VERIFICATIONS), [])
}

function saveVerifications(list) {
  localStorage.setItem(K.VERIFICATIONS, JSON.stringify(list))
  bumpStore()
}

export function submitEmployerVerification({ userId, company, inn, corporateEmail, links }) {
  const list = getVerificationQueue()
  const row = {
    id: uid('ver'),
    userId,
    company,
    inn,
    corporateEmail,
    links: links || '',
    status: 'pending',
    createdAt: new Date().toISOString(),
  }
  list.push(row)
  saveVerifications(list)
  return row
}

export function setVerificationRequestStatus(id, status) {
  const list = getVerificationQueue()
  const ix = list.findIndex((v) => v.id === id)
  if (ix < 0) return
  const row = { ...list[ix], status }
  list[ix] = row
  saveVerifications(list)
  if (row.userId != null) {
    if (status === 'approved') setEmployerVerificationUserStatus(row.userId, 'approved')
    else if (status === 'rejected') setEmployerVerificationUserStatus(row.userId, 'rejected')
  }
}

export function getEmployerVerificationStatus(userId) {
  const map = safeParse(localStorage.getItem(K.EMPLOYER_STATUS), {})
  return map[userId] || 'none'
}

export function setEmployerVerificationUserStatus(userId, status) {
  const map = safeParse(localStorage.getItem(K.EMPLOYER_STATUS), {})
  map[userId] = status
  localStorage.setItem(K.EMPLOYER_STATUS, JSON.stringify(map))
  bumpStore()
}

// --- Контакты / рекомендации ---

function loadContacts() {
  return safeParse(localStorage.getItem(K.NETWORK_CONTACTS), [])
}

function saveContacts(list) {
  localStorage.setItem(K.NETWORK_CONTACTS, JSON.stringify(list))
  bumpStore()
}

export function getContactsForUser(userId) {
  return loadContacts().filter((c) => c.ownerUserId === userId)
}

export function addContact(ownerUserId, contact) {
  const list = loadContacts()
  list.push({
    id: uid('c'),
    ownerUserId,
    userId: contact.userId,
    name: contact.name,
    university: contact.university || '',
    skills: contact.skills || [],
  })
  saveContacts(list)
}

export function removeContact(contactId) {
  const list = loadContacts().filter((c) => c.id !== contactId)
  saveContacts(list)
}

function loadRecs() {
  return safeParse(localStorage.getItem(K.NETWORK_RECS), [])
}

function saveRecs(list) {
  localStorage.setItem(K.NETWORK_RECS, JSON.stringify(list))
  bumpStore()
}

export function getRecommendationsForUser(userId) {
  return loadRecs().filter((r) => r.toUserId === userId && r.state !== 'declined')
}

export function addRecommendation({ fromUserId, toUserId, opportunityTitle, fromName }) {
  const list = loadRecs()
  list.push({
    id: uid('rec'),
    fromUserId,
    toUserId,
    fromName: fromName || 'Коллега',
    opportunityTitle,
    date: new Date().toISOString().slice(0, 10),
    state: 'pending',
  })
  saveRecs(list)
}

export function setRecommendationState(id, state) {
  const list = loadRecs()
  const ix = list.findIndex((r) => r.id === id)
  if (ix < 0) return
  list[ix] = { ...list[ix], state }
  saveRecs(list)
}

// --- Приватность ---

export function getPrivacy(userId) {
  const all = safeParse(localStorage.getItem(K.PRIVACY), {})
  return (
    all[userId] || {
      profileVisibility: 'contacts',
      hideApplications: false,
    }
  )
}

export function setPrivacy(userId, partial) {
  const all = safeParse(localStorage.getItem(K.PRIVACY), {})
  all[userId] = { ...getPrivacy(userId), ...partial }
  localStorage.setItem(K.PRIVACY, JSON.stringify(all))
  bumpStore()
}

/** Очередь модерации для куратора */
export function getModerationQueue() {
  return getOpportunities().filter((o) => o.moderationStatus === 'pending')
}
