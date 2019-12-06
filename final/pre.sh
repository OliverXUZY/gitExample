#!/bin/bash


if [ ! -d csv ]; then
    mkdir csv
fi
rm -r csv
mkdir csv

unzip rainbow_dataset.zip -d csv
