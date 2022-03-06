docker run --rm  --name androidstudio -e DISPLAY=$IP:0 --net host -d  -v /tmp/.X11-unix:/tmp/.X11-unix xckevin927/android-studio
