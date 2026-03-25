from sqlalchemy import MetaData
from sqlalchemy.orm import DeclarativeBase

from app.settings import Settings

metadata_obj = MetaData(schema=Settings().db_schema)


class Base(DeclarativeBase):
    metadata = metadata_obj


from app.domain.models.applicant_contact_recommendations import ApplicantContactRecommendation
from app.domain.models.applicant_contact_statuses import ApplicantContactStatus
from app.domain.models.applicant_contacts import ApplicantContact
from app.domain.models.applicant_educations import ApplicantEducation
from app.domain.models.applicant_experiences import ApplicantExperience
from app.domain.models.applicant_favorite_companies import ApplicantFavoriteCompany
from app.domain.models.applicant_profiles import ApplicantProfile
from app.domain.models.applicant_resume_files import ApplicantResumeFile
from app.domain.models.applicant_resume_links import ApplicantResumeLink
from app.domain.models.applicant_resume_projects import ApplicantResumeProject
from app.domain.models.applicant_skill_tags import ApplicantSkillTag
from app.domain.models.applicant_skills import ApplicantSkill
from app.domain.models.career_events import CareerEvent
from app.domain.models.company_profile_logos import CompanyProfileLogo
from app.domain.models.company_profile_photos import CompanyProfilePhoto
from app.domain.models.company_profile_socials import CompanyProfileSocial
from app.domain.models.company_profiles import CompanyProfile
from app.domain.models.employment_types import EmploymentType
from app.domain.models.event_types import EventType
from app.domain.models.experience_levels import ExperienceLevel
from app.domain.models.industries import Industry
from app.domain.models.internships import Internship
from app.domain.models.location_coordinates import LocationCoordinate
from app.domain.models.mentorship_programs import MentorshipProgram
from app.domain.models.moderation_statuses import ModerationStatus
from app.domain.models.roles import Role
from app.domain.models.universities import University
from app.domain.models.users import User
from app.domain.models.vacancies import Vacancy
from app.domain.models.vacancy_applications import VacancyApplication
from app.domain.models.verification_requests import VerificationRequest
from app.domain.models.work_formats import WorkFormat
