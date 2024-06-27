# EHR-FHIR Integration with Docker and Spring Cloud Gateway

This project integrates EHRbase and HAPI FHIR services into a single Dockerized application, orchestrated using Docker Compose.  and Spring Cloud Gateway is configured to manage API requests and as reverse proxy.
## Table of Contents

1. [Prerequisites](#Prerequisites)
2. [Microservices](#microservices) :
    * [EHRbase](#EHRbase)
    * [HAPI FHIR](#discussion-service)
    * [API Gateway](#api-gateway)
3. [Installation](#installation)
4. [Tech Stack](#tech-stack)

## Prerequisites

* Docker and Docker Compose installed on your machine
* Java Development Kit (JDK) 21 or higher
* Postgres Database (Dockerized within the setup)

## Microservices



### EHRbase


used EHRbase offical docker image and run it on a container and expose 8080 

### HAPI FHIR

used HAPI FHIR offical docker image and run it on a container and expose  8080

### API Gateway

#### Routes incoming requests to the appropriate microservice using springboot cloud gateway.

## postgres

used a shared postgres database for all microservice

### Deployment

##### Containerization: All services are containerized using Docker.

##### Docker Compose: Docker Compose file is provided for managing multi-container applications.

##### Instructions: Follow the README for instructions on how to build and run the application.

# Installation

To run this application, follow these steps:

1. Make sure you have Docker installed on your machine.

2. Clone the repository containing the API code.

```
https://github.com/rinshadkv/medblock-assignment.git
```

3. Navigate to the root directory of the project.

```
cd /medblock
```

4. Open a terminal window.

5. Run the following command to build and start the Docker containers:

```
docker-compose up --build
```

This command will build the Docker images for each service and start the containers defined in the `docker-compose.yml`
file.

6. Once the containers are up and running, you can access the APIs provided by the User Service on port 8000/users,
   and Discussion Service On port 8000/discussion.

- ehrbase Service API:http://localhost:8080/ehrbase/swagger-ui/index.html
- hapi fhir  Service: http://localhost:8080/fhir/metadata

7. You can also interact with the PostgreSQL database directly on port 5432 .

8. To stop the containers, press `Ctrl + C` in the terminal where they are running, and then run the following command
   to remove the containers:


## Tech Stack

* Backend Framework: Springboot
* Database: PostgreSQL
* Containerization: Docker
* Orchestration: Docker Compose
* API Gateway: Springboot cloud gateway

#### challenges faced
* lack of community support
* sql migration to a shared database

#### Conclusion

This project provides a unified entry point to EHRbase and HAPI FHIR applications through a single application, simplifying the management and interaction with these services.