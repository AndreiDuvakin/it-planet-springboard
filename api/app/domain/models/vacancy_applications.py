from sqlalchemy import Text, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class VacancyApplication(RootTable):
    __tablename__ = 'vacancy_applications'

    cover_letter: Mapped[str] = mapped_column(Text, nullable=True)
    employer_note: Mapped[str] = mapped_column(Text, nullable=True)

    vacancy_id: Mapped[int] = mapped_column(ForeignKey('vacancies.id'), nullable=False)
    applicant_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)

    vacancy: Mapped['Vacancy'] = relationship('Vacancy', back_populates='applications')
    applicant_profile: Mapped['ApplicantProfile'] = relationship('ApplicantProfile',
                                                                 back_populates='vacancy_applications')
