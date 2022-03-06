# docker-android-studio
a docker image for run android studio

## BUILD

please install `brew` first
```
./prepare.sh
```
then open `XQuartz->Preferences->Security`，check the `Allow connections from network clients`.

```
./build.sh
```

## RUN

just run
```
./run.sh
```

or use existed image on hub
```
docker run --rm  --name androidstudio -e DISPLAY=$IP:0 --net host -d  -v /tmp/.X11-unix:/tmp/.X11-unix xckevin927/android-studio
```

Have fun😄
