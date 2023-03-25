#!/bin/bash
export NAME="cloud-fam.com"
export DOMAIN="cloud-fam.com"
export ZONES="us-east-1a,us-east-1b,us-east-1c"
export KOPS_STATE_STORE="s3://tf-state-kops-stage"
export CONTROL_PLANE_SIZE="m5.large"
export CONTROL_PLANE_COUNT="5"
export CONTROL_PLANE_VOLUME_SIZE="50"
export NODE_SIZE="m5.large"
export NODE_COUNT="6"
export NODE_VOLUME_SIZE="70"
export NETWORKING="calico"
export DISCOVERY_STORE="s3://tf-state-kops-stage/${NAME}/discovery"
export TF_CONFIG_FILE='cluster'

kops create cluster \
	--name=$NAME \
	--cloud-labels "Owner=r0land,Enviornment=terraform" \
	--state=$KOPS_STATE_STORE \
	--dns-zone=$DOMAIN \
	--out=. \
	--target=terraform \
	--zones $ZONES \
	--control-plane-count $CONTROL_PLANE_COUNT \
	--control-plane-size $CONTROL_PLANE_SIZE \
	--control-plane-zones $ZONES \
	--control-plane-volume-size $CONTROL_PLANE_VOLUME_SIZE \
	--node-size=$NODE_SIZE \
	--node-count $NODE_COUNT \
	--networking $NETWORKING \
	--ssh-public-key="~/.ssh/homeadm.pub" \
	--bastion="true" \
	--topology private \
	--discovery-store=$DISCOVERY_STORE
