
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import joinedload
from app.domain.models import Internship, LocationCoordinate, CompanyProfile

class InternshipsRepository:
    def __init__(self, db: AsyncSession):
        self.db = db

    async def create_location(self, lat: float, lon: float) -> LocationCoordinate:
        location = LocationCoordinate(latitude=lat, longitude=lon)
        self.db.add(location)
        await self.db.flush()
        return location

    async def create_internship(self, internship: Internship) -> Internship:
        self.db.add(internship)
        await self.db.commit()

        # Глубокая подгрузка всех связей для InternshipRead
        query = (
            select(Internship)
            .filter_by(id=internship.id)
            .options(
                joinedload(Internship.work_format),
                joinedload(Internship.experience_level),
                joinedload(Internship.moderation_status),
                joinedload(Internship.location),
                joinedload(Internship.company_profile).options(
                    joinedload(CompanyProfile.logo),
                    joinedload(CompanyProfile.official_photo),
                    joinedload(CompanyProfile.industry),
                    joinedload(CompanyProfile.socials)
                )
            )
        )
        result = await self.db.execute(query)
        return result.scalars().first()