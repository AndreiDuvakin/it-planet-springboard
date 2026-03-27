from datetime import datetime
from typing import List, Optional
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from fastapi import HTTPException, status

from app.domain.entities.internships import InternshipCreate, InternshipUpdate
from app.domain.models import Internship, User


class InternshipsService:
    def __init__(self, db: AsyncSession):
        self.db = db

    async def create_internship(self, data: InternshipCreate, user: User) -> Internship:
        """
        Создает новую стажировку, автоматически привязывая её к компании юзера.
        """
        # 1. Проверяем, что у пользователя заполнена компания
        if not user.company_id:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Пользователь не привязан к профилю компании"
            )

        # 2. Превращаем Pydantic модель в словарь
        internship_data = data.model_dump()

        # 3. Автозаполнение технических полей, которые фронт не должен присылать
        internship_data['company_id'] = user.company_id
        internship_data['published_at'] = datetime.now()

        # Устанавливаем статус модерации "Новая" (обычно ID=1)
        if internship_data.get('moderation_status_id') is None:
            internship_data['moderation_status_id'] = 1

        # Заглушка для location_id, если логика локаций еще не реализована полностью
        if internship_data.get('location_id') is None:
            internship_data['location_id'] = 1

            # 4. Создаем объект модели SQLAlchemy
        new_internship = Internship(**internship_data)

        # 5. Сохраняем в базу
        self.db.add(new_internship)
        try:
            await self.db.commit()
            await self.db.refresh(new_internship)
        except Exception as e:
            await self.db.rollback()
            raise HTTPException(
                status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                detail=f"Ошибка при сохранении в базу данных: {str(e)}"
            )

        # Подгружаем связанные данные для InternshipRead (если нужно в ответе)
        # Это предотвратит ошибки Lazy Loading при возврате InternshipRead
        query = select(Internship).where(Internship.id == new_internship.id)
        # Если в моделях прописаны отношения, можно добавить .options(selectinload(...))

        return new_internship

    async def get_internships(self, limit: int = 10, offset: int = 0) -> List[Internship]:
        """Получение списка всех активных стажировок."""
        query = select(Internship).where(Internship.is_active == True).limit(limit).offset(offset)
        result = await self.db.execute(query)
        return result.scalars().all()

    async def get_internship_by_id(self, internship_id: int) -> Optional[Internship]:
        """Получение конкретной стажировки по ID."""
        query = select(Internship).where(Internship.id == internship_id)
        result = await self.db.execute(query)
        internship = result.scalar_one_or_none()

        if not internship:
            raise HTTPException(status_code=404, detail="Стажировка не найдена")
        return internship

    async def update_internship(self, internship_id: int, data: InternshipUpdate, user: User) -> Internship:
        """Обновление данных стажировки (только для владельца компании)."""
        internship = await self.get_internship_by_id(internship_id)

        if internship.company_id != user.company_id:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Вы не можете редактировать чужую стажировку"
            )

        update_data = data.model_dump(exclude_unset=True)
        for key, value in update_data.items():
            setattr(internship, key, value)

        await self.db.commit()
        await self.db.refresh(internship)
        return internship