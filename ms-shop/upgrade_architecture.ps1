# ==========================================================
# MS.Shop - Architecture Upgrade Script v1.0
# ==========================================================

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host " Upgrading MS.Shop Architecture"
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# ----------------------------------------------------------
# Remove old routes folder if it exists
# ----------------------------------------------------------

if (Test-Path "app\routes") {
    Remove-Item "app\routes" -Recurse -Force
    Write-Host "Removed old routes folder." -ForegroundColor Yellow
}

# ----------------------------------------------------------
# Create folders
# ----------------------------------------------------------

$folders = @(
    "app\blueprints",

    "app\blueprints\main",
    "app\blueprints\shop",
    "app\blueprints\cart",
    "app\blueprints\checkout",
    "app\blueprints\admin",
    "app\blueprints\auth",
    "app\blueprints\errors",

    "app\forms",
    "app\services",

    "app\templates\shop",
    "app\templates\cart",
    "app\templates\checkout",
    "app\templates\admin",
    "app\templates\auth",
    "app\templates\errors",

    "app\static\images\logo",
    "app\static\images\products",
    "app\static\images\categories",
    "app\static\images\banners",
    "app\static\images\icons",

    "app\static\fonts",
    "app\static\vendor"
)

foreach ($folder in $folders) {

    if (!(Test-Path $folder)) {

        New-Item -ItemType Directory -Path $folder | Out-Null

        Write-Host "Created: $folder"

    }

}

# ----------------------------------------------------------
# Create Blueprint Files
# ----------------------------------------------------------

$blueprints = @(
    "main",
    "shop",
    "cart",
    "checkout",
    "admin",
    "auth",
    "errors"
)

foreach ($bp in $blueprints) {

    $init = "app\blueprints\$bp\__init__.py"
    $routes = "app\blueprints\$bp\routes.py"

    if (!(Test-Path $init)) {
        New-Item -ItemType File -Path $init | Out-Null
    }

    if (!(Test-Path $routes)) {
        New-Item -ItemType File -Path $routes | Out-Null
    }

    Write-Host "Blueprint created: $bp"
}

# ----------------------------------------------------------
# Create Forms
# ----------------------------------------------------------

$forms = @(
    "login_form.py",
    "product_form.py",
    "category_form.py",
    "checkout_form.py"
)

foreach ($form in $forms) {

    $path = "app\forms\$form"

    if (!(Test-Path $path)) {

        New-Item -ItemType File -Path $path | Out-Null

        Write-Host "Created Form: $form"

    }

}

# ----------------------------------------------------------
# Create Services
# ----------------------------------------------------------

$services = @(
    "product_service.py",
    "category_service.py",
    "order_service.py",
    "customer_service.py",
    "upload_service.py",
    "email_service.py"
)

foreach ($service in $services) {

    $path = "app\services\$service"

    if (!(Test-Path $path)) {

        New-Item -ItemType File -Path $path | Out-Null

        Write-Host "Created Service: $service"

    }

}

# ----------------------------------------------------------
# Create Utility Files
# ----------------------------------------------------------

$utils = @(
    "helpers.py",
    "decorators.py",
    "constants.py"
)

foreach ($util in $utils) {

    $path = "app\utils\$util"

    if (!(Test-Path $path)) {

        New-Item -ItemType File -Path $path | Out-Null

        Write-Host "Created Utility: $util"

    }

}

# ----------------------------------------------------------
# Core Files
# ----------------------------------------------------------

$core = @(
    "app\extensions.py",
    "app\context_processors.py"
)

foreach ($file in $core) {

    if (!(Test-Path $file)) {

        New-Item -ItemType File -Path $file | Out-Null

        Write-Host "Created: $file"

    }

}

Write-Host ""
Write-Host "==========================================" -ForegroundColor Green
Write-Host " Architecture Upgrade Completed!"
Write-Host "==========================================" -ForegroundColor Green
Write-Host ""