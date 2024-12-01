# GKE paltform
application platform with GKE

## Components
- ArgoCD

## Setup
- create GKE cluster
  - cd terraform; terraform apply
- get credentials for kubectl
  - gcloud container clusters get-credentials sample-gke-platform --region asia-northeast1
- setup argocd
  - kubectl apply -f k8s_manifest/argocd.yaml
  - kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
  - kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  - kubectl port-forward svc/argocd-server -n argocd --address 0.0.0.0 8080:443
- deploy sample app
