------------------------------------------------------------------------
* Auto-encoder Based Data Clustering              *
* Demo Code Version 1.0                           *
* By Chunfeng Song and Yongzhen Huang             *
* E-mail: developfeng@gmail.com                   *
------------------------------------------------------------------------

i.    Overview
ii.   Copying
iii.  Use

i. OVERVIEW
-----------------------------
The auto-encoder based data clustering methods test on MNIST database to 
provide a demo version, supporting our paper:

Chunfeng Song, Feng Liu, Yongzhen Huang, Liang Wang, Tieniu Tan: 
Auto-encoder Based Data Clustering. CIARP2013.

Small part of this code is modified based on an earlier released
package of Hinton's, we have stated their right in our code.

ii. COPYING
-----------------------------
We share this code only for research use. We neither warrant 
correctness nor take any responsibility for the consequences of 
using this code. If you find any problem or inappropriate content
in this code, feel free to contact us.

iii. USE
-----------------------------
This code should work on Windows or Linux, with MATLAB.
Take MNIST for example, follow these steps:

1) Make sure your matlab has access to VLFeat, You could find them at: 
http://www.vlfeat.org/. Download and save it under the path of ./util/.
2) Download the MNIST database from: http://yann.lecun.com/exdb/mnist/, 
and then unzip them in the directory of ./data/.
3) Setup params in Demo.m. The default setting can achieve the result
reported in our CIARP13 paper.
4) Run Demo.m.
5) You can see the clustering result in ./tmp/ClusterResult.txt.