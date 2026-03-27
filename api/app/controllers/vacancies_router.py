# app/controllers/vacancies_router.py
from fastapi import APIRouter, Depends, status
from sqlalchemy.ext.asyncio import AsyncSession

from app.database.session import get_db
from app.infrastructure.dependencies import require_auth_user
from app.infrastructure.vacancies_service import VacanciesService
from app.domain.entities.vacancies import VacancyCreate, VacancyRead
from app.domain.models import User

vacancies_router = APIRouter()

@vacancies_router.post('/', response_model=VacancyRead, status_code=status.HTTP_201_CREATED)
async def create_vacancy(
    data: VacancyCreate,
    db: AsyncSession = Depends(get_db),
    user: User = Depends(require_auth_user)
):
    service = VacanciesService(db)
    return await service.create_opportunity(data, user)