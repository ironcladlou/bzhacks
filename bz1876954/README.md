# Bug 1876954 notes

Bug https://bugzilla.redhat.com/show_bug.cgi?id=1876954.

Assumes a cluster based on `install-config.yaml`.

```
docker build -t quay.io/dmace/bz1876954 .
docker run --rm -it -v $KUBECONFIG:/etc/kubeconfig -e=KUBECONFIG=/etc/kubeconfig quay.io/dmace/bz1876954 /bin/test-a.sh
```
