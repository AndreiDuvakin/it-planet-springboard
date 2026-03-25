from typing import List

from sqlalchemy.ext.asyncio import AsyncSession

from app.application.universities_repository import UniversitiesRepository
from app.domain.entities.universities import UniversityRead


class UniversitiesService:
    def __init__(self, db: AsyncSession):
        self.universities_repository = UniversitiesRepository(db)

    async def get_all(self) -> List[UniversityRead]:
        universities = await self.universities_repository.get_all()
        response = []

        for university in universities:
            response.append(UniversityRead.model_validate(university))

        return response
