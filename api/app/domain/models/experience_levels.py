from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column

from app.domain.models.base import RootTable


class ExperienceLevel(RootTable):
    __tablename__ = 'experience_levels'

    title: Mapped[str] = mapped_column(String(100), nullable=False)
