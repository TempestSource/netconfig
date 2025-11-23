#!/bin/sh

project=$1

cd $project
compose2nix --project $project --runtime docker
cd ..
