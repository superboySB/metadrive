FROM nvcr.io/nvidia/isaac/ros:x86_64-ros2_humble_bcf535ea3b9d16a854aaeb1701ab5a86

# Please contact with me if you have problems
LABEL maintainer="Zipeng Dai <daizipeng@bit.edu.cn>"
RUN apt-get update && \
    apt-get install -y --no-install-recommends locales git tmux gedit vim

WORKDIR /workspace
RUN git clone https://github.com/superboySB/metadrive && cd metadrive && pip install --upgrade pip && \
    pip install pyzmq && pip install -e . && python -m metadrive.examples.profile_metadrive 
RUN cd metadrive/bridges/ros_bridge && . /opt/ros/humble/setup.bash && \
    rosdep init && rosdep update && rosdep install --from-paths src --ignore-src -y && colcon build

WORKDIR /workspace
RUN git clone https://github.com/superboySB/scenarionet && cd scenarionet && pip install -e . && \
    python -m scenarionet.list

CMD ["/bin/bash"]