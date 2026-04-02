Production Monitoring and Incident Response System

Overview  
This project is a Bash-based monitoring system designed to simulate real-world DevOps incident handling. It monitors services, system resources, and Docker containers, while performing automated recovery and logging.

Features  
- Service monitoring (nginx)  
- Docker container monitoring  
- CPU and memory usage tracking  
- Automatic service restart  
- Alert generation (alerts.log)  
- Activity logging (prod.log)  
- Cron-based automation  
- Log rotation support  

Tech Stack  
- Bash  
- Linux (WSL)  
- Docker  
- Cron  

How It Works  
The script runs at regular intervals using cron. It checks the status of system services using systemctl and verifies Docker container activity using docker ps. It logs system activity and generates alerts when issues are detected. If a service is down, it attempts automatic recovery.

Testing  
- Stopped nginx service and verified automatic restart  
- Stopped Docker containers and verified alert generation  

Challenges and Resolutions  
- Docker is not managed by systemctl in WSL, so Docker monitoring was implemented using CLI commands instead  
- Faced permission issues with Docker socket, resolved by adding user to docker group  
- Encountered Docker connectivity issues in WSL, resolved by restarting WSL and Docker Desktop  

Key Learnings  
- Difference between system services and container-based workloads  
- Handling environment-specific constraints in WSL  
- Importance of logging and monitoring in production systems  
- Automating operational tasks using cron  

Author  
Reva
