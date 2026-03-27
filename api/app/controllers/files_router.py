from fastapi import APIRouter, UploadFile, File, Depends
from sqlalchemy.ext.asyncio import AsyncSession
from app.database.session import get_db
from app.infrastructure.files_service import FilesService
from app.domain.entities.company_profile_logos import CompanyProfileLogoRead
from app.domain.entities.company_profile_photos import CompanyProfilePhotoRead

files_router = APIRouter()

@files_router.post("/upload-logo", response_model=CompanyProfileLogoRead)
async def upload_logo(file: UploadFile = File(...), db: AsyncSession = Depends(get_db)):
    service = FilesService(db)
    return await service.upload_logo(file)

@files_router.post("/upload-photo", response_model=CompanyProfilePhotoRead)
async def upload_photo(file: UploadFile = File(...), db: AsyncSession = Depends(get_db)):
    service = FilesService(db)
    return await service.upload_photo(file)