from sqlalchemy.ext.asyncio import AsyncSession

from app.application.applicant_skill_tags_repository import ApplicantSkillTagsRepository
from app.domain.entities.applicant_skill_tags import ApplicantSkillTagRead


class ApplicantSkillTagsService:
    def __init__(self, db: AsyncSession):
        self.applicant_skill_tags_repository = ApplicantSkillTagsRepository(db)

    async def get_all(self):
        applicant_skill_tags = await self.applicant_skill_tags_repository.get_all()

        response = []
        for applicant_skill_tag in applicant_skill_tags:
            response.append(ApplicantSkillTagRead.model_validate(applicant_skill_tag))

        return response
