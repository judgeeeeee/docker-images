# Annaconda address
# Anaconda2: https://repo.continuum.io/archive/Anaconda2-5.2.0-Linux-x86_64.sh
# Anaconda3: https://repo.continuum.io/archive/Anaconda3-5.2.0-Linux-x86_64.sh

function valid () {
    if [ $? -eq 0 ]; then
        echo -e "build $1 OK"
    else
        echo -e "build $1 Failed"
        exit
    fi
}


#for package in anaconda caffe;do
for package in jupyter mxnet pytorch scikit-learn tensorflow keras;do
    echo "Start build -------> $package"
    for version in  `ls $package`; do
	docker build -t cargo-infra.caicloud.xyz/devops_release/$package:$version $package/$version/ 
        valid $package:$version
        docker tag cargo-infra.caicloud.xyz/devops_release/$package:$version codeflitting/$package:$version
        docker push codeflitting/$package:$version
    done
done
