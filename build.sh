#!/bin/bash
#
# This script automates the building and testing of the application.
#
# Copyright (c) 2023 Open Technologies for Integration
# Licensed under the MIT license (see LICENSE for details)
#

# Exit on any failure
set -e

# Move submodule projects to the correct level to be picked up by ibmint
find ace* -name ".project" -exec dirname {} ";" | xargs -n1 -i{} echo mv {} .  | grep -v Test | grep -v Scaffold > /tmp/move-projects.sh || /bin/true
bash /tmp/move-projects.sh

# Create the work directory
rm -rf /work/ace-submodule-app1-work-dir junit-reports
mqsicreateworkdir /work/ace-submodule-app1-work-dir

# Build everything; we can do this in this case because we want to include the unit
# tests, but production builds should specify the projects.
ibmint deploy --input-path . --output-work-directory /work/ace-submodule-app1-work-dir