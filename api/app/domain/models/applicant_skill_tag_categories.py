from typing import List

from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class ApplicantSkillTagCategory(RootTable):
    __tablename__ = 'applicant_skill_tag_categories'

    title: Mapped[str] = mapped_column(String(150), nullable=False)

    tags: Mapped[List['ApplicantSkillTag']] = relationship('ApplicantSkillTag', back_populates='category')

