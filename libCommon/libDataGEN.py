#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Sep  1 20:10:25 2018

@author: suliang
"""
import numpy as np
import matplotlib.pyplot as plt

'''
一个简单的数据可视化
'''
def plotCurve(X,y,*args,c='b'):   # 注意*args必须在kwargs的前面
    plt.scatter(X,y,c=c)
    if args:
        plt.plot(X, X*args, c='r')
        

'''
随机数据的创建
'''
def randomData():
    from numpy.random import RandomState  # numpy的RandomState会比python自带的有更多方法
    rdm = RandomState(1)   # ???
    m, n = [128, 2]
    X = rdm.rand(m, n)  # 生成两组随机矢量(x1, x2)，用来做噪声，(128行，2列)
    
    plotCurve(X[:,0], X[:,1])
    return X

'''
分类数据创建器
'''
def classifyData_1():
    from sklearn.datasets.samples_generator import make_classification
    X,labels=make_classification(n_samples=200,n_features=2,n_redundant=0,
                                 n_informative=2, random_state=1,
                                 n_clusters_per_class=2)
    rng=np.random.RandomState(2)
    X+=2*rng.uniform(size=X.shape)
    
    plotCurve(X[:,0], X[:,1], c=labels*30+60)
    return X, labels
    
'''
生成圆形分布的分类数据
'''
def classifyData_2():
    from sklearn.datasets.samples_generator import make_circles
    X,labels=make_circles(n_samples=200,noise=0.2,factor=0.2,random_state=1)
    
    plotCurve(X[:,0], X[:,1], c=labels*30+60)
    return X, labels

'''
生成螺旋形分布的分类数据
'''
def classifyData_3():
    pass


'''
回归数据创建器        
'''
def regressionData():
    from sklearn.datasets import make_regression
    X,y,coef=make_regression(n_samples=1000,n_features=1,noise=10,coef=True)
    #关键参数有n_samples（生成样本数），n_features（样本特征数）
    # noise（样本随机噪音）和coef（是否返回回归系数)
    # X为样本特征，y为样本输出， coef为回归系数，共1000个样本，每个样本1个特征
    plotCurve(X,y,coef)
    return X, y, coef


'''
聚类数据创建器(也可以用作分类数据集的创建)
'''
def clusterData_1():
    from sklearn.datasets.samples_generator import make_blobs
    center=[[1,1],[-1,-1],[1,-1]]  # 指定三个分类的中心点
    cluster_std=0.3          # 指定分类数据的标准差，标准差越大越分散
    X,labels = make_blobs(n_samples=200,centers=center,n_features=2,
                       cluster_std=cluster_std,random_state=0) 
    # 特征数=2个，随机状态？
    plotCurve(X[:,0], X[:,1], c=labels*30+60)
    return X, labels    


'''
分类数据集：iris莺尾花数据集导入
'''
def irisData():
    from sklearn.datasets import load_iris
    iris = load_iris()  # 导入后可用： iris.data, iris.target, 
                      # iris.DESCR, iris_feature_names, iris_target_names
    return iris.data, iris.target
    

'''
分类数据集：简化版手写数字数据集导入
'''
def digitsData():
    from sklearn.datasets import load_digits
    digits=load_digits()
    
    return digits.data, digits.target, digits.images


'''
回归数据集：boston房价数据导入, 包含13个特征，和一个labels目标房价
'''
def bostonData():
    from sklearn.datasets import load_boston
    boston = load_boston()
    
    return boston.data, boston.target
    

'''
回归数据集：糖尿病数据集,包括10个特征，和一个labels实测目标值
'''
def diabetesData():
    from sklearn.datasets import load_diabetes
    diabetes = load_diabetes()
    
    return diabetes.data, diabetes.target


'''
多元回归数据集：体能训练数据集linnerud, 包括3个特征，和3个目标值向量
'''
def linnerudData():
    from sklearn.datasets import load_linnerud
    linnerud = load_linnerud()
    
    return linnerud.data, linnerud.target
    


'''
著名数据集：MNIST，一个大型手写数字图片集。来自：http://yann.lecun.com/exdb/mnist/
    * 每张图片28*28*1，黑白照片所以色彩只有一层数据代表灰度的1和0
    * 训练数据集：train-images.idx3-ubyte，train-labels.idx1-ubyte，包括60，000个样本
    * 验证数据集：t10k-images.idx3-ubyte，t10k-labels.idx1-ubyte，包括10，000个样本
'''
def MNISTData():
    import os
    import struct
    import numpy as np
    import matplotlib.pyplot as plt
    
    # 用sudo find / -name xxx 查找xxx的绝对路径
    # 查看当前路径：os.getcwd()
    path = '/Users/suliang/MyDatasets/MNIST/'
    kind = 'train'
    labels_path = os.path.join(path,'%s-labels-idx1-ubyte'%kind)
    images_path = os.path.join(path,'%s-images-idx3-ubyte'%kind)
    
    with open(labels_path, 'rb') as lbpath:
        magic, n = struct.unpack('>II', lbpath.read(8))
        labels = np.fromfile(lbpath, dtype=np.uint8)

    with open(images_path, 'rb') as imgpath:
        magic, num, rows, cols = struct.unpack('>IIII', imgpath.read(16))
        images = np.fromfile(imgpath, dtype=np.uint8).reshape(len(labels), 784)
    
    X_train = images
    y_train = labels
    
    #--------可视化1------------
    fig, ax = plt.subplots(nrows=2,ncols=5,sharex=True,sharey=True)
    ax = ax.flatten()
    for i in range(10):
        img = X_train[y_train == i][0].reshape(28, 28)
        ax[i].imshow(img, cmap='Greys', interpolation='nearest')
    
    ax[0].set_xticks([])
    ax[0].set_yticks([])
    plt.tight_layout()
    plt.show()
    
    #--------可视化2------------
    fig, ax = plt.subplots(nrows=5,ncols=5,sharex=True,sharey=True)
    ax = ax.flatten()
    for i in range(25):
        img = X_train[y_train == 7][i].reshape(28, 28)
        ax[i].imshow(img, cmap='Greys', interpolation='nearest')
    
    ax[0].set_xticks([])
    ax[0].set_yticks([])
    plt.tight_layout()
    plt.show()
    
    return X_train, y_train


'''著名数据集：CIFAR-10，彩色图片数据集，来自http://www.cs.toronto.edu/~kriz/cifar.html
    * 共10个分类，每个分类6000张，总计60000张图片
    * 图片像素32*32*3，彩色照片所以有三层数据分别代表红绿蓝的1和0
'''
def unpickle(file):
    import pickle
    with open(file, 'rb') as fo:
        dict = pickle.load(fo, encoding='bytes')
    return dict

def CIFAR10Data():
    filename = ''

# -------------运行区---------------------------------
if __name__ == '__main__':
    
    test_id = 5
    
    if test_id == 0:
        pass
    
    #X, labels = classifyData_2()
    #X, labels = irisData()
    #X, labels =linnerudData()        
    #X, labels,images = digitsData()
    #plotCurve(X[:,0],X[:,1])

    #X,y,coef = regressionData()
    #plotCurve(X,y,coef)
    
    elif test_id == 5:
        X_train, y_train = MNISTData()
    
    else:
        print('Wrong test_id!')
