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

function get(key, fallback) {
  const raw = localStorage.getItem(key)
  return safeParse(raw, fallback)
}

function set(key, value) {
  localStorage.setItem(key, JSON.stringify(value))
  bumpStore()
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

export function getTagRegistry() {
  const parsed = get(K.TAGS, null)
  if (parsed && Array.isArray(parsed) && parsed.length) {
    return parsed.map((t) => (typeof t === 'string' ? { id: t, title: t } : t))
  }
  const initial = MOCK_TAG_TITLES.map((t) => ({ id: t, title: t }))
  set(K.TAGS, initial)
  return initial
}

export function addTagTitle(title) {
  const t = String(title || '').trim()
  if (!t) return getTagRegistry()
  const reg = getTagRegistry()
  if (reg.some((x) => x.title.toLowerCase() === t.toLowerCase())) return reg
  const next = [...reg, { id: t, title: t }]
  set(K.TAGS, next)
  return next
}

export function addTag(tag) {
  const tags = getTagRegistry()
  if (tags.find(t => t.id === tag.id || t.title === tag.title)) return tags
  const next = [...tags, tag]
  set(K.TAGS, next)
  return next
}


function loadPatches() { return get(K.PATCHES, {}) }
function savePatches(p) { set(K.PATCHES, p) }
function loadExtras() { return get(K.EXTRAS, []) }
function saveExtras(list) { set(K.EXTRAS, list) }

function normalizeOpp(o) {
  return {
    employmentType: o.employmentType || 'full',
    experienceLevel: o.experienceLevel || 'junior',
    moderationStatus: o.moderationStatus ?? 'approved',
    ...o,
    tags: Array.isArray(o.tags) ? o.tags : [],
  }
}

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

export function recordServerOpportunity({ serverId, kind, ownerUserId, companyTitle, localTags = [], moderationStatus = 'pending', extra = {} }) {
  const id = String(serverId)
  return upsertExtraOpportunity({
    id, serverId,
    title: extra.title || 'Без названия',
    company: companyTitle || 'Компания',
    type: kind === 'internship' ? 'internship' : 'vacancy',
    kind, format: extra.format || 'office',
    city: extra.city || '', address: extra.address || '',
    salaryFrom: extra.salaryFrom ?? null, salaryTo: extra.salaryTo ?? null,
    publishedAt: extra.publishedAt || new Date().toISOString().slice(0, 10),
    expiresAt: extra.expiresAt || null,
    tags: localTags, description: extra.description || '',
    contacts: extra.contacts || {},
    location: extra.location || { lat: 55.75, lng: 37.61 },
    status: extra.status || 'active',
    ownerUserId, source: 'api', moderationStatus,
    employmentType: extra.employmentType || 'full',
    experienceLevel: extra.experienceLevel || 'junior',
  })
}

export function getEmployerOpportunities(userId) {
  if (userId == null) return []
  return getOpportunities().filter((o) => o.ownerUserId === userId)
}

export function deleteOpportunity(id) {
  const sid = String(id)
  saveExtras(loadExtras().filter((o) => String(o.id) !== sid))
}

export function getModerationQueue() {
  return getOpportunities().filter((o) => o.moderationStatus === 'pending')
}

function loadApplications() { return get(K.APPLICATIONS, []) }
function saveApplications(list) { set(K.APPLICATIONS, list) }

export function getApplicationsForApplicant(userId) {
  return loadApplications().filter((a) => a.applicantUserId === userId)
}

export function getApplicationsByApplicant(userId) {
  return getApplicationsForApplicant(userId)
}

export function getApplicationsForEmployer(companyName) {
  const cn = (companyName || '').trim().toLowerCase()
  if (!cn) return []
  return loadApplications().filter((a) => (a.company || '').trim().toLowerCase() === cn)
}

export function getApplicationsByOpportunity(opportunityId) {
  return loadApplications().filter((a) => String(a.opportunityId) === String(opportunityId))
}

export function getApplications() {
  return loadApplications()
}


export function addApplication({ 
  applicantUserId, 
  opportunityId, 
  opportunityTitle, 
  company, 
  coverLetter, 
  applicantName, 
  applicantEmail,
  ownerUserId 
}) {
  const list = loadApplications()
  const row = {
    id: uid('app'),
    applicantUserId,
    ownerUserId: ownerUserId || null, 
    applicantName: applicantName || '',
    applicantEmail: applicantEmail || '',
    opportunityId: String(opportunityId),
    opportunityTitle,
    company,
    coverLetter: coverLetter || '',
    status: 'Новый',
    note: '',
    date: new Date().toISOString().slice(0, 10),
    createdAt: new Date().toISOString(),
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

export function patchApplication(id, partial) {
  return updateApplication(id, partial)
}

export function removeApplication(id) {
  const list = loadApplications().filter((a) => a.id !== id)
  saveApplications(list)
}


export function getVerificationRequests() {
  return get(K.VERIFICATIONS, [])
}

export function getEmployerVerificationStatus(userId) {
  if (!userId) return 'none'

  const requests = getVerificationRequests()
  const userReq = requests
    .filter((r) => String(r.userId) === String(userId))
    .sort((a, b) => new Date(b.submittedAt) - new Date(a.submittedAt))[0]

  if (userReq && userReq.status !== 'approved') return userReq.status

  const manualMap = get(K.EMPLOYER_STATUS, {})
  return manualMap[String(userId)] || 'none'
}

export function submitEmployerVerification(data) {
  const list = getVerificationRequests()
  const req = {
    ...data,
    id: uid('ver'),
    status: 'pending',
    submittedAt: new Date().toISOString(),
  }
  set(K.VERIFICATIONS, [...list, req])
  return req
}

export function setEmployerVerificationUserStatus(userId, status) {
  const map = get(K.EMPLOYER_STATUS, {})
  map[String(userId)] = status
  set(K.EMPLOYER_STATUS, map)

  const requests = getVerificationRequests().map((r) =>
    String(r.userId) === String(userId) ? { ...r, status } : r
  )
  set(K.VERIFICATIONS, requests)
}

export function setVerificationRequestStatus(id, status) {
  const list = getVerificationRequests().map((r) => {
    if (String(r.id) === String(id)) {
      setEmployerVerificationUserStatus(r.userId, status)
      return { ...r, status }
    }
    return r
  })
  set(K.VERIFICATIONS, list)
}

export function getVerificationQueue() {
  return getVerificationRequests().filter((r) => r.status === 'pending')
}

function loadContacts() { return get(K.NETWORK_CONTACTS, []) }
function saveContacts(list) { set(K.NETWORK_CONTACTS, list) }

export function getContactsForUser(userId) {
  return loadContacts().filter((c) => c.ownerUserId === userId)
}

export function getContacts(userId) {
  return getContactsForUser(userId)
}

export function addContact(ownerUserId, contact) {
  const list = loadContacts()
  if (list.find((c) => c.ownerUserId === ownerUserId && c.userId === contact.userId)) return list
  list.push({
    id: uid('c'),
    ownerUserId,
    userId: contact.userId,
    name: contact.name,
    university: contact.university || '',
    skills: contact.skills || [],
  })
  saveContacts(list)
  return list
}

export function removeContact(contactId) {
  const list = loadContacts().filter((c) => c.id !== contactId)
  saveContacts(list)
}

export function removeContactById(userId, contactId) {
  removeContact(contactId)
}


function loadRecs() { return get(K.NETWORK_RECS, []) }
function saveRecs(list) { set(K.NETWORK_RECS, list) }

export function getRecommendationsForUser(userId) {
  return loadRecs().filter((r) => r.toUserId === userId && r.state !== 'declined')
}

export function getRecommendations(userId) {
  return loadRecs().filter((r) => r.toUserId === userId)
}

export function addRecommendation({ fromUserId, toUserId, opportunityTitle, opportunityId, fromName, message }) {
  const list = loadRecs()
  list.push({
    id: uid('rec'),
    fromUserId,
    toUserId,
    fromName: fromName || 'Коллега',
    opportunityTitle,
    opportunityId: opportunityId || null,
    message: message || '',
    date: new Date().toISOString().slice(0, 10),
    createdAt: new Date().toISOString(),
    state: 'pending',
    read: false,
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

export function markRecommendationRead(userId, recId) {
  const list = loadRecs()
  const ix = list.findIndex((r) => r.id === recId && r.toUserId === userId)
  if (ix < 0) return
  list[ix] = { ...list[ix], read: true }
  saveRecs(list)
}

export function getPrivacy(userId) {
  const all = get(K.PRIVACY, {})
  return all[userId] || {
    profileVisibility: 'contacts',
    hideApplications: false,
    openProfile: false,
    showResume: false,
    showApplications: false,
  }
}

export function setPrivacy(userId, partial) {
  const all = get(K.PRIVACY, {})
  all[userId] = { ...getPrivacy(userId), ...partial }
  set(K.PRIVACY, all)
}

export function getApplicationsByOwnerId(userId) {
  return loadApplications().filter((a) => String(a.ownerUserId) === String(userId))
}