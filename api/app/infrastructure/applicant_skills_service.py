from typing import List

from fastapi import HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession

from app.application.applicant_profiles_repository import ApplicantProfilesRepository
from app.application.applicant_skill_tags_repository import ApplicantSkillTagsRepository
from app.application.applicant_skills_repository import ApplicantSkillsRepository
from app.application.experience_levels_repository import ExperienceLevelsRepository
from app.core.constants import UserRoles
from app.domain.entities.applicant_skills import ApplicantSkillRead, ApplicantSkillCreate
from app.domain.models import User, ApplicantSkill


class ApplicantSkillsService:
    def __init__(self, db: AsyncSession):
        self.applicant_skills_repository = ApplicantSkillsRepository(db)
        self.applicant_skill_tags_repository = ApplicantSkillTagsRepository(db)
        self.applicant_profiles_repository = ApplicantProfilesRepository(db)
        self.experience_levels_repository = ExperienceLevelsRepository(db)

    async def get_by_applicant_id(
            self,
            applicant_id: int,
            current_user: User,
    ) -> List[ApplicantSkillRead]:
        applicant = await self.applicant_profiles_repository.get_by_id(applicant_id)
        if not applicant:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail='Соискатель с таким ID не найден')

        if applicant.user_id != current_user.id and not (
                current_user.role.title == UserRoles.MODERATOR and current_user.is_admin):
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail='Доступ запрещен',
            )

        applicant_skills = await self.applicant_skills_repository.get_by_applicant_id(applicant_id)
        response = []

        for applicant_skill in applicant_skills:
            response.append(ApplicantSkillRead.model_validate(applicant_skill))

        return response

    async def replace_applicant_skills(
            self,
            applicant_id: int,
            applicant_skills: List[ApplicantSkillCreate],
            current_user: User,
    ):
        applicant = await self.applicant_profiles_repository.get_by_id(applicant_id)
        if not applicant:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail='Соискатель с таким ID не найден')

        if applicant.user_id != current_user.id and not (
                current_user.role.title == UserRoles.MODERATOR and current_user.is_admin):
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail='Доступ запрещен',
            )

        old_applicant_skills = await self.applicant_skills_repository.get_by_applicant_id(applicant_id)
        await self.applicant_skills_repository.delete_list(old_applicant_skills)

        applicant_skills_models = []
        for applicant_skill in applicant_skills:
            applicant_skills_tag = await self.applicant_skill_tags_repository.get_by_id(applicant_skill.tag_id)
            if not applicant_skills_tag:
                raise HTTPException(
                    status_code=status.HTTP_404_NOT_FOUND,
                    detail='Умение с таким id не найдено'
                )

            skill_level = await self.experience_levels_repository.get_by_id(applicant_skill.level_id)
            if not skill_level:
                raise HTTPException(
                    status_code=status.HTTP_404_NOT_FOUND,
                    detail='Уровень умения с таким ID не найден'
                )

            applicant_skills_models.append(ApplicantSkill(
                level_id=applicant_skill.level_id,
                tag_id=applicant_skill.tag_id,
                applicant_id=applicant_id,
                level=skill_level,
                tag=applicant_skills_tag,
            ))

        applicant_skills_models = await self.applicant_skills_repository.create_list(applicant_skills_models)

        response = []
        for applicant_skill in applicant_skills_models:
            response.append(ApplicantSkillRead.model_validate(applicant_skill))

        return response
