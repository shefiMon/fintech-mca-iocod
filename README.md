# Lead Management API

A comprehensive Laravel 12-based API application for managing merchant leads, investor deals, and bank statement uploads with automated assignment and processing capabilities.

## Prerequisites
*   PHP : ^8.2
*   Composer
*   MySQL/MariaDB
*   Laravel 12.x
*
## Installation & Setup

### 1. Clone the Repository

```bash
git clone https://github.com/shefiMon/fintech-mca-iocod.git
cd fintech-mca-iocod
```

```bash
composer install
```

# Copy environment file

```bash
cp .env.example .env
```


# Generate application key
```bash
php artisan key:generate
```

# Edit your .env file with your database credentials:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=lead_management
DB_USERNAME=your_username
DB_PASSWORD=your_password
```

### Run Migrations \& Seeders

```bash
# Run database migrations
php artisan migrate

# Seed the database with sample data
php artisan db:seed

# Seed the database with sample data
php artisan db:seed --class=InvestorSeeder

```


### Storage Setup

```bash
# Create symbolic link for file storage
php artisan storage:link

```


```bash
# Terminal 1: Start Laravel development server
php artisan serve

# Terminal 2: Start queue worker
php artisan queue:work

# Terminal 3: run fund:deals -import leads and assign deals
php php artisan fund:deals
```


### API Endpoints

#### Dashboard Summary

```bash
GET /api/dashboard/summary
```

#### Upload Bank Statements

```bash
POST /api/merchant/{id}/upload-bank-statement
Content-Type: multipart/form-data

# Form data:
file: statement1.pdf (FILE)
month: 12
year: 2024
```

## Documentation 

* [Postman API Documentation](https://documenter.getpostman.com/view/22975549/2sB3BBqXhJ)
