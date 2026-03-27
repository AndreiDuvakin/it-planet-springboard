from fastapi import APIRouter, Depends, status
from sqlalchemy.ext.asyncio import AsyncSession
from app.database.session import get_db
from app.infrastructure.dependencies import require_auth_user
from app.infrastructure.internships_service import InternshipsService
from app.domain.entities.internships import InternshipCreate, InternshipRead
from app.domain.models import User

internships_router = APIRouter()

@internships_router.post('', response_model=InternshipRead, status_code=status.HTTP_201_CREATED)
async def create_internship(
    data: InternshipCreate,
    db: AsyncSession = Depends(get_db),
    user: User = Depends(require_auth_user)
):
    service = InternshipsService(db)
    return await service.create_internship(data, user)