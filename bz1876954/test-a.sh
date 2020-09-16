#!/bin/bash
set -euo pipefail

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
