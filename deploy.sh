#!/usr/bin/env bash

export INGRESS_GATEWAY=istio-ingressgateway

# -- DEPLOY SERVICE
#kubectl apply --filename service.yaml

export IP_ADDRESS=$(kubectl get svc ${INGRESS_GATEWAY} --namespace istio-system --output 'jsonpath={.status.loadBalancer.ingress[0].ip}')
export HOST_URL=$(kubectl get ksvc helloworld-go  --output jsonpath='{.status.domain}')

#while true; do
    curl -H "Host: ${HOST_URL}" http://${IP_ADDRESS}
#done
#ab -t 6000 -c 10 -H "Host: ${HOST_URL}" "http://${IP_ADDRESS}/"

# -- PORTFORWARD 3000 TO GRAFANA
#kubectl port-forward --namespace knative-monitoring $(kubectl get pods --namespace knative-monitoring --selector=app=grafana --output=jsonpath="{.items..metadata.name}") 3000

# -- KIBANA & ZIPKIN
#kubectl proxy

# -- KIBANA
#open http://localhost:8001/api/v1/namespaces/knative-monitoring/services/kibana-logging/proxy/app/kibana

# -- ZIPKIN
#http://localhost:8001/api/v1/namespaces/istio-system/services/zipkin:9411/proxy/zipkin/
#
#hey -z 3000s -c 50 \
#  -host "autoscale-go.default.example.com" \
#  "http://${IP_ADDRESS?}?sleep=100&prime=10000&bloat=5" \
#  && kubectl get pods
