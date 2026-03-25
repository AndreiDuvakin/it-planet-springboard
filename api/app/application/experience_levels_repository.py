from typing import Sequence

from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from app.domain.models import ExperienceLevel


class ExperienceLevelsRepository:
    def __init__(self, db: AsyncSession):
        self.db = db

    async def get_all(self) -> Sequence[ExperienceLevel]:
        query = select(ExperienceLevel)
        result = await self.db.execute(query)
        return result.scalars().all()

    async def get_by_id(self, experience_level_id: int) -> ExperienceLevel:
        query = (
            select(ExperienceLevel)
            .filter_by(id=experience_level_id)
        )
        result = await self.db.execute(query)
        return result.scalars().first()
