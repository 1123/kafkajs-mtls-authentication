helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

# Install the Nginx controller
helm upgrade  --install ingress-nginx ingress-nginx/ingress-nginx
