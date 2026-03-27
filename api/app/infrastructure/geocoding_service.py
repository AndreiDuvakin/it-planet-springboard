import httpx


class GeocodingService:
    @staticmethod
    async def get_coords(address: str):
        url = "https://nominatim.openstreetmap.org/search"
        headers = {"User-Agent": "MyUniqueApp_123"}  # Сделайте его уникальным
        params = {"q": address, "format": "json", "limit": 1}

        async with httpx.AsyncClient() as client:
            try:
                r = await client.get(url, params=params, headers=headers, timeout=5.0)
                print(f"DEBUG GEOCORDS: Status {r.status_code}, Body: {r.text}")  # Добавьте это для отладки

                if r.status_code == 200:
                    data = r.json()
                    if data:
                        return float(data[0]["lat"]), float(data[0]["lon"])
                    else:
                        print(f"DEBUG: Address not found: {address}")
            except Exception as e:
                print(f"DEBUG: Geocoding error: {e}")

        return 0.0, 0.0