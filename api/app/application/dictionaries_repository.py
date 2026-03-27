
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from app.domain.models import EmploymentType, ExperienceLevel, WorkFormat

class DictionariesRepository:
    def __init__(self, db: AsyncSession):
        self.db = db

    async def get_all_employment_types(self):
        result = await self.db.execute(select(EmploymentType))
        return result.scalars().all()

    async def get_all_experience_levels(self):
        result = await self.db.execute(select(ExperienceLevel))
        return result.scalars().all()

    async def get_all_work_formats(self):
        result = await self.db.execute(select(WorkFormat))
        return result.scalars().all()