from typing import List

from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession

from app.database.session import get_db
from app.domain.entities.universities import UniversityRead
from app.domain.models import User
from app.infrastructure.dependencies import require_auth_user
from app.infrastructure.universities_service import UniversitiesService

universities_router = APIRouter()


@universities_router.get(
    '/',
    response_model=List[UniversityRead],
    summary='Returns all users',
    description='Returns all users',
)
async def get_all_users(
        db: AsyncSession = Depends(get_db),
        user: User = Depends(require_auth_user)
):
    universities_service = UniversitiesService(db)
    return await universities_service.get_all()
