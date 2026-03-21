from datetime import datetime
from typing import List

from sqlalchemy import String, Text, DateTime, Boolean, Integer, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class Vacancy(RootTable):
    __tablename__ = 'vacancies'

    title: Mapped[str] = mapped_column(String(250), nullable=False)
    description: Mapped[str] = mapped_column(Text, nullable=True)
    media_url: Mapped[str] = mapped_column(String(500), nullable=True)
    address: Mapped[str] = mapped_column(String(500), nullable=True)
    published_at: Mapped[datetime] = mapped_column(DateTime, nullable=False)
    is_active: Mapped[bool] = mapped_column(Boolean, nullable=False, default=True)
    moderation_comment: Mapped[str] = mapped_column(Text, nullable=True)
    expires_at: Mapped[datetime] = mapped_column(DateTime, nullable=True)
    salary_min: Mapped[int] = mapped_column(Integer, nullable=True)
    salary_max: Mapped[int] = mapped_column(Integer, nullable=True)

    company_id: Mapped[int] = mapped_column(ForeignKey('company_profiles.id'), nullable=False)
    work_format_id: Mapped[int] = mapped_column(ForeignKey('work_formats.id'), nullable=False)
    employment_type_id: Mapped[int] = mapped_column(ForeignKey('employment_types.id'), nullable=False)
    experience_level_id: Mapped[int] = mapped_column(ForeignKey('experience_levels.id'), nullable=False)
    moderation_status_id: Mapped[int] = mapped_column(ForeignKey('moderation_statuses.id'), nullable=False)
    location_id: Mapped[int] = mapped_column(ForeignKey('location_coordinates.id'), nullable=False)

    company_profile: Mapped['CompanyProfile'] = relationship('CompanyProfile', back_populates='vacancies')
    work_format: Mapped['WorkFormat'] = relationship('WorkFormat')
    employment_type: Mapped['EmploymentType'] = relationship('EmploymentType')
    experience_level: Mapped['ExperienceLevel'] = relationship('ExperienceLevel')
    moderation_status: Mapped['ModerationStatus'] = relationship('ModerationStatus')
    location: Mapped['LocationCoordinate'] = relationship('LocationCoordinate', back_populates='vacancies')
    applications: Mapped[List['VacancyApplication']] = relationship('VacancyApplication', back_populates='vacancy')
