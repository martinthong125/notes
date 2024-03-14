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
