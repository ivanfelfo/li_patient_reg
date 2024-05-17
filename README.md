# README
Welcome to my Patient Registration API Dockerized Rails app.

## Prerequisites

Before getting started, make sure you have the following prerequisites installed on your system:

- Docker: [Installation Instructions](https://docs.docker.com/get-docker/)
- Docker Compose: [Installation Instructions](https://docs.docker.com/compose/install/)

## Getting Started

Follow these steps to set up and run the Dockerized Rails application on your local machine:

1. **Clone the Repository:**
git clone https://github.com/ivanfelfo/li_patient_reg.git

2. **Navigate to the Project Directory:**
cd your-repository

3. **Set Up Mailtrap Credentials:**
- Open the docker-compose.yml file in the project directory.
- Locate the 'web' and 'sidekiq' services.
- Replace the placeholder Mailtrap credentials with your own Mailtrap SMTP settings:

environment:
  SMTP_ADDRESS: your_mailtrap_smtp_address
  SMTP_PORT: your_mailtrap_port
  SMTP_DOMAIN: your_mailtrap_domain
  SMTP_USERNAME: your_mailtrap_username
  SMTP_PASSWORD: your_mailtrap_password

4. **Register Patient**
Once the Docker containers are running, you can interact with the API endpoints using tools like cURL, Postman, or any HTTP client.
  - To register a patient, send a POST request to [http://localhost:3000/patients](http://localhost:3000/patients).
  - To view details of a registered patient, send a GET request to [http://localhost:3000/patients/:id](http://localhost:3000/patients/:id), where `:id` is the ID of the patient.


**Notes**
Unfortunately, I encountered some technical difficulties while attempting to set up MySQL for the project. My laptop seems to be experiencing issues with downloading MySQL via Homebrew, which I've attempted to troubleshoot without success. Due to these unforeseen circumstances and the time constraints of the project, I made the decision to proceed with SQLite as the database instead.