#!/bin/bash

kops delete cluster --yes \
	--name=cloud-fam.com \
	--state=s3://tf-state-kops-stage
