#!/usr/bin/env bash

mvn archetype:generate -DarchetypeGroupId=org.codehaus.mojo.archetypes \
    -DarchetypeArtifactId=pom-root \
    -DarchetypeVersion=RELEASE \
    -Dversion=0.1.0-SNAPSHOT
