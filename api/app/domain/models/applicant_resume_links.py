from sqlalchemy import String, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class ApplicantResumeLink(RootTable):
    __tablename__ = 'applicant_resume_links'

    title: Mapped[str] = mapped_column(String(250), nullable=False)
    link: Mapped[str] = mapped_column(String(500), nullable=False)

    applicant_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)

    applicant_profile: Mapped['ApplicantProfile'] = relationship('ApplicantProfile', back_populates='resume_links')
