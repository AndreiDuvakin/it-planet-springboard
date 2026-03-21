from datetime import datetime

from sqlalchemy import String, Text, DateTime, Boolean, Integer, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class Internship(RootTable):
    __tablename__ = 'internships'

    title: Mapped[str] = mapped_column(String(250), nullable=False)
    description: Mapped[str] = mapped_column(Text, nullable=True)
    media_url: Mapped[str] = mapped_column(String(500), nullable=True)
    address: Mapped[str] = mapped_column(String(500), nullable=True)
    published_at: Mapped[datetime] = mapped_column(DateTime, nullable=False)
    is_active: Mapped[bool] = mapped_column(Boolean, nullable=False, default=True)
    moderation_comment: Mapped[str] = mapped_column(Text, nullable=True)
    duration_months: Mapped[int] = mapped_column(Integer, nullable=False)
    is_paid: Mapped[bool] = mapped_column(Boolean, nullable=False, default=False)
    mentorship_available: Mapped[bool] = mapped_column(Boolean, nullable=False, default=False)
    expires_at: Mapped[datetime] = mapped_column(DateTime, nullable=True)

    company_id: Mapped[int] = mapped_column(ForeignKey('company_profiles.id'), nullable=False)
    moderation_status_id: Mapped[int] = mapped_column(ForeignKey('moderation_statuses.id'), nullable=False)
    experience_level_id: Mapped[int] = mapped_column(ForeignKey('experience_levels.id'), nullable=False)
    work_format_id: Mapped[int] = mapped_column(ForeignKey('work_formats.id'), nullable=False)
    location_id: Mapped[int] = mapped_column(ForeignKey('location_coordinates.id'), nullable=False)

    company_profile: Mapped['CompanyProfile'] = relationship('CompanyProfile', back_populates='internships')
    moderation_status: Mapped['ModerationStatus'] = relationship('ModerationStatus')
    experience_level: Mapped['ExperienceLevel'] = relationship('ExperienceLevel')
    work_format: Mapped['WorkFormat'] = relationship('WorkFormat')
    location: Mapped['LocationCoordinate'] = relationship('LocationCoordinate', back_populates='internships')
