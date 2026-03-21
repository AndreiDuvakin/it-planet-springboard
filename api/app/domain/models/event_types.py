from typing import List

from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class EventType(RootTable):
    __tablename__ = 'event_types'

    title: Mapped[str] = mapped_column(String(100), nullable=False)

    career_events: Mapped[List['CareerEvent']] = relationship('CareerEvent', back_populates='event_type')
