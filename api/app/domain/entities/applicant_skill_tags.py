from pydantic import BaseModel


class ApplicantSkillTagRead(BaseModel):
    id: int
    title: str

    class Config:
        from_attributes = True
