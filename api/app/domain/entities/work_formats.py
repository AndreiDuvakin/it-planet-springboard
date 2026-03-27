from typing import Optional, List
from pydantic import BaseModel, EmailStr, Field

class WorkFormatCreate(BaseModel):
    title: str = Field(max_length=100)


class WorkFormatUpdate(BaseModel):
    title: Optional[str] = Field(default=None, max_length=100)


class WorkFormatRead(BaseModel):
    id: int
    title: str

    class Config:
        from_attributes = True