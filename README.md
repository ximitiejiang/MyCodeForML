# Machine learning algorithm implementation

Machine learning algorithm implemented by python3: 
trying to build a clear, modular, easy-to-use-and-modify machine learning library. all the machine learning algorithms are rewrited as Class, with same and clear interface. also implement common dataset Class that can be easily used in any algorithms.
As this is a simplified machine learning algorithm implement, the accuracy is not the main factor to be considered, but it can be taken as a baseline, a better acc result is possible to get by optimizing the training hyper params.

### update
- 2019/06/25 add kdtree algorithm
- 2019/06/21 add svm algorithm
- 2019/06/15 add perceptron algorithm
- 2019/06/14 add softmax regression algorithm
- 2019/06/12 add logistic regression algorithm
- 2019/06/10 add knn regression algorithm
- 2019/06/03 reconstruct this repo

### features
- pure python code to implement all the algorithm.
- all the algorithms integrated as Class, easy to use and modify.
- all the datasets integrated as Class, easy to use and modify.
- all the algorithms are validated on several datasets(sklearn exist datasets or Mnist/Digits).
- support multi class classify by using multi-class-model_wrapper on top of two-class-classify-model.
- support training hyper-parameters modify: batch_size change, learning rate change, model save and load.
- visualization training process: log text and loss curve generation.
- detailed code explanation.

### usage

- prepare main dataset: digits(from sklearn), mnist(from kaggle)
```
python3 setup.sh
```
- train: 
```
from core.softmax_reg_lib import SoftmaxReg
sm = SoftmaxReg(feats, labels)
sm.train()
sm.save(root='./')
```
- eval:
```
from core.softmax_reg_lib import SoftmaxReg
sm = SoftmaxReg(feats, labels)
sm.load(path='./softmax_reg_weight_2019-5-1_150341.pkl')
sm.evaluation(test_feats, test_labels)
```
- test a sample
```
from core.softmax_reg_lib import SoftmaxReg
sm = SoftmaxReg(feats, labels)
sm.load(path='./softmax_reg_weight_2019-5-1_150341.pkl')
sm.classify([-1, 8.5])
```
- visualize the divide hyperplane
```
from core.softmax_reg_lib import SoftmaxReg
sm = SoftmaxReg(feats, labels)
sm.train()
sm.vis_points_line()
```

### PART 1. knn classifier
<br>feature: 
- no model weight
- support two-classes-classification and multi-classes-classification.
- support linear separable features and nonlinear separable features.
<br>test code: [test_knn](https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/test_knn.py).
<br>source code: [knn_reg_lib](https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/core/knn_lib.py).
<div align=center><img src="https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/demo/knn.png"/></div>

### PART 2. logistic regression classifier
<br>feature: 
- with model weight(n_feat+1, 1).
- only support two-classes-classification.
- support linear separable features.
<br>test code: [test_logistic_reg](https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/test_logistic_reg.py).
<br>source code: [logistic_reg_lib](https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/core/logistic_reg_lib.py).
<div align=center><img src="https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/demo/logistic.png"/></div>

### PART 3. softmax regression classifier
<br>feature: 
- with model weight(n_feat+1, n_class).
- support two-classes-classification and multi-classes-classification.
- support linear separable features.
<br>test code: [test_softmax_reg](https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/test_softmax_reg.py).
<br>source code: [softmax_reg_lib](https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/core/softmax_reg_lib.py).
<div align=center><img src="https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/demo/softmax.png"/></div>

### PART 4. perceptron classifier
<br>feature: 
- with model weight(n_feat+1, 1).
- only support two-classes-classification.
- support linear separable features.
<br>test code: [test_perceptron](https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/test_perceptron.py).
<br>source code: [perceptron_lib](https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/core/perceptron_lib.py).
<div align=center><img src="https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/demo/perceptron.png"/></div>

### PART 5. svm classifier
<br>feature: 
- with model weight.
- only support two-classes-classification.
- support linear separable features and nonlinear separable features.
<br>test code: [test_svm](https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/test_svm.py).
<br>source code: [svm_lib](https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/core/svm_lib.py).
<div align=center><img src="https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/demo/svm.png"/></div>
<div align=center><img src="https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/demo/svm2.png"/></div>

### PART 6. kdtree classifier 
<br>feature:
- no model weight
- support two-classes-classification and multi-classes-classification.
- support linear separable features and nonlinear separable features.
<br>test code: [test_knn](https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/test_kdtree.py).
<br>source code: [knn_reg_lib](https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/core/kdtree_lib.py).
<div align=center><img src="https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/demo/kdtree.png"/></div>

### PART 7. naive bayes classifier 
<br>feature:
<br>test code: [test_cart](https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/test_cart.py).
<br>source code: [cart_lib](https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/core/cart_lib.py).

### PART 8. CART classifier 
<br>to be update ...

### PART 9. OneVSOne classifier
<br>feature:
- as a wrapper to transform 2-class classifer to multi-class classifier, can be used on logistic-reg/svm/perceptron 
<br>test code: [test_cart](https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/test_ovo_model.py).
<br>source code: [cart_lib](https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/core/multi_class_model_wrapper.py).


### Reference:
- Machine Learning in Action, Peter Harrington
- Python Machine learning Algorithm, Zhiyong Zhao
- Statical learning method, Hang Li
- https://github.com/WenDesi/lihang_book_algorithm
  

