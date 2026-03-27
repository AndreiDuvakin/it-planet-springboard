from typing import Optional, List
from pydantic import BaseModel, EmailStr, Field


class LocationCoordinateCreate(BaseModel):
    latitude: float = Field(ge=-90, le=90)
    longitude: float = Field(ge=-180, le=180)


class LocationCoordinateUpdate(BaseModel):
    latitude: Optional[float] = Field(default=None, ge=-90, le=90)
    longitude: Optional[float] = Field(default=None, ge=-180, le=180)


class LocationCoordinateRead(BaseModel):
    id: int
    latitude: float
    longitude: float

    class Config:
        from_attributes = True