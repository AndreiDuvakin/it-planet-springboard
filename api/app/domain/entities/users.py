from datetime import date
from typing import Optional

from pydantic import BaseModel, EmailStr, Field

from app.domain.entities.applicant_profiles import ApplicantProfileRead
from app.domain.entities.roles import RoleRead


class UserRegister(BaseModel):
    first_name: str = Field(max_length=250)
    last_name: str = Field(max_length=250)
    patronymic: Optional[str] = Field(default=None, max_length=250)
    login: str = Field(max_length=250)
    email: EmailStr = Field(max_length=250)
    birthdate: date
    password: str = Field(min_length=8)
    repeat_password: str = Field(min_length=8)
    role_id: int


class UserCreate(BaseModel):
    first_name: str = Field(max_length=250)
    last_name: str = Field(max_length=250)
    patronymic: Optional[str] = Field(default=None, max_length=250)
    login: str = Field(max_length=250)
    email: Optional[EmailStr] = None
    birthdate: date
    password: str = Field(min_length=8)
    repeat_password: str = Field(min_length=8)
    role_id: Optional[int] = None
    is_admin: bool = False


class UserUpdate(BaseModel):
    first_name: Optional[str] = Field(default=None, max_length=250)
    last_name: Optional[str] = Field(default=None, max_length=250)
    patronymic: Optional[str] = Field(default=None, max_length=250)
    login: Optional[str] = Field(default=None, max_length=250)
    email: Optional[EmailStr] = None
    birthdate: Optional[date] = None
    role_id: Optional[int] = None


class PasswordChangeRequest(BaseModel):
    password: str = Field(min_length=8)
    repeat_password: str = Field(min_length=8)


class UserActivate(BaseModel):
    is_activated: bool
    user_id: int


class UserRead(BaseModel):
    id: int
    first_name: str
    last_name: str
    patronymic: Optional[str]
    login: str
    email: Optional[EmailStr]
    birthdate: date
    is_activated: bool
    is_admin: bool
    role_id: int

    role: RoleRead
    applicant_profile: Optional[ApplicantProfileRead] = None

    class Config:
        from_attributes = True
