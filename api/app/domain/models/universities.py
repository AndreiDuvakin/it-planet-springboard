from typing import List

from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class University(RootTable):
    __tablename__ = 'universities'

    title: Mapped[str] = mapped_column(String(300), nullable=False)

    applicant_profiles: Mapped[List['ApplicantProfile']] = relationship('ApplicantProfile', back_populates='university')
    educations: Mapped[List['ApplicantEducation']] = relationship('ApplicantEducation', back_populates='university')
