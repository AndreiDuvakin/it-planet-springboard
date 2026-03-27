from typing import Optional, List
from pydantic import BaseModel, EmailStr, Field
from datetime import datetime
from app.domain.entities.company_profiles import CompanyProfileRead
from app.domain.entities.work_formats import WorkFormatRead
from app.domain.entities.employment_types import EmploymentTypeRead
from app.domain.entities.experience_levels import ExperienceLevelRead
from app.domain.entities.location_coordinates import LocationCoordinateRead


class InternshipCreate(BaseModel):
    title: str
    description: str
    address: str
    duration_months: int
    experience_level_id: int
    work_format_id: int
    # Эти поля делаем Optional, их заполнит сервис
    expires_at: Optional[datetime] = None
    media_url: Optional[str] = None
    is_paid: bool = False
    mentorship_available: bool = False
    tag_ids: List[int] = []

class InternshipUpdate(BaseModel):
    title: Optional[str] = Field(default=None, max_length=250)
    description: Optional[str] = None
    media_url: Optional[str] = Field(default=None, max_length=500)
    address: Optional[str] = Field(default=None, max_length=500)
    is_active: Optional[bool] = None
    moderation_comment: Optional[str] = None
    duration_months: Optional[int] = None
    is_paid: Optional[bool] = None
    mentorship_available: Optional[bool] = None
    expires_at: Optional[datetime] = None
    moderation_status_id: Optional[int] = None
    experience_level_id: Optional[int] = None
    work_format_id: Optional[int] = None
    location_id: Optional[int] = None


class InternshipRead(BaseModel):
    id: int
    title: str
    description: Optional[str]
    media_url: Optional[str]
    address: Optional[str]
    published_at: datetime
    is_active: bool
    moderation_comment: Optional[str]
    duration_months: int
    is_paid: bool
    mentorship_available: bool
    expires_at: Optional[datetime]
    company_id: int
    moderation_status_id: int
    experience_level_id: int
    work_format_id: int
    location_id: int

    company_profile: CompanyProfileRead
#    moderation_status: ModerationStatusRead
    experience_level: ExperienceLevelRead
    work_format: WorkFormatRead
    location: LocationCoordinateRead

    class Config:
        from_attributes = True