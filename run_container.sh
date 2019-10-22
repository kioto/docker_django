#!/bin/sh

source ./setting.sh

docker run -itd -p 127.0.0.1:8000:8000 -v $mnt_path:$work_dir --name $container_name $image_name
