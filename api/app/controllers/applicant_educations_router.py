from typing import List

from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession

from app.database.session import get_db
from app.domain.entities.applicant_educations import ApplicantEducationRead, ApplicantEducationCreate
from app.domain.models import User
from app.infrastructure.applicant_educations_service import ApplicantEducationsService
from app.infrastructure.dependencies import require_auth_user

applicant_education_router = APIRouter()


@applicant_education_router.get(
    '/{applicant_id}/',
    response_model=List[ApplicantEducationRead],
    summary='Returns applicant educations by applicant id',
    description='Returns applicant educations by applicant id',
)
async def get_applicant_educations(
        applicant_id: int,
        db: AsyncSession = Depends(get_db),
        user: User = Depends(require_auth_user)
):
    applicant_educations_service = ApplicantEducationsService(db)
    return await applicant_educations_service.get_by_applicant_id(applicant_id, user)


@applicant_education_router.post(
    '/{applicant_id}/',
    response_model=List[ApplicantEducationRead],
    summary='Replace applicant educations by applicant id',
    description='Replace applicant educations by applicant id',
)
async def replace_applicant_educations(
        applicant_id: int,
        applicant_educations: List[ApplicantEducationCreate],
        db: AsyncSession = Depends(get_db),
        user: User = Depends(require_auth_user),
):
    applicant_educations_service = ApplicantEducationsService(db)
    return await applicant_educations_service.replace_applicant_educations(applicant_educations, applicant_id, user)
