from typing import Sequence, List

from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import joinedload

from app.domain.models import ApplicantEducation


class ApplicantEducationsRepository:
    def __init__(self, db: AsyncSession):
        self.db = db

    async def get_by_applicant_id(self, applicant_id: int) -> Sequence[ApplicantEducation]:
        query = (
            select(ApplicantEducation)
            .filter_by(applicant_id=applicant_id)
            .options(joinedload(ApplicantEducation.university))
        )
        result = await self.db.execute(query)
        return result.scalars().all()

    async def create_list(self, applicant_educations: List[ApplicantEducation]) -> Sequence[ApplicantEducation]:
        self.db.add_all(applicant_educations)
        await self.db.commit()

        for applicant_education in applicant_educations:
            await self.db.refresh(applicant_education)

        return applicant_educations

    async def delete_list(self, applicant_educations: List[ApplicantEducation] | Sequence[ApplicantEducation]) -> Sequence[ApplicantEducation]:
        for applicant_education in applicant_educations:
            await self.db.delete(applicant_education)

        await self.db.commit()
        return applicant_educations
