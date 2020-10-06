

alias k=kubectl
        helm delete kubecf
        helm delete cf-operator
        k delete namespace kubecf
        k delete namespace cf-operator
        k delete clusterrole cf-operator-quarks-job
        k delete clusterrole cf-operator
        k delete clusterrole cf-operator-cluster
        k delete clusterrole cf-operator-quarks-job-cluster
        k delete crd boshdeployments.quarks.cloudfoundry.org
        k delete crd quarksjobs.quarks.cloudfoundry.org
        k delete crd quarkssecrets.quarks.cloudfoundry.org
        k delete crd quarksstatefulsets.quarks.cloudfoundry.org
        k delete clusterrolebinding cf-operator-quarks-job
        k delete clusterrolebinding cf-operator
        k delete clusterrolebinding cf-operator-cluster
        k delete clusterrolebinding cf-operator-quarks-job-cluster
        k delete psp kubecf-default
        k delete csr kubecf-bits-service-ssl
	k delete namespace eirini
	k delete psp bits-service
	k delete psp eirini-app-psp
	k delete psp eirini
	k delete psp eirini-events
	k delete psp eirini-metrics
	k delete psp eirini-routing
	k delete psp eirini-staging-reporter
	k delete clusterrole  eirini-nodes-policy
	k delete clusterrole kubecf:eirini-webhook
	k delete clusterrolebinding eirini-metrics
	k delete clusterrolebinding kubecf:eirini-webhook




