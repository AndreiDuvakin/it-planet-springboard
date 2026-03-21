from typing import List

from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class ApplicantContactStatus(RootTable):
    __tablename__ = 'applicant_contact_statuses'

    title: Mapped[str] = mapped_column(String(100), nullable=False)

    contacts: Mapped[List['ApplicantContact']] = relationship('ApplicantContact', back_populates='status')

