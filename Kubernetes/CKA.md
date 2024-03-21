# Kubernetes CKA

## Set a hostname for each server

```
sudo hostnamectl set-hostname <hostname>
```

```
sudo hostnamectl set-hostname k8s-control
```

## setup dns on all servers

```
sudo vi /etc/hosts
```

copy the following into the hosts file

```
<privateIP1> <hostname1>

<privateIP2> <hostname2>

<privateIP3> <hostname3>
```

## Namespace commands

```
kubectl create namespace <my-namespace>
kubectl get namespaces
kubectl get pods -n kube-system
kubectl get pods --all-namespaces
```

## Drain a k8s node - move all the pods from one node to another node

```
kubectl get nodes -o wide
kubectl drain <node-name> --ignore-daemonsets --force
```

## Uncordoning a node - enable a node to be deployed

```
kubectl uncordon <node-name>
```

## Steps to upgrade control plane node

1.  Drain the control plane node

    ```
    kubectl drain <control-node> --ignore-daemonsets
    ```

    ```
    kubectl drain k8s-control --ignore-daemonsets
    ```

1.  Upgrade kubeadm on the control plane node

    ```
    sudo apt-get update && \
    sudo apt-get install -y --allow-change-held-packages kubeadm=<latest-version>
    ```

    ```
    sudo apt-get update && \
    sudo apt-get install -y --allow-change-held-packages kubeadm=1.27.2-00
    ```

1.  Check kubeadm version

    ```
    kubeadm version
    ```

1.  Plan the upgrade (kubeadm upgrade plan)

    ```
    sudo kubeadm upgrade plan <latest-version>
    ```

    ```
    sudo kubeadm upgrade plan v1.27.2
    ```

1.  Apply the upgrade (kubeadm upgrade apply)

    ```
    sudo kubeadm upgrade apply <latest-version>
    ```

    ```
    sudo kubeadm upgrade apply v1.27.2 -y
    ```

1.  Upgrade kubelet and kubectl on the control plane node

    ```
    sudo apt-get update && \
    sudo apt-get install -y --allow-change-held-packages \
    kubelet=<latest-version> kubectl=<latest-version>
    ```

    ```
    sudo apt-get update && \
    sudo apt-get install -y --allow-change-held-packages \
    kubelet=1.27.2-00 kubectl=1.27.2-00
    ```

    ```
    sudo systemctl daemon-reload
    sudo systemctl restart kubelet
    ```

1.  Uncordon the control plane node

    ```
    kubectl uncordon <control-node>
    ```

    ```
    kubectl uncordon k8s-control
    ```

1.  Check k8s version from the control plane

    ```
    kubectl get nodes
    ```

## Steps to upgrade worker node

1. Drain the node from the control plane node

   ```
   kubectl drain <worker-node> --ignore-daemonsets --force
   ```

   ```
   kubectl drain k8s-worker1 --ignore-daemonsets --force
   ```

1. Upgrade kubeadm on worker node

   ```
   sudo apt-get update && \
   sudo apt-get install -y --allow-change-held-packages kubeadm=<latest-version>
   ```

   ```
   sudo apt-get update && \
   sudo apt-get install -y --allow-change-held-packages kubeadm=1.27.2-00
   ```

1. Check kubeadm version

   ```
   kubeadm version
   ```

1. Upgrade the kubelet configuration (kubeadm upgrade node)

   ```
   sudo kubeadm upgrade node
   ```

1. Upgrade kubelet and kubectl

   ```
   sudo apt-get update && \
   sudo apt-get install -y --allow-change-held-packages kubelet=<latest-version> kubectl=<latest-version>
   ```

   ```
   sudo apt-get update && \
   sudo apt-get install -y --allow-change-held-packages kubelet=1.27.2-00 kubectl=1.27.2-00
   ```

   ```
   sudo systemctl daemon-reload
   sudo systemctl restart kubelet
   ```

1. Uncordon the node from the control plane node

   ```
   kubectl uncordon <worker-node>
   ```

   ```
   kubectl uncordon k8s-worker1
   ```

1. Check k8s version from the control plane node

   ```
   kubectl get nodes
   ```

## Backup etcd

1. Look up the value for the key cluster.name in the etcd cluster

   ```
   ETCDCTL_API=3 etcdctl get cluster.name \
   --endpoints=https://<private-ip>:2379 \
   --cacert=/home/cloud_user/etcd-certs/etcd-ca.pem \
   --cert=/home/cloud_user/etcd-certs/etcd-server.crt \
   --key=/home/cloud_user/etcd-certs/etcd-server.key
   ```

1. Back up etcd using etcdctl and the provided etcd certificates:

   ```
   ETCDCTL_API=3 etcdctl snapshot save /home/cloud_user/etcd_backup.db \
   --endpoints=https://<private-ip>:2379 \
   --cacert=/home/cloud_user/etcd-certs/etcd-ca.pem \
   --cert=/home/cloud_user/etcd-certs/etcd-server.crt \
   --key=/home/cloud_user/etcd-certs/etcd-server.key
   ```

## Restore etcd

1. Restore the etcd data from the backup (this command spins up a temporary etcd cluster, saving the data from the backup file to a new data directory in the same location where the previous data directory was)

   ```
   sudo ETCDCTL_API=3 etcdctl snapshot restore /home/cloud_user/etcd_backup.db \
   --initial-cluster etcd-restore=https://<private-ip>:2380 \
   --initial-advertise-peer-urls https://<private-ip>:2380 \
   --name etcd-restore \
   --data-dir /var/lib/etcd
   ```

1. Set ownership on the new data directory

   ```
   sudo chown -R etcd:etcd /var/lib/etcd
   ```

1. Start etcd

   ```
   sudo systemctl start etcd
   ```

1. Verify the restored data is present by looking up the value for the key cluster.name again

   ```
   ETCDCTL_API=3 etcdctl get cluster.name \
   --endpoints=https://<private-ip>:2379 \
   --cacert=/home/cloud_user/etcd-certs/etcd-ca.pem \
   --cert=/home/cloud_user/etcd-certs/etcd-server.crt \
   --key=/home/cloud_user/etcd-certs/etcd-server.key
   ```

## kubectl commands

1. kubectl get

   ```
   kubectl get nodes
   kubectl get pods -o wide
   kubectl get pods -o yaml
   kubectl get pods -o --sort-by .spec.nodeName
   kubectl get pods -n kube-system
   kubectl get pods -n kube-system --selector k8s-app=calico-node
   ```

1. kubectl describe

   ```
   kubectl describe pod <pod-name>
   ```

1. kubectl create

   ```
   kubectl create -f <file-name>
   kubectl create deployment <deployment-name> --image=nginx
   kubectl create deployment <deployment-name> --image=nginx -dry-run=client -o yaml > <deployment-name>.yaml
   ```

1. kubectl apply

   ```
   kubectl apply -f <file-name>
   ```

1. kubectl delete

   ```
   kubectl delete pod my-pod
   kubectl delete -f <file-name>
   ```

1. kubectl exec

   ```
   kubectl exec <pod-name> -c <container-name> -- <command>
   kubectl exec my-pod -c busybox -- echo "Hello world!"
   ```

## Role-based Access Control (RBAC)

A **Role** defines permissions within a particular namespace, and a **ClusterRole** defines permissions not specific to a single namespace.

**RoleBinding** and **ClusterRoleBinding** are objects that connect Roles and ClusterRoles to users.

## Service Accounts

A **service account** is an account used by container processes within pods to authenicate with the K8s API.

## ConfigMaps

ConfigMaps store data in the form of a key-value map. ConfigMap data can be passed to your container applications.

## Secrets

Secrets are similar to ConfigMaps but are designed to store sensitive data, such as passwords or API keys, more securely. They are created and used similarly to ConfigMaps.

The secret value must be base64-encoded.

```
echo -n '<secret-value>'| base64
```

## Environment Variables

You can pass ConfigMap and Secret data to your containers as environment variables. These variables will be visible to your container process at runtime.

## Configuration Volumes

Configuration data from ConfigMaps and Secrets can also be passed to containers in the form of mounted volumes. This will cause the configuration data to appear in files available to the container file system.

Each top-level key in the configuration data will appear as a file containing all keys below that top-level key.

## Generate an htpasswd file and store it as a secret

1. Generate an htpasswd file

   ```
   htpasswd -c .htpasswd user
   ```

1. View the file's content

   ```
   cat .htpasswd
   ```

1. Create a secret containing the htpasswd data

   ```
   kubectl create secret generic nginx-htpasswd --from-file .htpasswd
   ```

1. Delete the .htpasswd file

   ```
   rm .htpasswd
   ```

1. Verify that container1 can access container2

   ```
   kubectl exec <container1> -- curl -u user:<PASSWORD> <CONTAINER2_IP>
   ```

## Container Resources

Resource Requests - define an amount of resources (such as CPU or memory) you expect a container to use.

Resource Limits - limits the amount of resources your container can use.

CPU is measured in CPU units, which is 1/1000 of one CPU. Eg. 250m = 1/4 CPU

Memory is measured in bytes. Eg. 128Mi = 128 MB

## Container Health

K8s provides a number of features that allow you to build robust solutions, such as the ability to automatically resart unhealthy containers. To make the most of these features, K8s needs to be able to accurately determine the status of your applications. This means actively monitoring container health.

### Liveness Probes

- It allow you to automatically determine whether or not a container application is in a healthy state.
- By default, K8s will only consider a container to be "down" if the container process stops.
- Livness probes allow you to customize this detection mechanism and make it more sophisticated.

### Startup Probes

- They are very similar to liveness probes. However, while liveness probes run constantly on a schedule, startup probes run at container startup and stop running once they succeed.
- They are used to determine when the application has successfully started up. Startup probes are especially useful for legacy applications that can have long startup times.

### Readiness Probes

- They are used to determine when a container is ready to accept requests. When you have a service backed by multiple container endpoints, user traffic will not be sent to a particular pod until its containers have all passed the readiness checks defined by their readiness probes.
- Use readiness probes to prevent user traffic from being sent to pods that are still in the process of starting up.

## Restart Policies

K8s can automatically restart containers when they fail. Restart policies allow you to customize this behavior by defining when you want a pod's containers to be automatically restarted.

Restart policies are an important component of self-healing applications, which are automatically repaired when a problem arises.

There are three possible values for a pod's restart policy in K8s: Always, OnFailure, and Never.

**Always** - This is the default restart policy in K8s. With this policy, containers will always be restarted if they stop, even if they completed succesfully. Use this policy for applications that should always be running.

**OnFailure** - This restart policy will restart containers only if the container process exits with an error code or the container is determined to be unhealthy by a liveness probe. Use this policy for applications that need to be run successfully and then stop.

**Never** - This restart policy will cause the pod's containers to never be restarted, even if the container exits or a liveness probe fails. Use this for applications that should run once and never be automatically restarted.

## Multi-Container Pod

In a multi-container Pod, the containers share resources such as **network** and **storage**. They can interact with one anther, working together to provide functionality.

## Init containers

Init containers are containers that run once during the startup process of a pod. A pod can have any number of init containers, and they will each run once (in order) to completion.

You can use init containers to perform a variety of startup tasks. They can contain and use software and setup scripts that are not needed by your main containers.

They are often useful in keeping your main containers lighter and more secure by offloading startup tasks to a separate container.

Use cases for Init Containers

- Cause a pod to wait for another K8s resource to be created before finishing startup.
- Perform sensitive startup steps securely outside of app containers.
- Populate data into a shared volume at startup.
- Communicate with another service at startup.
- Eg. Frontend container will wait for backend container to run first before starting.

## K8s Scheduling

**Scheduling** - The process of assigning Pods to Nodes so kubelets can run them

**Scheduler** - Control plane component that handles scheduling

**Scheduling Process** - The Kubernetes scheduler selects a suitable Node for each Pod. It takes into account things like:

- Resouce requests vs available node resources
- Various configurations that affect scheduling using node labels

**nodeSelector** - You can configure a nodeSelector for your Pods to limit which Nodes(s) the Pod can be scheduled on. Node selectors use node labels to filter suitable nodes.

**nodeName** - You can bypass scheduling and assign a Pod to a specific Node by name using nodeName.

## Using DaemonSets

**DaemonSets** - Automatically runs a copy of a Pod on each node. DaemonSets will run a copy of the POd on new nodes as they are added to the cluster.

**DaemonSets and Scheduling** - DaemonSets respect normal scheduling rules around node labels, taints, and tolerations. If a pod would not normally be scheduled on a node, a DaemonSet will not create a copy of the Pod on that Node.

**Static Pod** - A Pod that is managed directly by the kubelet on a node, not by the K8s API server. They can run even if there is no K8s API server present. Kubelet automatically creates static Pods from YAML manifest files located in the manifest path on the node.

**Mirror Pod** - Kubelet will create a mirror Pod for each static Pod. Mirror Pods allow you to see the status of the static Pod via the K8s API, but you cannot change or manage them via the API.

## Deployment

A K8s object that defines a **desired state** for a ReplicaSet (a set of replica Pods). The Deployment Controller seeks to mainain the desired state by creating, deleting, and replacing Pods with new configurations.

A Deployment's Desired State includes:

1. replicas - The number of replica Pods the Deployment will seek to maintain
2. selector - A label selector used to identify the replica Pods managed by the Deployment
3. template - A template Pod definition used to create replica Pods

Use Cases:

There are many use cases for Deployments, such as:

- Easily scale an application up or down by changing the number of replicas.
- Perform rolling updates to deploy a new software version.
- Roll back to a previous software version.

### Scaling Applications with Deployments

Scaling refers to dedeicating more (or fewer) resources to an application in order to meet changing needs.

K8s Deployments are very useful in **horizontal scaling**, which involves changing the number of containers running an application.

### Deployment Scaling

The Deployment's **replicas** setting determines how many replicas are desired in its desired state. If the **replicas** number is changed, replica Pods will be created or deleted to satisfy the new number.

### How to Scale a Deployment

- Edit the YAML file
- kubectl scale command

### Managing Rolling Updates with Deployments

**Rolling Update** - Rolling updates allow you to make changes to a Deployment's Pods at a controlled rate, gradually replacing old Pods, with new Pods. This allows you to update your Pods without incurring downtime.

**Rollback** - If an update to a deployment causes a problem, you can roll back the depoyment to a previous working state.

## K8s Networking Architectural

### Kubernetes Network Model

The **Kubernetes network model** is a set of standards that define how networking between Pods behaves.

There are a variety of different implementations of this model - including the Calico network plugin.

### Network Model Architecture

The **Kubernetes network model** defines how Pods communicate with each other, regardless of which Node they are running on.

Each Pod has its own unique IP address within the cluster.

Any Pod can reach any other Pod using that Pod's IP address. This creates a virtual network that allows Pods to easily communicate with each other, regardless of which node they are on.

### CNI Plugins

**CNI plugins** are a type of Kubernetes network plugin. These plugins provide network connectivity between Pods according to the standard set by the Kubernetes network model.

Each plugin has its own unique installation process. Eg. Calico network plugin

```
kubectl apply -f https://docs.projectcalico.org/v3.27.2/manifests/calico.yaml
```

Kubernetes nodes will remain **NotReady** until a network pugin is installed. You will be unable to run Pods while this is the case.

### K8s DNS

The K8s virtual network uses a **DNS** (Domain Name System) to allow Pods to locate other Pods and Services using domain names instead of IP addresses.

This DNS runs as a Service within the cluster. You can usually find it in the **kube-system** namespace.

Kubeadm clusters use **CoreDNS**.

### Pod Domain Names

All Pods in our Kubeadm cluster are automatically given a domain name of the following form:

```
<pod-ip-address>.<namespace-name>.pod.cluster.local
```

A pod in the default namespace with the IP address 192.168.10.100 would have a domain name like this:

```
192-168-10-100.default.pod.cluster.local
```

### Using Network Policies

A K8s **NetworkPolicy** is an object that allows you to control the flow of network communication to and from Pods.

This allows you to build a more secure cluster network by keeping Pods isolated from traffic they do not need.

**podSelector** - Determines to which Pods in the namespace the NetworkPolicy applies. The podSelector can select Pods using Pod labels.

Note: By default, Pods are considered non-isolated and completly open to all communication. If any NetworkPolicy selects a Pod, the Pod is considered isolated and will only be open to traffic allowed by NetworkPolicies.

A NetworkPolicy can apply to Ingress, Egress, or both.

1. Ingress - Incoming network traffic coming into the Pod from another source.
1. Egress - Outgoing network traffic leaving the Pod for another destination.

**from and to Selectors:**

**from selector** - Selects ingress (incoming) traffic that will be allowed.

**to selector** - Selects egress (outgoing) traffic that will be allowed.

**podSelector** - Select Pods to allow traffic from/to.

**namespaceSelector** - Select namespaces to allow traffic from/to.

**ipBlock** - Select an IP range to allow traffic from/to.

**Ports**

**port** - Specifies one or more ports that will allow traffic.

Traffic is only allowed if it matches both an allowed port and one of the from/to rules.
