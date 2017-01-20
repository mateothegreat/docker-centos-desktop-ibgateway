# docker-centos-desktop-ibgateway
https://download2.interactivebrokers.com/installers/ibgateway/latest-standalone/ibgateway-latest-standalone-linux-x64.sh
```

docker exec -it gateway /bin/bash

```

```

docker logs gateway -f --tail 100

```


```
docker-centos-tools/build.sh docker-centos-desktop-ibgateway/ virtualmachines-154415 

docker-centos-desktop-ibgateway/run.sh 1.0.0-4 && docker logs -f --tail all gateway 

docker-centos-tools/push.sh docker-centos-desktop-ibgateway virtualmachines-154415 docker-centos-desktop-ibgateway 1.0.0-4 gcr.io 

```

```


 kubectl --namespace prod delete -f docker-centos-desktop-algolab/deployment.yaml && \
 
    docker-centos-tools/build.sh docker-centos-desktop-ibgateway/ virtualmachines-154415 docker-centos-desktop-ibgateway 1.0.0-2 gcr.io '--no-cache' && \
    docker-centos-tools/push.sh docker-centos-desktop-ibgateway virtualmachines-154415 docker-centos-desktop-ibgateway 1.0.0-2 gcr.io 
 
 
kubectl --namespace prod create -f docker-centos-desktop-algolab/deployment.yaml 
 

```