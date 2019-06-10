#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Aug 28 09:56:41 2018

@author: suliang
"""

import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt


def moving_average(a, w=10):
    if len(a) < w:
        return a[:]
    return [val if idx <w else sum(a[(idx-w)])/w for idx, val in enumerate(a)]

# 创建数据
train_X = np.linspace(-1, 1, 100)
train_Y = 2 * train_X + np.random.randn(*train_X.shape)*0.3

plt.plot(train_X, train_Y, 'ro', label = 'original data')
plt.legend()
plt.show()

# -------------------创建运行图----------------------
X = tf.placeholder('float')
Y = tf.placeholder('float')
W = tf.Variable(tf.random_normal([1]), name = 'weight')
b = tf.Variable(tf.zeros([1]), name = 'bias')
z = tf.multiply(X, W) + b

tf.summary.histogram('z', z)  # 把数据预测值以直方图形式显示在tensorboard
# 计算损失函数：均方误差
cost = tf.reduce_mean(tf.square(Y-z))
tf.summary.scalar('loss_function', cost) # 将损失以标量形式显示在tensorboard

learning_rate = 0.01
# 梯度下降
optimizer = tf.train.GradientDescentOptimizer(learning_rate).minimize(cost)

# 初始化变量
init = tf.global_variables_initializer()

training_epochs = 20
display_step = 2

# 新建saver用于保存模型
saver = tf.train.Saver()
savedir = 'log/'

# ---------------启动一个session as sess-----------------
with tf.Session() as sess:
    sess.run(init)
    plotdata = {'batchsize':[], 'loss':[]}
    
    # 合并所有summary
    merged_summary_op = tf.summary.merge_all()
    summary_writer = tf.summary.FileWriter('log/mnist_with_summaries',sess.graph)
    
    for epoch in range(training_epochs):  # 外循环：20次自定义循环次数
        for (x,y) in zip(train_X, train_Y):  # 内循环：取出每个样本
            sess.run(optimizer, feed_dict = {X:x, Y:y})
            
        if epoch % display_step ==0:
            loss = sess.run(cost, feed_dict = {X:train_X, Y:train_Y})
            print('Epoch:', epoch +1, 'cost=', loss, 'W=', sess.run(W),
                    'b=', sess.run(b))
            if not (loss == 'NA'):
                plotdata['batchsize'].append(epoch)
                plotdata['loss'].append(loss)
                
    print('finished!')
    # 生成summary
    summary_str = sess.run(merged_summary_op, feed_dict = {X:x, Y:y})
    summary_writer.add_summary(summary_str, epoch)
    
    
    # 保存模型
    saver.save(sess, savedir + 'linearmodel.cpkt')
    
    print('cost = ', sess.run(cost, feed_dict = {X:train_X, Y:train_Y}),
          'W=', sess.run(W), 'b=', sess.run(b))
    
    # 可视化
    plt.plot(train_X, train_Y, 'ro', label='original data')
    plt.plot(train_X, sess.run(W)*train_X + sess.run(b), label = 'fitted line')
    plt.legend()
    plt.show()
    
    plotdata['avgloss'] = moving_average(plotdata['loss'])
    plt.figure(1)
    plt.subplot(221)
    plt.plot(plotdata['batchsize'], plotdata['avgloss'], 'b--')
    plt.xlabel('minibatch number')
    plt.ylabel('loss')
    plt.title('minibatch run vs. training loss')
    plt.show

    
    
            
            
            