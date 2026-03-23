import re
from typing import Optional

from app.application.applicant_profiles_repository import ApplicantProfilesRepository
from app.domain.entities.users import UserRead, UserCreate, UserRegister
from fastapi import HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession

from app.application.roles_repository import RolesRepository
from app.application.users_repository import UsersRepository
from app.core.constants import UserRoles
from app.domain.models import ApplicantProfile
from app.domain.models.users import User
from app.settings import Settings


class RegisterService:
    def __init__(self, db: AsyncSession):
        self.users_repository = UsersRepository(db)
        self.roles_repository = RolesRepository(db)
        self.applicant_profiles_repository = ApplicantProfilesRepository(db)
        self.user_roles = UserRoles()
        self.settings = Settings()

    async def create_user(self, create_user_entity: UserCreate) -> Optional[UserRead]:
        user = await self.users_repository.get_by_login(create_user_entity.login)
        if user:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail='Пользователь с таким логином уже существует',
            )

        user = await self.users_repository.get_by_login(create_user_entity.email)
        if user:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail='Пользователь с такой почтой уже существует',
            )

        if create_user_entity.password != create_user_entity.repeat_password:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail='Пароли не совпадают',
            )

        if not self.is_strong_password(create_user_entity.repeat_password):
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail='Пароль слишком слабый. Пароль должен содержать не менее 8 символов, включая хотя бы одну букву и одну цифру и один специальный символ.'
            )

        role = await self.roles_repository.get_by_id(create_user_entity.role_id)
        if role is None:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail='Роль с таким ID не найдена',
            )

        user = User(
            first_name=create_user_entity.first_name,
            last_name=create_user_entity.last_name,
            patronymic=create_user_entity.patronymic,
            login=create_user_entity.login,
            email=create_user_entity.email,
            birthdate=create_user_entity.birthdate,
            role_id=create_user_entity.role_id,
            is_admin=create_user_entity.is_admin,
        )

        user.set_password(create_user_entity.password)

        user = await self.users_repository.create(user)

        user.role = role

        if role.title == self.user_roles.APPLICANT:
            applicant_profile = ApplicantProfile(
                user_id=user.id,
            )
            applicant_profile = await self.applicant_profiles_repository.create(applicant_profile)

            user.applicant_profile_id = applicant_profile.id
            user.applicant_profile = applicant_profile

        else:
            user.applicant_profile = None

        return UserRead.model_validate(user)

    async def user_register(self, register_user_entity: UserRegister) -> UserRead:
        user = await self.users_repository.get_by_login(register_user_entity.login)
        if user:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail='Пользователь с таким логином уже существует',
            )

        user = await self.users_repository.get_by_login(register_user_entity.email)
        if user:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail='Пользователь с такой почтой уже существует',
            )

        if register_user_entity.password != register_user_entity.repeat_password:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail='Пароли не совпадают',
            )

        if not self.is_strong_password(register_user_entity.repeat_password):
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail='Пароль слишком слабый. Пароль должен содержать не менее 8 символов, включая хотя бы одну букву и одну цифру и один специальный символ.'
            )

        role = await self.roles_repository.get_by_id(register_user_entity.role_id)
        if role is None:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail='Роль с таким ID не найдена',
            )

        if role.title == self.user_roles.MODERATOR:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail='Нельзя зарегистрироваться, как модератор',
            )

        user = User(
            first_name=register_user_entity.first_name,
            last_name=register_user_entity.last_name,
            patronymic=register_user_entity.patronymic,
            birthdate=register_user_entity.birthdate,
            login=register_user_entity.login,
            email=register_user_entity.email,
            role_id=register_user_entity.role_id,
        )

        user.set_password(register_user_entity.password)

        user = await self.users_repository.create(user)
        user.role = role

        if role.title == self.user_roles.APPLICANT:
            applicant_profile = ApplicantProfile(
                user_id=user.id,
            )
            applicant_profile = await self.applicant_profiles_repository.create(applicant_profile)

            user.applicant_profile_id = applicant_profile.id
            user.applicant_profile = applicant_profile

        else:
            user.applicant_profile = None

        return UserRead.model_validate(user)

    @staticmethod
    def is_strong_password(password: str) -> bool:
        if len(password) < 8:
            return False

        if not re.search(r'[A-Z]', password):
            return False

        if not re.search(r'[a-z]', password):
            return False

        if not re.search(r'\d', password):
            return False

        if not re.search(r'[!@#$%^&*(),.?\':{}|<>]', password):
            return False

        return True
