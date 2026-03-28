import { useEffect, useRef } from 'react'
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'

function salaryText(item) {
  if (item.salaryFrom && item.salaryTo)
    return `${item.salaryFrom.toLocaleString('ru')}–${item.salaryTo.toLocaleString('ru')} ₽`
  if (item.salaryFrom) return `от ${item.salaryFrom.toLocaleString('ru')} ₽`
  return null
}

const TYPE_MARKER = {
  vacancy: '#1677ff',
  vacancy_junior: '#2f54eb',
  internship: '#13c2c2',
  mentor: '#722ed1',
  mentorship: '#722ed1',
  event: '#fa8c16',
}

const TYPE_LABEL = {
  vacancy: 'Вакансия',
  vacancy_junior: 'Вакансия (Junior)',
  internship: 'Стажировка',
  mentor: 'Менторство',
  mentorship: 'Менторство',
  event: 'Мероприятие',
}

function escapeHtml(s) {
  return String(s || '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
}

export default function HomeMap({
  items,
  selectedId,
  onSelect,
  favoriteCompanyNames = [],
}) {
  const containerRef = useRef(null)
  const mapRef = useRef(null)
  const layerRef = useRef(null)

  useEffect(() => {
    if (!containerRef.current || mapRef.current) return
    const map = L.map(containerRef.current, {
      scrollWheelZoom: true,
    }).setView([55.75, 37.62], 4)
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
      maxZoom: 19,
    }).addTo(map)
    mapRef.current = map
    layerRef.current = L.layerGroup().addTo(map)
    return () => {
      map.remove()
      mapRef.current = null
      layerRef.current = null
    }
  }, [])

  useEffect(() => {
    const map = mapRef.current
    const layer = layerRef.current
    if (!map || !layer) return

    layer.clearLayers()
    const bounds = []

    items.forEach((opp) => {
      const lat = opp.location?.lat
      const lng = opp.location?.lng
      if (lat == null || lng == null) return

      const favComp = favoriteCompanyNames.some(
        (c) => c && opp.company && c.trim().toLowerCase() === opp.company.trim().toLowerCase()
      )
      const selected = String(opp.id) === String(selectedId)
      const fill = favComp ? '#c2185b' : TYPE_MARKER[opp.type] || '#1677ff'
      const ring = selected ? '0 0 0 3px rgba(22,119,255,0.95)' : '0 1px 4px rgba(0,0,0,0.35)'

      const icon = L.divIcon({
        className: 'tramplin-map-marker',
        html: `<div style="
          width:${selected ? 18 : 14}px;
          height:${selected ? 18 : 14}px;
          border-radius:50%;
          background:${fill};
          border:2px solid #fff;
          box-shadow:${ring};
        "></div>`,
        iconSize: [selected ? 18 : 14, selected ? 18 : 14],
        iconAnchor: [selected ? 9 : 7, selected ? 9 : 7],
      })

      const marker = L.marker([lat, lng], { icon }).addTo(layer)
      const sal = salaryText(opp)
      const typeLabel = TYPE_LABEL[opp.type] || opp.type
      const tipHtml = `
        <div style="min-width:200px;max-width:260px;font-size:12px;line-height:1.35">
          <div style="font-weight:600;margin-bottom:4px">${escapeHtml(opp.title)}</div>
          <div style="color:#666;margin-bottom:6px">${escapeHtml(opp.company)}</div>
          <div style="display:flex;flex-wrap:wrap;gap:4px;align-items:center;margin-bottom:6px">
            <span style="background:#f0f0f0;padding:1px 6px;border-radius:4px;font-size:11px">${escapeHtml(typeLabel)}</span>
            ${sal ? `<span style="color:#0958d9;font-weight:500">${escapeHtml(sal)}</span>` : ''}
          </div>
          <div style="display:flex;flex-wrap:wrap;gap:3px">
            ${(opp.tags || []).slice(0, 4).map((t) => `<span style="border:1px solid #eee;padding:0 5px;border-radius:4px;font-size:10px">${escapeHtml(t)}</span>`).join('')}
          </div>
        </div>
      `

      marker.bindTooltip(tipHtml, {
        direction: 'top',
        opacity: 1,
        sticky: true,
        className: 'tramplin-opp-tooltip',
      })

      marker.on('click', () => onSelect(opp.id))
      bounds.push([lat, lng])
    })

    if (bounds.length > 0) {
      try {
        map.fitBounds(bounds, { padding: [36, 36], maxZoom: 12 })
      } catch {
        /* ignore */
      }
    }
  }, [items, selectedId, onSelect, favoriteCompanyNames])

  return (
    <div
      ref={containerRef}
      style={{ width: '100%', height: '100%', minHeight: 380, borderRadius: 12 }}
    />
  )
}
