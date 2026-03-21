from typing import List

from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class LocationCoordinate(RootTable):
    __tablename__ = 'location_coordinates'

    latitude: Mapped[float] = mapped_column(nullable=False)
    longitude: Mapped[float] = mapped_column(nullable=False)

    vacancies: Mapped[List['Vacancy']] = relationship('Vacancy', back_populates='location')
    internships: Mapped[List['Internship']] = relationship('Internship', back_populates='location')
    mentorship_programs: Mapped[List['MentorshipProgram']] = relationship('MentorshipProgram',
                                                                          back_populates='location')
    career_events: Mapped[List['CareerEvent']] = relationship('CareerEvent', back_populates='location')

