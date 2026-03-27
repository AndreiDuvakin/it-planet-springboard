from pydantic import BaseModel, EmailStr, Field
from typing import Optional, List

class CompanyProfileSocialCreate(BaseModel):
    title: str = Field(max_length=100)
    link: str = Field(max_length=500)
    company_id: Optional[int] = None

class CompanyProfileSocialUpdate(BaseModel):
    title: Optional[str] = Field(default=None, max_length=100)
    link: Optional[str] = Field(default=None, max_length=500)


class CompanyProfileSocialRead(BaseModel):
    id: int
    title: str
    link: str
    company_id: int

    class Config:
        from_attributes = True

