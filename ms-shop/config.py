import os
from dotenv import load_dotenv

load_dotenv()


class Config:
    SECRET_KEY = os.getenv("SECRET_KEY", "dev-secret-key")

    SQLALCHEMY_DATABASE_URI = os.getenv(
        "DATABASE_URL",
        "sqlite:///ms_shop.db"
    )

    SQLALCHEMY_TRACK_MODIFICATIONS = False

    STORE_NAME = "MS.Shop"

    INSTAGRAM_URL = "https://instagram.com/ms.shop"