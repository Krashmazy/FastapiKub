# Namespace
echo "Déploiement des Namespaces"
kubectl apply -f ./namespace.yaml

# secrets
echo "Déploiement Secrets"
kubectl apply -f ./YAML-STANDARD/k3s/postgres/secret.yaml
kubectl apply -f ./YAML-STANDARD/k3s/pgadmin/secret-pgadmin.yaml

# base de donnée
echo "Déploiement bases de données"
kubectl apply -f ./YAML-STANDARD/k3s/postgres/pvc.yaml
kubectl apply -f ./YAML-STANDARD/k3s/postgres/service.yaml
kubectl apply -f ./YAML-STANDARD/k3s/postgres/statefulset.yaml

# application
echo "Déploiement applications"
kubectl apply -f ./YAML-STANDARD/k3s/fastapi/service.yaml
kubectl apply -f ./YAML-STANDARD/k3s/fastapi/deployment.yaml
kubectl apply -f ./YAML-STANDARD/k3s/ingress.yaml

# PGAdmin
echo "Déploiement PGAdmin"
kubectl apply -f ./YAML-STANDARD/k3s/pgadmin/service.yaml
kubectl apply -f ./YAML-STANDARD/k3s/pgadmin/deployment.yaml

# Ingress
echo "Déploiement Ingress et HPA"
kubectl apply -f ./YAML-STANDARD/k3s/ingress.yaml
kubectl apply -f ./YAML-STANDARD/k3s/fastapi/hpa.yaml

# HELM
echo "Déploiement HELM"
helm install helm-chart ./HELM --values=./HELM/values.yaml

# Kustomize
echo "Déploiement Kustomize"
kubectl apply -k Kustomize