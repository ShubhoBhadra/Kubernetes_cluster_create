create:
	# Check if kind is installed
	@if ! command -v kind >/dev/null 2>&1; then \
		echo "kind not found. Installing kind..."; \
		curl -Lo ./kind https://kind.sigs.k8s.io/dl/latest/kind-darwin-amd64; \
		chmod +x ./kind; \
		sudo mv ./kind /usr/local/bin/kind; \
		echo "kind installed successfully"; \
	else \
		echo "kind already installed. Skipping installation."; \
	fi

  # This will create the kind cluster.
    echo "------ Creating cluster ------"
	kind create cluster --name my-cluster --config kind-cluster.yaml
    echo "------ Cluster creation done ------"
  
  # After 10 min i.e. 6000 sec, cluster will automatically delete.
	(sleep 6000 && kind delete cluster --name my-cluster) &

#This makefile is for the kind cluster creation and deleteion after particulsr interval, kind_cluster.yaml file.
