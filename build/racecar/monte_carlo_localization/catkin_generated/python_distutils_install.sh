#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/nvidia/sdc-ernie/src/racecar/monte_carlo_localization"

# snsure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/nvidia/sdc-ernie/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/nvidia/sdc-ernie/install/lib/python2.7/dist-packages:/home/nvidia/sdc-ernie/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/nvidia/sdc-ernie/build" \
    "/usr/bin/python" \
    "/home/nvidia/sdc-ernie/src/racecar/monte_carlo_localization/setup.py" \
    build --build-base "/home/nvidia/sdc-ernie/build/racecar/monte_carlo_localization" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/nvidia/sdc-ernie/install" --install-scripts="/home/nvidia/sdc-ernie/install/bin"
