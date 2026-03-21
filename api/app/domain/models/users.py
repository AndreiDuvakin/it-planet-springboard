from datetime import date
from typing import List

from sqlalchemy import String, Date, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class User(RootTable):
    __tablename__ = 'users'

    first_name: Mapped[str] = mapped_column(String(250), nullable=False)
    last_name: Mapped[str] = mapped_column(String(250), nullable=False)
    patronymic: Mapped[str] = mapped_column(String(250), nullable=True)
    birthdate: Mapped[date] = mapped_column(Date, nullable=False)
    login: Mapped[str] = mapped_column(String(250), nullable=False, unique=True)
    email: Mapped[str] = mapped_column(String(250), unique=True, nullable=True)
    password_hash: Mapped[str] = mapped_column(nullable=False)

    role_id: Mapped[int] = mapped_column(ForeignKey('roles.id'), nullable=False)

    role: Mapped['Role'] = relationship('Role', back_populates='users', lazy='joined')
    applicant_profile: Mapped['ApplicantProfile'] = relationship('ApplicantProfile', back_populates='user',
                                                                 uselist=False)
    created_companies: Mapped[List['CompanyProfile']] = relationship('CompanyProfile', back_populates='creator')
