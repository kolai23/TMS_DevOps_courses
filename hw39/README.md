1. Прочитать 2-ю главу Kubernetes in Action и повторить приведенные там примеры.
```bash
q3181309@cloudshell:~ (seismic-vista-405108)$ cat app.js 
const http = require('http');
const os = require('os');
console.log("Kubia server starting...");
var handler = function(request, response) {
 console.log("Received request from " + request.connection.remoteAddress);
 response.writeHead(200);
 response.end("You've hit " + os.hostname() + "\n");
};
var www = http.createServer(handler);
www.listen(8080);
q3181309@cloudshell:~ (seismic-vista-405108)$ cat Dockerfile 
FROM node:7
ADD app.js /app.js
ENTRYPOINT ["node", "app.js"]
q3181309@cloudshell:~ (seismic-vista-405108)$ docker 
q3181309@cloudshell:~ (seismic-vista-405108)$ docker images
REPOSITORY    TAG       IMAGE ID       CREATED          SIZE
kubia         latest    954d8657231d   27 minutes ago   660MB
luksa/kubia   latest    954d8657231d   27 minutes ago   660MB
q3181309@cloudshell:~ (seismic-vista-405108)$ docker run --name kubia-container -p 8080:8080 -d kubia
270123b859b1440e89a1e27946bd05f423ae6102aa7532f9e3e42274ba760ec3
q3181309@cloudshell:~ (seismic-vista-405108)$ docker ps
CONTAINER ID   IMAGE     COMMAND         CREATED          STATUS         PORTS                    NAMES
270123b859b1   kubia     "node app.js"   10 seconds ago   Up 9 seconds   0.0.0.0:8080->8080/tcp   kubia-container
q3181309@cloudshell:~ (seismic-vista-405108)$ docker inspect kubia-container
q3181309@cloudshell:~ (seismic-vista-405108)$ docker stop kubia-container
kubia-container
q3181309@cloudshell:~ (seismic-vista-405108)$ docker tag kubia luksa/kubia
q3181309@cloudshell:~ (seismic-vista-405108)$  docker images | head
REPOSITORY    TAG       IMAGE ID       CREATED          SIZE
luksa/kubia   latest    954d8657231d   33 minutes ago   660MB
kubia         latest    954d8657231d   33 minutes ago   660MB
q3181309@cloudshell:~ (seismic-vista-405108)$ gcloud container clusters create-auto kubia  --location=us-central1


```
2. Познакомиться с Workload объектами Kubernetes (Pod, ReplicaSet, DaemonSet, Job, CronJob), а также их конфигурацией (Liveness Probe, Resources) путем запуска примеров из lecture45.