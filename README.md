Etudiant
DURBIN Deniz Ali 21111116
GILARDI Avi 21109361

Projet 1 OPSCI: Conteneurisation et déploiement d'une application Web (de gestion de stock d'un magasin).


Dans ce repo github se trouvent: Dockerfile (pour l'application strapi), docker-compose.yml, notre README et vidéo, deux scripts bash start.sh et stop.sh et un dossier "frontend". Dans ce dossier se trouvent: Dockerfile (pour l'application react) et conf.ts dans lequel se trouvent l'API token et l'URL.




conf.ts :
export const TOKEN =
  '9b97cdfb4b0674fac1d8c33671025402c08d1dcec65fc1090311f246d2852228fc8bbd9a4bca1f972865174df338ae18b2883e0d52dce921be9557d52ffbb6e527c583d8fd16dd2fe78c81efb107ef4a74920c392237e7667f2b278bd295797b9c7a152b7865c6f1bae40b83c68410c4f8d80671b8be811dae4e49797c9749fa'
export const URL = 'http://localhost:1337'



Nom des conteneurs:
$ sudo docker ps
docker_db : strapi-pg                port: 5432     
docker_strapi : projet-strapi        port: 1337
docker_react : strapi-frontend       port: 3000

Network : strapi-network IP: 172.20.0.0/16


Endpoints nécessaire à son utilisation : 
    adresses et ports de tous les éléments de l’application.

admin strapi : localhost 1337
frontend : 172.21.0.4:5173




Ce projet est composé de 3 parties pour pouvoir fonctionner :
-strapi : un serveur CMS (content manager system) https://docs.strapi.io/dev-docs/quick-start
-la base de données de strapi (postgresql)
-un frontend web utilisant l’API de strapi : https://github.com/arthurescriou/opsci-strapi-frontend

Strapi nous permet de créer, gérer et publier du contenu sur le web sans imposer de structure de présentation. Cette flexibilité permet aux développeurs de concevoir des expériences numériques personnalisées en utilisant n'importe quel framework frontend ou technologie de rendu.

Nous avons intégré notre Strapi avec une base de données PostgreSQL (PSQL). En conteneurisant l'application web, nous sommes en mesure de la redéployer sur diverses infrastructures. 
En evitant ainsi les problemes eventuelles de corresponsabilité.
Notre architecture comprend plusieurs conteneurs Docker : un conteneur pour la base de données PostgreSQL, un conteneur pour Strapi, et un conteneur pour le frontend développé en React.

Le docker-compose est responsable de lier ces différents conteneurs ensemble, facilitant ainsi la gestion et le déploiement cohérent de notre application.



Description du docker-compose

Le fichier docker-compose définit les trois services qui composent votre application :

    strapi-pg :
        Utilise l'image Docker PostgreSQL la plus récente.
        Le nom du conteneur est défini comme "strapi-pg".
        Redémarre automatiquement le conteneur sauf s'il est arrêté manuellement.
        Configure les variables d'environnement pour définir le nom d'utilisateur, le mot de passe et la base de données PostgreSQL.
        Montre un volume pour stocker les données de la base de données PostgreSQL.
        Connecte le service au réseau "strapi-network".

    projet-strapi :
        Construit le conteneur en utilisant le Dockerfile dans le répertoire courant.
        Le nom du conteneur est défini comme "projet-strapi".
        Redémarre automatiquement le conteneur sauf s'il est arrêté manuellement.
        Expose le port 1337 pour accéder à l'interface Strapi.
        Déclare les dépendances sur le service "strapi-pg".
        Configure les variables d'environnement pour spécifier l'hôte de la base de données, le port, le nom d'utilisateur, le mot de passe, ainsi que certaines clés d'application et jetons.
        Connecte le service au réseau "strapi-network".

    strapi-frontend :
        Construit le conteneur en utilisant le Dockerfile dans le répertoire "opsci-strapi-frontend".
        Le nom du conteneur est défini comme "strapi-frontend".
        Expose le port 3000 pour accéder à l'application frontend.
        Déclare les dépendances sur le service "projet-strapi".
        Connecte le service au réseau "strapi-network".




