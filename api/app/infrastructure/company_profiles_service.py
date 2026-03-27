from typing import Optional, List
from fastapi import HTTPException, status
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import joinedload

from app.application.company_profiles_repository import CompanyProfilesRepository
from app.application.industries_repository import IndustriesRepository
from app.domain.models import CompanyProfile, CompanyProfileSocial, User
from app.domain.entities.company_profiles import CompanyProfileCreate, CompanyProfileRead


class CompanyProfilesService:
    def __init__(self, db: AsyncSession):
        self.db = db
        self.repo = CompanyProfilesRepository(db)
        self.industry_repo = IndustriesRepository(db)

    async def get_company_by_creator_id(self, user_id: int) -> Optional[CompanyProfileRead]:
        """
        Получить профиль компании по ID создателя со всеми связями.
        """
        query = (
            select(CompanyProfile)
            .filter_by(creator_user_id=user_id)
            .options(
                joinedload(CompanyProfile.logo),
                joinedload(CompanyProfile.official_photo),
                joinedload(CompanyProfile.industry),
                joinedload(CompanyProfile.socials)
            )
        )
        result = await self.db.execute(query)
        profile = result.scalars().first()

        if not profile:
            return None

        return CompanyProfileRead.model_validate(profile)

    async def create_company(self, data: CompanyProfileCreate, user: User) -> CompanyProfileRead:
        """
        Создать новый профиль компании.
        """
        # Проверка: нет ли уже профиля у этого пользователя
        existing_profile = await self.get_company_by_creator_id(user.id)
        if existing_profile:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="У вас уже создан профиль компании. Используйте обновление."
            )

        # Проверка существования индустрии
        industry = await self.industry_repo.get_by_id(data.industry_id)
        if not industry:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="Указанная индустрия не найдена"
            )

        # Создание объекта модели
        new_company = CompanyProfile(
            title=data.title,
            description=data.description,
            website_url=data.website_url,
            inn=data.inn,
            corporate_email=str(data.corporate_email) if data.corporate_email else None,
            video_url=data.video_url,
            logo_id=data.logo_id,
            official_photo_id=data.official_photo_id,
            industry_id=data.industry_id,
            creator_user_id=user.id,
            is_verified=False
        )

        # Сохранение в БД через репозиторий
        created_company = await self.repo.create(new_company)

        # Добавление социальных сетей, если они переданы
        if data.socials:
            social_models = [
                CompanyProfileSocial(
                    title=s.title,
                    link=s.link,
                    company_id=created_company.id
                ) for s in data.socials
            ]
            await self.repo.add_socials(social_models)

        # Возвращаем полный объект профиля (с подгруженными связями)
        result = await self.repo.get_by_id(created_company.id)
        return CompanyProfileRead.model_validate(result)