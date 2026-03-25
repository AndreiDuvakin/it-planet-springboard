from typing import Sequence

from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from app.domain.models import University


class UniversitiesRepository:
    def __init__(self, db: AsyncSession):
        self.db = db

    async def get_all(self) -> Sequence[University]:
        query = select(University)
        result = await self.db.execute(query)
        return result.scalars().all()

    async def get_by_id(self, university_id: int) -> University:
        query = (
            select(University)
            .filter_by(id=university_id)
        )
        result = await self.db.execute(query)
        return result.scalars().first()
