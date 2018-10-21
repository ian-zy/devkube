#!/bin/bash

helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm install stable/gocd --name gocd --namespace gocd

