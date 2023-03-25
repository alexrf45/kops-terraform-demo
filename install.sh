#!/bin/bash

helm repo add my-repo https://charts.bitnami.com/bitnami

helm install my-repo \
	--set ghostUsername=admin,ghostPassword=Bmt.2013!!!!,mysql.auth.rootPassword=o2c2DJ87Y%J2!uQurwdRcp^oLLtU#kTgK#,ingress.enabled=true,ingress.host=cloud-fam.com \
	my-repo/ghost
