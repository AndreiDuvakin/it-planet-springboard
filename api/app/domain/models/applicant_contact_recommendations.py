
from sqlalchemy import ForeignKey, Text
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class ApplicantContactRecommendation(RootTable):
    __tablename__ = 'applicant_contact_recommendations'

    message: Mapped[str] = mapped_column(Text, nullable=False)

    recommender_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)
    recipient_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)

    recommender: Mapped['ApplicantProfile'] = relationship(
        'ApplicantProfile', back_populates='sent_recommendations', foreign_keys=[recommender_id]
    )
    recipient: Mapped['ApplicantProfile'] = relationship(
        'ApplicantProfile', back_populates='received_recommendations', foreign_keys=[recipient_id]
    )
