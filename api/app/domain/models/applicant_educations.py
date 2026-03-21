from sqlalchemy import Integer, String, Boolean, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class ApplicantEducation(RootTable):
    __tablename__ = 'applicant_educations'

    start_education_year: Mapped[int] = mapped_column(Integer, nullable=False)
    end_education_year: Mapped[int] = mapped_column(Integer, nullable=True)
    specialization: Mapped[str] = mapped_column(String(300), nullable=False)
    is_in_the_learning: Mapped[bool] = mapped_column(Boolean, nullable=False)  # column name cleaned from diagram

    applicant_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)
    university_id: Mapped[int] = mapped_column(ForeignKey('universities.id'), nullable=False)

    applicant_profile: Mapped['ApplicantProfile'] = relationship('ApplicantProfile', back_populates='educations')
    university: Mapped['University'] = relationship('University', back_populates='educations')

