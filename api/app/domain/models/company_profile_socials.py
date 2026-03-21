from sqlalchemy import String, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class CompanyProfileSocial(RootTable):
    __tablename__ = 'company_profile_socials'

    title: Mapped[str] = mapped_column(String(100), nullable=False)
    link: Mapped[str] = mapped_column(String(500), nullable=False)

    company_id: Mapped[int] = mapped_column(ForeignKey('company_profiles.id'), nullable=False)

    company_profile: Mapped['CompanyProfile'] = relationship('CompanyProfile', back_populates='socials')
