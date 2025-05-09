#!/bin/bash

BUILD_HTML_DIR="./build/html"


build_window() {

    WINDOW_DIR=${BUILD_HTML_DIR}"/window"
    mkdir -p $WINDOW_DIR
    cp -r ./window/window.tex $WINDOW_DIR/window.tex

    cd $WINDOW_DIR

    htlatex window.tex "xhtml,mathjax"

    cd -
}


if [[ $1 = "all" ]]; then
    build_window
elif [[ $1 = "window" ]]; then
    build_window
else
    echo "Usage for script: $0 "
    echo "{ all | window }"
fi
