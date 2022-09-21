Situation:

Windows laptop with WSL2 becomes unresponsive after some usage. This is due to the resources allocated to WSL2 not deallocated even after use.

Solution: 

1. Create a file .wslconfig at c:\Users\<username>\.wslconfig
2. Copy and paste the configuration into the file.

```sh
[wsl2]
memory=4GB # Limits VM memory in WSL 2 
processors=4 # Makes the WSL 2 VM use 4 virtual processors
```

3. Open Powershell with admin rights and key in

```sh
Restart-Service LxssManager
```
or
```sh
wsl --shutdown
```

4. Check by launching Ubuntu and key in the commands

```sh
lscpu # check CPU allocated
free -m # check memory allocated
```
