from datetime import datetime
from fastapi import HTTPException, status
from app.application.internships_repository import InternshipsRepository
from app.infrastructure.company_profiles_service import CompanyProfilesService
from app.infrastructure.geocoding_service import GeocodingService
from app.domain.models import Internship, User
from app.domain.entities.internships import InternshipCreate

class InternshipsService:
    def __init__(self, db):
        self.db = db
        self.repository = InternshipsRepository(db)
        self.company_service = CompanyProfilesService(db)

    async def create_internship(self, data: InternshipCreate, current_user: User):
        # 1. Получаем профиль компании
        company = await self.company_service.get_company_by_creator_id(current_user.id)
        if not company:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Сначала создайте профиль компании"
            )

        # 2. Геокодирование адреса
        lat, lon = await GeocodingService.get_coords(data.address)
        location = await self.repository.create_location(lat=lat, lon=lon)

        # 3. Подготовка дат
        published_at = datetime.now()
        expires_at = data.expires_at.replace(tzinfo=None) if data.expires_at else None

        # 4. Создание объекта стажировки
        new_internship = Internship(
            title=data.title,
            description=data.description,
            media_url=data.media_url,
            address=data.address,
            duration_months=data.duration_months,
            is_paid=data.is_paid,
            mentorship_available=data.mentorship_available,
            expires_at=expires_at,
            published_at=published_at,
            experience_level_id=data.experience_level_id,
            work_format_id=data.work_format_id,
            company_id=company.id,
            location_id=location.id,
            moderation_status_id=1,
            is_active=True
        )

        # 5. Сохранение через репозиторий
        internship = await self.repository.create_internship(new_internship)

        # 6. Заглушка для тегов
        setattr(internship, 'tag_ids', [])

        return internship