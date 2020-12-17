
@ https://mp.weixin.qq.com/s?__biz=MzA4MjY4NTk0NQ==&mid=2247485776&idx=1&sn=3cc43a8763bf3ef737ecd7f7065b54f2&chksm=9f80b3c6a8f73ad029734bafdf7dd40f2a15af29b70e63bdbd7b2e5cd802ce5f77fbfffb624c&scene=21#wechat_redirect
Markdown Mind Map Preview

# YOLOv4

## Bag of freebies

### data augmentation
#### pixel-wise adjustments
##### photometric distortions 
- brightness
- contrast(对比度)
- hue(色彩)
- saturation(饱和度)
- noise of an image
- swap Channels
- convert Color
##### geometric distortions
- resize
- cropping
- rotating
- mirror
- expand

#### object occlusion(遮挡)
- erase
- CutOut   
- hide-and-seek(捉迷藏)
- grid mask 
- 正则化
    - DropOut
    - DropConnect
    - DropBlock
- multiple images
    - MixUp(混合)
    - CutMix

### 数据分布不均衡
- 两阶段
    - hard negative example mining
    - online hard example mining 
- 单阶段
    - focal loss 

###  one-hot 
- label smoothing
- knowledge distillation(蒸馏)

### BBox regression
- MSE loss
- IoU loss
- GIoU loss
- DIoU loss
    -- considers the distance of the center of an object
- CIoU loss 
    -- considers the overlapping area, the distance between center points, and the aspect ratio.

# Bag of Specials

## 即插即用模块
### 提升感受野
- SPP
- RFB
- ASPP
### 注意力机制
- SE
- SAM    
- modefied attention

###  feature integration(特征融合)
- Skip connection
- Hyper Column
- FPN
    - SFAM
    - ASFF
    - BiFPN

### active function
- 详见active function


## 后处理方法
-NMS
    - greedy NMS
    - Soft NMS
    - DIOU NMS


# 核心方法
## 创新点
- Mosaic数据增强方法
- Self Adversarial Training(SAT)
- CmBN 
- modefied SAM
- PANet   shortcut-> concate

## yolov4最终方案
- CSPDarknet53
- SPP
- PANet
- YOLOv3 Head
- CmBN
- Multi-input Weighted Residual Connection(多输入残差链接)
- Mish
- CIOU loss
- DIOU NMS

## 训练方法
### 数据增强
- Mosaic
- CutMix
- SAT
- Label Smoothing
- DropBlock

### 超参数进化
- 和u版一样

### 策略
- Cosine annealing scheduler
- Random Training Shapes
