#!/bin/sh
echo $RUNNER_CFG_PAT
[ -z "$RUNNER_CFG_PAT" ] && echo "RUNNER_CFG_PAT is required" && exit 1 || true
[ -z "$RUNNER_REPOSITORY" ] && echo "RUNNER_REPOSITORY is required" && exit 1 || true
curl -s https://raw.githubusercontent.com/actions/runner/main/scripts/create-latest-svc.sh | bash -s $RUNNER_REPOSITORY
