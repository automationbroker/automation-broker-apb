Automation Broker APB
=========

Ansible Role for installing (and uninstalling) the
[automation-broker](http://automation-broker.io) in a Kubernetes/OpenShift
Cluster with the
[service-catalog](https://github.com/kubernetes-incubator/service-catalog).

Requirements
------------

- [openshift-restclient-python](https://github.com/openshift/openshift-restclient-python)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

Role Variables
--------------

See [defaults/main.yaml](defaults/main.yaml).

Usage
-----

Until this project is configured to publish `docker.io/automation-broker/automation-broker-apb`
you will want to first build the image:

```
$ docker build -t automation-broker-apb -f Dockerfile .
```

## OpenShift/Kubernetes

You may replace `kubectl` for `oc` in the case you have the origin client
installed but not the kubernetes client.

**Note:** You will likely need to be an administrator (ie. `system:admin` in OpenShift).
If you don't have sufficient permissions to create the `clusterrolebinding`,
the provision/deprovision will fail.

```
$ kubectl create namespace automation-broker
$ kubectl create serviceaccount automation-broker-apb --namespace automation-broker
$ kubectl create clusterrolebinding automation-broker-apb --clusterrole=cluster-admin --serviceaccount=automation-broker:automation-broker-apb
$ kubectl run automation-broker-apb \
    --namespace=automation-broker \
    --image=automation-broker-apb \
    --image-pull-policy=Never \
    --restart=Never \
    --attach=true \
    --serviceaccount=automation-broker-apb \
    -- provision -e broker_name=automation-broker -e cluster=openshift
```

Example Playbook
----------------

See [playbooks/provision.yml](playbooks/provision.yml).

License
-------

Apache-2.0

Author Information
------------------

http://automationbroker.io
