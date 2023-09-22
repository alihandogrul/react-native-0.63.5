#!/bin/bash
# Copyright (c) Facebook, Inc. and its affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

case $1 in
  "android" | "ios")
    GITHUB_OWNER=${CIRCLE_PROJECT_USERNAME:-facebook} \
    GITHUB_REPO=${CIRCLE_PROJECT_REPONAME:-react-native} \
    GITHUB_PR_NUMBER="$CIRCLE_PR_NUMBER" \
    GITHUB_REF=${CIRCLE_BRANCH} \
    GITHUB_SHA=${CIRCLE_SHA1} \
    node bots/report-bundle-size.js "$1"
    ;;
  *)
    echo "Syntax: $0 [android | ios]"
    exit 1
esac
