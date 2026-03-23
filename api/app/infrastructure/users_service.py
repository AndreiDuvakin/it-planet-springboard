from typing import List

from fastapi import HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession

from app.application.users_repository import UsersRepository
from app.core.constants import UserRoles
from app.domain.entities.users import UserRead, UserActivate
from app.domain.models import User


class UsersService:
    def __init__(self, db: AsyncSession):
        self.users_repository = UsersRepository(db)

    async def get_all(self) -> List[UserRead]:
        users = await self.users_repository.get_all()
        response = []
        for user in users:
            response.append(UserRead.model_validate(user))

        return response

    async def get_by_id(self, user_id: int) -> UserRead:
        user = await self.users_repository.get_by_id(user_id)
        if not user:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail='Пользователь не найден',
            )

        return UserRead.model_validate(user)

    async def set_activate(self, activate_data: UserActivate, current_user: User) -> UserRead:
        user = await self.users_repository.get_by_id(activate_data.user_id)
        if not user:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail='Пользователь не найден',
            )

        if user.id == current_user.id:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail='Нельзя заблокировать самого себя'
            )

        if user.role.title == UserRoles.MODERATOR and user.is_admin:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail='Нельзя заблокировать даминистратора'
            )

        user.is_activated = activate_data.is_activated

        user = await self.users_repository.update(user)
        return UserRead.model_validate(user)
