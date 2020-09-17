#!/bin/bash
set -euo pipefail

oc label machineconfigpool worker custom-kubelet=true

cat <<EOF | oc apply -f -
apiVersion: machineconfiguration.openshift.io/v1
kind: KubeletConfig
metadata:
  name: custom-kubelet
spec:
  machineConfigPoolSelector:
    matchLabels:
      custom-kubelet: "true"
  kubeletConfig:
    maxPods: 500
    kubeAPIQPS: 500
    kubeAPIBurst: 1000
EOF

oc wait --for=condition=Success kubeletconfig/custom-kubelet >/dev/null 2>/dev/null && break

/bin/loader \
--v=5 \
--kubeconfig=$KUBECONFIG \
--concurrency=30 \
--burst=5 \
--delay=10s \
--duration=30m \
--timeout=15m \
--pod-longevity=60s \
--namespaces=500
