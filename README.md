# 🚀 .NET Microservices Playground

![.NET](https://img.shields.io/badge/.NET-6.0-blue?logo=dotnet)
![C#](https://img.shields.io/badge/C%23-9.0-green?logo=c-sharp)
![Microservices](https://img.shields.io/badge/Microservices-Enabled-orange)

Welcome to the ultimate **.NET Microservices Playground**, where cutting-edge .NET technologies converge in a modern, scalable microservice architecture. This repository demonstrates how to build a full-fledged ecosystem using all the latest .NET tools, frameworks, and best practices.  

---

## 🏗 Architecture

This project follows a **microservice-based architecture** with clear separation of concerns, allowing each service to scale independently.  

- **API Gateway:** ASP.NET Core + Ocelot for routing, authentication, and load balancing.  
- **Authentication & Authorization:** IdentityServer4 / ASP.NET Core Identity with JWT.  
- **Communication:**  
  - **Synchronous:** HTTP/REST with OpenAPI (Swagger)  
  - **Asynchronous:** RabbitMQ / Kafka for event-driven messaging  
  - **Real-time:** SignalR for notifications  
- **Database:**  
  - SQL Server with Entity Framework Core  
  - Redis for caching  
  - MongoDB for NoSQL storage  
- **Containerization & Orchestration:**  
  - Docker for service containers  
  - Kubernetes manifests for deployment & scaling  
- **Monitoring & Logging:**  
  - Serilog for structured logging  
  - Prometheus & Grafana for metrics & dashboards  

---

## ⚡ Technologies Used

| Layer / Tool               | Technology |
|----------------------------|------------|
| Backend Framework          | ASP.NET Core |
| ORM                        | Entity Framework Core |
| Messaging                  | RabbitMQ, Kafka |
| Real-time Communication    | SignalR |
| Authentication             | IdentityServer4, JWT |
| Database                   | SQL Server, MongoDB, Redis |
| API Gateway                | Ocelot |
| Containerization           | Docker |
| Orchestration              | Kubernetes |
| Logging & Monitoring       | Serilog, Prometheus, Grafana |
| CI/CD                      | GitHub Actions |

---

## 📂 Repository Structure
