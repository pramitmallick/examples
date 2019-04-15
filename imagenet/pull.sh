#!/bin/bash

git pull origin master

sbatch inception_experiment.sh
sbatch densenet_experiment.sh