from typing import Optional, List
from pydantic import BaseModel, EmailStr, Field


class EmploymentTypeCreate(BaseModel):
    title: str = Field(max_length=100)


class EmploymentTypeUpdate(BaseModel):
    title: Optional[str] = Field(default=None, max_length=100)


class EmploymentTypeRead(BaseModel):
    id: int
    title: str

    class Config:
        from_attributes = True