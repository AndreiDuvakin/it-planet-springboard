from typing import Optional, Sequence

from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from app.domain.models import ApplicantProfile


class ApplicantProfilesRepository:
    def __init__(self, db: AsyncSession) -> None:
        self.db = db

    async def get_all(self) -> Sequence[ApplicantProfile]:
        query = select(ApplicantProfile)
        result = await self.db.execute(query)
        return result.scalars().all()

    async def get_by_id(self, applicant_profile_id: int) -> Optional[ApplicantProfile]:
        query = (
            select(ApplicantProfile)
            .filter_by(id=applicant_profile_id)
        )
        result = await self.db.execute(query)
        return result.scalars().first()

    async def create(self, applicant_profile: ApplicantProfile) -> ApplicantProfile:
        self.db.add(applicant_profile)
        await self.db.commit()
        await self.db.refresh(applicant_profile)
        return applicant_profile

    async def update(self, applicant_profile: ApplicantProfile) -> ApplicantProfile:
        await self.db.merge(applicant_profile)
        await self.db.commit()
        return applicant_profile
