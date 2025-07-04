$ helm3 plugin install https://github.com/helm/helm-2to3
Downloading and installing helm-2to3 v0.2.0 ...
https://github.com/helm/helm-2to3/releases/download/v0.2.0/helm-2to3_0.2.0_darwin_amd64.tar.gz
Installed plugin: 2to3

helm repo add gitlab https://charts.gitlab.io
helm repo update
helm upgrade --install web4 gitlab/gitlab-agent \
--namespace gitlab-agent-web4 \
--create-namespace \
--set config.token=glagent-DrCQ-ycz-
egQbTmEYeM_Utak-3vcWQjjPEzcTQyHFkHTxYMxМА \
--set config.kasAddress=wss://kas.gitlab.com
