#!/bin/bash
export NAME="cloud-fam.com"
export DOMAIN="cloud-fam.com"
export ZONES="us-east-1a,us-east-1b,us-east-1c"
export KOPS_STATE_STORE="s3://tf-state-kops-stage"
export CONTROL_PLANE_SIZE="m5.large"
export NODE_SIZE="m5.large"
export NODE_COUNT="3"
export NETWORKING="amazonvpc"
export DISCOVERY_STORE="s3://tf-state-kops-stage/${NAME}/discovery"

kops create cluster \
	--name=$NAME \
	--state=$KOPS_STATE_STORE \
	--dns-zone=$DOMAIN \
	--out=. \
	--target=terraform \
	--zones $ZONES \
	--control-plane-size=$CONTROL_PLANE_SIZE \
	--control-plane-zones $ZONES \
	--node-size=$NODE_SIZE \
	--node-count $NODE_COUNT \
	--networking $NETWORKING \
	--bastion="true" \
	--topology private \
	--discovery-store=$DISCOVERY_STORE
