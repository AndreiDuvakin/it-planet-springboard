from typing import Optional, List
from pydantic import BaseModel, EmailStr, Field

class ExperienceLevelCreate(BaseModel):
    title: str = Field(max_length=100)


class ExperienceLevelUpdate(BaseModel):
    title: Optional[str] = Field(default=None, max_length=100)


class ExperienceLevelRead(BaseModel):
    id: int
    title: str

    class Config:
        from_attributes = True