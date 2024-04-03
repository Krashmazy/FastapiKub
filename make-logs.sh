# Collecte des logs de déploiement
kubectl describe deployments -n standard > logs/log-STANDARD/standard-deployment.txt
kubectl describe deployments -n helm > logs/log-HELM/helm-deployment.txt
kubectl describe deployments -n kustomize > logs/log-KUSTOMIZE/kustomize-deployment.txt

# Collecte des logs des informations de StatefulSet
kubectl describe statefulsets -n standard > logs/log-STANDARD/standard-statefulset.txt
kubectl describe statefulsets -n helm > logs/log-HELM/helm-statefulset.txt
kubectl describe statefulsets -n kustomize > logs/log-KUSTOMIZE/kustomize-statefulset.txt

# Collecte des logs des Persistent Volumes
kubectl get pv > logs/
# Collecte des logs des Ingress
kubectl describe ingress -n standard > logs/log-STANDARD/standard-ingress.txt
kubectl describe ingress -n helm > logs/log-HELM/helm-ingress.txt
kubectl describe ingress -n kustomize > logs/log-KUSTOMIZE/kustomize-ingress.txt