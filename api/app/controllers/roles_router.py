from typing import List, Optional

from fastapi import APIRouter, Depends, Response
from sqlalchemy.ext.asyncio import AsyncSession

from app.database.session import get_db
from app.domain.entities.roles import RoleRead
from app.domain.models import User
from app.infrastructure.dependencies import require_admin
from app.infrastructure.roles_service import RolesService

roles_router = APIRouter()


@roles_router.get(
    '/for-register/',
    response_model=List[RoleRead],
    summary='Returns all roles for register',
    description='Returns all roles for register',
)
async def get_all_roles(
        db: AsyncSession = Depends(get_db),
):
    roles_service = RolesService(db)
    return await roles_service.get_for_register()
