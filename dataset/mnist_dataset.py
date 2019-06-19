#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jun 11 17:54:50 2019

@author: ubuntu
"""

import pandas as pd
from .base_dataset import BaseDataset

class MnistDataset(BaseDataset):
    """采用kaggle版本的mnist数据集https://www.kaggle.com/c/digit-recognizer/data
    数据被处理成train.csv和test.csv，每张图片像素为28*28, 被展平为一行784个像素
    其中train.csv为(42000,785), 即42000个样本，且第一列为label(0-9), 剩下为像素(0-255)
    其中test.csv为(28000, 784), 即28000个样本
    另一个外部转换过的train_binary.cvs数据集是把tarin.csv的label列进行转换，原来label=0不变，原来label>0的改为1
    从而变成一个二分类数据集(两个类别是0或非零)
    """
    def __init__(self, root_path='./dataset/mnist/', data_type='train'):
        """可设置data_type = train, test, binary分别调用训练集/测试集/二值训练集"""       
        train_path = root_path + 'train.csv'
        test_path = root_path + 'test.csv'
        train_binary_path = root_path + 'train_binary.csv'
        
        if data_type == 'train':
            self.path = train_path
        elif data_type == 'binary':
            self.path = train_binary_path
        elif data_type == 'test':
            self.path = test_path
        else:
            raise ValueError('wrong data type, only support train/binary/test.')
            
        super().__init__() # 先准备self.path再init
    
    def get_dataset(self):
        raw_data = pd.read_csv(self.path, header=0).values  # (42000, 785)
        dataset = {}
        dataset['data'] = raw_data[:, 1:]
        dataset['target'] = raw_data[:, 0]
        dataset['images'] = raw_data[:, 1:].reshape(-1, 28, 28)  # (n, 784) -> (n, 28, 28)
        return dataset
        