from datetime import date

from sqlalchemy import String, Text, Date, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class ApplicantExperience(RootTable):
    __tablename__ = 'applicant_experiences'

    company_name: Mapped[str] = mapped_column(String(250), nullable=False)
    description: Mapped[str] = mapped_column(Text, nullable=True)
    start_date: Mapped[date] = mapped_column(Date, nullable=False)
    end_date: Mapped[date] = mapped_column(Date, nullable=True)

    applicant_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)

    applicant_profile: Mapped['ApplicantProfile'] = relationship('ApplicantProfile', back_populates='experiences')
