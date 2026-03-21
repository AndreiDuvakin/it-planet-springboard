from sqlalchemy import ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class ApplicantContact(RootTable):
    __tablename__ = 'applicant_contacts'

    sender_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)
    receiver_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)
    status_id: Mapped[int] = mapped_column(ForeignKey('applicant_contact_statuses.id'), nullable=False)

    sender: Mapped['ApplicantProfile'] = relationship(
        'ApplicantProfile', back_populates='sent_contacts', foreign_keys=[sender_id]
    )
    receiver: Mapped['ApplicantProfile'] = relationship(
        'ApplicantProfile', back_populates='received_contacts', foreign_keys=[receiver_id]
    )
    status: Mapped['ApplicantContactStatus'] = relationship('ApplicantContactStatus', back_populates='contacts')

