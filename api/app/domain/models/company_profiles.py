from typing import List

from sqlalchemy import String, Text, Boolean, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class CompanyProfile(RootTable):
    __tablename__ = 'company_profiles'

    title: Mapped[str] = mapped_column(String(250), nullable=False)
    description: Mapped[str] = mapped_column(Text, nullable=True)
    website_url: Mapped[str] = mapped_column(String(500), nullable=True)
    inn: Mapped[str] = mapped_column(String(50), nullable=True)
    corporate_email: Mapped[str] = mapped_column(String(250), nullable=True)
    video_url: Mapped[str] = mapped_column(String(500), nullable=True)
    is_verified: Mapped[bool] = mapped_column(Boolean, nullable=False, default=False)

    logo_id: Mapped[int] = mapped_column(ForeignKey('company_profile_logos.id'), nullable=True)
    official_photo_id: Mapped[int] = mapped_column(ForeignKey('company_profile_photos.id'),
                                                   nullable=True)
    creator_user_id: Mapped[int] = mapped_column(ForeignKey('users.id'), nullable=False)
    industry_id: Mapped[int] = mapped_column(ForeignKey('industries.id'), nullable=False)

    logo: Mapped['CompanyProfileLogo'] = relationship('CompanyProfileLogo')
    official_photo: Mapped['CompanyProfilePhoto'] = relationship('CompanyProfilePhoto')
    creator: Mapped['User'] = relationship('User', back_populates='created_companies')
    industry: Mapped['Industry'] = relationship('Industry', back_populates='companies')

    socials: Mapped[List['CompanyProfileSocial']] = relationship('CompanyProfileSocial',
                                                                 back_populates='company_profile')
    verification_requests: Mapped[List['VerificationRequest']] = relationship('VerificationRequest',
                                                                              back_populates='company_profile')
    favorite_by_applicants: Mapped[List['ApplicantFavoriteCompany']] = relationship('ApplicantFavoriteCompany',
                                                                                    back_populates='company_profile')
    vacancies: Mapped[List['Vacancy']] = relationship('Vacancy', back_populates='company_profile')
    internships: Mapped[List['Internship']] = relationship('Internship', back_populates='company_profile')
    mentorship_programs: Mapped[List['MentorshipProgram']] = relationship('MentorshipProgram',
                                                                          back_populates='company_profile')
    career_events: Mapped[List['CareerEvent']] = relationship('CareerEvent', back_populates='company_profile')
