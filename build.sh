#!/usr/bin/env bash

function valid () {
    if [ $? -eq 0 ]; then
        echo -e "build $1 OK"
    else
        echo -e "build $1 Failed"
        exit
    fi
}


#for package in anaconda caffe;do
#for package in anaconda tensorflow jupyter pytorch mxnet caffe scikit-learn;do
for package in miniconda tensorflow keras pytorch mxnet caffe scikit-learn jupyterlab-base jupyterlab;do
    for version in  `ls $package`; do
    	echo "Start build -------> $package/$version"
	docker build -t codeflitting/$package:$version $package/$version/ 
	valid $package:$version
        docker push codeflitting/$package:$version
	docker tag codeflitting/$package:$version cargo.caicloud.xyz/devops_release/$package:$version
    done
done
