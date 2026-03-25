from typing import List

from sqlalchemy import String, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class ApplicantSkillTag(RootTable):
    __tablename__ = 'applicant_skill_tags'

    title: Mapped[str] = mapped_column(String(150), nullable=False)

    skills: Mapped[List['ApplicantSkill']] = relationship('ApplicantSkill', back_populates='tag')

