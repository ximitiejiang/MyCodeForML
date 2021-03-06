#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jul 15 19:24:08 2019

@author: ubuntu
"""
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from dataset.regression_dataset import RegressionDataset
from utils.dataloader import train_test_split
from core.linear_regression_lib import LinearRegression

def standardize(X):
    """ Standardize the dataset X """
    X_std = X
    mean = X.mean(axis=0)    # 按列求均值
    std = X.std(axis=0)      # 按列求标准差
    for col in range(np.shape(X)[1]):
        if std[col]:
            X_std[:, col] = (X_std[:, col] - mean[col]) / std[col]  # 每一列特征单独做自己的标准化(减列均值，除列标准差)
    # X_std = (X - X.mean(axis=0)) / X.std(axis=0)
    return X_std


if __name__ == "__main__":
    
    source = 'linear'
    
    if source == 'temp':
        data = pd.read_csv('../dataset/simple/TempLinkoping2016.txt', sep="\t")

        time = np.atleast_2d(data["time"].values).T
        temp = np.atleast_2d(data["temp"].values).T
    
        X = standardize(time)        # Time. Fraction of the year [0, 1]
        y = temp[:, 0]  # Temperature. Reduce to one-dim
    
        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3)
    
        model = LinearRegression(X_train, y_train).train()
        y_pred = model.evaluation(X_test, y_test, title="test")
        
    if source == 'linear':
        dataset = RegressionDataset(n_samples=500, n_features=1, n_targets=1, noise=5)
        X = dataset.datas
        y = dataset.labels
#        plt.scatter(X, y)
        
        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3)

        model = LinearRegression(X_train, y_train, lr=0.001, n_iters=100).train()
        y_pred = model.evaluation(X_test, y_test, title='test')
           