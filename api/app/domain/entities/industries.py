from typing import Optional, List
from pydantic import BaseModel, EmailStr, Field

class IndustryCreate(BaseModel):
    title: str = Field(max_length=150)


class IndustryUpdate(BaseModel):
    title: Optional[str] = Field(default=None, max_length=150)


class IndustryRead(BaseModel):
    id: int
    title: str

    class Config:
        from_attributes = True
