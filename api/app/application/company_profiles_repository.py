from typing import Optional, List
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import joinedload
from app.domain.models import CompanyProfile, CompanyProfileSocial

class CompanyProfilesRepository:
    def __init__(self, db: AsyncSession):
        self.db = db

    async def get_by_id(self, company_id: int) -> Optional[CompanyProfile]:
        query = (
            select(CompanyProfile)
            .filter_by(id=company_id)
            .options(
                joinedload(CompanyProfile.logo),
                joinedload(CompanyProfile.official_photo),
                joinedload(CompanyProfile.industry),
                joinedload(CompanyProfile.socials)
            )
        )
        result = await self.db.execute(query)
        return result.scalars().first()

    async def create(self, company: CompanyProfile) -> CompanyProfile:
        self.db.add(company)
        await self.db.commit()
        await self.db.refresh(company)
        return company

    async def add_socials(self, socials: List[CompanyProfileSocial]):
        self.db.add_all(socials)
        await self.db.commit()

    async def delete_socials_by_company_id(self, company_id: int):
        from sqlalchemy import delete
        query = delete(CompanyProfileSocial).filter_by(company_id=company_id)
        await self.db.execute(query)
        await self.db.commit()