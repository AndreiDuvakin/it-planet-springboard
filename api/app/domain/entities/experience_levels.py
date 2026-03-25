from pydantic import BaseModel


class ExperienceLevelRead(BaseModel):
    id: int
    title: str

    class Config:
        from_attributes = True
