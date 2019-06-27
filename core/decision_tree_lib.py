#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jun 26 17:37:06 2019

@author: ubuntu
"""
import numpy as np
from .base_model import BaseModel

class Node:
    def __init__(self, fea=-1, value=None, results=None, right=None, left=None):
        self.fea = fea  # 用于切分数据集的属性的列索引值
        self.value = value  # 设置划分的值
        self.results = results  # 存储叶节点的值
        self.right = right  # 右子树
        self.left = left  # 左子树
    

class CART(BaseModel):
    
    def __init__(self, feats, labels, min_sample=30, min_err=0.3):
        super().__init__(feats, labels)
        
        
        self.root = self.create_tree(self.feats, self.labels, min_sample, min_err)
    
    def create_tree(self, feats, labels, min_sample, min_err):
        '''构建树
        input:  data(list):训练样本
                min_sample(int):叶子节点中最少的样本数
                min_err(float):最小的error
        output: node:树的根结点
        '''
        # 构建决策树，函数返回该决策树的根节点
        if len(feats) <= min_sample:
            return Node(results=self.leaf(feats))
        
        # 1、初始化
        best_err = self.err_cnt(feats)
        bestCriteria = None  # 存储最佳切分属性以及最佳切分点
        bestSets = None  # 存储切分后的两个数据集
        
        # 2、开始构建CART回归树
        feature_num = len(feats[0]) - 1
        for fea in range(0, feature_num):
            feature_values = {}
            for sample in feats:
                feature_values[sample[fea]] = 1
            
            for value in feature_values.keys():
                # 2.1、尝试划分
                (set_1, set_2) = self.split_tree(feats, fea, value)
                if len(set_1) < 2 or len(set_2) < 2:
                    continue
                # 2.2、计算划分后的error值
                now_err = self.err_cnt(set_1) + self.err_cnt(set_2)
                # 2.3、更新最优划分
                if now_err < best_err and len(set_1) > 0 and len(set_2) > 0:
                    best_err = now_err
                    bestCriteria = (fea, value)
                    bestSets = (set_1, set_2)
    
        # 3、判断划分是否结束
        if best_err > min_err:
            right = self.create_tree(bestSets[0], min_sample, min_err)
            left = self.create_tree(bestSets[1], min_sample, min_err)
            return Node(fea=bestCriteria[0], value=bestCriteria[1], \
                        right=right, left=left)
        else:
            return Node(results=self.leaf(feats))  # 返回当前的类别标签作为最终的类别标签
    
    def split_tree(self, data, fea, value):
        '''根据特征fea中的值value将数据集data划分成左右子树
        input:  data(list):训练样本
                fea(float):需要划分的特征index
                value(float):指定的划分的值
        output: (set_1, set_2)(tuple):左右子树的聚合
        '''
        set_1 = []  # 右子树的集合
        set_2 = []  # 左子树的集合
        for x in data:
            if x[fea] >= value:
                set_1.append(x)
            else:
                set_2.append(x)
        return (set_1, set_2)
    
    def leaf(self, dataSet):
        '''计算叶节点的值
        input:  dataSet(list):训练样本
        output: np.mean(data[:, -1])(float):均值
        '''
        data = np.mat(dataSet)
        return np.mean(data[:, -1])

    def err_cnt(self, dataSet):
        '''回归树的划分指标
        input:  dataSet(list):训练数据
        output: m*s^2(float):总方差
        '''
        data = np.mat(dataSet)
        return np.var(data[:, -1]) * np.shape(data)[0]
    
    def cal_error(self, data, tree):
        ''' 评估CART回归树模型
        input:  data(list):
                tree:训练好的CART回归树模型
        output: err/m(float):均方误差
        '''
        m = len(data)  # 样本的个数   
        n = len(data[0]) - 1  # 样本中特征的个数
        err = 0.0
        for i in range(m):
            tmp = []
            for j in range(n):
                tmp.append(data[i][j])
            pre = self.predict(tmp, tree)  # 对样本计算其预测值
            # 计算残差
            err += (data[i][-1] - pre) * (data[i][-1] - pre)
        return err / m
    
    def predict(self, sample, tree):
        '''对每一个样本sample进行预测
        input:  sample(list):样本
                tree:训练好的CART回归树模型
        output: results(float):预测值
        '''
        # 1、只是树根
        if tree.results != None:
            return tree.results
        else:
        # 2、有左右子树
            val_sample = sample[tree.fea]  # fea处的值
            branch = None
            # 2.1、选择右子树
            if val_sample >= tree.value:
                branch = tree.right
            # 2.2、选择左子树
            else:
                branch = tree.left
            return self.predict(sample, branch)
    
    
class ID3():
    def __init__(self):
        pass
    
class C45():
    def __init__(self):
        pass