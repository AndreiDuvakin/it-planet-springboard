from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class ExperienceLevel(RootTable):
    __tablename__ = 'experience_levels'

    title: Mapped[str] = mapped_column(String(100), nullable=False)

    skills: Mapped['ApplicantSkill'] = relationship('ApplicantSkill', back_populates='level')
