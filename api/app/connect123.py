from sqlalchemy import create_engine, Column, Integer, String, ForeignKey, Boolean, Float, DateTime, func
from sqlalchemy.orm import sessionmaker, declarative_base, relationship
# from werkzeug.security import generate_password_hash, check_password_hash

__factory = None
base = declarative_base()


class City(base):
    __tablename__ = 'cities'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(200))

    universities = relationship('University', back_populates='city')
    vacancies = relationship('Vacancy', back_populates='city')
    internships = relationship('Internship', back_populates='city')
    mentorship_programs = relationship('MentorshipProgram', back_populates='city')
    career_events = relationship('CareerEvent', back_populates='city')


class University(base):
    __tablename__ = 'universities'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(300))

    city_id = Column(Integer, ForeignKey('cities.id'))

    city = relationship('City', back_populates='universities')
    applicant_profiles = relationship('ApplicantProfile', back_populates='university')


class Industry(base):
    __tablename__ = 'industries'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(200))

    employer_profiles = relationship('EmployerProfile', back_populates='industry')


class UserRole(base):
    __tablename__ = 'user_roles'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(100))

    users = relationship('User', back_populates='role')


class User(base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True, autoincrement=True)
    last_name = Column(String(100))
    first_name = Column(String(100))
    patronymic = Column(String(100))
    email = Column(String(250), unique=True)
    password = Column(String)
    is_active = Column(Boolean, default=True)
    avatar_url = Column(String)
    created_at = Column(DateTime, server_default=func.now())

    role_id = Column(Integer, ForeignKey('user_roles.id'))

    role = relationship('UserRole', back_populates='users')
    applicant_profile = relationship('ApplicantProfile', back_populates='user')
    employer_profile = relationship('EmployerProfile', back_populates='user')
    curator_profile = relationship('CuratorProfile', back_populates='user')
    created_curators = relationship('CuratorProfile', back_populates='creator')
    created_tags = relationship('Tag', back_populates='creator')
    applications = relationship('Application', back_populates='applicant')
    favorites = relationship('Favorite', back_populates='user')
    moderation_logs = relationship('ModerationLog', back_populates='curator')
    notifications = relationship('Notification', back_populates='user')
    favorite_employers = relationship('FavoriteEmployer', back_populates='user')

    # def set_password(self, password: str):
    #     self.password = generate_password_hash(password)
    #
    # def check_password(self, password: str) -> bool:
    #     return check_password_hash(self.password, password)


class ApplicantProfile(base):
    __tablename__ = 'applicant_profiles'
    id = Column(Integer, primary_key=True, autoincrement=True)
    study_year = Column(DateTime)
    graduation_year = Column(DateTime)
    specialization = Column(String(200))
    about = Column(String(1000))
    github_url = Column(String)
    portfolio_url = Column(String)
    resume_url = Column(String)
    is_profile_public = Column(Boolean, default=True)
    show_applications = Column(Boolean, default=False)
    show_resume = Column(Boolean, default=False)

    user_id = Column(Integer, ForeignKey('users.id'))
    university_id = Column(Integer, ForeignKey('universities.id'))

    user = relationship('User', back_populates='applicant_profile')
    university = relationship('University', back_populates='applicant_profiles')
    experiences = relationship('Experience', back_populates='applicant_profile')
    skills = relationship('ApplicantSkill', back_populates='applicant_profile')
    portfolio_projects = relationship('PortfolioProject', back_populates='applicant_profile')
    sent_contacts = relationship('Contact', back_populates='sender')
    received_contacts = relationship('Contact', back_populates='receiver')
    sent_recommendations = relationship('ContactRecommendation', back_populates='recommender')
    received_recommendations = relationship('ContactRecommendation', back_populates='recipient')


class Experience(base):
    __tablename__ = 'experiences'
    id = Column(Integer, primary_key=True, autoincrement=True)
    title = Column(String(200))
    company = Column(String(200))
    description = Column(String(1000))
    url = Column(String)
    start_date = Column(DateTime)
    end_date = Column(DateTime)

    applicant_profile_id = Column(Integer, ForeignKey('applicant_profiles.id'))

    applicant_profile = relationship('ApplicantProfile', back_populates='experiences')


class EmployerProfile(base):
    __tablename__ = 'employer_profiles'
    id = Column(Integer, primary_key=True, autoincrement=True)
    company_name = Column(String(300))
    description = Column(String(1000))
    website_url = Column(String)
    social_url = Column(String)
    logo_url = Column(String)
    office_photo_url = Column(String)
    video_url = Column(String)
    inn = Column(Integer)
    corporate_email = Column(String(250))

    user_id = Column(Integer, ForeignKey('users.id'))
    industry_id = Column(Integer, ForeignKey('industries.id'))
    verification_status_id = Column(Integer, ForeignKey('verification_statuses.id'))

    user = relationship('User', back_populates='employer_profile')
    industry = relationship('Industry', back_populates='employer_profiles')
    verification_status = relationship('VerificationStatus', back_populates='employer_profiles')
    verification_requests = relationship('VerificationRequest', back_populates='employer_profile')
    vacancies = relationship('Vacancy', back_populates='employer_profile')
    internships = relationship('Internship', back_populates='employer_profile')
    mentorship_programs = relationship('MentorshipProgram', back_populates='employer_profile')
    career_events = relationship('CareerEvent', back_populates='employer_profile')
    favorited_by = relationship('FavoriteEmployer', back_populates='employer_profile')


class CuratorProfile(base):
    __tablename__ = 'curator_profiles'
    id = Column(Integer, primary_key=True, autoincrement=True)
    is_admin = Column(Boolean, default=False)

    user_id = Column(Integer, ForeignKey('users.id'))
    created_by_id = Column(Integer, ForeignKey('users.id'))

    user = relationship('User', back_populates='curator_profile')
    creator = relationship('User', back_populates='created_curators')


class VerificationStatus(base):
    __tablename__ = 'verification_statuses'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(100))

    employer_profiles = relationship('EmployerProfile', back_populates='verification_status')
    verification_requests = relationship('VerificationRequest', back_populates='status')


class VerificationRequest(base):
    __tablename__ = 'verification_requests'
    id = Column(Integer, primary_key=True, autoincrement=True)
    method = Column(String(50))

    employer_profile_id = Column(Integer, ForeignKey('employer_profiles.id'))
    status_id = Column(Integer, ForeignKey('verification_statuses.id'))

    employer_profile = relationship('EmployerProfile', back_populates='verification_requests')
    status = relationship('VerificationStatus', back_populates='verification_requests')


class EventType(base):
    __tablename__ = 'event_types'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(100))

    career_events = relationship('CareerEvent', back_populates='event_type')


class WorkFormat(base):
    __tablename__ = 'work_formats'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(100))

    vacancies = relationship('Vacancy', back_populates='work_format')
    internships = relationship('Internship', back_populates='work_format')


class EmploymentType(base):
    __tablename__ = 'employment_types'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(100))

    vacancies = relationship('Vacancy', back_populates='employment_type')


class ExperienceLevel(base):
    __tablename__ = 'experience_levels'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(100))

    vacancies = relationship('Vacancy', back_populates='experience_level')
    internships = relationship('Internship', back_populates='experience_level')


class ModerationStatus(base):
    __tablename__ = 'moderation_statuses'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(100))

    vacancies = relationship('Vacancy', back_populates='moderation_status')
    internships = relationship('Internship', back_populates='moderation_status')
    mentorship_programs = relationship('MentorshipProgram', back_populates='moderation_status')
    career_events = relationship('CareerEvent', back_populates='moderation_status')


class Vacancy(base):
    __tablename__ = 'vacancies'
    id = Column(Integer, primary_key=True, autoincrement=True)

    title = Column(String(300))
    description = Column(String)
    media_url = Column(String)
    address = Column(String(400))
    published_at = Column(DateTime, server_default=func.now())
    is_active = Column(Boolean, default=True)
    moderation_comment = Column(String(500))

    expires_at = Column(DateTime)
    salary_min = Column(Float)
    salary_max = Column(Float)

    employer_profile_id = Column(Integer, ForeignKey('employer_profiles.id'))
    city_id = Column(Integer, ForeignKey('cities.id'))
    work_format_id = Column(Integer, ForeignKey('work_formats.id'))
    employment_type_id = Column(Integer, ForeignKey('employment_types.id'))
    experience_level_id = Column(Integer, ForeignKey('experience_levels.id'))
    moderation_status_id = Column(Integer, ForeignKey('moderation_statuses.id'))

    employer_profile = relationship('EmployerProfile', back_populates='vacancies')
    city = relationship('City', back_populates='vacancies')
    work_format = relationship('WorkFormat', back_populates='vacancies')
    employment_type = relationship('EmploymentType', back_populates='vacancies')
    experience_level = relationship('ExperienceLevel', back_populates='vacancies')
    moderation_status = relationship('ModerationStatus', back_populates='vacancies')
    applications = relationship('Application', back_populates='vacancy')
    favorites = relationship('Favorite', back_populates='vacancy')
    recommendations = relationship('ContactRecommendation', back_populates='vacancy')
    locations = relationship('LocationCoordinate', back_populates='vacancy')


class Internship(base):
    __tablename__ = 'internships'
    id = Column(Integer, primary_key=True, autoincrement=True)

    title = Column(String(300))
    description = Column(String)
    media_url = Column(String)
    address = Column(String(400))
    published_at = Column(DateTime, server_default=func.now())
    is_active = Column(Boolean, default=True)
    moderation_comment = Column(String(500))

    duration_months = Column(Integer)
    is_paid = Column(Boolean)
    mentorship_available = Column(Boolean)
    expires_at = Column(DateTime)

    employer_profile_id = Column(Integer, ForeignKey('employer_profiles.id'))
    city_id = Column(Integer, ForeignKey('cities.id'))
    work_format_id = Column(Integer, ForeignKey('work_formats.id'))
    experience_level_id = Column(Integer, ForeignKey('experience_levels.id'))
    moderation_status_id = Column(Integer, ForeignKey('moderation_statuses.id'))

    employer_profile = relationship('EmployerProfile', back_populates='internships')
    city = relationship('City', back_populates='internships')
    work_format = relationship('WorkFormat', back_populates='internships')
    experience_level = relationship('ExperienceLevel', back_populates='internships')
    moderation_status = relationship('ModerationStatus', back_populates='internships')
    applications = relationship('Application', back_populates='internship')
    favorites = relationship('Favorite', back_populates='internship')
    recommendations = relationship('ContactRecommendation', back_populates='internship')
    locations = relationship('LocationCoordinate', back_populates='internship')


class MentorshipProgram(base):
    __tablename__ = 'mentorship_programs'
    id = Column(Integer, primary_key=True, autoincrement=True)

    title = Column(String(300))
    description = Column(String)
    media_url = Column(String)
    address = Column(String(400))
    published_at = Column(DateTime, server_default=func.now())
    is_active = Column(Boolean, default=True)
    moderation_comment = Column(String(500))

    mentor_name = Column(String(300))
    focus_area = Column(String)
    selection_criteria = Column(String)

    employer_profile_id = Column(Integer, ForeignKey('employer_profiles.id'))
    city_id = Column(Integer, ForeignKey('cities.id'))
    moderation_status_id = Column(Integer, ForeignKey('moderation_statuses.id'))

    employer_profile = relationship('EmployerProfile', back_populates='mentorship_programs')
    city = relationship('City', back_populates='mentorship_programs')
    moderation_status = relationship('ModerationStatus', back_populates='mentorship_programs')
    applications = relationship('Application', back_populates='mentorship_program')
    favorites = relationship('Favorite', back_populates='mentorship_program')
    recommendations = relationship('ContactRecommendation', back_populates='mentorship_program')
    locations = relationship('LocationCoordinate', back_populates='mentorship_program')


class CareerEvent(base):
    __tablename__ = 'career_events'
    id = Column(Integer, primary_key=True, autoincrement=True)

    title = Column(String(300))
    description = Column(String)
    media_url = Column(String)
    address = Column(String(400))
    published_at = Column(DateTime, server_default=func.now())
    is_active = Column(Boolean, default=True)
    moderation_comment = Column(String(500))

    event_date = Column(DateTime)
    registration_link = Column(String)
    is_online = Column(Boolean)

    employer_profile_id = Column(Integer, ForeignKey('employer_profiles.id'))
    city_id = Column(Integer, ForeignKey('cities.id'))
    moderation_status_id = Column(Integer, ForeignKey('moderation_statuses.id'))
    event_type_id = Column(Integer, ForeignKey('event_types.id'))

    employer_profile = relationship('EmployerProfile', back_populates='career_events')
    city = relationship('City', back_populates='career_events')
    moderation_status = relationship('ModerationStatus', back_populates='career_events')
    event_type = relationship('EventType', back_populates='career_events')
    applications = relationship('Application', back_populates='career_event')
    favorites = relationship('Favorite', back_populates='career_event')
    recommendations = relationship('ContactRecommendation', back_populates='career_event')
    locations = relationship('LocationCoordinate', back_populates='career_event')


class TagCategory(base):
    __tablename__ = 'tag_categories'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(100))

    tags = relationship('Tag', back_populates='category')


class Tag(base):
    __tablename__ = 'tags'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(100), unique=True)

    category_id = Column(Integer, ForeignKey('tag_categories.id'))
    created_by_id = Column(Integer, ForeignKey('users.id'))

    category = relationship('TagCategory', back_populates='tags')
    creator = relationship('User', back_populates='created_tags')
    opportunity_tags = relationship('OpportunityTag', back_populates='tag')
    applicant_skills = relationship('ApplicantSkill', back_populates='tag')


class OpportunityTag(base):
    __tablename__ = 'opportunity_tags'
    id = Column(Integer, primary_key=True, autoincrement=True)

    tag_id = Column(Integer, ForeignKey('tags.id'))

    tag = relationship('Tag', back_populates='opportunity_tags')


class ApplicantSkill(base):
    __tablename__ = 'applicant_skills'
    id = Column(Integer, primary_key=True, autoincrement=True)
    level = Column(String)

    applicant_profile_id = Column(Integer, ForeignKey('applicant_profiles.id'))
    tag_id = Column(Integer, ForeignKey('tags.id'))

    applicant_profile = relationship('ApplicantProfile', back_populates='skills')
    tag = relationship('Tag', back_populates='applicant_skills')


class ApplicationStatus(base):
    __tablename__ = 'application_statuses'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(100))

    applications = relationship('Application', back_populates='status')


class Application(base):
    __tablename__ = 'applications'
    id = Column(Integer, primary_key=True, autoincrement=True)
    cover_letter = Column(String)
    employer_note = Column(String(500))
    updated_at = Column(DateTime, server_default=func.now())

    applicant_id = Column(Integer, ForeignKey('users.id'))

    vacancy_id = Column(Integer, ForeignKey('vacancies.id'))
    internship_id = Column(Integer, ForeignKey('internships.id'))
    mentorship_program_id = Column(Integer, ForeignKey('mentorship_programs.id'))
    career_event_id = Column(Integer, ForeignKey('career_events.id'))

    status_id = Column(Integer, ForeignKey('application_statuses.id'))

    applicant = relationship('User', back_populates='applications')
    vacancy = relationship('Vacancy', back_populates='applications')
    internship = relationship('Internship', back_populates='applications')
    mentorship_program = relationship('MentorshipProgram', back_populates='applications')
    career_event = relationship('CareerEvent', back_populates='applications')
    status = relationship('ApplicationStatus', back_populates='applications')


class Favorite(base):
    __tablename__ = 'favorites'
    id = Column(Integer, primary_key=True, autoincrement=True)
    added_at = Column(DateTime, server_default=func.now())

    user_id = Column(Integer, ForeignKey('users.id'))

    vacancy_id = Column(Integer, ForeignKey('vacancies.id'))
    internship_id = Column(Integer, ForeignKey('internships.id'))
    mentorship_program_id = Column(Integer, ForeignKey('mentorship_programs.id'))
    career_event_id = Column(Integer, ForeignKey('career_events.id'))

    user = relationship('User', back_populates='favorites')
    vacancy = relationship('Vacancy', back_populates='favorites')
    internship = relationship('Internship', back_populates='favorites')
    mentorship_program = relationship('MentorshipProgram', back_populates='favorites')
    career_event = relationship('CareerEvent', back_populates='favorites')


class ContactStatus(base):
    __tablename__ = 'contact_statuses'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(100))

    contacts = relationship('Contact', back_populates='status')


class Contact(base):
    __tablename__ = 'contacts'
    id = Column(Integer, primary_key=True, autoincrement=True)
    created_at = Column(DateTime, server_default=func.now())
    updated_at = Column(DateTime, server_default=func.now())

    sender_id = Column(Integer, ForeignKey('applicant_profiles.id'))
    receiver_id = Column(Integer, ForeignKey('applicant_profiles.id'))
    status_id = Column(Integer, ForeignKey('contact_statuses.id'))

    sender = relationship('ApplicantProfile', back_populates='sent_contacts')
    receiver = relationship('ApplicantProfile', back_populates='received_contacts')
    status = relationship('ContactStatus', back_populates='contacts')


class ContactRecommendation(base):
    __tablename__ = 'contact_recommendations'
    id = Column(Integer, primary_key=True, autoincrement=True)
    message = Column(String)
    created_at = Column(DateTime, server_default=func.now())

    recommender_id = Column(Integer, ForeignKey('applicant_profiles.id'))
    recipient_id = Column(Integer, ForeignKey('applicant_profiles.id'))

    vacancy_id = Column(Integer, ForeignKey('vacancies.id'))
    internship_id = Column(Integer, ForeignKey('internships.id'))
    mentorship_program_id = Column(Integer, ForeignKey('mentorship_programs.id'))
    career_event_id = Column(Integer, ForeignKey('career_events.id'))

    recommender = relationship('ApplicantProfile', back_populates='sent_recommendations')
    recipient = relationship('ApplicantProfile', back_populates='received_recommendations')
    vacancy = relationship('Vacancy', back_populates='recommendations')
    internship = relationship('Internship', back_populates='recommendations')
    mentorship_program = relationship('MentorshipProgram', back_populates='recommendations')
    career_event = relationship('CareerEvent', back_populates='recommendations')


class ModerationLog(base):
    __tablename__ = 'moderation_logs'
    id = Column(Integer, primary_key=True, autoincrement=True)
    entity_type = Column(String(50))
    entity_id = Column(Integer)
    action = Column(String(50))
    comment = Column(String(500))
    created_at = Column(DateTime, server_default=func.now())

    curator_id = Column(Integer, ForeignKey('users.id'))

    curator = relationship('User', back_populates='moderation_logs')


class Notification(base):
    __tablename__ = 'notifications'
    id = Column(Integer, primary_key=True, autoincrement=True)
    title = Column(String(300))
    body = Column(String(1000))
    is_read = Column(Boolean, default=False)
    link = Column(String)
    created_at = Column(DateTime, server_default=func.now())

    user_id = Column(Integer, ForeignKey('users.id'))

    user = relationship('User', back_populates='notifications')


class PortfolioProject(base):
    __tablename__ = 'portfolio_projects'
    id = Column(Integer, primary_key=True, autoincrement=True)
    title = Column(String(200))
    description = Column(String(1000))
    project_url = Column(String)
    repository_url = Column(String)

    applicant_profile_id = Column(Integer, ForeignKey('applicant_profiles.id'))

    applicant_profile = relationship('ApplicantProfile', back_populates='portfolio_projects')


class FavoriteEmployer(base):
    __tablename__ = 'favorite_employers'
    id = Column(Integer, primary_key=True, autoincrement=True)
    added_at = Column(DateTime, server_default=func.now())

    user_id = Column(Integer, ForeignKey('users.id'))
    employer_profile_id = Column(Integer, ForeignKey('employer_profiles.id'))

    user = relationship('User', back_populates='favorite_employers')
    employer_profile = relationship('EmployerProfile', back_populates='favorited_by')


class LocationCoordinate(base):
    __tablename__ = 'location_coordinates'
    id = Column(Integer, primary_key=True, autoincrement=True)
    latitude = Column(Float)
    longitude = Column(Float)

    vacancy_id = Column(Integer, ForeignKey('vacancies.id'))
    internship_id = Column(Integer, ForeignKey('internships.id'))
    mentorship_program_id = Column(Integer, ForeignKey('mentorship_programs.id'))
    career_event_id = Column(Integer, ForeignKey('career_events.id'))

    vacancy = relationship('Vacancy', back_populates='locations')
    internship = relationship('Internship', back_populates='locations')
    mentorship_program = relationship('MentorshipProgram', back_populates='locations')
    career_event = relationship('CareerEvent', back_populates='locations')


def init_db(engine_url: str = 'postgresql+psycopg2://postgres:2509@localhost:5432/testt123'):
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