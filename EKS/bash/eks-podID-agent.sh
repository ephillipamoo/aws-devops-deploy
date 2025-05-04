#!/bin/bash

ksctl utils associate-iam-oidc-provider \
  --region <region> \
  --cluster <cluster-name> \
  --approve


kubectl annotate serviceaccount <service-account-name> \
  -n <namespace> \
  eks.amazonaws.com/role-arn=<role-arn>
