from datetime import datetime

from sqlalchemy import String, Text, DateTime, Boolean, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class MentorshipProgram(RootTable):
    __tablename__ = 'mentorship_programs'

    title: Mapped[str] = mapped_column(String(250), nullable=False)
    description: Mapped[str] = mapped_column(Text, nullable=True)
    media_url: Mapped[str] = mapped_column(String(500), nullable=True)
    address: Mapped[str] = mapped_column(String(500), nullable=True)
    published_at: Mapped[datetime] = mapped_column(DateTime, nullable=False)
    is_active: Mapped[bool] = mapped_column(Boolean, nullable=False, default=True)
    moderation_comment: Mapped[str] = mapped_column(Text, nullable=True)
    mentor_name: Mapped[str] = mapped_column(String(250), nullable=True)
    focus_area: Mapped[str] = mapped_column(String(250), nullable=True)
    selection_criteria: Mapped[str] = mapped_column(Text, nullable=True)

    company_id: Mapped[int] = mapped_column(ForeignKey('company_profiles.id'), nullable=False)
    moderation_status_id: Mapped[int] = mapped_column(ForeignKey('moderation_statuses.id'), nullable=False)
    location_id: Mapped[int] = mapped_column(ForeignKey('location_coordinates.id'), nullable=False)

    company_profile: Mapped['CompanyProfile'] = relationship('CompanyProfile', back_populates='mentorship_programs')
    moderation_status: Mapped['ModerationStatus'] = relationship('ModerationStatus')
    location: Mapped['LocationCoordinate'] = relationship('LocationCoordinate', back_populates='mentorship_programs')

