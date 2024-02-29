# 复现笔记
安装
```sh
# --progress=plain --no-cache=false
docker build -t linc_image:bithk .

docker run -itd --privileged -v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY=$DISPLAY --runtime=nvidia --network=host --ipc host --name=linc-bithk linc_image:bithk /bin/bash

docker exec -it sbtracker-train /bin/bash
```
运行
```sh
cd metadrive/bridges/ros_bridge && source install/setup.bash

# Terminal 1, launch ROS publishers
ros2 launch metadrive_example_bridge metadrive_example_bridge.launch.py
# Terminal 2, launch socket server
python ros_socket_server.py
```
