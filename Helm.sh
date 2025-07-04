helm repo add gitlab https://charts.gitlab.io
helm repo update
helm upgrade --install web4 gitlab/gitlab-agent \
--namespace gitlab-agent-web4 \
--create-namespace \
--set config.token=glagent-DrCQ-ycz-
egQbTmEYeM_Utak-3vcWQjjPEzcTQyHFkHTxYMxМА \
--set config.kasAddress=wss://kas.gitlab.com
