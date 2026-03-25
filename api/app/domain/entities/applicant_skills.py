from pydantic import BaseModel, Field

from app.domain.entities.applicant_skill_tags import ApplicantSkillTagRead
from app.domain.entities.experience_levels import ExperienceLevelRead


class ApplicantSkillCreate(BaseModel):
    level_id: int
    tag_id: int


class ApplicantSkillRead(BaseModel):
    id: int
    level_id: int
    tag_id: int
    applicant_id: int

    tag: ApplicantSkillTagRead
    level: ExperienceLevelRead

    class Config:
        from_attributes = True
