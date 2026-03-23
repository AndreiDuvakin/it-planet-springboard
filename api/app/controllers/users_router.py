from typing import Optional, List

from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession

from app.database.session import get_db
from app.domain.entities.users import UserRead, UserRegister, UserActivate, UserCreate
from app.domain.models import User
from app.infrastructure.dependencies import require_auth_user, require_admin
from app.infrastructure.register_service import RegisterService
from app.infrastructure.users_service import UsersService

users_router = APIRouter()


@users_router.get(
    '/',
    response_model=List[UserRead],
    summary='Returns all users',
    description='Returns all users',
)
async def get_all_users(
        db: AsyncSession = Depends(get_db),
        user: User = Depends(require_auth_user)
):
    users_service = UsersService(db)
    return await users_service.get_all()


@users_router.get(
    '/me/',
    response_model=Optional[UserRead],
    summary='Returns current authenticated user data',
    description='Returns current authenticated user data',
)
async def get_authenticated_user_data(
        db: AsyncSession = Depends(get_db),
        user: User = Depends(require_auth_user)
):
    users_service = UsersService(db)
    return await users_service.get_by_id(user.id)


@users_router.post(
    '/register/',
    response_model=UserRead,
    summary='User registration',
    description='Performs user registration in the system',
)
async def register_user(
        user_data: UserRegister,
        db: AsyncSession = Depends(get_db)
):
    register_service = RegisterService(db)
    return await register_service.user_register(user_data)


@users_router.post(
    '/create/',
    response_model=UserRead,
    summary='User creation',
    description='Performs user creation in the system',
)
async def create_user(
        user_data: UserCreate,
        db: AsyncSession = Depends(get_db),
        user: User = Depends(require_admin)
):
    register_service = RegisterService(db)
    return await register_service.create_user(user_data)


@users_router.post(
    '/set-activate/',
    response_model=UserRead,
    summary='User activation',
    description='Performs user activation in the system',
)
async def activate_user(
        activate_data: UserActivate,
        db: AsyncSession = Depends(get_db),
        user: User = Depends(require_admin),
):
    users_service = UsersService(db)
    return await users_service.set_activate(activate_data, user)
