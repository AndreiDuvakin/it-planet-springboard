from pydantic import BaseModel


class UniversityRead(BaseModel):
    id: int
    title: str

    class Config:
        from_attributes = True
