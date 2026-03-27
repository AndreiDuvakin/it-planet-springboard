from datetime import datetime
from fastapi import HTTPException, status
from app.application.vacancies_repository import VacanciesRepository
from app.infrastructure.company_profiles_service import CompanyProfilesService
from app.infrastructure.geocoding_service import GeocodingService  # Импортируем ваш новый сервис
from app.domain.models import Vacancy, User
from app.domain.entities.vacancies import VacancyCreate


class VacanciesService:
    def __init__(self, db):
        self.db = db
        self.repository = VacanciesRepository(db)
        self.company_service = CompanyProfilesService(db)

    async def create_opportunity(self, data: VacancyCreate, current_user: User):
        # 1. Получаем профиль компании (кто создает вакансию)
        company = await self.company_service.get_company_by_creator_id(current_user.id)
        if not company:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Сначала создайте профиль компании"
            )

        # 2. Получаем реальные координаты через GeocodingService
        # Теперь здесь нет хардкода Москвы, а идет запрос к OpenStreetMap
        lat, lon = await GeocodingService.get_coords(data.address)

        # Сохраняем координаты в таблицу location_coordinates
        location = await self.repository.create_location(lat=lat, lon=lon)

        # 3. Подготовка дат (приведение к naive datetime для PostgreSQL)
        published_at = datetime.now()
        expires_at = data.expires_at.replace(tzinfo=None) if data.expires_at else None

        # 4. Создание объекта вакансии
        new_vacancy = Vacancy(
            title=data.title,
            description=data.description,
            media_url=data.media_url,
            address=data.address,
            salary_min=int(data.salary_min) if data.salary_min else None,
            salary_max=int(data.salary_max) if data.salary_max else None,
            expires_at=expires_at,
            published_at=published_at,
            employment_type_id=data.employment_type_id,
            experience_level_id=data.experience_level_id,
            work_format_id=data.work_format_id,
            company_id=company.id,
            location_id=location.id,
            moderation_status_id=1,  # По умолчанию: На модерации
            is_active=True
        )

        # 5. Сохранение и получение объекта со всеми подгруженными связями (joinedload)
        vacancy = await self.repository.create_vacancy(new_vacancy)

        # 6. Заглушка для тегов для соответствия схеме VacancyRead
        setattr(vacancy, 'tag_ids', [])

        return vacancy