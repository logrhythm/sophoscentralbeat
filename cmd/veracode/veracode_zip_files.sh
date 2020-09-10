#!/usr/local/bin/bash

# Build all sophoscentralbeat component veracode zip files
# Create gosec result issue file
#
# Confluence veracode page https://confluence.logrhythm.com/x/3tF4Aw
# Confluence gosec page https://confluence.logrhythm.com/x/Oed4Aw
#
# Specfic to https://github.com/logrhythm repo 'sophoscentralbeat' 
#
# Required that 'github.com/logrhythm/sophoscentralbeat' directory have
#   Generated siem repo's WORKSPACE 'go.mod' file 'cmd/veracode/sophos_go.mod'
#   'prepAll' action - Removes 'vendor/' directory
#   build actions - Removes go build: 'go.mod' 'go.sum' files
#                 - Removes executable: 'sophoscentralbeat' file
#                 - Uses 'cmd/veracode/sophos_go.mod' to generate
#                 -     executable: 'sophoscentralbeat' file 
#                 -     veracode zip and/or gosec report files
#   Note: build actions are
#      allSAST, veracode, sophos, pubsub
# 
# Note: 'sophoscentralbeat' repo does not have 
#   'internal' sub-directory to convert to 'support' sub-directory
#   '*.proto' files to generate '*.pb.go' files 
#   'bazel.build' files that generate 'asssets.go' files
#
# Post clean up 'github.com/logrhythm/sophoscentralbeat' directory 
#   'postAll' action - restores 'vendor/' directory
#   
# Assume starting at 'github.com/logrhythm/sophoscentralbeat' directory

function error_eval () {
    argc=$#
    code=0
    reason="Not Provided"
    if [[ $argc -ge 1 ]]
    then 
        code=$1
        if [[ $argc -ge 2 ]]
        then
            reason=$2 
        fi
    fi
    if [[ $code -ne 0 ]]
    then
        echo "Exit: code $code; reason: $reason"
        exit $code
    fi
    return $code
}

function build_app () {
    #which go
    build=$1
    go mod vendor
    error_eval $? "$build failed 'go mod vendor'"
    go build -mod=vendor .
    error_eval $? "$build failed 'go build -mod=vendor'"
    ls -l sophoscentralbeat
    error_eval $? "$build no sophoscentralbeat file"
    #cat main.go
    sleep 4
}

function remove_build () {
    rm go.mod go.sum sophoscentralbeat
    if [ $1 == true ] 
    then 
        rm -r vendor/ 
    fi
}

function build_veracode_zip () {
    local mainName=$1
    local zipName=$2
    remove_build true
    cp cmd/veracode/sophos_go.mod go.mod
    build_app $mainName  
    cd ../../..   
    rm github.com.$zipName.zip
    zip -r github.com.$zipName.zip github.com/ -x "*.DS_Store" -x "__MACOSX" -x "*.git*" -x "*sophoscentralbeat"
    ls -ltr 
    cd github.com/logrhythm/sophoscentralbeat
}

function build_gosec_results () {
    local mainName=$1
    local resDir=$2
    remove_build true
    cp cmd/veracode/sophos_go.mod go.mod
    build_app $mainName  
    mkdir cmd/$resDir
    d=`date +"%Y_%m_%d"`
    gosec -fmt=json -out=cmd/veracode/$resDir/gosec_sophos_result-$d.json ./...
    cd cmd/veracode
    python scripts/gosec_rule_order.py -i $resDir/gosec_sophos_result-$d.json -o $resDir/gosec_sophos_issues-$d.json
    scripts/gosec_severity_counts.sh $resDir/gosec_sophos_result-$d.json
    cd ..
}

# arg $1 values - action
#   all ( default) - both veracode and gosec
#   veracode - only veracode zip files
#   gosec - only do gosec issue result file 

doSophos=false   # true: build sophos veracode zip files
doGoSec=false    # true: genrate gosec issue result file
doPrepVendor=false  # true: prepare 'vendor' directory
doPostVendor=false  # true: post restore 'vendor' directory 
doPostRmBuild=false # true: post remove go.mod, go.sum, sophoscentralbeat files

if [ $# -eq 0 ]
then
    action=help
else
    action=`echo "$1" | tr '[:upper:]' '[:lower:]'`
fi

# any arg $2 - display what would build and/or generate
real=true        # true: really do both veracode and gosec

if [ $# -gt 1 ]
then
    real=false
fi

case $action in
prepall )
    doPrepVendor=true
    ;;
postall )
    doPostVendor=true
    doPostRmBuild=true
    ;;
allsast )
    doPubsub=true
    doGoSec=true
    ;;
veracode )
    doSophos=true
    ;;
sophos )
    doSophos=true
    ;;
gosec )
    doGoSec=true
    ;;
* )
    echo "$0 arg1 [arg2]" 
    echo "   arg1 = 'PrepAll' - All Prepare Setup: vendor"
    echo "   arg1 = 'PostAll' - All Post Cleanup: vendor"
    echo "   arg1 = 'AllSAST' - All Static Analysis Security: Veracode and Gosec"
    echo "   arg1 = 'veracode' - All componentis veracode zip files"
    echo "    arg1 = 'sophos' - sophoscentralbeat veracode zip file"
    echo "   arg1 = 'gosec' - All components gosec issue result file"
    echo "  arg2 any value - just display what would build or generate"
    echo ""
    exit 1
esac

# set env GO mod values via confluence pages above
export GO111MODULE=on
env | grep GO111

# Assume run script from 'github.com/logrhythm/sophoscentralbeat' directory
# Place 'veracode.json' file in the 'github.com' directory
# like confluence pages above
cp cmd/veracode/veracode.json ../../

if [ $doPrepVendor == true ] 
then 
    echo "Prepare Vendor directory"
    if [ $real == true ]
    then
        cmd/veracode/prep_vendor.sh
    fi
fi

if [ $doPostRmBuild == true ] 
then 
    echo "Post remove go.mod, go.sum, sophoscentralbeat files"
    if [ $real == true ]
    then
        remove_build false
    fi
fi

if [ $doPostVendor == true ] 
then 
    echo "Post restore Vendor directory"
    if [ $real == true ]
    then
        cmd/veracode/post_vendor.sh
    fi
fi

if [ $doSophos == true ] 
then 
    echo "Build sophoscentralbeat veracode zip files"
    if [ $real == true ]
    then
        build_veracode_zip sophoscentralbeat sophoscentralbeat
    fi
fi

if [ $doGoSec == true ] 
then 
    echo "Generate gosec issue result file"
    if [ $real == true ]
    then
        build_gosec_results veracode results
    fi
fi
