# app/controllers/dictionaries_router.py
from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from app.database.session import get_db
from app.domain.models import EmploymentType, ExperienceLevel, WorkFormat
from app.domain.entities.employment_types import EmploymentTypeRead
from app.domain.entities.experience_levels import ExperienceLevelRead
from app.domain.entities.work_formats import WorkFormatRead

router = APIRouter()

@router.get("/employment-types", response_model=list[EmploymentTypeRead])
async def get_employment_types(db: AsyncSession = Depends(get_db)):
    result = await db.execute(select(EmploymentType))
    return result.scalars().all()

@router.get("/experience-levels", response_model=list[ExperienceLevelRead])
async def get_experience_levels(db: AsyncSession = Depends(get_db)):
    result = await db.execute(select(ExperienceLevel))
    return result.scalars().all()

@router.get("/work-formats", response_model=list[WorkFormatRead])
async def get_work_formats(db: AsyncSession = Depends(get_db)):
    result = await db.execute(select(WorkFormat))
    return result.scalars().all()