from fastapi import APIRouter, Depends, status
from sqlalchemy.ext.asyncio import AsyncSession
from app.database.session import get_db
from app.infrastructure.dependencies import require_auth_user # Используем этот импорт
from app.infrastructure.internships_service import InternshipsService
from app.domain.entities.internships import InternshipCreate
from app.domain.models import User

internships_router = APIRouter()

@internships_router.post("", status_code=status.HTTP_201_CREATED)
async def create_internship(
    data: InternshipCreate,
    current_user: User = Depends(require_auth_user), # Исправлено на require_auth_user
    db: AsyncSession = Depends(get_db)
):
    service = InternshipsService(db)
    return await service.create_internship(data, current_user)