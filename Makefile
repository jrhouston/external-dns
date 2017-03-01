# Copyright 2017 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# The verify target runs tasks similar to the CI tasks, but without code coverage
verify:
	vendor/github.com/kubernetes/repo-infra/verify/verify-boilerplate.sh --rootdir=${CURDIR}
	vendor/github.com/kubernetes/repo-infra/verify/verify-go-src.sh -v --rootdir ${CURDIR}
	go test -v $(shell go list ./... | grep -v /vendor/)