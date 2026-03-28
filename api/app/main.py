from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from starlette.middleware.cors import CORSMiddleware
from starlette.responses import RedirectResponse

from app.controllers.applicant_educations_router import applicant_education_router
from app.controllers.applicant_profiles_router import applicant_profiles_router
from app.controllers.applicant_skill_tags_router import applicant_skill_tags_router
from app.controllers.applicant_skills_router import applicant_skills_router
from app.controllers.auth_router import auth_router
from app.controllers.company_profiles_router import company_profiles_router
from app.controllers.dictionaries_router import router as dictionaries_router
from app.controllers.industries_router import industries_router
from app.controllers.internships_router import internships_router
from app.controllers.files_router import files_router
from app.controllers.experince_levels_router import experience_levels_router
from app.controllers.roles_router import roles_router
from app.controllers.universities_router import universities_router
from app.controllers.users_router import users_router
from app.controllers.vacancies_router import vacancies_router
from app.settings import Settings


def start_app():
    api_app = FastAPI()
    settings = Settings()

    api_app.add_middleware(
        CORSMiddleware,
        allow_origins=['https://api.springboard.numerum.team', 'https://springboard.numerum.team',
                       'http://localhost:5173', 'http://localhost:3000', 'http://localhost:8000'],
        allow_credentials=True,
        allow_methods=['*'],
        allow_headers=['*'],
    )

    api_app.include_router(applicant_education_router, prefix=f'{settings.prefix}/applicant_educations', tags=['applicant_educations'])
    api_app.include_router(applicant_profiles_router, prefix=f'{settings.prefix}/applicant_profiles', tags=['applicant_profiles'])
    api_app.include_router(applicant_skill_tags_router, prefix=f'{settings.prefix}/applicant_skill_tags', tags=['applicant_skill_tags'])
    api_app.include_router(applicant_skills_router, prefix=f'{settings.prefix}/applicant_skills', tags=['applicant_skills'])
    api_app.include_router(auth_router, prefix=f'{settings.prefix}/auth', tags=['auth'])
    api_app.include_router(company_profiles_router, prefix=f'{settings.prefix}/company_profiles', tags=['company_profiles'])
    api_app.include_router(industries_router, prefix=f'{settings.prefix}/company_profiles/industries', tags=['company_profiles'])
    api_app.include_router(internships_router, prefix=f'{settings.prefix}/internships', tags=["internships"])
    api_app.include_router(files_router, prefix=f'{settings.prefix}/company_profiles/files', tags=['company_profiles'])
    api_app.include_router(dictionaries_router, prefix=f'{settings.prefix}/vacancies/dictionaries', tags=['vacancies'])
    api_app.include_router(experience_levels_router, prefix=f'{settings.prefix}/experience_levels', tags=['experience_levels'])
    api_app.include_router(roles_router, prefix=f'{settings.prefix}/roles', tags=['roles'])
    api_app.include_router(universities_router, prefix=f'{settings.prefix}/universities', tags=['universities'])
    api_app.include_router(users_router, prefix=f'{settings.prefix}/users', tags=['users'])
    api_app.include_router(vacancies_router, prefix=f'{settings.prefix}/vacancies', tags=['vacancies'])

    return api_app


app = start_app()


@app.get('/', tags=['root'])
async def root():
    return RedirectResponse(url='/docs')
