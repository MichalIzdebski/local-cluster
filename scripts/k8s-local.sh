
limactl start k3s-dev.yaml &

 export KUBECONFIG="$HOME/.lima/k3s-dev/copied-from-guest/kubeconfig.yaml"

sleep 60

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.7/config/manifests/metallb-native.yaml

echo "Waiting for MetalLB"

sleep 120

kubectl apply -f metallb-ip.yaml

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sleep 30
kubectl apply -f argo-init.yaml



