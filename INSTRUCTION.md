# Instructions

## 1. Build and push the Docker image

Build the Docker image and push it to your Docker Hub account. Make sure the image name matches the one specified in `.infrastructure/todoapp-pod.yml`.

```bash
docker build -t stassytnykov/todoapp:3.0.0 .
docker push stassytnykov/todoapp:3.0.0
```

## 2. Apply all manifests

```bash
cd .infrastructure
kubectl apply -f namespace.yml
kubectl apply -f busybox.yml
kubectl apply -f todoapp-pod.yml
```

## 3. Test the ToDo application using port-forward

Use `kubectl port-forward` to forward local port `8081` to the todoapp pod's port `8080`:

```bash
kubectl port-forward pod/todoapp-pod 8081:8080 -n todoapp
```

After running this command, open your browser and navigate to `http://localhost:8081` to access the application.

## 4. Test the application using the busyboxplus:curl container

The `busybox.yml` manifest creates a pod named `busybox` using the `ikulyk404/busyboxplus:curl` image, which includes the `curl` utility.

1. Get the IP address of the `todoapp-pod`:

```bash
kubectl get pods -n todoapp -o wide
```

2. Execute a curl request from the `busybox` pod (replace `<POD_IP>` with the actual IP from the previous step):

```bash
kubectl exec -n todoapp -it busybox -- curl http://<POD_IP>:8080
```

You can also test the health and readiness endpoints:

```bash
kubectl exec -n todoapp -it busybox -- curl http://<POD_IP>:8080/api/health/
kubectl exec -n todoapp -it busybox -- curl http://<POD_IP>:8080/api/readiness/
```
