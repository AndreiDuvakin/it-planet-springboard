from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column

from app.domain.models.base import RootTable


class EmploymentType(RootTable):
    __tablename__ = 'employment_types'

    title: Mapped[str] = mapped_column(String(100), nullable=False)
