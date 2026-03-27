from typing import Optional, List
from pydantic import BaseModel, EmailStr, Field

from app.domain.entities.industries import IndustryRead
from app.domain.entities.company_profile_socials import CompanyProfileSocialCreate, CompanyProfileSocialRead
from app.domain.entities.company_profile_logos import CompanyProfileLogoRead
from app.domain.entities.company_profile_photos import CompanyProfilePhotoRead

class CompanyProfileCreate(BaseModel):
    title: str = Field(max_length=250)
    description: Optional[str] = None
    website_url: Optional[str] = Field(default=None, max_length=500)
    inn: Optional[str] = Field(default=None, max_length=50)
    corporate_email: Optional[EmailStr] = None
    video_url: Optional[str] = Field(default=None, max_length=500)
    is_verified: bool = False
    logo_id: Optional[int] = None
    official_photo_id: Optional[int] = None
    industry_id: int
    socials: Optional[List[CompanyProfileSocialCreate]] = []

class CompanyProfileUpdate(BaseModel):
    title: Optional[str] = Field(default=None, max_length=250)
    description: Optional[str] = None
    website_url: Optional[str] = Field(default=None, max_length=500)
    inn: Optional[str] = Field(default=None, max_length=50)
    corporate_email: Optional[EmailStr] = None
    video_url: Optional[str] = Field(default=None, max_length=500)
    is_verified: Optional[bool] = None
    logo_id: Optional[int] = None
    official_photo_id: Optional[int] = None
    industry_id: Optional[int] = None

class CompanyProfileRead(BaseModel):
    id: int
    title: str
    description: Optional[str]
    website_url: Optional[str]
    inn: Optional[str]
    corporate_email: Optional[EmailStr]
    video_url: Optional[str]
    is_verified: bool
    logo_id: Optional[int]
    official_photo_id: Optional[int]
    creator_user_id: int
    industry_id: int

    logo: Optional[CompanyProfileLogoRead] = None
    official_photo: Optional[CompanyProfilePhotoRead] = None
    industry: IndustryRead
    socials: List[CompanyProfileSocialRead] = []

    class Config:
        from_attributes = True