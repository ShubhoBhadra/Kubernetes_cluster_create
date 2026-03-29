create:
  # This will create the kind cluster.
  echo "------ Creating cluster ------"
  echo "------------------------------"
	kind create cluster --name my-cluster --config kind-cluster.yaml
  echo "------ Cluster creation done ------"
  echo "-----------------------------------"
  #After 10 min i.e. 6000 sec, cluster will automatically delete.
	(sleep 6000 && kind delete cluster --name my-cluster) &

#This makefile is for the kind cluster creation and deleteion after particulsr interval, kind_cluster.yaml file.
