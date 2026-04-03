# Hardening Debian - Standards ANSSI (R32/R33)

Ce dépôt contient un script d'automatisation pour le durcissement (hardening) d'un serveur Debian 12, configuré pour un environnement de collectivité territoriale.

![Architecture Réseau Sécurisée](SCHEMA%20RESEAU.png)

## Contexte du Projet
Mise en conformité d'instances Debian exposées en respectant les guides de bonnes pratiques de l'ANSSI, avec maintien d'un accès d'administration via tunnel VPN.

## Analyse du script hardening.sh
* **Gestion des paquets :** Mise à jour systématique via le gestionnaire apt.
* **Sécurisation SSH :** * Interdiction du login root (PermitRootLogin no).
    * Filtrage des utilisateurs autorisés.
* **Pare-feu (Iptables) :**
    * Politique de filtrage restrictive (Default DROP).
    * Ouverture du flux SSH (Port 22) limitée exclusivement au subnet VPN (10.8.0.0/24).
    * Suivi de connexion (Stateful inspection).
* **Conformité :** Application des recommandations R32 et R33 de l'ANSSI.

## Procédure d'installation
1. Cloner le dépôt : `git clone https://github.com/Zine92k/Hardening-Debian-ANSSI`
2. Rendre le script exécutable : `chmod +x hardening.sh`
3. Exécuter avec les privilèges root : `sudo ./hardening.sh`

**Note de sécurité :** L'activation des règles iptables peut couper l'accès distant si le VPN n'est pas correctement configuré avant l'exécution.
