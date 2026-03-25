from typing import Optional

from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession

from app.database.session import get_db
from app.domain.entities.applicant_profiles import ApplicantProfileUpdate, ApplicantProfileRead
from app.domain.models import User
from app.infrastructure.applicant_profiles_service import ApplicantProfilesService
from app.infrastructure.dependencies import require_auth_user

applicant_profiles_router = APIRouter()


@applicant_profiles_router.put(
    '/{applicant_profile_id}/',
    response_model=Optional[ApplicantProfileRead],
    summary='Updates applicant data',
    description='Updates applicant data',
)
async def update_user(
        applicant_profile_id: int,
        applicant_data: ApplicantProfileUpdate,
        db: AsyncSession = Depends(get_db),
        user: User = Depends(require_auth_user)
):
    applicant_profiles_service = ApplicantProfilesService(db)
    return await applicant_profiles_service.update(applicant_data, applicant_profile_id, user)
