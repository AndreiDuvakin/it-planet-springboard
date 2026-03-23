from sqlalchemy.ext.asyncio import AsyncSession

from app.application.roles_repository import RolesRepository
from app.domain.entities.roles import RoleRead


class RolesService:
    def __init__(self, db: AsyncSession):
        self.roles_repository = RolesRepository(db)

    async def get_for_register(self):
        roles = await self.roles_repository.get_for_register()
        response = []

        for role in roles:
            response.append(RoleRead.model_validate(role))

        return response
