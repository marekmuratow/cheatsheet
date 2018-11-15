#############
### MINIKUBE
#############

# start minikube
$ minikube start

# check minikube’s status
$ minikube status

# stop minikube
$ minikube stop

#############
### KUBECTL
#############

# list pods
$ kubectl get pod

# list services
$ kubectl get service

# list deployments
$ kubectl get deployment

# create a Pod based on a yaml file
$ kubectl create -f pod.yaml 

# get details and events of the last Pod
$ kubectl describe pods

# get details and events of the named deployment
$ kubectl describe deployment rss-site

# remove a Pod
$ kubectl delete pod rss-site

# apply changes to the deployment
$ kubectl apply -f deployment.yaml 
