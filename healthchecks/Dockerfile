# Utiliser l'image de base Nginx
FROM nginx:latest

# Copier le fichier de configuration Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Exposer le port 80
EXPOSE 80

# Définir le health check
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD curl -f http://localhost/health || exit 1
