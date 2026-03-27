from pydantic import BaseModel, EmailStr, Field
from typing import Optional, List

class CompanyProfilePhotoCreate(BaseModel):
    filename: str = Field(max_length=250)
    path: str = Field(max_length=500)
    url: Optional[str] = Field(default=None, max_length=500)


class CompanyProfilePhotoRead(BaseModel):
    id: int
    filename: str
    path: str
    url: Optional[str]

    class Config:
        from_attributes = True