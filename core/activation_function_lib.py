#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Aug 22 15:57:22 2019

@author: ubuntu
"""

import numpy as np

# %%激活函数
       
class Sigmoid():
    """sigmoid函数的计算及梯度计算: 对sigmoid函数直接可求导
    缺点：在输入值过大或过小时，初始会变为0和1造成梯度grad=0也就是梯度消失；
         同时输出永远大于0，导致原来0均值特征不再为0均值，即特征偏移。
    公式：sigmoid = 1 / (1+exp(-x))
    求导：sigmoid' = sigmoid * (1- sigmoid)
    """
    def __call__(self, x):
        return 1 / (1 + np.exp(-x)) 
    
    def gradient(self, x):
        return self.__call__(x) * (1 - self.__call__(x))
    
    
class Softmax():
    """softmax函数的计算及梯度计算：对softmax函数直接可求导"""
    def __call__(self, x):
        exp_x = np.exp(x - np.max(x, axis=-1, keepdims=True))  # 在np.exp(x - C), 相当于对x归一化，防止因x过大导致exp(x)无穷大使softmax输出无穷大 
        return exp_x / np.sum(exp_x, axis=-1, keepdims=True)
    
    def gradient(self, x):
        y_p = self.__call__(x)  # 先求得输出y'
        return y_p * (1 - y_p)  # grad = y'*(1-y')


class Tanh():
    """正切函数作为激活函数: 比sigmoid改进的地方是输出变为对称的，不再有特征偏移问题。
    公式：tanh = (exp(x) - exp(-x)) / (exp(x) + exp(-x))
    求导：tanh'= (1-tanh^2)
    """
    def __call__(self, x):
        return 2 / (1 + np.exp(-2*x)) - 1

    def gradient(self, x):
        return 1 - np.power(self.__call__(x), 2)
        
    
class Relu():
    """relu函数的计算及梯度计算：对relu函数直接可求导, 但负区间还是可能梯度消失"""
    def __call__(self, x):
        return np.where(x>=0, x, 0)   # 注意这里是矩阵操作，不能用普通的判断，需要用np.where做矩阵级判断
    
    def gradient(self, x):
        return np.where(x>=0, 1, 0)


class Elu():
    """Elu函数的计算及梯度计算：用指数函数让relu的负区间有值不会产生神经元死亡，但负区间有可能梯度爆炸grad=alpha*e^x"""
    def __init__(self, alpha=0.1):
        self.alpha = alpha
    
    def __call__(self, x):
        return np.where(x>=0, x, self.alpha * (np.exp(x) - 1))
    
    def gradient(self, x):
        return np.where(x>=0, 1, self.__call__(x) + self.alpha)


class LeakyRelu():
    """leaky relu函数的计算及梯度计算：用线性函数让relu负区间有值不会神经元死亡，且不会梯度爆炸，且计算量小。"""
    def __init__(self, alpha=0.2):
        self.alpha = alpha
        
    def __call__(self, x):
        return np.where(x>=0, x, self.alpha * x)
    
    def gradient(self, x):
        return np.where(x>=0, 1, self.alpha)


    
    