from typing import List

from sqlalchemy import Text, String, ForeignKey
from sqlalchemy.orm import mapped_column, Mapped, relationship

from app.domain.models import ApplicantContact, ApplicantContactRecommendation
from app.domain.models.base import RootTable


class ApplicantProfile(RootTable):
    __tablename__ = 'applicant_profiles'

    resume_html: Mapped[str] = mapped_column(Text, nullable=True)
    resume_url: Mapped[str] = mapped_column(String(500), nullable=True)

    university_id: Mapped[int] = mapped_column(ForeignKey('universities.id'), nullable=True)
    user_id: Mapped[int] = mapped_column(ForeignKey('users.id'), nullable=False)

    user: Mapped['User'] = relationship('User', back_populates='applicant_profile', uselist=False)
    university: Mapped['University'] = relationship('University', back_populates='applicant_profiles')

    educations: Mapped[List['ApplicantEducation']] = relationship('ApplicantEducation',
                                                                  back_populates='applicant_profile')
    resume_files: Mapped[List['ApplicantResumeFile']] = relationship('ApplicantResumeFile',
                                                                     back_populates='applicant_profile')
    resume_links: Mapped[List['ApplicantResumeLink']] = relationship('ApplicantResumeLink',
                                                                     back_populates='applicant_profile')
    resume_projects: Mapped[List['ApplicantResumeProject']] = relationship('ApplicantResumeProject',
                                                                           back_populates='applicant_profile')
    experiences: Mapped[List['ApplicantExperience']] = relationship('ApplicantExperience',
                                                                    back_populates='applicant_profile')
    skills: Mapped[List['ApplicantSkill']] = relationship('ApplicantSkill', back_populates='applicant_profile')
    favorite_companies: Mapped[List['ApplicantFavoriteCompany']] = relationship('ApplicantFavoriteCompany',
                                                                                back_populates='applicant_profile')
    sent_contacts: Mapped[List['ApplicantContact']] = relationship(
        'ApplicantContact', back_populates='sender', foreign_keys=[ApplicantContact.sender_id]
    )
    received_contacts: Mapped[List['ApplicantContact']] = relationship(
        'ApplicantContact', back_populates='receiver', foreign_keys=[ApplicantContact.receiver_id]
    )
    sent_recommendations: Mapped[List['ApplicantContactRecommendation']] = relationship(
        'ApplicantContactRecommendation', back_populates='recommender',
        foreign_keys=[ApplicantContactRecommendation.recommender_id]
    )
    received_recommendations: Mapped[List['ApplicantContactRecommendation']] = relationship(
        'ApplicantContactRecommendation', back_populates='recipient',
        foreign_keys=[ApplicantContactRecommendation.recipient_id]
    )
    vacancy_applications: Mapped[List['VacancyApplication']] = relationship('VacancyApplication',
                                                                            back_populates='applicant_profile')
