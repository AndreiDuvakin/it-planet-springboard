from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import joinedload
from app.domain.models import Vacancy, LocationCoordinate, CompanyProfile


class VacanciesRepository:
    def __init__(self, db: AsyncSession):
        self.db = db

    async def create_location(self, lat: float, lon: float) -> LocationCoordinate:
        location = LocationCoordinate(latitude=lat, longitude=lon)
        self.db.add(location)
        await self.db.flush()
        return location

    async def create_vacancy(self, vacancy: Vacancy) -> Vacancy:
        self.db.add(vacancy)
        await self.db.commit()

        # Делаем глубокую загрузку всех связей для ответа API
        query = (
            select(Vacancy)
            .filter_by(id=vacancy.id)
            .options(
                # Подгружаем простые связи вакансии
                joinedload(Vacancy.work_format),
                joinedload(Vacancy.employment_type),
                joinedload(Vacancy.experience_level),
                joinedload(Vacancy.location),
                # Подгружаем профиль компании И его вложенные связи (лого, фото, индустрия, соцсети)
                joinedload(Vacancy.company_profile).options(
                    joinedload(CompanyProfile.logo),
                    joinedload(CompanyProfile.official_photo),
                    joinedload(CompanyProfile.industry),
                    joinedload(CompanyProfile.socials)
                )
            )
        )
        result = await self.db.execute(query)
        return result.scalars().first()