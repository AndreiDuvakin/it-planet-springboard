from typing import List

from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession

from app.database.session import get_db
from app.domain.entities.experience_levels import ExperienceLevelRead
from app.domain.models import User
from app.infrastructure.dependencies import require_auth_user
from app.infrastructure.experience_levels_service import ExperienceLevelService

experience_levels_router = APIRouter()


@experience_levels_router.get(
    '/',
    response_model=List[ExperienceLevelRead],
    summary='Return a list of experience levels',
    description='Return a list of experience levels',
)
async def get_experience_levels(
        db: AsyncSession = Depends(get_db),
        user: User = Depends(require_auth_user),
):
    experience_levels_service = ExperienceLevelService(db)
    return await experience_levels_service.get_all_experience_levels()
