from typing import Sequence

from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from app.domain.models import ApplicantSkillTag


class ApplicantSkillTagsRepository:
    def __init__(self, db: AsyncSession):
        self.db = db

    async def get_all(self) -> Sequence[ApplicantSkillTag]:
        query = select(ApplicantSkillTag)
        result = await self.db.execute(query)
        return result.scalars().all()

    async def get_by_id(self, applicant_skill_tag_id: int) -> ApplicantSkillTag:
        query = (
            select(ApplicantSkillTag)
            .filter_by(id=applicant_skill_tag_id)
        )
        result = await self.db.execute(query)
        return result.scalars().first()
