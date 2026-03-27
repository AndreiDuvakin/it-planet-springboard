from typing import Optional, List
from pydantic import BaseModel, EmailStr, Field
from datetime import datetime
from app.domain.entities.company_profiles import CompanyProfileRead
from app.domain.entities.work_formats import WorkFormatRead
from app.domain.entities.employment_types import EmploymentTypeRead
from app.domain.entities.experience_levels import ExperienceLevelRead
from app.domain.entities.location_coordinates import LocationCoordinateRead

class VacancyCreate(BaseModel):
    title: str
    description: str
    media_url: Optional[str] = None
    address: str
    salary_min: Optional[int] = None
    salary_max: Optional[int] = None
    expires_at: Optional[datetime] = None
    employment_type_id: int
    experience_level_id: int
    work_format_id: int
    tag_ids: List[int] = []

    tag_ids: Optional[list[int]] = Field(default_factory=list)


class VacancyUpdate(BaseModel):
    title: Optional[str] = Field(default=None, max_length=250)
    description: Optional[str] = None
    media_url: Optional[str] = Field(default=None, max_length=500)
    address: Optional[str] = Field(default=None, max_length=500)
    is_active: Optional[bool] = None
    moderation_comment: Optional[str] = None
    expires_at: Optional[datetime] = None
    salary_min: Optional[int] = None
    salary_max: Optional[int] = None
    work_format_id: Optional[int] = None
    employment_type_id: Optional[int] = None
    experience_level_id: Optional[int] = None
    moderation_status_id: Optional[int] = None
    location_id: Optional[int] = None

    tag_ids: Optional[list[int]] = None

class VacancyRead(BaseModel):
    id: int
    title: str
    description: Optional[str]
    media_url: Optional[str]
    address: Optional[str]
    published_at: datetime
    is_active: bool
    moderation_comment: Optional[str]
    expires_at: Optional[datetime]
    salary_min: Optional[int]
    salary_max: Optional[int]
    company_id: int
    work_format_id: int
    employment_type_id: int
    experience_level_id: int
    moderation_status_id: int
    location_id: int

    company_profile: CompanyProfileRead
    work_format: WorkFormatRead
    employment_type: EmploymentTypeRead
    experience_level: ExperienceLevelRead
   # moderation_status: ModerationStatusRead
    location: LocationCoordinateRead

    tag_ids: list[int]

    class Config:
        from_attributes = True