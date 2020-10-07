# KubeCF on Z Installation Guide
### Prerequisites:
* [go](https://golang.org/dl/)
* docker (`zypper install docker`)
* [kubernetes](https://github.com/mfriesenegger/docs/blob/master/sles-crio-k8s.md)
 * after installing kubernetes, make sure the cluster is running on the correct config by running these commands: `sudo cp /etc/kubernetes/admin.conf .kube/config` `sudo chown $USER .kube/config`
* helm (execute `bash build-helm.sh` in `Kube-CF---Endgame-Platform-on-Z/src/helm`)
### Deploying underlying infrastructure
* Local Path Provisioner: run `./install.sh` in `Kube-CF---Endgame-Platform-on-Z/src/local-path-provisioner`
* MySQL:
  * run `./install-mysql` in `Kube-CF---Endgame-Platform-on-Z/src/mysql`
  * open a shell in the running container ``kubectl exec --stdin --tty <mysql-pod-name> -n mysql -- /bin/bash``
  * login: `mysql --password=password'. 
  * create all the necessary databases: ``create database uaa; create database cloud_controller; create database diego; create database `routing-api`; create database network_policy; create database network_connectivity; create database locket; create database credhub;``
  * check the databases have been created: `show databases;`
* Create the "eirini-fix" resource. This is required to fix an error: run `k create -f eirini-fix.yaml` in `Kube-CF---Endgame-Platform-on-Z/src/`
* CF-Operator: `./install-operator` in `Kube-CF---Endgame-Platform-on-Z/src/cf-operator`
### Deploying, Installing & Testing KubeCF 
* Run `./install-kubecf' in ``Kube-CF---Endgame-Platform-on-Z/src/kubecf``
* Install the CF Command Line Interface: `sudo rpm -i cf-cli-6.50.0-1.5.s390x.rpm` in `Kube-CF---Endgame-Platform-on-Z/src/test`
* Login: 
  * execute ``cf login --skip-ssl-validation -a <your-cluster-ip> -u admin -p `kubectl get secrets -n kubecf -o json var-cf-admin-password | jq -r '.data."password"' | base64 -d``
* Test: 
  * `cf create-org test-org` - Create a test organization
  * `cf create-space test-space` - Create a test space
  * `cf target -s test-space` - Set the targeted space
  * `cf create-buildpack binary ./binary_buildpack-cached-v1.0.36.zip 3 --enable` - Create the s390x binary-buildpack
  * `cd Kube-CF---Endgame-Platform-on-Z/src/binary-app` and `cf push test-app -b binary` to push the test app
  * `cf apps` - Check the deployed `test-app` is working
