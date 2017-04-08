#!/bin/bash

# Run script for jite/mono-nunit docker image.
# Builds and tests one or many solutions and projects.
# Author: Johannes Tegnér.

cd /nunit
nuget install NUnit.Console
NUNIT=$(ls -d *NUnit.ConsoleRunner.*/)
NUNIT_PATH="/nunit/${NUNIT}tools/nunit3-console.exe"
# Move the source so that restore don't add a bunch of packages to the folder.
cp -R /app /usr/src/app/source
cd /usr/src/app/source
# Build all solutions in the SOLUTIONS env variable.
for SLN in ${SOLUTIONS//,/ }
do
    mkdir /usr/src/app/build/${SLN}
    nuget restore -NonInteractive $SLN
    xbuild /property:Configuration=Release /property:OutDir=/usr/src/app/build/${SLN}/ $SLN
done
cd /usr/src/app/source

# For each project in the env TEST_PROJECTS run nunit tests.
for PROJ in ${TEST_PROJECTS//,/ }
do
    mono $NUNIT_PATH $PROJ
done
