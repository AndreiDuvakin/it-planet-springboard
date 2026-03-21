from typing import List

from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class Industry(RootTable):
    __tablename__ = 'industries'

    title: Mapped[str] = mapped_column(String(150), nullable=False)

    companies: Mapped[List['CompanyProfile']] = relationship('CompanyProfile', back_populates='industry')
