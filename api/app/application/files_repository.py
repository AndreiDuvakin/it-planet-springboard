from sqlalchemy.ext.asyncio import AsyncSession
from app.domain.models import CompanyProfileLogo, CompanyProfilePhoto

class FilesRepository:
    def __init__(self, db: AsyncSession):
        self.db = db

    async def create_logo_record(self, filename: str, path: str, url: str) -> CompanyProfileLogo:
        logo = CompanyProfileLogo(filename=filename, path=path, url=url)
        self.db.add(logo)
        await self.db.commit()
        await self.db.refresh(logo)
        return logo

    async def create_photo_record(self, filename: str, path: str, url: str) -> CompanyProfilePhoto:
        photo = CompanyProfilePhoto(filename=filename, path=path, url=url)
        self.db.add(photo)
        await self.db.commit()
        await self.db.refresh(photo)
        return photo