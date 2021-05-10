#!/bin/bash

sudo docker build -t brutalsysteam/redis-to-s3-backup:latest .
sudo docker push brutalsysteam/redis-to-s3-backup:latest