from sqlalchemy import String, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.domain.models.base import RootTable


class ApplicantSkill(RootTable):
    __tablename__ = 'applicant_skills'

    level_id: Mapped[int] = mapped_column(ForeignKey('experience_levels.id'), nullable=False)
    tag_id: Mapped[int] = mapped_column(ForeignKey('applicant_skill_tags.id'), nullable=False)
    applicant_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)

    tag: Mapped['ApplicantSkillTag'] = relationship('ApplicantSkillTag', back_populates='skills')
    level: Mapped['ExperienceLevel'] = relationship('ExperienceLevel', back_populates='skills')
    applicant_profile: Mapped['ApplicantProfile'] = relationship('ApplicantProfile', back_populates='skills')
