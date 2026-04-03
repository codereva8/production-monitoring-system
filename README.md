## Production Monitoring and Incident Response System

### Overview

This project implements a lightweight monitoring and incident response system using Bash scripting. It simulates real-world operational scenarios by continuously monitoring system services, Docker containers, and resource utilization, while triggering automated recovery and logging events for analysis.

---

### Objective

To design a simple, automated monitoring solution that detects failures, generates alerts, and performs basic incident remediation without manual intervention.

---

### Tech Stack

* Bash
* Linux (WSL)
* Docker
* Cron

---

### Core Functionality

* Monitors critical services (e.g., nginx)
* Tracks Docker container status
* Observes CPU and memory utilization
* Performs automatic service recovery on failure
* Generates alerts for incidents
* Maintains structured logs for system activity and failures
* Runs continuously via cron scheduling

---

### System Design

The monitoring script is executed at fixed intervals using cron. It performs:

* Service health checks using system-level commands
* Container status validation using Docker CLI
* Resource usage checks for basic system health

If a failure is detected:

* An alert is written to `alerts.log`
* The system attempts automatic recovery (e.g., restarting nginx)
* All actions are recorded in `prod.log` for traceability

---

### Testing and Validation

* Simulated service failure by stopping nginx and verified automatic restart
* Simulated container failure and confirmed alert generation
* Verified logging accuracy for both normal and failure scenarios

---

### Challenges and Resolutions

* Docker is not managed by systemctl in WSL

  * Resolved by switching to Docker CLI-based monitoring

* Permission issues with Docker socket

  * Resolved by adding the user to the docker group

* Docker connectivity issues in WSL

  * Resolved by restarting WSL and Docker Desktop

---

### Limitations

* No centralized logging or alerting system
* No real-time notifications (e.g., email or Slack)
* Limited scalability beyond a single host
* Basic threshold-based monitoring only

---

### Future Improvements

* Integrate centralized logging (e.g., ELK stack)
* Add real-time alerting mechanisms (email or messaging integrations)
* Extend monitoring to multiple hosts
* Replace Bash with more scalable tooling (Python or monitoring agents)
* Integrate with observability tools like Prometheus and Grafana

---

### Key Learnings

* Practical understanding of service vs container monitoring
* Handling environment-specific constraints in WSL
* Importance of observability in production systems
* Designing basic self-healing mechanisms
* Automating operational workflows

---

### Summary

This project demonstrates foundational DevOps practices by combining monitoring, logging, and automated recovery into a single workflow. It reflects an understanding of incident handling and system reliability at a basic production level.

---

### Author

Reva

