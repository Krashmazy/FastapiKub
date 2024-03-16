# secrets
echo "Déploiement Secrets"
kubectl apply -f ./YAML-STANDARD/k3s/postgres/secret.yaml
kubectl apply -f ./YAML-STANDARD/k3s/pgadmin/secret-pgadmin.yaml

# base de donnée
echo "Déploiement bases de données"
kubectl apply -f ./YAML-STANDARD/k3s/postgres/pvc.yaml
kubectl apply -f ./YAML-STANDARD/k3s/postgres/service.yaml
kubectl apply -f ./YAML-STANDARD/k3s/postgres/deployment.yaml

# application
echo "Déploiement applications"
kubectl apply -f ./YAML-STANDARD/k3s/fastapi/service.yaml
kubectl apply -f ./YAML-STANDARD/k3s/fastapi/deployment.yaml
#kubectl apply -f ./YAML-STANDARD/k3s/fastapi/ingress.yaml

# PGAdmin
echo "Déploiement PGAdmin"
kubectl apply -f ./YAML-STANDARD/k3s/pgadmin/service.yaml
kubectl apply -f ./YAML-STANDARD/k3s/pgadmin/deployment.yaml
#kubectl apply -f ./YAML-STANDARD/k3s/pgadmin/ingress.yaml
