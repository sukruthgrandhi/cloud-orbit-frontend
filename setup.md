# install microk8s
apt update
snap install microk8s --classic --channel=1.29
microk8s status --wait-ready

# optional
sudo usermod -a -G microk8s $USER
sudo mkdir -p ~/.kube
sudo chown -f -R $USER ~/.kube

# microk8s addon
microk8s enable community
microk8s enable dns
microk8s enable hostpath-storage
microk8s enable ingress
microk8s enable cert-manager

# adding alias
snap alias microk8s.kubectl kubectl
snap alias microk8s.helm helm

# enable argocd
microk8s enable argocd

```In order to access the server UI you have the following options:

1. kubectl port-forward service/argo-cd-argocd-server -n argocd 8080:443

    and then open the browser on http://localhost:8080 and accept the certificate

2. enable ingress in the values file `server.ingress.enabled` and either
      - Add the annotation for ssl passthrough: https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#option-1-ssl-passthrough
      - Set the `configs.params."server.insecure"` in the values file and terminate SSL at your ingress: https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#option-2-multiple-ingress-objects-and-hosts


After reaching the UI the first time you can login with username: admin and the random password generated during the installation. You can find the password by running:

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

(You should delete the initial secret afterwards as suggested by the Getting Started Guide: https://argo-cd.readthedocs.io/en/stable/getting_started/#4-login-using-the-cli)
ArgoCD is installed
```