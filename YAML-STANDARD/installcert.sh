# cert-manager
echo -e "\n==============================================================================\n"
echo "installing cert-manager"
echo -e "\n==============================================================================\n"
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.10.1 --set installCRDs=true
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.yaml

# waiting for the cert-manager pods to be ready
echo -e "\n==============================================================================\n"
echo "waiting for the cert-manager pods to be ready"
echo -e "\n==============================================================================\n"
echo "sleeping 15 seconds"
sleep 15
kubectl wait --for=condition=Ready pod -l app.kubernetes.io/component=webhook -n cert-manager --timeout=120s

# cert-manager plugin
echo -e "\n==============================================================================\n"
echo "installing cert-manager plugin"
echo -e "\n==============================================================================\n"
curl -L -o kubectl-cert-manager.tar.gz https://github.com/jetstack/cert-manager/releases/latest/download/kubectl-cert_manager-linux-amd64.tar.gz
tar xzf kubectl-cert-manager.tar.gz
sudo mv kubectl-cert_manager /usr/local/bin

# checking cert plugin
echo -e "\n==============================================================================\n"
echo "checking cert plugin"
echo -e "\n==============================================================================\n"
kubectl cert-manager check api