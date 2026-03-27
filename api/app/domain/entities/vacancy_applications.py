from typing import Optional, List
from pydantic import BaseModel, EmailStr, Field

class VacancyApplicationCreate(BaseModel):
    cover_letter: Optional[str] = None
    employer_note: Optional[str] = None
    vacancy_id: int
    applicant_id: int


class VacancyApplicationUpdate(BaseModel):
    employer_note: Optional[str] = None


class VacancyApplicationRead(BaseModel):
    id: int
    cover_letter: Optional[str]
    employer_note: Optional[str]
    vacancy_id: int
    applicant_id: int

    vacancy: VacancyRead
    applicant_profile: ApplicantProfileRead

    class Config:
        from_attributes = True