#!/usr/bin/env sh

# N.B. This does not download the ilsvrcC12 data set, as it is gargantuan.
# This script downloads the imagenet example auxiliary files including:
# - the ilsvrc12 image mean, binaryproto
# - synset ids and words
# - Python pickle-format data of ImageNet graph structure and relative infogain
# - the training splits with labels

# Modified from bvlc 

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
cd "$DIR/../examples/caffe_converter/bvlc"

echo "Downloading..."

wget -c http://dl.caffe.berkeleyvision.org/caffe_ilsvrc12.tar.gz

echo "Unzipping..."

tar -xf caffe_ilsvrc12.tar.gz && rm -f caffe_ilsvrc12.tar.gz
rm imagenet.bet.pickle det_synset_words.txt synsets.txt
rm test.txt train.txt val.txt 
rm ._*

echo "Done."
