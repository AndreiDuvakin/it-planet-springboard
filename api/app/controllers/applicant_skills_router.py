from typing import List

from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession

from app.database.session import get_db
from app.domain.entities.applicant_skills import ApplicantSkillRead, ApplicantSkillCreate
from app.domain.models import User
from app.infrastructure.applicant_skills_service import ApplicantSkillsService
from app.infrastructure.dependencies import require_auth_user

applicant_skills_router = APIRouter()


@applicant_skills_router.get(
    '/{applicant_id}/',
    response_model=List[ApplicantSkillRead],
    summary='Returns skills by applicant id',
    description='Returns skills by applicant id',
)
async def get_applicant_skills(
        applicant_id: int,
        db: AsyncSession = Depends(get_db),
        user: User = Depends(require_auth_user),
):
    applicant_skills_service = ApplicantSkillsService(db)
    return await applicant_skills_service.get_by_applicant_id(applicant_id, user)


@applicant_skills_router.post(
    '/{applicant_id}/',
    response_model=List[ApplicantSkillRead],
    summary='Replace skills by applicant id',
    description='Replace skills by applicant id',
)
async def replace_applicant_skills(
        applicant_id: int,
        applicant_skills: List[ApplicantSkillCreate],
        db: AsyncSession = Depends(get_db),
        user: User = Depends(require_auth_user),
):
    applicant_skills_service = ApplicantSkillsService(db)
    return await applicant_skills_service.replace_applicant_skills(applicant_id, applicant_skills, user)
