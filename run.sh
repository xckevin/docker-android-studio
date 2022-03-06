socat TCP-LISTEN:6000,reuseaddr,fork UNIX-
export DISPLAY=:0
export IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
echo $IP
xhost +
xhost +$IP

docker run --rm  --name androidstudio -e DISPLAY=$IP:0 --net host -d  -v /tmp/.X11-unix:/tmp/.X11-unix android-dev
