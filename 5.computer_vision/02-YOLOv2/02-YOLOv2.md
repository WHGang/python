# YOLO9000 YOLOv2


# BETTER
## Shortcoming
1. YOLO makes a significant number of localization errors.
2. YOLO has relatively low recall compared to region proposal-based methods.

**Table 2**
![奋斗](./pictures/better.png)  

## 1. Batch Normalization

## 2. High Resolution Classifier.

## 3. Convolutional With Anchor Boxes. 
1. Predicting offsets instead of coordinates simplifies the problem and makes it easier for the network to learn.
2. We also shrink the network to operate on 416 input images instead of 448×448. We do this because we want an odd number of locations in our feature map so there is a single center cell.

## 4. Dimension Clusters.
1. k-means clustering
2. 



## 5. Direct location prediction.
![奋斗](./pictures/解码.png)  

## 6. Multi-Scale Training.
1. Since our model downsamples by a factor of 32, we pull from the following multiples of 32: f320; 352; :::; 608g. 

# Faster
Draknet19



# Stronger



