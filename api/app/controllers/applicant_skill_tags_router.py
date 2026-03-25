from typing import List

from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession

from app.database.session import get_db
from app.domain.entities.applicant_skill_tags import ApplicantSkillTagRead
from app.domain.models import User
from app.infrastructure.applicant_skill_tags_service import ApplicantSkillTagsService
from app.infrastructure.dependencies import require_auth_user

applicant_skill_tags_router = APIRouter()


@applicant_skill_tags_router.get(
    '/',
    response_model=List[ApplicantSkillTagRead],
    summary='Returns all skill tags',
    description='Returns all skill tags',
)
async def get_applicant_skill_tags(
        db: AsyncSession = Depends(get_db),
        user: User = Depends(require_auth_user),
):
    applicant_skill_tags_service = ApplicantSkillTagsService(db)
    return await applicant_skill_tags_service.get_all()
