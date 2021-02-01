#!/bin/bash

export COMPOSE_PROJECT=num-knoten

docker-compose -p $COMPOSE_PROJECT -f fhir-gw/docker-compose.yml up -d

docker wait ${COMPOSE_PROJECT}_gpasinit-patient_1 && docker wait ${COMPOSE_PROJECT}_gpasinit-fall_1

docker-compose -p $COMPOSE_PROJECT -f monitoring/docker-compose.yml up -d