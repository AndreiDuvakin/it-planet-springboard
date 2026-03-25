from typing import Optional

from pydantic import BaseModel, Field

from app.domain.entities.universities import UniversityRead


class ApplicantEducationCreate(BaseModel):
    start_education_year: int
    end_education_year: Optional[int] = None
    specialization: str = Field(max_length=300)
    is_in_the_learning: bool = False
    university_id: int


class ApplicantEducationRead(BaseModel):
    id: int
    start_education_year: int
    end_education_year: Optional[int]
    specialization: str
    is_in_the_learning: bool
    applicant_id: int
    university_id: int

    university: UniversityRead

    class Config:
        from_attributes = True
