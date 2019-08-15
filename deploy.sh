#!/bin/bash
docker kill mynodeapp > /dev/null 2>&1
docker rm mynodeapp > /dev/null 2>&1
docker run -d --name mynodeapp -p 80:8000 emontoya/nodeapp
#/usr/local/bin/docker-compose up -d