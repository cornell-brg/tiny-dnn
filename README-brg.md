# Running tiny-dnn on brg servers
==========================================================================

## Setting up the tiny-dnn environment

Clone the repo and source the setup script to setup TTB path variables
and gcc version 4.8.2.
```
git clone git@github.com:cornell-brg/tiny-dnn.git
cd tiny-dnn
source setup-tiny-dnn.sh
```

## Using cmake with the examples

To set up the CMAKE build files:
```
mkdir build && cd build
cmake -DBUILD_EXAMPLES=ON -DUSE_AVX=OFF ../
```
The BUILD_EXAMPLES flag is necessary to easily compile any of the examples.
The USE_AVX flag needs to be turned off (compiling with AVX results in illegal 
instructions on the brg server). The command above defaults to using the Intel 
SSE instruction set. To turn on other configurations or turn off SSE, add flags 
to the cmake command. 

## Compiling tiny-dnn

After running cmake, to see the available options for compilation, type:
```
make help
```
In order to run example_mnist_test (which is test.cpp), 
```
make example_mnist_test
```
tiny-dnn allows for trained networks to be saved and loaded. You can find the 
trained model for mnist in tiny-dnn/github/examples/mnist. The
trained model is called LeNet-model.

## Running mnist example

To load the model and run the example_mnist_test:
```
cd ../examples/mnist
../../build/examples/example_mnist_test ../../data/4.bmp
```
You should see the following output:
```
4,93.0714
7,9.59128
8,5.04411
```
This shows the confidence level of the network on classifying the input,
which is an image of a 4.

## Importing caffe models

It is also possible to import already trained Caffe models using Google 
protobuf. The protobuf files (caffe_converter.bin and caffe.pb.cc) for tiny-dnn 
have already been set up. All that is required is a model file, trained file, 
mean file, label file, and image file.

As an example, the files for a pre-trained Caffe model are provided in the 
directory bvlc (files from the Berkeley Vision and Learning Center):
```
tiny-dnn/examples/caffe_converter/bvlc
```
In order to get the pre-trained Caffe model and the ImageNet labels file (synset 
file), run the scripts below from the home tiny-dnn directory. The first script takes 
several minutes to complete.
```
./scripts/download_model_binary.py examples/caffe_converter/bvlc
./scripts/get_ilsvrc_aux.sh
```
Note that using the same model files repeatedly resulted in unpredictable 
behavior, it seems the importing and running of the model may be destructive.

To run the pre-trained model: 
```
cd examples/caffe_converter/bvlc
../caffe_converter.bin deploy.prototxt bvlc_reference_caffenet.caffemodel imagenet_mean.binaryproto synset_words.txt cat.jpg
```
We can see the layers getting converted to tiny-dnn layers. At the end we can 
see
the predictions of the network on classifying the cat image.  ```
Elapsed time(s): 8.6
n02123045 tabby, tabby cat,0.331108
n02123159 tiger cat,0.201654
n02124075 Egyptian cat,0.148082
n02119022 red fox, Vulpes vulpes,0.12278
n02119789 kit fox, Vulpes macrotis,0.071408
```
Note, tiny-dnn says that the caffe-converter only supports networks without 
branch.
Since the "branch" terminology is used in reference to graph networks in the
"How To" section, this may mean that caffe-converter does not work for graph 
networks, such as DenseNet, without modification. 
