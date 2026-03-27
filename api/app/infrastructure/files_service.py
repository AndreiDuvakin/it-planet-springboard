import os
import uuid
import aiofiles
from app.application.files_repository import FilesRepository


class FilesService:
    def __init__(self, db):
        self.repo = FilesRepository(db)
        # Базовый путь относительно корня проекта
        self.base_dir = "База данных/media"

    async def _save_to_disk(self, upload_file, sub_folder: str):
        # Генерируем уникальное имя, чтобы не перезаписать файлы
        unique_name = f"{uuid.uuid4()}_{upload_file.filename}"
        relative_folder = os.path.join(sub_folder)
        full_folder_path = os.path.join(self.base_dir, relative_folder)

        os.makedirs(full_folder_path, exist_ok=True)

        file_path = os.path.join(full_folder_path, unique_name)
        # URL для раздачи статикой
        web_url = f"/media/{sub_folder}/{unique_name}"

        content = await upload_file.read()
        async with aiofiles.open(file_path, mode='wb') as f:
            await f.write(content)

        return {
            "filename": upload_file.filename,
            "path": file_path,
            "url": web_url
        }

    async def upload_logo(self, file):
        info = await self._save_to_disk(file, "company_logos")
        return await self.repo.create_logo_record(**info)

    async def upload_photo(self, file):
        info = await self._save_to_disk(file, "company_photos")
        return await self.repo.create_photo_record(**info)