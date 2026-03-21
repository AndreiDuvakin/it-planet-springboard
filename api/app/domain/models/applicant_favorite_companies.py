from sqlalchemy import ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class ApplicantFavoriteCompany(RootTable):
    __tablename__ = 'applicant_favorite_companies'

    applicant_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)
    company_id: Mapped[int] = mapped_column(ForeignKey('company_profiles.id'), nullable=False)

    applicant_profile: Mapped['ApplicantProfile'] = relationship('ApplicantProfile',
                                                                 back_populates='favorite_companies')
    company_profile: Mapped['CompanyProfile'] = relationship('CompanyProfile', back_populates='favorite_by_applicants')

