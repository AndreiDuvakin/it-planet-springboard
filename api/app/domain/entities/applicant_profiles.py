from typing import Optional

from pydantic import BaseModel, Field

from app.domain.entities.universities import UniversityRead


class ApplicantProfileCreate(BaseModel):
    resume_html: Optional[str] = None
    resume_url: Optional[str] = Field(default=None, max_length=500)
    university_id: Optional[int] = None
    user_id: int


class ApplicantProfileUpdate(BaseModel):
    resume_html: Optional[str] = None
    resume_url: Optional[str] = Field(default=None, max_length=500)
    university_id: Optional[int] = None


class ApplicantProfileRead(BaseModel):
    id: int
    resume_html: Optional[str]
    resume_url: Optional[str]
    university_id: Optional[int]
    user_id: int

    university: Optional[UniversityRead] = None

    class Config:
        from_attributes = True