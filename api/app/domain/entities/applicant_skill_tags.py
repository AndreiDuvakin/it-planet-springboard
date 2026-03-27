from typing import Optional, List
from pydantic import BaseModel, EmailStr, Field


class ApplicantSkillTagCreate(BaseModel):
    title: str = Field(max_length=150)
    category_id: int


class ApplicantSkillTagUpdate(BaseModel):
    title: Optional[str] = Field(default=None, max_length=150)
    category_id: Optional[int] = None


class ApplicantSkillTagRead(BaseModel):
    id: int
    title: str
    category: Optional["ApplicantSkillTagCategoryRead"] = None

    class Config:
        from_attributes = True
