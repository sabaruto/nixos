#!/bin/bash

# Installation environment
alias mvn-install="./mvnw install -Dskip.unitTests -Dskip.integrationTests=true -Djacoco.skip=true -Dcheckstyle.skip=true"
alias mvn-clean-install="./mvnw clean install -Dskip.unitTests -Dskip.integrationTests=true -Dcheckstyle.skip=true"
alias mvn-full-install="./mvnw clean install"

# Mock environment
alias pgs-mock-way4="./mvnw -pl :common-test-utils exec:java@way4-mock"
alias pgs-mock-solar="./mvnw -pl :common-test-utils exec:java@solar-mock"
alias pgs-mock-monet="./mvnw -pl :common-test-utils exec:java@monet-mock"
alias pgs-mock-nexi="./mvnw -pl :common-test-utils exec:java@nexi-mock"
alias pgs-mock-futurex="./mvnw -pl :common-test-utils exec:java@futurex-mock"

alias pgs-mock-app="./mvnw spring-boot:run -pl payments-gateway-service-web -Dspring-boot.run.profiles=mock,local,secret -Dspring-boot.run.arguments=\"--spring.docker.compose.file=../docker-compose.yml\""
alias pgs-mock-bootstap="./mvnw -pl :common-test-utils exec:java@Localbootstrap-mock"

# Dev environment
alias pgs-dev-app="./mvnw spring-boot:run -pl payments-gateway-service-web -Dspring-boot.run.profiles=proxy,local,secret -Dspring-boot.run.arguments=\"--spring.docker.compose.file=../docker-compose.yml\""
alias pgs-dev-bootstap="./mvnw -pl :common-test-utils exec:java@Localbootstrap-dev"

