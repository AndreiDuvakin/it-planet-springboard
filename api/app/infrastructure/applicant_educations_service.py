from typing import List

from fastapi import HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession

from app.application.applicant_educations_repository import ApplicantEducationsRepository
from app.application.applicant_profiles_repository import ApplicantProfilesRepository
from app.application.universities_repository import UniversitiesRepository
from app.core.constants import UserRoles
from app.domain.entities.applicant_educations import ApplicantEducationRead, ApplicantEducationCreate
from app.domain.entities.universities import UniversityRead
from app.domain.models import User, ApplicantEducation


class ApplicantEducationsService:
    def __init__(self, db: AsyncSession):
        self.applicant_educations_repository = ApplicantEducationsRepository(db)
        self.applicant_profiles_repository = ApplicantProfilesRepository(db)
        self.universities_repository = UniversitiesRepository(db)

    async def get_by_applicant_id(
            self,
            applicant_id: int,
            current_user: User,
    ) -> List[ApplicantEducationRead]:
        applicant = await self.applicant_profiles_repository.get_by_id(applicant_id)
        if not applicant:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail='Соискатель с таким ID не найден')

        if applicant.user_id != current_user.id and not (
                current_user.role.title == UserRoles.MODERATOR and current_user.is_admin):
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail='Доступ запрещен',
            )

        applicant_educations = await self.applicant_educations_repository.get_by_applicant_id(applicant_id)
        response = []

        for applicant_education in applicant_educations:
            response.append(ApplicantEducationRead.model_validate(applicant_education))

        return response

    async def replace_applicant_educations(
            self, applicant_educations: List[ApplicantEducationCreate],
            applicant_id: int,
            current_user: User,
    ) -> List[ApplicantEducationRead]:
        applicant = await self.applicant_profiles_repository.get_by_id(applicant_id)
        if not applicant:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail='Соискатель с таким ID не найден')

        if applicant.user_id != current_user.id and not (
                current_user.role.title == UserRoles.MODERATOR and current_user.is_admin):
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail='Доступ запрещен',
            )

        old_applicant_educations = await self.applicant_educations_repository.get_by_applicant_id(applicant_id)
        await self.applicant_educations_repository.delete_list(old_applicant_educations)
        applicant_education_models = []
        for applicant_education in applicant_educations:
            university = await self.universities_repository.get_by_id(applicant_education.university_id)
            if not university:
                raise HTTPException(
                    status_code=status.HTTP_404_NOT_FOUND,
                    detail='Университет с таким id не найден'
                )

            applicant_education_models.append(ApplicantEducation(
                start_education_year=applicant_education.start_education_year,
                end_education_year=applicant_education.end_education_year,
                specialization=applicant_education.specialization,
                is_in_the_learning=applicant_education.is_in_the_learning,
                applicant_id=applicant_id,
                university_id=applicant_education.university_id,
            ))

        applicant_education_models = await self.applicant_educations_repository.create_list(applicant_education_models)

        response = []
        for applicant_education_model in applicant_education_models:
            response.append(ApplicantEducationRead.model_validate(applicant_education_model))

        return response
