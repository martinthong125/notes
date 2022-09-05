# How to use docker volume (recommended)
The problem: when using WSL2, the given named volume location might not be found. Instead, open explorer and key this in address bar.
```sh
\\wsl$\docker-desktop-data\version-pack-data\community\docker\volumes
```
The solution: Use Host Volumes

1. Named Volumes (Linux) -persistent data even when container is stopped/deleted

  ```sh
  docker run -it --name jenkins-server -v jenkins_home:/var/jenkins_home jenkins:latest /bin/bash
  ```

2. Host Volumes (WSL2, Linux) -share with other concurrently running containers

  Create a folder /jenkins_home in /opt and change permissions to folder
  
  ```sh
  sudo mkdir /opt/jenkins_home
  sudo chmod 777 /opt/jenkins_home
  ```
  
  Run the container
  ```sh
  docker run -it --name jenkins-server -v /opt/jenkins_home:/var/jenkins_home jenkins:latest /bin/bash
  ```
