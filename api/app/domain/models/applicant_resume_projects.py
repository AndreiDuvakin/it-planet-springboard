from sqlalchemy import String, Text, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class ApplicantResumeProject(RootTable):
    __tablename__ = 'applicant_resume_projects'

    title: Mapped[str] = mapped_column(String(250), nullable=False)
    description: Mapped[str] = mapped_column(Text, nullable=True)
    link: Mapped[str] = mapped_column(String(500), nullable=True)
    repository_url: Mapped[str] = mapped_column(String(500), nullable=True)

    applicant_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)

    applicant_profile: Mapped['ApplicantProfile'] = relationship('ApplicantProfile', back_populates='resume_projects')

