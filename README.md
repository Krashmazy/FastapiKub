
## Installation
 * utilisation :
- installer cert-manager : bash YAML-STANDARD/K3s/installcert.sh
- installer helm : bash installhelm.sh
- installer et deployer : bash install.sh
- desinstaller : bash destroy.sh
<<<<<<< HEAD
=======

## CONTEXTE :
Le projet consiste de déployer les nouveaux micro services qui permettront 
l'enregistrement des utilisateurs et le décompte des utilisateurs présents 
sur la plateforme.

## MICRO SERVICE :
un service qui déploie l'application : FASTAPI
un second qui dépose les données dans une base de données : POSTGRES
un troisième qui déploie PGADMIN pour la gestion de la base de données

## CONTRAINTES :
- HPA : minimum 3 et maximum 6 en se basant sur une consommation de 70% de la ressource CPU
- Préparer un backup pour le cluster grâce à K3S
- Sécuriser l'API grâce à un certificat SSL (let's encrypt)
