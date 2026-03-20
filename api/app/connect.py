from sqlalchemy import create_engine, Column, Integer, String, ForeignKey, Boolean, Float, DateTime, func
from sqlalchemy.orm import sessionmaker, declarative_base

# from werkzeug.security import generate_password_hash, check_password_hash

__factory = None
base = declarative_base()
from datetime import date, datetime
from typing import List

from sqlalchemy import Boolean, Date, DateTime, ForeignKey, Integer, String, Text
from sqlalchemy.orm import Mapped, mapped_column, relationship


class RootTable(base):
    __abstract__ = True

    id: Mapped[int] = mapped_column(primary_key=True, autoincrement=True)
    created_at: Mapped[datetime] = mapped_column(server_default=func.now())
    updated_at: Mapped[datetime] = mapped_column(onupdate=func.now(), server_default=func.now())


class Role(RootTable):
    __tablename__ = 'roles'

    title: Mapped[str] = mapped_column(String(150), unique=True, nullable=False)

    users: Mapped[List['User']] = relationship('User', back_populates='role')


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


class University(RootTable):
    __tablename__ = 'universities'

    title: Mapped[str] = mapped_column(String(300), nullable=False)

    applicant_profiles: Mapped[List['ApplicantProfile']] = relationship('ApplicantProfile', back_populates='university')
    educations: Mapped[List['ApplicantEducation']] = relationship('ApplicantEducation', back_populates='university')


class ApplicantProfile(RootTable):
    __tablename__ = 'applicant_profiles'

    resume_html: Mapped[str] = mapped_column(Text, nullable=True)
    resume_url: Mapped[str] = mapped_column(String(500), nullable=True)

    university_id: Mapped[int] = mapped_column(ForeignKey('universities.id'), nullable=True)
    user_id: Mapped[int] = mapped_column(ForeignKey('users.id'), nullable=False)

    user: Mapped['User'] = relationship('User', back_populates='applicant_profile', uselist=False)
    university: Mapped['University'] = relationship('University', back_populates='applicant_profiles')

    educations: Mapped[List['ApplicantEducation']] = relationship('ApplicantEducation',
                                                                  back_populates='applicant_profile')
    resume_files: Mapped[List['ApplicantResumeFile']] = relationship('ApplicantResumeFile',
                                                                     back_populates='applicant_profile')
    resume_links: Mapped[List['ApplicantResumeLink']] = relationship('ApplicantResumeLink',
                                                                     back_populates='applicant_profile')
    resume_projects: Mapped[List['ApplicantResumeProject']] = relationship('ApplicantResumeProject',
                                                                           back_populates='applicant_profile')
    experiences: Mapped[List['ApplicantExperience']] = relationship('ApplicantExperience',
                                                                    back_populates='applicant_profile')
    skills: Mapped[List['ApplicantSkill']] = relationship('ApplicantSkill', back_populates='applicant_profile')
    favorite_companies: Mapped[List['ApplicantFavoriteCompany']] = relationship('ApplicantFavoriteCompany',
                                                                                back_populates='applicant_profile')
    sent_contacts: Mapped[List['ApplicantContact']] = relationship(
        'ApplicantContact', back_populates='sender', foreign_keys=['ApplicantContact.sender_id']
    )
    received_contacts: Mapped[List['ApplicantContact']] = relationship(
        'ApplicantContact', back_populates='receiver', foreign_keys=['ApplicantContact.receiver_id']
    )
    sent_recommendations: Mapped[List['ApplicantContactRecommendation']] = relationship(
        'ApplicantContactRecommendation', back_populates='recommender',
        foreign_keys=['ApplicantContactRecommendation.recommender_id']
    )
    received_recommendations: Mapped[List['ApplicantContactRecommendation']] = relationship(
        'ApplicantContactRecommendation', back_populates='recipient',
        foreign_keys=['ApplicantContactRecommendation.recipient_id']
    )
    vacancy_applications: Mapped[List['VacancyApplication']] = relationship('VacancyApplication',
                                                                            back_populates='applicant_profile')


class ApplicantEducation(RootTable):
    __tablename__ = 'applicant_educations'

    start_education_year: Mapped[int] = mapped_column(Integer, nullable=False)
    end_education_year: Mapped[int] = mapped_column(Integer, nullable=True)
    specialization: Mapped[str] = mapped_column(String(300), nullable=False)
    is_in_the_learning: Mapped[bool] = mapped_column(Boolean, nullable=False)  # column name cleaned from diagram

    applicant_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)
    university_id: Mapped[int] = mapped_column(ForeignKey('universities.id'), nullable=False)

    applicant_profile: Mapped['ApplicantProfile'] = relationship('ApplicantProfile', back_populates='educations')
    university: Mapped['University'] = relationship('University', back_populates='educations')


class ApplicantResumeFile(RootTable):
    __tablename__ = 'applicant_resume_files'

    title: Mapped[str] = mapped_column(String(250), nullable=False)
    filename: Mapped[str] = mapped_column(String(250), nullable=False)
    file_path: Mapped[str] = mapped_column(String(500), nullable=False)

    applicant_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)

    applicant_profile: Mapped['ApplicantProfile'] = relationship('ApplicantProfile', back_populates='resume_files')


class ApplicantResumeLink(RootTable):
    __tablename__ = 'applicant_resume_links'

    title: Mapped[str] = mapped_column(String(250), nullable=False)
    link: Mapped[str] = mapped_column(String(500), nullable=False)

    applicant_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)

    applicant_profile: Mapped['ApplicantProfile'] = relationship('ApplicantProfile', back_populates='resume_links')


class ApplicantResumeProject(RootTable):
    __tablename__ = 'applicant_resume_projects'

    title: Mapped[str] = mapped_column(String(250), nullable=False)
    description: Mapped[str] = mapped_column(Text, nullable=True)
    link: Mapped[str] = mapped_column(String(500), nullable=True)
    repository_url: Mapped[str] = mapped_column(String(500), nullable=True)

    applicant_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)

    applicant_profile: Mapped['ApplicantProfile'] = relationship('ApplicantProfile', back_populates='resume_projects')


class ApplicantExperience(RootTable):
    __tablename__ = 'applicant_experiences'

    company_name: Mapped[str] = mapped_column(String(250), nullable=False)
    description: Mapped[str] = mapped_column(Text, nullable=True)
    start_date: Mapped[date] = mapped_column(Date, nullable=False)
    end_date: Mapped[date] = mapped_column(Date, nullable=True)

    applicant_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)

    applicant_profile: Mapped['ApplicantProfile'] = relationship('ApplicantProfile', back_populates='experiences')


class ApplicantSkillTagCategory(RootTable):
    __tablename__ = 'applicant_skill_tag_catogories'  # exact table name from diagram

    title: Mapped[str] = mapped_column(String(150), nullable=False)

    tags: Mapped[List['ApplicantSkillTag']] = relationship('ApplicantSkillTag', back_populates='category')


class ApplicantSkillTag(RootTable):
    __tablename__ = 'applicant_skill_tags'

    title: Mapped[str] = mapped_column(String(150), nullable=False)

    category_id: Mapped[int] = mapped_column(ForeignKey('applicant_skill_tag_catogories.id'), nullable=False)

    category: Mapped['ApplicantSkillTagCategory'] = relationship('ApplicantSkillTagCategory', back_populates='tags')
    skills: Mapped[List['ApplicantSkill']] = relationship('ApplicantSkill', back_populates='tag')


class ApplicantSkill(RootTable):
    __tablename__ = 'applicant_skills'

    level: Mapped[str] = mapped_column(String(50), nullable=False)  # e.g. "beginner", "advanced"

    tag_id: Mapped[int] = mapped_column(ForeignKey('applicant_skill_tags.id'), nullable=False)
    applicant_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)

    tag: Mapped['ApplicantSkillTag'] = relationship('ApplicantSkillTag', back_populates='skills')
    applicant_profile: Mapped['ApplicantProfile'] = relationship('ApplicantProfile', back_populates='skills')


class ApplicantContactStatus(RootTable):
    __tablename__ = 'applicant_contact_statuses'

    title: Mapped[str] = mapped_column(String(100), nullable=False)

    contacts: Mapped[List['ApplicantContact']] = relationship('ApplicantContact', back_populates='status')


class ApplicantContact(RootTable):
    __tablename__ = 'applicant_contacts'

    sender_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)
    receiver_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)
    status_id: Mapped[int] = mapped_column(ForeignKey('applicant_contact_statuses.id'), nullable=False)

    sender: Mapped['ApplicantProfile'] = relationship(
        'ApplicantProfile', back_populates='sent_contacts', foreign_keys=[sender_id]
    )
    receiver: Mapped['ApplicantProfile'] = relationship(
        'ApplicantProfile', back_populates='received_contacts', foreign_keys=[receiver_id]
    )
    status: Mapped['ApplicantContactStatus'] = relationship('ApplicantContactStatus', back_populates='contacts')


class ApplicantContactRecommendation(RootTable):
    __tablename__ = 'applicant_contact_recomendations'  # exact table name from diagram

    message: Mapped[str] = mapped_column(Text, nullable=False)

    recommender_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)
    recipient_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)

    recommender: Mapped['ApplicantProfile'] = relationship(
        'ApplicantProfile', back_populates='sent_recommendations', foreign_keys=[recommender_id]
    )
    recipient: Mapped['ApplicantProfile'] = relationship(
        'ApplicantProfile', back_populates='received_recommendations', foreign_keys=[recipient_id]
    )


class Industry(RootTable):
    __tablename__ = 'industries'

    title: Mapped[str] = mapped_column(String(150), nullable=False)

    companies: Mapped[List['CompanyProfile']] = relationship('CompanyProfile', back_populates='industry')


class CompanyProfileLogo(RootTable):
    __tablename__ = 'company_profile_logos'

    filename: Mapped[str] = mapped_column(String(250), nullable=False)
    path: Mapped[str] = mapped_column(String(500), nullable=False)
    url: Mapped[str] = mapped_column(String(500), nullable=True)


class CompanyProfilePhoto(RootTable):
    __tablename__ = 'company_profile_photos'

    filename: Mapped[str] = mapped_column(String(250), nullable=False)
    path: Mapped[str] = mapped_column(String(500), nullable=False)
    url: Mapped[str] = mapped_column(String(500), nullable=True)


class CompanyProfile(RootTable):
    __tablename__ = 'company_profiles'

    title: Mapped[str] = mapped_column(String(250), nullable=False)
    description: Mapped[str] = mapped_column(Text, nullable=True)
    website_url: Mapped[str] = mapped_column(String(500), nullable=True)
    inn: Mapped[str] = mapped_column(String(50), nullable=True)
    corporate_email: Mapped[str] = mapped_column(String(250), nullable=True)
    video_url: Mapped[str] = mapped_column(String(500), nullable=True)
    is_verified: Mapped[bool] = mapped_column(Boolean, nullable=False, default=False)

    logo_id: Mapped[int] = mapped_column(ForeignKey('company_profile_logos.id'), nullable=True)
    official_photo_id: Mapped[int] = mapped_column(ForeignKey('company_profile_photos.id'),
                                                   nullable=True)  # fixed spelling
    creator_user_id: Mapped[int] = mapped_column(ForeignKey('users.id'), nullable=False)
    industry_id: Mapped[int] = mapped_column(ForeignKey('industries.id'), nullable=False)

    logo: Mapped['CompanyProfileLogo'] = relationship('CompanyProfileLogo')
    official_photo: Mapped['CompanyProfilePhoto'] = relationship('CompanyProfilePhoto')
    creator: Mapped['User'] = relationship('User', back_populates='created_companies')
    industry: Mapped['Industry'] = relationship('Industry', back_populates='companies')

    socials: Mapped[List['CompanyProfileSocial']] = relationship('CompanyProfileSocial',
                                                                 back_populates='company_profile')
    verification_requests: Mapped[List['VerificationRequest']] = relationship('VerificationRequest',
                                                                              back_populates='company_profile')
    favorite_by_applicants: Mapped[List['ApplicantFavoriteCompany']] = relationship('ApplicantFavoriteCompany',
                                                                                    back_populates='company_profile')
    vacancies: Mapped[List['Vacancy']] = relationship('Vacancy', back_populates='company_profile')
    internships: Mapped[List['Internship']] = relationship('Internship', back_populates='company_profile')
    mentorship_programs: Mapped[List['MentorshipProgram']] = relationship('MentorshipProgram',
                                                                          back_populates='company_profile')
    career_events: Mapped[List['CareerEvent']] = relationship('CareerEvent', back_populates='company_profile')


class CompanyProfileSocial(RootTable):
    __tablename__ = 'company_profile_socials'

    title: Mapped[str] = mapped_column(String(100), nullable=False)
    link: Mapped[str] = mapped_column(String(500), nullable=False)

    company_id: Mapped[int] = mapped_column(ForeignKey('company_profiles.id'), nullable=False)

    company_profile: Mapped['CompanyProfile'] = relationship('CompanyProfile', back_populates='socials')


class VerificationRequest(RootTable):
    __tablename__ = 'verification_requests'

    is_accepted: Mapped[bool] = mapped_column(Boolean, nullable=False, default=False)

    company_id: Mapped[int] = mapped_column(ForeignKey('company_profiles.id'), nullable=False)

    company_profile: Mapped['CompanyProfile'] = relationship('CompanyProfile', back_populates='verification_requests')


class ApplicantFavoriteCompany(RootTable):
    __tablename__ = 'applicant_favorite_companies'

    applicant_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)
    company_id: Mapped[int] = mapped_column(ForeignKey('company_profiles.id'), nullable=False)

    applicant_profile: Mapped['ApplicantProfile'] = relationship('ApplicantProfile',
                                                                 back_populates='favorite_companies')
    company_profile: Mapped['CompanyProfile'] = relationship('CompanyProfile', back_populates='favorite_by_applicants')


class ExperienceLevel(RootTable):
    __tablename__ = 'experience_levels'

    title: Mapped[str] = mapped_column(String(100), nullable=False)


class WorkFormat(RootTable):
    __tablename__ = 'work_formats'

    title: Mapped[str] = mapped_column(String(100), nullable=False)


class EmploymentType(RootTable):
    __tablename__ = 'employment_types'

    title: Mapped[str] = mapped_column(String(100), nullable=False)


class ModerationStatus(RootTable):
    __tablename__ = 'moderation_statuses'

    title: Mapped[str] = mapped_column(String(100), nullable=False)


class LocationCoordinate(RootTable):
    __tablename__ = 'location_coordinates'

    latitude: Mapped[float] = mapped_column(nullable=False)
    longitude: Mapped[float] = mapped_column(nullable=False)

    # relationships to all entities that use location_id
    vacancies: Mapped[List['Vacancy']] = relationship('Vacancy', back_populates='location')
    internships: Mapped[List['Internship']] = relationship('Internship', back_populates='location')
    mentorship_programs: Mapped[List['MentorshipProgram']] = relationship('MentorshipProgram',
                                                                          back_populates='location')
    career_events: Mapped[List['CareerEvent']] = relationship('CareerEvent', back_populates='location')


class EventType(RootTable):
    __tablename__ = 'event_types'

    title: Mapped[str] = mapped_column(String(100), nullable=False)

    career_events: Mapped[List['CareerEvent']] = relationship('CareerEvent', back_populates='event_type')


class CareerEvent(RootTable):
    __tablename__ = 'career_events'

    title: Mapped[str] = mapped_column(String(250), nullable=False)
    description: Mapped[str] = mapped_column(Text, nullable=True)
    media_url: Mapped[str] = mapped_column(String(500), nullable=True)
    address: Mapped[str] = mapped_column(String(500), nullable=True)
    published_at: Mapped[datetime] = mapped_column(DateTime, nullable=False)
    is_active: Mapped[bool] = mapped_column(Boolean, nullable=False, default=True)
    moderation_comment: Mapped[str] = mapped_column(Text, nullable=True)
    event_date: Mapped[datetime] = mapped_column(DateTime, nullable=False)
    registration_link: Mapped[str] = mapped_column(String(500), nullable=True)
    is_online: Mapped[bool] = mapped_column(Boolean, nullable=False, default=False)

    event_type_id: Mapped[int] = mapped_column(ForeignKey('event_types.id'), nullable=False)
    company_id: Mapped[int] = mapped_column(ForeignKey('company_profiles.id'), nullable=False)
    moderation_status_id: Mapped[int] = mapped_column(ForeignKey('moderation_statuses.id'), nullable=False)
    location_id: Mapped[int] = mapped_column(ForeignKey('location_coordinates.id'), nullable=False)

    event_type: Mapped['EventType'] = relationship('EventType', back_populates='career_events')
    company_profile: Mapped['CompanyProfile'] = relationship('CompanyProfile', back_populates='career_events')
    moderation_status: Mapped['ModerationStatus'] = relationship('ModerationStatus')
    location: Mapped['LocationCoordinate'] = relationship('LocationCoordinate', back_populates='career_events')


class Vacancy(RootTable):
    __tablename__ = 'vacancies'

    title: Mapped[str] = mapped_column(String(250), nullable=False)
    description: Mapped[str] = mapped_column(Text, nullable=True)
    media_url: Mapped[str] = mapped_column(String(500), nullable=True)
    address: Mapped[str] = mapped_column(String(500), nullable=True)
    published_at: Mapped[datetime] = mapped_column(DateTime, nullable=False)
    is_active: Mapped[bool] = mapped_column(Boolean, nullable=False, default=True)
    moderation_comment: Mapped[str] = mapped_column(Text, nullable=True)
    expires_at: Mapped[datetime] = mapped_column(DateTime, nullable=True)
    salary_min: Mapped[int] = mapped_column(Integer, nullable=True)
    salary_max: Mapped[int] = mapped_column(Integer, nullable=True)

    company_id: Mapped[int] = mapped_column(ForeignKey('company_profiles.id'), nullable=False)
    work_format_id: Mapped[int] = mapped_column(ForeignKey('work_formats.id'), nullable=False)
    employment_type_id: Mapped[int] = mapped_column(ForeignKey('employment_types.id'), nullable=False)
    experience_level_id: Mapped[int] = mapped_column(ForeignKey('experience_levels.id'), nullable=False)
    moderation_status_id: Mapped[int] = mapped_column(ForeignKey('moderation_statuses.id'), nullable=False)
    location_id: Mapped[int] = mapped_column(ForeignKey('location_coordinates.id'), nullable=False)

    company_profile: Mapped['CompanyProfile'] = relationship('CompanyProfile', back_populates='vacancies')
    work_format: Mapped['WorkFormat'] = relationship('WorkFormat')
    employment_type: Mapped['EmploymentType'] = relationship('EmploymentType')
    experience_level: Mapped['ExperienceLevel'] = relationship('ExperienceLevel')
    moderation_status: Mapped['ModerationStatus'] = relationship('ModerationStatus')
    location: Mapped['LocationCoordinate'] = relationship('LocationCoordinate', back_populates='vacancies')
    applications: Mapped[List['VacancyApplication']] = relationship('VacancyApplication', back_populates='vacancy')


class VacancyApplication(RootTable):
    __tablename__ = 'vacancy_applications'

    cover_letter: Mapped[str] = mapped_column(Text, nullable=True)
    employer_note: Mapped[str] = mapped_column(Text, nullable=True)

    vacancy_id: Mapped[int] = mapped_column(ForeignKey('vacancies.id'), nullable=False)
    applicant_id: Mapped[int] = mapped_column(ForeignKey('applicant_profiles.id'), nullable=False)

    vacancy: Mapped['Vacancy'] = relationship('Vacancy', back_populates='applications')
    applicant_profile: Mapped['ApplicantProfile'] = relationship('ApplicantProfile',
                                                                 back_populates='vacancy_applications')


class Internship(RootTable):
    __tablename__ = 'internships'

    title: Mapped[str] = mapped_column(String(250), nullable=False)
    description: Mapped[str] = mapped_column(Text, nullable=True)
    media_url: Mapped[str] = mapped_column(String(500), nullable=True)
    address: Mapped[str] = mapped_column(String(500), nullable=True)
    published_at: Mapped[datetime] = mapped_column(DateTime, nullable=False)
    is_active: Mapped[bool] = mapped_column(Boolean, nullable=False, default=True)
    moderation_comment: Mapped[str] = mapped_column(Text, nullable=True)
    duration_months: Mapped[int] = mapped_column(Integer, nullable=False)
    is_paid: Mapped[bool] = mapped_column(Boolean, nullable=False, default=False)
    mentorship_available: Mapped[bool] = mapped_column(Boolean, nullable=False, default=False)
    expires_at: Mapped[datetime] = mapped_column(DateTime, nullable=True)

    company_id: Mapped[int] = mapped_column(ForeignKey('company_profiles.id'), nullable=False)
    moderation_status_id: Mapped[int] = mapped_column(ForeignKey('moderation_statuses.id'), nullable=False)
    experience_level_id: Mapped[int] = mapped_column(ForeignKey('experience_levels.id'), nullable=False)
    work_format_id: Mapped[int] = mapped_column(ForeignKey('work_formats.id'), nullable=False)
    location_id: Mapped[int] = mapped_column(ForeignKey('location_coordinates.id'), nullable=False)

    company_profile: Mapped['CompanyProfile'] = relationship('CompanyProfile', back_populates='internships')
    moderation_status: Mapped['ModerationStatus'] = relationship('ModerationStatus')
    experience_level: Mapped['ExperienceLevel'] = relationship('ExperienceLevel')
    work_format: Mapped['WorkFormat'] = relationship('WorkFormat')
    location: Mapped['LocationCoordinate'] = relationship('LocationCoordinate', back_populates='internships')


class MentorshipProgram(RootTable):
    __tablename__ = 'mentorship_programs'

    title: Mapped[str] = mapped_column(String(250), nullable=False)
    description: Mapped[str] = mapped_column(Text, nullable=True)
    media_url: Mapped[str] = mapped_column(String(500), nullable=True)
    address: Mapped[str] = mapped_column(String(500), nullable=True)
    published_at: Mapped[datetime] = mapped_column(DateTime, nullable=False)
    is_active: Mapped[bool] = mapped_column(Boolean, nullable=False, default=True)
    moderation_comment: Mapped[str] = mapped_column(Text, nullable=True)
    mentor_name: Mapped[str] = mapped_column(String(250), nullable=True)
    focus_area: Mapped[str] = mapped_column(String(250), nullable=True)
    selection_criteria: Mapped[str] = mapped_column(Text, nullable=True)

    company_id: Mapped[int] = mapped_column(ForeignKey('company_profiles.id'), nullable=False)
    moderation_status_id: Mapped[int] = mapped_column(ForeignKey('moderation_statuses.id'), nullable=False)
    location_id: Mapped[int] = mapped_column(ForeignKey('location_coordinates.id'), nullable=False)

    company_profile: Mapped['CompanyProfile'] = relationship('CompanyProfile', back_populates='mentorship_programs')
    moderation_status: Mapped['ModerationStatus'] = relationship('ModerationStatus')
    location: Mapped['LocationCoordinate'] = relationship('LocationCoordinate', back_populates='mentorship_programs')


def init_db(engine_url: str = 'postgresql+psycopg2://postgres:2509@localhost:5432/testt'):
    engine = create_engine(engine_url)
    global __factory
    __factory = sessionmaker(bind=engine)
    base.metadata.create_all(engine)


def connect_db():
    global __factory
    if __factory is None:
        init_db()
    return __factory()


init_db()
