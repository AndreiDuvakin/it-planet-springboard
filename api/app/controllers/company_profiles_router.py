from fastapi import APIRouter, Depends, status, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession
from app.database.session import get_db
from app.domain.entities.company_profiles import CompanyProfileCreate, CompanyProfileRead
from app.domain.models import User
from app.infrastructure.company_profiles_service import CompanyProfilesService
from app.infrastructure.dependencies import require_auth_user

# Это имя должно совпадать с тем, что импортируется в main.py
company_profiles_router = APIRouter()

@company_profiles_router.get(
    '/me',
    response_model=CompanyProfileRead,
    summary='Получить профиль текущей компании',
)
async def get_my_company(
        db: AsyncSession = Depends(get_db),
        user: User = Depends(require_auth_user)
):
    """Возвращает профиль компании для авторизованного пользователя"""
    service = CompanyProfilesService(db)
    profile = await service.get_company_by_creator_id(user.id)
    if not profile:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Профиль компании не найден"
        )
    return profile

@company_profiles_router.post(
    '/',
    response_model=CompanyProfileRead,
    status_code=status.HTTP_201_CREATED,
    summary='Создать профиль компании',
)
async def create_company(
        company_data: CompanyProfileCreate,
        db: AsyncSession = Depends(get_db),
        user: User = Depends(require_auth_user)
):
    """Создает новый профиль компании"""
    service = CompanyProfilesService(db)
    return await service.create_company(company_data, user)