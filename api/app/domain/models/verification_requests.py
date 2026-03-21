from sqlalchemy import Boolean, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class VerificationRequest(RootTable):
    __tablename__ = 'verification_requests'

    is_accepted: Mapped[bool] = mapped_column(Boolean, nullable=False, default=False)

    company_id: Mapped[int] = mapped_column(ForeignKey('company_profiles.id'), nullable=False)

    company_profile: Mapped['CompanyProfile'] = relationship('CompanyProfile', back_populates='verification_requests')
