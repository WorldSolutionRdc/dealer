```markdown
# Proxy WebSocket avec load balancing pour Cloud Run

Proxy WebSocket avec répartition de charge (load balancing) entre plusieurs VPS, déployable sur Google Cloud Run.

## Architecture
```

Client WebSocket → Cloud Run → Nginx (Load Balancer) → VPS1, VPS2, VPS3, VPS4

```

## Fonctionnalités
- ✅ WebSocket proxy
- ✅ Load balancing round-robin
- ✅ Support UDP (badvpn-udpgw)
- ✅ Serveur SSH (dropbear)
- ✅ Optimisé pour HTTP Custom

## Configuration des VPS
Modifiez `nginx.conf` pour ajouter vos VPS :

```nginx
upstream backend {
    server VOTRE_VPS_1:443 max_fails=3;
    server VOTRE_VPS_2:443 max_fails=3;
    server VOTRE_VPS_3:443 max_fails=3;
}
```

Déploiement sur Cloud Run

```bash
gcloud run deploy dealer-proxy \
  --source https://github.com/WorldSolutionRdc/dealer \
  --platform managed \
  --region europe-west1 \
  --allow-unauthenticated \
  --port 8080 \
  --memory 512Mi \
  --cpu 1 \
  --timeout 3600
```

Variables d'environnement (optionnelles)

Variable Défaut Description
PORT 8080 Port d'écoute
DHOST 127.0.0.1 Hôte cible
DPORT 8080 Port cible

Fichiers inclus

· Dockerfile - Construction de l'image
· nginx.conf - Load balancer
· proxy3.js - Proxy WebSocket
· run.sh - Script de démarrage
· badvpn-src/ - Code source badvpn

Auteur

Déployé par GodWin | @GodWinAdm


## 🚀 **Pour mettre à jour votre README**

# Dans votre dossier local
cd ~/nova2022

# Modifier le README
nano README.md
# Copiez le contenu ci-dessus

# Pousser la mise à jour
git add README.md
git commit -m "Update README with complete documentation"
git push origin main
