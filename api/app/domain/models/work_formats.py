from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column

from app.domain.models.base import RootTable


class WorkFormat(RootTable):
    __tablename__ = 'work_formats'

    title: Mapped[str] = mapped_column(String(100), nullable=False)
