# ============================
# MS.Shop Project Setup
# ============================

$ProjectName = "ms-shop"

Write-Host "Creating project..." -ForegroundColor Green

# Create project folder
mkdir $ProjectName -Force | Out-Null
Set-Location $ProjectName

# Create virtual environment
python -m venv venv

# Activate virtual environment
& ".\venv\Scripts\Activate.ps1"

# Upgrade pip
python -m pip install --upgrade pip

# Install required libraries
pip install `
Flask `
Flask-SQLAlchemy `
Flask-Migrate `
Flask-Login `
Flask-WTF `
Flask-Bcrypt `
Pillow `
python-slugify `
email-validator `
gunicorn `
python-dotenv

# Save requirements
pip freeze > requirements.txt

# ============================
# Create Folder Structure
# ============================

mkdir app
mkdir app\models
mkdir app\routes
mkdir app\templates
mkdir app\utils

mkdir app\static
mkdir app\static\css
mkdir app\static\js
mkdir app\static\images
mkdir app\static\uploads

mkdir instance
mkdir migrations

# ============================
# Create Files
# ============================

New-Item app\__init__.py -ItemType File
New-Item app\models\__init__.py -ItemType File
New-Item app\routes\__init__.py -ItemType File

New-Item app\templates\layout.html -ItemType File
New-Item app\templates\navbar.html -ItemType File
New-Item app\templates\footer.html -ItemType File
New-Item app\templates\home.html -ItemType File

New-Item app\static\css\style.css -ItemType File
New-Item app\static\js\main.js -ItemType File

New-Item config.py -ItemType File
New-Item run.py -ItemType File
New-Item README.md -ItemType File
New-Item .env -ItemType File
New-Item .gitignore -ItemType File

# ============================
# Initialize Git
# ============================

git init

@"
venv/
__pycache__/
instance/
*.pyc
.env
.vscode/
"@ | Set-Content .gitignore

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "MS.Shop project created successfully!" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Open with:"
Write-Host "code ."