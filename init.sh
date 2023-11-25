#! /bin/bash

CUR_DIR=$(cd "$(dirname "$0")";pwd)

echo "init Fig.4 files"
cd $CUR_DIR/Source
FIG4_SRC_DIR=/home/qzhao24/go/pkg/mod/google.golang.org 
if [ -d $FIG4_SRC_DIR ]; then
    rm -rf $FIG4_SRC_DIR
fi
mkdir $FIG4_SRC_DIR
tar -jxvf grpc.tar.bz2
mv grpc@v1.26.0 $FIG4_SRC_DIR/

echo "init Fig.6 & Fig.7 files"
cd $CUR_DIR/Source
FIG7_SRC_DIR=/home/qzhao24/projects/DrCCTProf-ARM-samples/lulesh
if [ -d $FIG7_SRC_DIR ]; then
    rm -rf $FIG7_SRC_DIR
fi
mkdir $FIG7_SRC_DIR
tar -jxvf lulesh.tar.bz2
mv lulesh $FIG7_SRC_DIR/

echo "init data converter experiment"
cd $CUR_DIR/Source
FIG6_SRC_DIR=$CUR_DIR/Source/hpctoolkit-lulesh-par-original-database
if [ -d $FIG6_SRC_DIR ]; then
    rm -rf $FIG6_SRC_DIR
fi
tar -jxvf hpctoolkit-lulesh-par-original-database.tar.bz2

DATA_BUILDER_DIR=$CUR_DIR/Source/drcctprof-databuilder
if [ -d $DATA_BUILDER_DIR ]; then
    rm -rf $DATA_BUILDER_DIR
fi
git clone https://github.com/Xuhpclab/drcctprof-databuilder.git
cd $CUR_DIR/Source/drcctprof-databuilder
./install.sh
./hpctoolkit-converter.py $CUR_DIR/Source/hpctoolkit-lulesh-par-original-database lulesh.hpctoolkit.drcctprof
mv lulesh.hpctoolkit.drcctprof $CUR_DIR/Profiles/data_converter.demo.ezview

echo "init overhead experiment"
cd $CUR_DIR/Overhead
tar -jxvf 1MB.profile.tar.bz2
tar -jxvf 100MB.profile.tar.bz2
tar -jxvf 1GB.profile.tar.bz2





