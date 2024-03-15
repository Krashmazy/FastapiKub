#!/bin/bash
#arret si error
set -e

# secrets
echo "Déploiement Secrets"
kubectl apply -f ./postgres/secret.yaml

# base de donnée
echo "Déploiement bases de données"
kubectl apply -f ./postgres/service.yaml
kubectl apply -f ./postgres/deployment.yaml

# application
echo "Déploiement applications"
kubectl apply -f ./fastapi/service.yaml
kubectl apply -f ./fastapi/deployment.yaml
#kubectl apply -f ./fastapi/ingress.yaml

# PGAdmin
echo "Déploiement PGAdmin"
kubectl apply -f ./pgadmin/service.yaml
kubectl apply -f ./pgadmin/deployment.yaml
#kubectl apply -f ./pgadmin/ingress.yaml

