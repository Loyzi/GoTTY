import logging
from aiogram import Bot, Dispatcher, types
from aiogram.contrib.middlewares.logging import LoggingMiddleware
from aiogram.utils import executor

API_TOKEN = '6366753734:AAE0oAxOByAu6sCpDgXQZCyUU6kAeQlhSI8'

# Устанавливаем уровень логов на DEBUG
logging.basicConfig(level=logging.DEBUG)

# Создаем объект бота и диспетчер
bot = Bot(token=API_TOKEN)
dp = Dispatcher(bot)

# При запуске бота выводим приветственное сообщение
@dp.message_handler(commands=['start'])
async def send_welcome(message: types.Message):
    await message.reply("Привет! Я простой бот на Python!")

# Добавляем миддлвар для логирования
dp.middleware.setup(LoggingMiddleware())


# Запускаем бота
if __name__ == '__main__':
    executor.start_polling(dp, skip_updates=True).