#!/bin/bash

BUILD_HTML_DIR="./build/html"


build_example_misc() {

    EXAMPLE_MISC_DIR=${BUILD_HTML_DIR}"/example_misc"
    mkdir -p $EXAMPLE_MISC_DIR
    cp -r ./latex_util/example_misc.tex $EXAMPLE_MISC_DIR/example_misc.tex

    cd $EXAMPLE_MISC_DIR

    htlatex example_misc.tex "xhtml,mathjax"

    cd -
}

build_example_layout() {

    LAYOUT_DIR=${BUILD_HTML_DIR}"/example_layout"
    mkdir -p $LAYOUT_DIR
    cp -r ./latex_util/example_layout.tex $LAYOUT_DIR/example_layout.tex

    cd $LAYOUT_DIR

    htlatex example_layout.tex "xhtml,mathjax" 

    cd -
}

build_example_math() {

    MATH_DIR=${BUILD_HTML_DIR}"/example_math"
    mkdir -p $MATH_DIR
    cp -r ./latex_util/example_math.tex $MATH_DIR/example_math.tex
    
    cd $MATH_DIR

    htlatex example_math.tex "xhtml,mathjax" 

    cd -
}

build_example_image() {

    # Setup for image-example
    IMAGE_BUILD_DIR=${BUILD_HTML_DIR}"/example_image"
    mkdir -p $IMAGE_BUILD_DIR
    cp -r ./latex_util/example_image.tex $IMAGE_BUILD_DIR/example_image.tex
    
    # Copy images to the build directory
    IMAGE_SOURCE_DIR=./image/examples
    IMAGE_DEST_DIR=${IMAGE_BUILD_DIR}/images
    mkdir -p $IMAGE_DEST_DIR
    cp ${IMAGE_SOURCE_DIR}/* ${IMAGE_DEST_DIR}
    
    # Build
    cd $IMAGE_BUILD_DIR
    htlatex example_image.tex "xhtml,mathjax" 
    cd -
}

if [[ $1 = "all" ]]; then
    build_example_misc
    build_example_layout
    build_example_math
    build_example_image
elif [[ $1 = "misc" ]]; then
    build_example_misc
elif [[ $1 = "layout" ]]; then
    build_example_layout
elif [[ $1 = "math" ]]; then
    build_example_math
elif [[ $1 = "image" ]]; then
    build_example_image
else
    echo "Usage for script: $0 "
    echo "{ all | misc | layout | math | image }"
fi
