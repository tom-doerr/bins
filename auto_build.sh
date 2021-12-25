#!/bin/bash

file_to_hash=docker/Dockerfile
while true; do
        # check if shasum_val changed
        if [[ $(shasum -a 256 $file_to_hash) != $shasum_val ]]; then
                docker build docker -t render_image 
        fi
        # update shasum_val
        shasum_val=$(shasum -a 256 $file_to_hash)
        sleep 1
done                                                                                                                 
