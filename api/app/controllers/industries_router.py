from typing import List
from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession
from app.database.session import get_db
from app.domain.entities.industries import IndustryRead
from app.application.industries_repository import IndustriesRepository

industries_router = APIRouter()

@industries_router.get(
    '/',
    response_model=List[IndustryRead],
    summary='Получить список всех сфер деятельности',
)
async def get_all_industries(db: AsyncSession = Depends(get_db)):
    repo = IndustriesRepository(db)
    industries = await repo.get_all()
    return [IndustryRead.model_validate(i) for i in industries]