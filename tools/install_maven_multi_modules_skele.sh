#!/usr/bin/env bash

##### https://stackoverflow.com/questions/6328778/how-to-create-an-empty-multi-module-maven-project/17981350#17981350

mvn archetype:generate -DarchetypeGroupId=org.codehaus.mojo.archetypes \
    -DarchetypeArtifactId=pom-root \
    -DarchetypeVersion=RELEASE \
    -Dversion=0.1.0-SNAPSHOT
