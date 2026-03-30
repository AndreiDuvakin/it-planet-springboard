from typing import Sequence, List

from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import joinedload

from app.domain.models import ApplicantSkill


class ApplicantSkillsRepository:
    def __init__(self, db: AsyncSession):
        self.db = db

    async def get_by_applicant_id(self, applicant_id: int) -> Sequence[ApplicantSkill]:
        query = (
            select(ApplicantSkill)
            .filter_by(applicant_id=applicant_id)
            .options(joinedload(ApplicantSkill.tag))
            .options(joinedload(ApplicantSkill.level))
        )
        result = await self.db.execute(query)
        return result.scalars().all()

    async def create_list(self, applicant_skills: Sequence[ApplicantSkill] | List[ApplicantSkill]) -> Sequence[
        ApplicantSkill
    ]:
        self.db.add_all(applicant_skills)
        await self.db.commit()

        ids = [skill.id for skill in applicant_skills]

        query = (
            select(ApplicantSkill)
            .where(ApplicantSkill.id.in_(ids))
            .options(joinedload(ApplicantSkill.tag))
            .options(joinedload(ApplicantSkill.level))
        )

        result = await self.db.execute(query)
        return result.scalars().all()

    async def delete_list(self, applicant_skills: List[ApplicantSkill] | Sequence[ApplicantSkill]) -> List[ApplicantSkill]:
        for applicant_skill in applicant_skills:
            await self.db.delete(applicant_skill)

        await self.db.commit()
        return applicant_skills
