# Simple WebApp deployed on Google Cloud Platform

This is a simple project that aims to implement a "Hello, World!" type app to a GKE Cluster, configuring Autoscaling, Load-balancing, CI/CD. It was done in just 2 days with little prior experience, so please don't be too harsh :)

## GKE Cluster and infrastructure

- The infrastructure for this app was provisioned exclusively using Terraform.
- The GKE cluster is configured to autoscale both vertically and horizontally, although this feature has only seen limited testing.
- The cluster is exposed to the internet using a load-balancer.

## CI/CD

- Implemented on a separate Compute Instance (VM) using Ansible & Jenkins.
- Jenkins is set to automatically poll the SCM Repo (this one) each minute and build from the ./webapp folder.
- It is then containerised using Docker and uploaded to gcr.io.
- Ansible reads any .yaml files and updates the GKE deployment using the new build, as well as any changes to the cluster.

### As of now, this project is

- Assuming I still have credits on Google Cloud, a fully functional WebApp exposed to the internet.
  - This is actually still a WIP, the load balancer is not yet properly configured. As of now it only works with port-forwarding
- A functional CI/CD Pipeline & Automatization Server.
- A succesful implementation of a K8s Cluster on the cloud.
- A fruitful learning experience.

### In the future, I'd like to

- Improve security by using HTTPS, SSL and properly configuring the Firewall and VPC.
- Add proper Monitoring and Notifications.
- Work on the WebApp itself. Develop the Backend in a more suited and familiar language (Python or Java, or maybe I'd learn Kotlin).

### If I were to start over, I would

- Deploy Jenkins and Ansible in two separate Containers (probably). Better Performance, but also more Complexity.
- Build from the beginning with Security in mind.
- Have proper git branches and practices (like not exposing my own keys).
- Do a much better job :)
