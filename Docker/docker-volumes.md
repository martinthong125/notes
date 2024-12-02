# How to use docker volume (recommended)
The problem: when using WSL2, docker inspect <volume>, the Mountpoint location might not be found. Instead, open explorer and key this in address bar.
```sh
\\wsl$\docker-desktop-data\version-pack-data\community\docker\volumes
```
The solution: Use Host Volumes

1. Named Volumes (Linux) -persistent data even when container is stopped/deleted

  ```sh
  docker run --name jenkins-server1 -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
  ```

2. Host Volumes (WSL2, Linux) -share with other concurrently running containers aka high availability

  Create a folder /opt/jenkins_home and change permissions of the folder

  ```sh
  sudo mkdir /opt/jenkins_home
  sudo chmod 777 /opt/jenkins_home
  ```

  Run the containers
  ```sh
  docker run --name jenkins-server2 -p 8081:8080 -p 50001:50000 -v /opt/jenkins_home:/var/jenkins_home jenkins/jenkins:lts
  ```
  ```sh
  docker run --name jenkins-server3 -p 8082:8080 -p 50002:50000 -v /opt/jenkins_home:/var/jenkins_home jenkins/jenkins:lts
  ```

### Resources

https://github.com/microsoft/WSL/discussions/4176

https://www.youtube.com/watch?v=kXb7WAl1YN4
