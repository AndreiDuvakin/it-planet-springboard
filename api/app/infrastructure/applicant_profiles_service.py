from fastapi import HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession

from app.application.applicant_profiles_repository import ApplicantProfilesRepository
from app.core.constants import UserRoles
from app.domain.entities.applicant_profiles import ApplicantProfileUpdate, ApplicantProfileRead
from app.domain.models import User


class ApplicantProfilesService:
    def __init__(self, db: AsyncSession):
        self.applicant_profiles_repository = ApplicantProfilesRepository(db)

    async def update(
            self, applicant_profile: ApplicantProfileUpdate, applicant_profile_id: int, current_user: User
    ) -> ApplicantProfileRead:
        applicant_profile_model = await self.applicant_profiles_repository.get_by_id(applicant_profile_id)
        if not applicant_profile_model:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail='Пользователь не найден',
            )

        if applicant_profile_model.user_id != current_user.id and not (
                current_user.role.title == UserRoles.MODERATOR and current_user.is_admin):
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail='Доступ запрещен',
            )

        applicant_profile_model.resume_html = applicant_profile.resume_html
        applicant_profile_model.resume_url = applicant_profile.resume_url

        applicant_profile_model = await self.applicant_profiles_repository.update(applicant_profile_model)

        return ApplicantProfileRead.model_validate(applicant_profile_model)
