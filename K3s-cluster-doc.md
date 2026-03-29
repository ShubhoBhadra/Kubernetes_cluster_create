# 🚀 Guide: Creating a Multi-Node K3s Cluster via Docker
This document outlines the steps to initialize a 4-node Kubernetes cluster (1 Master, 3 Workers) using Docker Compose and the official K3s image.

# 1. Provision the Infrastructure
* Run the following command to pull the images and start the containers in the background.
```
docker-compose -f k3s-kind.yaml up -d
```

# 2. Monitor Initial Boot
* The Master node needs a few seconds to generate certificates and the configuration file.
```
docker logs -f k8s-master
```
* Note: Wait until you see a log entry similar to Wrote kubeconfig to /etc/rancher/k3s/k3s.yaml

# 3. Configure Local Access (kubectl)
* To manage the cluster from your host machine (Mac), you need to extract the credentials and map them to the correct local port.

* Extract the configuration:
```
docker exec k8s-master cat /etc/rancher/k3s/k3s.yaml > k3s-config.yaml
```

* Patch the API Endpoint:
* Since Docker Desktop for Mac maps internal container ports to local ports, we must update the config to point to 6445.
```
sed -i '' 's/127.0.0.1:6443/127.0.0.1:6445/g' k3s-config.yaml
```

* Set the Environment Variable:
```
export KUBECONFIG=$PWD/k3s-config.yaml
```

# 4. Verify Cluster Health
* Check that all four nodes have joined the cluster and reached the Ready status.
```
kubectl get nodes
```

-----------------------------------------------------------------------------------------------------------------------------
NOTE: Used for File name: K3S_cluster-create.yaml
