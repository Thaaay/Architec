# 🏗️ Architec

A professional architecture portfolio and project management platform built with **Ruby on Rails 8**. This application features a containerized architecture for robust deployment and high performance.



## 🚀 Tech Stack

* **Ruby Version:** 8.0.4
* **Database:** PostgreSQL (Production) | SQLite (Development)
* **Styling:** Tailwind CSS v4
* **JavaScript:** esbuild & Stimulus
* **Deployment:** Docker & Render

## 🛠️ Local Development (Fedora/Linux)

### 1. Clone the repository
```bash
git clone [https://github.com/YOUR_USERNAME/architec.git](https://github.com/YOUR_USERNAME/architec.git)
cd architec

bundle install
pnpm install

bin/rails db:prepare

bin/rails s

Access the app at http://localhost:3000.


🐳 Docker & ProductionThis project is fully containerized. The Dockerfile is optimized for Rails 8, including specific user permissions and asset precompilation.Required Environment Variables (Render)To successfully deploy, you must configure these variables in your Render Dashboard:KeyDescriptionRAILS_MASTER_KEYContent of your config/master.key file.DATABASE_URLPostgreSQL connection string (Use the Internal URL).ADMIN_USERNAMEUsername for the image upload popup (Basic Auth).ADMIN_PASSWORDPassword for the image upload popup (Basic Auth).

🔐 Image Upload Security
Uploading new projects and images is protected by HTTP Basic Authentication.

In Development: Credentials are read from your .env file.

In Production: Credentials are set via Render Environment Variables.

📦 Deployment Flow
The CI/CD pipeline is connected to the main branch:

Developer pushes code to GitHub.

Render detects the change and triggers a Docker Build.

Assets are precompiled, and migrations are run automatically.

The service goes Live.
