To apply all manifest you need to run this command in terminal

```bash
    cd .infrastructure
    kubectl apply -f namespace.yml
    kubectl apply -f busybox.yml
    kubectl apply -f todoapp-pod.yml
```

You need to use this command to redirect trafic to pod

```bash
    kubectl port-forward todoapp-pod 8081:8080 -n todoapp
```

To test app with busyboxplus:curl container:

1. Take an IP todoapp pod:

```bash
kubectl get pods -n todoapp -o wide
```

2. Make request from busybox pod:

```bash
kubectl exec -n todoapp -it busybox -- curl http://<POD_IP>:8080
```
