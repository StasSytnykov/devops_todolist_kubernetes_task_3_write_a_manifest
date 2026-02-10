# Django ToDo list

This is a to-do list web application with the basic features of most web apps, i.e., accounts/login, API, and interactive UI. To do this task, you will need:

- CSS | [Skeleton](http://getskeleton.com/)
- JS | [jQuery](https://jquery.com/)

## Explore

Try it out by installing the requirements (the following commands work only with Python 3.8 and higher, due to Django 4):

```
pip install -r requirements.txt
```

Create a database schema:

```
python manage.py migrate
```

And then start the server (default is http://localhost:8000):

```
python manage.py runserver
```

You can now browse the [API](http://localhost:8000/api/) or start on the [landing page](http://localhost:8000/).

## Task

Create a Kubernetes manifest for a pod that will contain a ToDo app container:

1. Fork this repository.
1. Create a simple `Dockerfile` for the ToDo application
1. Add readiness endpoint code to `api` of the application (modify `api/views.py` and `api/urls.py`)
1. Add liveness endpoint cide to `api` of the application (modify `api/views.py` and `api/urls.py`)
1. Build your image and push it to your personal Docker Hub account into the `todoapp` repository with the `3.0.0` tag (`todoapp:3.0.0`)
1. All manifests should be located under the `.infrastructure` folder
1. Create a `manifest` which can be used to create a namespace. The file should be named `namespace.yml` and should contain the following content:

```
apiVersion: v1
kind: Namespace
metadata:
 name: todoapp
```

8. Create a pod `manifest` that will start a `ikulyk404/busyboxplus:curl` container in a cluster. The file should be named `busybox.yml`.
1. Create a pod `manifest` that will use a previously created image with the tag `{yourname}/todoapp:3.0.0`. The file should be named `todoapp-pod.yml`.
1. ToDo app pod `manifest` should have a readiness probe configured
1. ToDo app pod `manifest` should have a liveness probe configured
1. Create the `INSTRUCTION.md` file
1. `INSTRUCTION.md` file should contain instructions on how to apply all manifests
1. `INSTRUCTION.md` file should contain instructions on how to test ToDo application using the `port-forward` command
1. `INSTRUCTION.md` file should contain instructions on how to test the application using the
   `busyboxplus:curl` container
1. Create PR with your changes and attach it for validation on a platform.
