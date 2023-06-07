#!/bin/bash
#
# This script automates the building and testing of the application.
#
# Copyright (c) 2023 Open Technologies for Integration
# Licensed under the MIT license (see LICENSE for details)
#

# Exit on any failure
set -e

# Build everything; we can do this in this case because we want to include the unit
# tests, but production builds should specify the projects.
ibmint deploy --input-path . --output-work-directory /work/ace-submodule-app1-work-dir --project App1_UnitTest

# ibmint optimize server new for v12.0.4 - speed up test runs
ibmint optimize server --work-directory /work/ace-submodule-app1-work-dir --enable JVM --disable NodeJS

# Run the server to run the unit tests
IntegrationServer -w /work/ace-submodule-app1-work-dir --test-project App1_UnitTest --test-junit-options "--reports-dir=junit-reports"
