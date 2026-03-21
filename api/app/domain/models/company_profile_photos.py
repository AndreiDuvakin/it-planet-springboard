from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column

from app.domain.models.base import RootTable


class CompanyProfilePhoto(RootTable):
    __tablename__ = 'company_profile_photos'

    filename: Mapped[str] = mapped_column(String(250), nullable=False)
    path: Mapped[str] = mapped_column(String(500), nullable=False)
    url: Mapped[str] = mapped_column(String(500), nullable=True)

