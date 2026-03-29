
# ВНИМАНИЕ

Просьба дочитать данный файл от начала и до КОНЦА, чтобы не упустить важную информацию касающуюся демонстрации проекта

# Трамплин

**Трамплин** — интерактивная карьерная платформа, которая объединяет талантливых студентов, выпускников, работодателей и кураторов вузов.  
Соискатели находят стажировки, вакансии, менторские программы и карьерные мероприятия. Работодатели публикуют возможности и получают отклики. Кураторы модерируют контент, верифицируют компании и управляют пользователями.  

Платформа включает:
- интерактивную карту с вакансиями и мероприятиями,
- карточки возможностей с тегами навыков,
- личные кабинеты трёх ролей,
- систему откликов и статусов,
- нетворкинг между соискателями,
- верификацию работодателей,
- модерацию контента.

## Наша команда Numerum

Дувакин Андрей — фуллстак + DevOps  
Лучевников Лев — фронтенд-разработчик  
Филимонов Михаил — бэкенд-разработчик

## Технологический стек
* Backend: FastAPI (Python), SQLAlchemy 2.0, PostgreSQL, JWT-аутентификация
* Frontend: React + Vite + JavaScript + Ant Design + RTK Query
* Инфраструктура: Docker, Kubernetes (microk8s), Helm-чарт, cert-manager + Let’s Encrypt

## Развернутый дистрибутив
WEB: https://springboard.numerum.team  
API: https://api.springboard.numerum.team (с автоматической Swagger-документацией)  
Хранение файлов: PersistentVolume с hostPath

## Структура проекта
### API
Бэкенд построен на FastAPI с луковой архитектурой.
```
api/
├── app/
│   ├── application/         — репозитории 
│   ├── controllers/         — FastAPI-роутеры 
│   ├── infrastructure/      — бизнес-сервисы
│   ├── domain/
│   │   ├── models/          — SQLAlchemy-модели (ORM)
│   │   └── entities/        — Pydantic-схемы (DTO)
│   ├── database/            — сессии, Alembic-миграции
│   ├── core/                — константы, настройки
│   └── main.py, settings.py
├── k8s/helm/springboard-api — Helm-чарт для продакшена
└── req.txt
```
API спроектирован так, что добавление новых сущностей (например, сертификаты, тесты, группы) требует минимум изменений — достаточно добавить модель, репозиторий, сервис и роутер.

### WEB
Фронтенд реализован на  React + Vite + JavaScript с использованием UI-библиотеки Ant Design и state-менеджмента через RTK Query.
```
web/
├── src/
│   ├── Api/                 — RTK Query слайсы (vacanciesApi, applicantProfilesApi и др.)
│   ├── App/                 — роутинг, PrivateRoute, AdminRoute
│   ├── Components/
│   │   ├── Pages/           — HomePage (карта + лента), CabinetPage (три роли), OpportunityPage и др.
│   │   └── Widgets/
│   ├── Redux/               — store + слайсы
│   ├── Core/                — константы, конфиги
│   └── Hooks/
├── k8s/helm/springboard-web — Helm-чарт
└── Dockerfile
```

## Система ролей

Права проверяются как на бэкенде (Depends), так и на фронтенде (PrivateRoute / AdminRoute).

### Куратор с привелегией администратора
- Полный доступ к модерации
- Верификация компаний
- Управление пользователями и ролями
- Просмотр всех возможностей и откликов

### Работодатель
- Создание и управление вакансиями, стажировками, менторскими программами и карьерными мероприятиями
- Просмотр откликов и изменение их статусов
- Редактирование профиля компании

### Соискатель
- Просмотр карты и ленты возможностей
- Отклики и добавление в «Избранное»
- Личный кабинет с резюме, навыками, образованием, опытом и контактами
- Нетворкинг (профессиональные контакты)
- Настройка приватности профиля

### Администратор

- Всё, что может преподаватель
- Управление пользователями (создание, редактирование, удаление, смена роли)
- Управление ролями и статусами
- Просмотр и редактирование всех курсов и их содержимого
- Доступ ко всем журналам успеваемости


## Развертывание проекта

### API

Бэкенд можно запустить тремя способами — от самого простого до полноценного production-деплоймента.

#### 1. Локальный запуск (без Docker)

```bash
# Клонируем репозиторий
git clone https://git.numerum.team/andrei/it-planet-springboard.git
cd it-planet-springboard/api

# Создаём виртуальное окружение и устанавливаем зависимости
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate
pip install -r req.txt

# Создаём файл .env в корне api/
cp .env.example .env
# Редактируем .env — обязательно заполняем:
DB_DRIVER=postgresql+asyncpg
DB_HOST=localhost
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=your_password
DB_NAME=springboard
DB_SCHEMA=public
SECRET_KEY=your_very_strong_secret_key_here

# Применяем миграции
alembic upgrade head

# Запускаем сервер
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```
API: http://localhost:8000

#### 2. Запуск через Docker

Обратите внимание, что для хранения файлов необходимо создавать хранилище.  
**Вариант A — просто тянуть готовый образ**  
```bash
docker run -d \
  --name springboard-api \
  -p 8000:8000 \
  -e DB_DRIVER=postgresql+asyncpg \
  -e DB_HOST=host.docker.internal \
  -e DB_PORT=5432 \
  -e DB_USER=postgres \
  -e DB_PASSWORD=your_password \
  -e DB_NAME=springboard \
  -e DB_SCHEMA=public \
  -e SECRET_KEY=supersecretkey123 \
  -v ./uploads:/app/uploads \
  andreiduvakin/springboard-api:latest
```

**Вариант B — собрать локально**  
Запускается из папки api:
```bash
docker build -t springboard-api . -а app/Dockerfile
docker run -d --name springboard-api -p 8000:8000 springboard-api
```

#### 3. Production-развёртывание в Kubernetes
Используется Helm-чарт **k8s/helm/springboard-api**.
```bash
# Устанавливаем чарт (пример для нашего microk8s)
helm upgrade --install springboard-api k8s/helm/springboard-api --namespace springboard-api --create-namespace
```
Что нужно настроить в **values.yaml**:
```
env:
  DB_DRIVER: postgresql+asyncpg
  DB_HOST: db.numerum.team
  DB_PORT: 30000
  DB_USER: springboard
  DB_NAME: springboard
  DB_SCHEMA: public
```

**Secret** с чувствительными данными:
```
# k8s/helm/springboard-api/templates/secrets.yaml
apiVersion: v1
kind: Secret
metadata:
  name: springboard-api-secret
type: Opaque
data:
  SECRET_KEY: base64_encoded_very_long_key==
  DB_PASSWORD: base64_encoded_password==
```

**ОБРАТИТЕ ВНИМАНИЕ**  
В настоящем решении не предоставлен действительный файл **k8s/helm/springboard-api/templates/secrets.yaml** - для предотвращения несанкционированного доступа к нашей базе данных. Для ВАШЕЙ конфигурации нужно создавать свой файл.

PersistentVolume автоматически создаётся через pvc.yaml и монтирует папку /mnt/k8s_storage/springboard-api/uploads на хосте — все загруженные студентами файлы сохраняются между перезапусками.
После деплоя:

API: https://api.springboard.numerum.team/  
Swagger/ReDoc: https://api.springboard.numerum.team/docs

Именно так система работает в продакшене прямо сейчас — с HTTPS, Let’s Encrypt, персистентным хранилищем и автоматическим масштабированием.

### WEB

Фронтенд можно запустить тремя способами — от локальной разработки до production-развёртывания в Kubernetes.

### 1. Локальный запуск

```bash
git clone https://git.numerum.team/andrei/it-planet-springboard.git
cd it-planet-springboard/web

# Устанавливаем зависимости
npm install

# Создаём .env файл (в корне web/)
echo "VITE_BASE_URL=http://localhost:8000/api/v1" > .env

# Запускаем dev-сервер
npm run dev
```
Приложение будет доступно по адресу: http://localhost:5173

### 2. Запуск через Docker
Запускается из папки web:
**Вариант A — готовый образ**  
Готовый образ уже собран с продакшен-настройками!
**VITE_BASE_URL** жёстко зашиты в образ на этапе сборки:
```Dockerfile
ENV VITE_BASE_URL=https://api.springboard.numerum.team/api/v1
```
Поэтому запуск предельно прост:
```bash
docker run -d \
  --name springboard-web \
  -p 3000:3000 \
  andreiduvakin/springboard-web:latest
```

**Вариант B — сборка локально**  
```bash
docker run -d \
  --name springboard-web \
  -p 3000:3000 \
  --build-arg VITE_BASE_URL=http://localhost:8000/api/v1 \
  andreiduvakin/springboard-web:latest
```
Приложение доступно по адресу: http://localhost:3000

### 3. Production-развёртывание в Kubernetes

Используется Helm-чарт k8s/helm/springboard-web.

```bash
helm upgrade --install springboard-web k8s/helm/springboard-web --namespace springboard-web --create-namespace
```

Поскольку переменные окружения уже зашиты в образ на этапе **npm run build**, в **values.yaml** ничего передавать не нужно.

После деплоя приложение доступно по адресу:
https://springboard.numerum.team  
Именно так работает продакшен прямо сейчас.


## Демонстрация 

Видео ДЕМОНСТРАЦИИ проекта достпуно по ссылке: https://vkvideo.ru/video-237166148_456239017

Пожалуйста, досмотрите видео целиком.

## Регистрация

В системе можно зарегистрироваться перейдя на страницу регистрации из страницы входа.

## Презентация

Презентация находится в файле [ИС Трамплин - Презентация.pdf](<ИС Трамплин - Презентация.pdf>)