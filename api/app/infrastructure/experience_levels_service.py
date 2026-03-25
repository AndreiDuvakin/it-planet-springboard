from typing import List

from sqlalchemy.ext.asyncio import AsyncSession

from app.application.experience_levels_repository import ExperienceLevelsRepository
from app.domain.entities.experience_levels import ExperienceLevelRead


class ExperienceLevelService:
    def __init__(self, db: AsyncSession):
        self.experience_levels_repository = ExperienceLevelsRepository(db)

    async def get_all_experience_levels(self) -> List[ExperienceLevelRead]:
        levels = await self.experience_levels_repository.get_all()

        response = []
        for level in levels:
            response.append(ExperienceLevelRead.model_validate(level))

        return response
