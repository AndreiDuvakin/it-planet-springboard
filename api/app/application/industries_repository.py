from typing import Optional, Sequence
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from app.domain.models import Industry

class IndustriesRepository:
    def __init__(self, db: AsyncSession) -> None:
        self.db = db

    async def get_all(self) -> Sequence[Industry]:
        query = select(Industry).order_by(Industry.title)
        result = await self.db.execute(query)
        return result.scalars().all()

    async def get_by_id(self, industry_id: int) -> Optional[Industry]:
        query = select(Industry).filter_by(id=industry_id)
        result = await self.db.execute(query)
        return result.scalars().first()