from fastapi import FastAPI
from starlette.middleware.cors import CORSMiddleware

from app.controllers.auth_router import auth_router
from app.controllers.roles_router import roles_router
from app.controllers.users_router import users_router
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
    api_app.include_router(auth_router, prefix=f'{settings.prefix}/auth', tags=['auth'])
    api_app.include_router(roles_router, prefix=f'{settings.prefix}/roles', tags=['roles'])
    api_app.include_router(users_router, prefix=f'{settings.prefix}/users', tags=['users'])

    return api_app


app = start_app()


@app.get('/', tags=['root'])
async def root():
    return {'message': 'Hello :з'}
