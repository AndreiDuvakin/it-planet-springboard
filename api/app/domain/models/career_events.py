from datetime import datetime

from sqlalchemy import String, Text, DateTime, Boolean, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class CareerEvent(RootTable):
    __tablename__ = 'career_events'

    title: Mapped[str] = mapped_column(String(250), nullable=False)
    description: Mapped[str] = mapped_column(Text, nullable=True)
    media_url: Mapped[str] = mapped_column(String(500), nullable=True)
    address: Mapped[str] = mapped_column(String(500), nullable=True)
    published_at: Mapped[datetime] = mapped_column(DateTime, nullable=False)
    is_active: Mapped[bool] = mapped_column(Boolean, nullable=False, default=True)
    moderation_comment: Mapped[str] = mapped_column(Text, nullable=True)
    event_date: Mapped[datetime] = mapped_column(DateTime, nullable=False)
    registration_link: Mapped[str] = mapped_column(String(500), nullable=True)
    is_online: Mapped[bool] = mapped_column(Boolean, nullable=False, default=False)

    event_type_id: Mapped[int] = mapped_column(ForeignKey('event_types.id'), nullable=False)
    company_id: Mapped[int] = mapped_column(ForeignKey('company_profiles.id'), nullable=False)
    moderation_status_id: Mapped[int] = mapped_column(ForeignKey('moderation_statuses.id'), nullable=False)
    location_id: Mapped[int] = mapped_column(ForeignKey('location_coordinates.id'), nullable=False)

    event_type: Mapped['EventType'] = relationship('EventType', back_populates='career_events')
    company_profile: Mapped['CompanyProfile'] = relationship('CompanyProfile', back_populates='career_events')
    moderation_status: Mapped['ModerationStatus'] = relationship('ModerationStatus')
    location: Mapped['LocationCoordinate'] = relationship('LocationCoordinate', back_populates='career_events')
