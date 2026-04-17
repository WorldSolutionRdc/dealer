```markdown
<div align="center">
  
# 🚀 PROXY WEBSOCKET CLOUD RUN

### Load Balancing Multi-VPS | High Performance | Auto-scaling

[![Deploy on Cloud Run](https://img.shields.io/badge/Deploy-Cloud%20Run-blue?style=for-the-badge&logo=google-cloud)](https://cloud.google.com/run)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![Version](https://img.shields.io/badge/Version-2.0-orange?style=for-the-badge)]()

</div>

---

## 📋 **Table des matières**
- [Architecture](#-architecture)
- [Fonctionnalités](#-fonctionnalités)
- [Prérequis](#-prérequis)
- [Configuration](#-configuration)
- [Déploiement](#-déploiement)
- [Variables d'environnement](#-variables-denvironnement)
- [Commandes utiles](#-commandes-utiles)
- [Dépannage](#-dépannage)
- [Auteur](#-auteur)

---

## 🏗️ **Architecture**

```mermaid
graph LR
    A[Client HTTP Custom] --> B[Cloud Run]
    B --> C[Nginx Load Balancer]
    C --> D[VPS 1 :443]
    C --> E[VPS 2 :443]
    C --> F[VPS 3 :443]
    C --> G[VPS 4 :443]
```

```
┌─────────────────────────────────────────────────────────────────┐
│                         CLOUD RUN                               │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────────────┐  │
│  │  proxy3.js  │ →  │   nginx     │ →  │  VPS1, VPS2, VPS3   │  │
│  │ (WebSocket) │    │(Load Balancer)│  │     (Backends)      │  │
│  └─────────────┘    └─────────────┘    └─────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
```

---

⚡ Fonctionnalités

Fonctionnalité Description
🌐 WebSocket Proxy Tunnel WebSocket haute performance
🔄 Load Balancing Répartition automatique round-robin
📡 Support UDP Intégration badvpn-udpgw
🔐 Serveur SSH Dropbear intégré
📱 HTTP Custom Ready Payload compatible
💰 Économies Min instances = 0, payez à l'usage
🚀 Auto-scaling Scale de 0 à 2 instances

---

📦 Prérequis

Élément Version
Compte Google Cloud Actif avec facturation
gcloud CLI Dernière version
Git 2.x+
Docker 20.x+ (optionnel)

---

🛠️ Configuration

1. Ajouter vos VPS dans nginx.conf

```nginx
stream {
    upstream backend {
        server VOTRE_VPS_1:443 max_fails=3;
        server VOTRE_VPS_2:443 max_fails=3;
        server VOTRE_VPS_3:443 max_fails=3;
        server VOTRE_VPS_4:443 max_fails=3;
    }
}
```

2. Options de load balancing

Algorithme Configuration Utilisation
Round-robin server ip:port; ✅ Par défaut
Least connections least_conn; Charge minimale
IP Hash ip_hash; Sticky sessions
