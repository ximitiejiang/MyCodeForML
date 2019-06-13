#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jun 11 10:34:02 2019

@author: ubuntu
"""

import numpy as np
import matplotlib.pyplot as plt
import time
from tqdm import tqdm

class SoftmaxReg():
    def __init__(self, feats, labels):
        """ softmax reg algorithm lib, 可用于多分类的算法: 参考<机器学习算法-赵志勇, softmax regression>
        softmax reg算法由一个线性模块(w0x0+w1x1+..wnxn)和一个非线性模块(softmax函数)组成一个函数
        用输入特征feats和labels来训练这个模块，得到一组(w0,w1,..wn)的模型，可用来进行二分类问题的预测，但不能直接用于多分类问题
        Args:
            feats(numpy): (n_samples, m_feats)
            labels(numpy): (n_samples,)  注意，多分类样本标签必须是0-n，从0开头因为算法中需要用label从0开始定位取对应概率值
        """
        assert feats.ndim ==2, 'the feats should be (n_samples, m_feats), each sample should be 1-dim flatten data.'
        self.feats = feats
        self.labels = labels.astype(np.int8)
        self.trained = False
    
    def softmax(self, x):
        """exp(wx)/sum(exp(wx))
        Args:
            x(array): (n_sample, k_class)
        Return:
            x_prob(array): (n_sample, k_class)
        """
        x_exp = np.exp(x)                    # (135,4), 这里要防止无穷大的产生
        x_sum = np.sum(x_exp, axis=1)        # (135,)
        x_sum_repeat = np.tile(x_sum.reshape(-1,1), (1, x.shape[1]))
        x_prob = x_exp / x_sum_repeat
        return x_prob
    
    def get_batch_data(self, feats, labels, batch_size=16, type='shuffle'):
        """从特征数据中提取batch size个特征，并组合成一个特征数据
        """
        batch_idx = np.random.permutation(np.arange(len(labels)))[:batch_size]  # 随机出batch_size个idx
        batch_feats_list = []
        batch_labels_list = []
        for idx in batch_idx:
            batch_feats_list.append(feats[idx].reshape(1,-1))
            batch_labels_list.append(labels[idx].reshape(-1,1))
        batch_feats = np.concatenate(batch_feats_list, axis=0)
        batch_labels = np.concatenate(batch_labels_list, axis=0)
        return batch_feats, batch_labels
        
    def train(self, alpha=0.001, n_epoch=500, batch_size=16):
        """feats(x1,x2,..xn) -> feats(1,x1,x2,..xn)
        Args:
            alpha(float): 梯度下降步长
            n_epoch(inf): 循环训练轮数
        """
        start = time.time()
        n_classes = len(set(self.labels))
        n_samples = len(self.feats)
        feats_with_one = np.concatenate([np.ones((n_samples,1)), self.feats], axis=1)  # (n_sample, 1+ n_feats) (1,x1,x2,..xn)
        labels = self.labels.reshape(-1, 1)   # (n_sample, 1)
        self.W = np.ones((feats_with_one.shape[1], n_classes)) # (m_feat, k_classes)
        self.losses = []
        
        n_iter = n_epoch * (n_samples // batch_size)
        
        for i in range(n_iter):
            # TODO: to support batch_size define: currently only support 1 pic per batch for training
            batch_feats, batch_labels = self.get_batch_data(feats_with_one, labels, batch_size=batch_size, type='shuffle')

            # w0*x0 + w1*x1 +...wn*xn = w0 + w1*x1 +...wn*xn, 然后通过softmax函数转换为概率(0-1)
            # (n_sample, 1) 每个样本一个prob(0~1)，也就是作为2分类问题的预测概率
            w_x = np.dot(batch_feats, self.W)   # w*x  (1, 4) (b, c)
            probs = self.softmax(w_x)              # probability (b,c)
            # loss
            loss = np.mean(-np.log(probs + 1e-06))  # 归一化平均  loss = -log(p)
            self.losses.append([i,loss])
            # vis text
            if i % 20 == 0:  # 每20个iter显示一次
                print('epoch: %d / %d, loss: %f, '%(i, n_epoch, loss))
            # gradient    
            _probs = - probs              # 取负号 -p
            for j in range(batch_size):
                label = batch_labels[j, 0]   # 提取每个样本的标签
                _probs[j, label] = 1 + _probs[j, label]   # 正样本则为1-p, 负样本不变依然是-p    
            gradient = - np.dot(batch_feats.transpose(), _probs)  # (135,3).T * (135,4) -> (3,4), grad = -x*(I-y')   
            # update Weights
            self.W -= alpha/n_samples * gradient   # W(3,4) - (a/n)*(3,4)
        
        self.vis_loss(self.losses)
        if self.feats.shape[1] == 2:
            for j in range(self.W.shape[1]):   # w (3,4)代表3个特征，4个类别
                w = self.W[:,j].reshape(-1,1)
                self.vis_points_line(self.feats, self.labels, w)
        
        self.trained = True
        print('training finished, with %f seconds.'%(time.time() - start))
        
    def classify(self, single_sample_feats):
        """ 单样本预测
        Args:
            data(numpy): (1, m_feats) or (m_feats,)，如果是(m,n)则需要展平
            k(int): number of neibours
        Returns:
            label(int)
        """
        assert isinstance(single_sample_feats, np.ndarray), 'data should be ndarray.'
        assert (single_sample_feats.shape[0]==1 or single_sample_feats.ndim==1), 'data should be flatten data like(m,) or (1,m).'
        assert self.trained, 'model didnot trained, can not classify without pretrained params.'
        single_sample_feats = np.concatenate([np.array([1]), single_sample_feats]).reshape(1,-1)
        probs = self.softmax(np.dot(single_sample_feats, self.W))  # w*x
        label = np.argmax(probs)   # 获得最大概率所在位置，即标签(所以也要求标签从0开始 0~n)
        label_prob = probs[0,label]
        return label, label_prob
    
    def evaluation(self, test_feats, test_labels):
        """评价整个验证数据集
        """
        correct = 0
        total_sample = len(test_feats)
        start = time.time()
        for feat, label in zip(test_feats, test_labels):
            pred_label, pred_prob = self.classify(feat)
            if int(pred_label) == int(label):
                correct += 1
        acc = correct / total_sample
        print('evaluation finished, with %f seconds.'%(time.time() - start))
        return acc
    
    def vis_loss(self, losses):
        """可视化损失, losses为list [(epoch, loss)]"""
        assert losses is not None, 'can not visualize losses because losses is empty.'
        x = np.array(losses)[:,0]
        y = np.array(losses)[:,1]
        plt.subplot(1,2,1)
        plt.title('losses')
        plt.plot(x,y)
        
    def vis_points_line(self, feats, labels, W):
        """可视化二维点和分隔线(单组w)
        """
        assert feats.shape[1] == 2, 'feats should be 2 dimention data with 1st. column of 1.'
        assert len(W) == 3, 'W should be 3 values list.'
        
        feats_with_one = np.concatenate([np.ones((len(feats),1)), feats], axis=1)
        
        plt.subplot(1,2,2)
        plt.title('points and divide hyperplane')
        color = [c*64 + 64 for c in labels.reshape(-1)]
        plt.scatter(feats_with_one[:,1], feats_with_one[:,2], c=color)
        
        min_x = int(min(feats_with_one[:,1]))
        max_x = int(max(feats_with_one[:,1]))
        x = np.arange(min_x - 1, max_x + 1, 0.1)
        y = np.zeros((len(x),))
        for i in range(len(x)):
            y[i] = (-W[0,0] - x[i]*W[1,0]) / W[2,0]
        plt.plot(x, y, c='r')

if __name__ == '__main__':
    import matplotlib.pyplot as plt
    import pandas as pd
    filename = '4classes_data.txt'  # 一个简单的2个特征的二分类数据集
    data = pd.read_csv(filename, sep='\t').values
    x = data[:,0:2]
    y = data[:,-1]
#    plt.scatter(x[:,0],x[:,1])
    
    plt.subplot(1,1,1)
    plt.title('points and divide hyperplane')
    color = [c*32 + 64 for c in y.reshape(-1)]
    plt.scatter(x[:,0], x[:,1], c=color)
    
    soft = SoftmaxReg(x,y)
    soft.train()
    print('finish trained: %s'%str(soft.trained))
    print('W = ', soft.W)
    
    sample = np.array([2,8])
    label, prob = soft.classify(sample)
    print('label = %d, probility = %f'% (label, prob))
