#!/usr/bin/env bash

# ref https://help.aliyun.com/zh/ack/ack-managed-and-ack-dedicated/user-guide/use-helm-to-simplify-application-deployment?spm=a2c4g.11186623.0.i22#d2c0b190a1fgf

helm list

helm repo add aliyunhub https://aliacs-app-catalog.oss-cn-hangzhou.aliyuncs.com/charts-incubator/

helm repo update

helm repo list

