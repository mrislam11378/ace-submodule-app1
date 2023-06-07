# Copyright (c) 2022 Open Technologies for Integration
# Licensed under the MIT license (see LICENSE for details)

#FROM tdolby/experimental:ace-minimal-11.0.0.11-alpine
ARG BASE_IMAGE=ace-server-prod:12.0.8.0-r1
FROM $BASE_IMAGE

# Used for tekton and Maven containers

LABEL "maintainer"="trevor.dolby@ibm.com"

WORKDIR /work/ace-submodule-app1-work-dir

RUN mkdir /home/aceuser/ace-server/shared-classes || /bin/true
RUN touch /home/aceuser/ace-server/shared-classes/test.txt

COPY ace-server /work/ace-submodule-app1-work-dir
RUN rm -rf /home/aceuser/ace-server/run/* || /bin/true
RUN cp -r /tmp/maven-output/ace-server/run/* /home/aceuser/ace-server/run/

# This is needed for IntegrationRuntime support - IRs try to move the whole
# run directory to a volume mount and fail on permissions issues.
RUN chmod -R 777 /home/aceuser/ace-server || /bin/true
