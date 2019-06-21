#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jun 11 09:59:32 2019

@author: ubuntu
"""

from sklearn.datasets.samples_generator import make_blobs
from .base_dataset import BaseDataset

class MultiClassDataset(BaseDataset):
    """sklearn自带多分类数据集，可生成2-n任意类别数据集，基本是线性可分，但有可能部分点线性不可分
    
    """
    def __init__(self, n_samples=100, centers=2, n_features=2):
        self.n_samples = n_samples
        self.centers = centers
        self.n_features = n_features
        super().__init__()
        
    def get_dataset(self):
        dataset = {}
        datas, labels = make_blobs(n_samples=self.n_samples, 
                                     centers=self.centers, 
                                     n_features=self.n_features)
        dataset['data'] = datas
        dataset['target'] = labels
        return dataset

               