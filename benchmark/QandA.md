# 机器学习问题集 v1.0

## 概率论

**Q. 高中数列求和公式**
1. 一个等差数列an = a1 + (n-1)d
    - n = (an - a1)/d + 1
    - d = (an - a1)/(n - 1)
    - s = (a1 + an)*n/2

**Q. 高中的排列组合基础**
<br>高中的排列组合知识主要是如下几点
- 排列是指有顺序的从m个里边提取n个，A(m,n) = m*(m-1)...(m-n+1) = m!/(m-n)!
- 组合是指无顺序的从m个里边提取nge，C(m,n) = A(m,n)/n! = m!/((m-n)!n!)

<br>例1：6个人站一排，如果要求甲乙必须相邻，有多少种站法？如果要求甲不站左端且乙不站右端，有多少种站法？
解答1：由于甲乙相邻，看成一个整体，相当于5个人排队，A(5,5)，然后甲乙顺序有A(2,2), 所以总计A(5,5)*A(2,2)=120*2=240
解答2：按顺序选择6个位置的人，则分别是C(5,1)*C(5,1)*C(4,1)*C(3,1)*C(2,1) = 600

<br>例2(面试题)：用1*3的瓷砖铺满3*20的地板有多少种方法？
解答：首先我的理解是最终铺出的形状一样就算同一种。假定地板是3行20列的水平长条。
可以2块竖放，剩下横放18%3=0，取决于竖放的位置，放法有
可以5块竖放，剩下横放15%3=0，取决于竖放的位置，放法有
可以8块竖放，剩下横放12%3=0，取决于竖放的位置，放法有
可以11块竖放，剩下横放9%3=0，取决于竖放的位置，放法有
可以14块竖放，剩下横放6%3=0，取决于竖放的位置，放法有
可以17块竖放，剩下横放3%3=0，取决于竖放的位置，放法有
可以20块竖放，剩下横放0%3=0，取决于竖放的位置，放法有
最后总计1278种放法

**Q. 概率怎么定义？**
<br>以前人们基于n次试验中，事件A发生的次数na，可以定义一个A发生的频率f = na / n，用来表征事件发生的可能性大小。
后来为了研究方便，引入概率P(A)，是指在试验次数n趋近于无穷时，频率f就接近了概率P(A)
<br>研究最多的就是古典概率，也就是样本空间中每个事件发生概率相同，比如抛硬币。
<br>实例1：袋中6只球，其中4只白球，2只红球，
<br>实例2：连续抛一枚硬币，直到连续出现两次正面为止，平均要抛多少次？-马尔科夫链


**Q. 为什么要引入随机变量？**
<br>概率论的核心就是研究事件的概率值，也就相当于研究事件X与概率Y的映射关系Y=f(X)。
但之前研究事件的概率，都是以描述的方式定义事件X和事件的概率Y, 而这种描述的方式显然无法找到这种映射关系f。
<br>而通过引入随机变量，就把事件定义成了一个数字化的变量X，同时把概率定义成变量Y，这样就通过两个数字化变量X,Y能够定义出两者之间的关系f(X)=Y，
也就可以使用任何数学工具来分析这种映射关系了，这就是随机变量引入的价值。
<br>所以概率论就是在已知X事件的分布情况下，分析映射关系(分布率/概率密度/概率)，分析数字特征(期望，方差，相关系数，矩)

**Q. 既然概率论就是研究x事件与y概率之间的映射关系，那有哪些常见的映射关系？**
<br>针对事件X自变量，主要有2种类型：
- 离散型事件的自变量X：
- 连续型事件的自变量X:
<br>针对概率Y映射值，也对应2种类型：
- 如果X为离散型自变量，则Y为离散型
- 如果X为连续型自变量，则Y为？？？

<br>两种类型X/Y对应了两种数学工具来研究：分别定义(分布律或概率密度，以及分布函数)，就可以用数学方法求概率了。
- 离散型X,Y：X的分布律P   ->  X的分布函数F(X)=P(X<x)=求和(X=xi)  ->   从而可求X的区间概率P(x1<x<x2)=F(x2) - F(x1)
- 连续型X,Y：X的概率密度f ->  X的分布函数F(X)=P(X<x)=积分f(t)dt  ->   从而可求X的区间概率P(x1<x<x2)=从x1到x2积分f(t)dt

<br>概率论就是在已知分布情况下，分析映射关系，分析数学特征。那么常见分布包括：
- (0-1)分布(离散分布)：
        - 特点：
        - 分布律P(x=k) = p^k * (1-p)^(1-k), 这是多次重复试验的分布律
- 二项分布/伯努利分布(离散分布)：
        - 特点：
        - 分布律P(x=k) =(n/k) 
- 泊松分布(离散分布)：

**Q. 什么是条件概率P(B|A)，跟同时发生的概率P(AB)有什么区别？**
<br>概率P(AB)代表事件A和事件B同时发生的概率，而条件概率P(B|A)代表在A发生的前提下B发生的概率。
其中P(AB)是在整个样本空间进行统计，而P(B|A)是在A发生的样本空间进行统计，也就是样本空间更小。
也可以理解为P(B|A)是在A发生的样本空间里AB同时发生的概率，所以才有公式P(B|A)=P(AB)/P(A)

<br>例如抛两次硬币，事件A为第一次为正面，事件B为第二次为正面，则P(AB)代表两次都是正面的概率，
P(B|A)代表第一次为正面的前提下再抛一次还为正面的概率。可采用手算的方式分析出计算两种概率：
- P(AB)两次都是正面的概率：(11)/(11+10+01+00) = 1/4
- P(B|A)在第一次为正面条件下，第二次为正面的概率：1/2
- 而用条件概率公式P(B|A) = (1/4)/(1/2) = 1/2

<br>针对同时发生概率P(AB)的定义，有一个乘法公式：
- 如果两个事件相互独立，则P(AB)=P(A)P(B)
- 如果两个时间不独立，则P(AB)=P(B|A)P(A)，这就是乘法公式

<br>针对条件概率定义，有一个最有名公式，叫贝叶斯公式，这也是机器学习贝叶斯分类算法的基础。
- 全概率公式: P(A) = P(A|B1)P(B1) + P(A|B1)P(B1) + ... + P(A|Bn)P(Bn)，
即把样本空间分割，在每一个子样本空间求概率，再累加。比如抽样1个的次品概率，原样本空间是所有样品，可以分解成来自B1厂/B2厂/B3厂样本
的三个子样本空间，所以P(A) = P(A|B1)P(B1) + P(A|B2)P(B2) + P(A|B3)P(B3), 参考概率论与数理统计p19

- 贝叶斯公式: P(B|A) = P(A|B)P(B)/P(A), 这里分母P(A)还可以用全概率公式展开。
即把两个事件A和B进行反转来作为先验概率，A事件作为先验概率下B事件的概率，就转化成了B事件作为先验概率下A事件的概率

**Q. 对随机变量的数字特征的本质认识**
<br>期望和方差是用来描述概率论中总体的数字特征，所以求解时：
- 期望：(均值大圆)即E(X)，描述的是数值的均值(也就是数值)。离散均值E(X)=sum(xk*pk)，连续均值E(X)=全积分(xf(x)dx)
- 方差：(相对于均值的偏差平方中圆)即D(X)，描述的是偏差的平均(也就是偏差)。即sigma^2。(方差方差，也就是平方一下偏差)。
- 标准差：(相对于均值的偏差小圆)方差的开方，也就是sigma。所谓的6sigma就是左右各3个标准差。

- 方差是数据偏离均值的偏差平方的均值，也就是D(X)=E((X-E(x))^2)，平方是为了放大偏离程度，所以方差也是一种相对于均值的偏离量的均值的度量。
基于方差也是一种均值，所以求方差的公式就是用均值公式，只不过对象不是随机变量X，而是相对于均值的偏差平方(X-E(X))^2。
也就是说，离散方差D(X)=sum((xk-E(X))^2*pk)，连续方差D(X)=全积分((x-E(x))^2*f(x)dx)
- 方差计算1个重要公式：D(X)=E(X^2) - (E(X))^2 ，可用D(X)的定义展开即可证明。

<br>如果是针对样本而不是总体，标准差公式是除以(n-1)，而总体的标准差公式是除以(n)


**Q. 偏差与方差的区别**
<br>偏差就是误差,也就是下图中的bias, 是相对于真值的距离，所以距离真值越远则偏差越大。
<br>方差就是均值，也就是下图中的Variance, 是相对于均值的距离，所以想对于均值越分散则方差越大。
<div align=center><img src="https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/demo/bias_vs_variance.png"/></div>

**Q. 协方差与方差的区别**
- 方差是描述一个随机变量(也就是一个特征)不同取值的偏差情况sum(X-Xmean)^2/(n-1)，
而协方差是描述两个随机变量(也就是2个特征)之间的关系sum(X_Xmean)(Y-Ymean)/n-1
- 从公式可以看出，随机变量X跟自己的的协方差就是方差即cov(X,X)=var(X)，同时cov(X,Y)=cov(Y,X)
- 由于协方差矩阵只能描述2个特征之间的关系，那如果要描述n个特征之间的关系，就需要协方差矩阵：
```
C = (cov(X,X), cov(X,Y), cov(X,Z),
     cov(Y,X), cov(Y,Y), cov(Y,Z),
     cov(Z,X), cov(Z,Y), cov(Z,Z)) 
```
- 方差/协方差的意义：方差越大，就说明特征表达能力越强，极限情况特征所有值相同，此时方差=0，说明该特征完全没有意义。

-------------------------------------------------------------------------------
### 统计学
**Q.概率论与数理统计的区别**
<br>概率论与数理统计的区别：(参考概率论与数理统计P128)
- 概率论就是：已知随机变量X的分布类型，来求1.分布律/概率密度/概率，2.数字特性(期望，方差，相关系数，矩)。
而且一般是先得到分布率/概率密度，才能再具体计算数字特性。
- 数理统计是：对随机变量X分布未知，也不知道分布律/概率密度，也不知道数字特征，
而是通过一部分样本数据，反过来先找数字特征，在分析分布律/概率密度，最后得知分布特点

**Q. 根据抽样计算抽样的数字特征**
<br>抽样的数字特征计算跟总体的特征计算类似，但有一个特殊的地方在样本方差
- 样本均值：Xmean = sum(Xi) / n
- 样本方差：S2 = sum((xi-Xmean)^2) / (n-1)
- 样本标准差：sqrt(sum((xi-Xmean)^2) / (n-1))

<br>在numpy中计算均值方差标准差，他并不能区分到底是总体还是抽样，但可以选择：
- 均值np.mean()，这条总体和样本计算是一样的。
- 标准差np.std()，默认是总体标准差，即ddof=0(是除以n)，也可设置ddof=1则为样本标准差(是除以n-1)(相当于放大一点标准差的值，更接近总体，也称无偏估计)
- 方差np.var()，默认是总体方差，即ddof=0(是除以n)，也可设置ddof=1为样本方差(是除以n-1)(相当于放大一点方差的值，更接近总体，也称无偏估计)

<br>为什么样本方差是除以n-1，且叫做无偏估计？
- 我理解的主要原因是对方差进行估计时，本应该是相对于总体均值的偏差平方的均值，
但通常总体均值未知而采用样本均值放入计算样本方差，此时计算出来的样本均值会比实际样本均值偏小，
从而造成低估方差，所以要把分母的n换成n-1来放大样本均值，从而可以抵消因为用样本均值替代总体均值造成的低估问题，从而得到无偏估计。
参考：https://blog.csdn.net/qq_39521554/article/details/79633207
证明：https://blog.csdn.net/Hearthougan/article/details/77859173 (应该是标准答案)


**Q. 样本的另外2个数字特征：一阶矩和二阶距**
<br>理解矩之前先理解概率：变量和概率形成一个函数，变量*概率得到一个均值，也可以理解为变量*概率得到一个力矩
例如：买彩票获得5元奖金概率是10%，100元奖金概率是0.5%，500w奖金概率是0.00001%，表示的是一个概率分布。
也就是说这个概率分布的可以得到均值E(x) = 5*0.1+100*0.005 + 5000000*0.0000001 = 1.5，也就是平均中奖概率是1.5元

换一个角度看这个均值公式，他等效于物理中的力矩公式5*0.1+100*0.005 + 5000000*0.0000001 = 1.5*1
其中取值为力，概率为力臂，等号左边为力矩之和，等号右边也为力矩之和，从而均值也就是平均力臂乘以概率1，也就是平均力矩。
所以x幂为1的成为一阶矩，也就是均值。

既然均值(一阶矩)=sum(取值*概率)
那么方差(二阶距)=sum(取值*概率)，只不过这里的取值是(x-u)^2，也就是与均值的偏差的平方，幂是2，所以是二阶距。

<br>一阶矩和二阶距的概念：
- 一阶矩是E(X-E(X))，相当于均值
- 二阶距是E((X-E(X))^2)，相当于方差

<br>应用场景
- 在梯度更新时，对梯度的一阶矩和二阶距进行计算，并利用他们调整梯度更新策略，这就是Adam优化器的原理

-------------------------------------------------------------------------------
## 数据分析

**Q. 如何找到缺失值和异常值，如何处理这些值？**
1. 如何找缺失值：
- 可通过python的筛选方法去寻找缺失值
```
idx = c[c>20]  # 筛选某列得到idx
a = a[idx]     # 提取其他列对应idx的数据
b = b[idx]     # 提取其他列对应idx的数据
c = c[idx]     # 提取其他列对应idx的数据
```
2. 如何处理缺失值：
- 直接删除记录:
- 使用固定值插值：比如0, 均值，中位数，众数
- 使用插值法找插值：拉格郎日插值(需自己实现)，牛顿插值(在scipy中有现成的)
- 使用回归模型得到插值：先寻找回归模型()，然后生成缺失值

3. 如何找异常值：
- 可通过python的筛选方法寻找异常值
- 可通过3sigma的997原则：取值在+/-3*sigma之内数据占比99.7%，这之外的就是异常值
- 可通过箱型图分析：取值在(Ql - 1.5IQR, Qu + 1.5IQR)之外的是异常值，
  其中Qu和Ql是上下四分位，分别表示1/4的数据比他大或比他小，QIQR是指四分位数间距，等于上下四分位之差，
  从而通过找到上下四分位的长度而找到上下界(Ql - 1.5IQR, Qu + 1.5IQR)

**Q. 如何对数据进行统计量分析？**
1. 基本统计量分析包括衍生出其他统计量：可通过pandas的data.describe()，或者自己写一个describe()函数
- 集中度：均值/中位数/众数
- 分散度：极差/标准差/四分位间距


**Q. 如何对数据中不同特征列的关系进行分析？**
1. 可绘制2列之间的散点图或者散点图矩阵：比如用pandas的scatter_matrix
```
```
2. 


**Q. 如何找到最重要的一些特征列，也叫做特征降维？**
1. 进行PCA主成分分析，找到最重要的一些特征列。



**Q. 为什么经常要对数据进行归一化或者标准化处理，有什么区别？**
<br>参考：https://www.zhihu.com/question/20455227
1. 首先定义什么是归一化，什么是标准化：
    - 归一化(normalization): xi' = (xi - xmin) / (xmax - xmin)，也就是把数据变换到[0,1]区间。所以归一化中的归一就是数据值归到[0,1]。
    - 标准化(standardization): xi' = (xi - mu)/sigma，也就是把数据变换到N(0,1)标准方差区间(可能大于1)。所以标准化中的标准就是数据值变成标准方差区间。

2. 归一化/标准化的本质和区别
    - 本质：xi' = xi/k + d，由于归一化标准化都可以写成这个公式，说明两者都相当于对x的缩放+平移，也就是一种线性变换。
    - 线性变换的特点：不改变数据的排序顺序，
    
    - 两者区别：归一化只跟最小值最大值有关系而跟其他数值都没关系，把输出范围压缩到(0,1)；
      而标准化是跟每个点都有关系，通过方差体现出来，输出范围不固定但分布形式为标准正态分布N(0,1)即均值为0方差为1
      优先使用标准化：可不受异常值或极端值影响
      但如果数据稳定不受极端最大最小值影响，可考虑归一化；如果输出要求在固定范围，可考虑归一化

3. 做归一化/标准化的好处：
    - 多个特征往往量纲不统一，有的数值很小，有的数值很大，如果不做归一化/标准化，那么大数值的特征影响会淹没小数值特征，
      所以归一化的好处就是**统一了量纲同时保留了特征内部各个数值的相互关系**。
    - 另一个原因以线性回归问题为例，损失函数为mse loss = (w1*x1+w2*x2 - y)^2， 这是一个关于w1,w2的平方函数，所以该损失
      函数的等高线投影到w1,w2坐标轴上就一个圆圈套圆圈如下，如果没有归一化则w1/w2数值相差很大，为一组椭圆，损失函数在求解
      梯度的时候就会更难收敛，而如果w1,w2归一化后两者数值相差不大，等高线为一组圆形，梯度求解就更容易收敛。
      <div align=center><img src="https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/demo/normalize.png"/></div>


-------------------------------------------------------------------------------
## 机器学习

**Q. 所有模型对比？**

|模型名称      |分类   |特征    |参数    |损失     |优点                              | 缺点                                               | 
|------------- |:-     |:-     |:-       |:-      |:-                               |:-                                                  |
|knn           |多分类 |非线性 |不可调参|不训练    |支持几乎所有类型数据，结构简单     |不是最优解，分隔面会侵入少样本区，计算量大              | 
|kdtree        |多分类 |非线性 |不可调参|不训练    |支持几乎所有类型数据，计算量有下降  |不是最优解，分隔面会侵入少样本区                       |
|logistic reg  |二分类 |线性   |不可调参|有损失函数|                                  |                                                      |
|softmax reg   |多分类 |线性   |不可调参|有损失函数|支持线性可分的多分类               |不是最优解，只支持线性分隔面                           |
|perceptron    |二分类 |线性   |不可调参|有损失函数|                                  |                                                      |
|svm           |多分类 |非线性 |可调参  |合页损失  |支持几乎所有类型数据，可参数优化   |完美!                                                  |
|naive bayes   |多分类 |非线性 |不可调参|不训练    |支持连续和离散数据                 |非线性能力不太强，对连续特征要求是正态分布否则分类效果差 |
|dt-cart       |多分类 |非线性 |不可调参|不训练    |                                  |                                                       |
|random forest |多分类 |非线性 |
|ada boost     |多分类 |非线性 |
|gradient boost|多分类|非线性 |
|xgboost       |多分类 |非线性 |
|mlp           |多分类 |非线性 |
|cnn           |多分类 |非线性 |


**Q. 当前模型精度对比？**
<br>数据集基于如下几个:
- iris: 简单的多特征多类别数据集，4个特征，3个类别        self.
- digits: 复杂的多特征多类别数据集，1000多个特征，10个类别
- breast cancer: 复杂的多特征二分类数据集，30个特征，2个类别

<br>设置：采用7：3的训练测试集比例
<br>m表示多分类，2表示二分类

|模型名称       |特点                       |circle(2)|cancer(2)     |iris(m) |digits(m)|备注         |
|------------- |:-                         |:-       |:-            |:-      |:-       |:-           |
|knn           |多分类/非线性可分           |         |              |0.985   |         |             |
|kdtree        |多分类/非线性可分           |         |              |        |         |             |
|logistic      |二分类/线性可分             |         |              |x       |x        |             |
|logistic ovo  |多分类/线性可分             |         |              |        |         |             |
|softmax       |多分类/线性可分             |         |              |0.967   |         |             |
|percptron     |二分类/线性可分             |         |              |x       |x        |             |
|percptron ovo |多分类/线性可分             |         |              |        |         |             |
|svmc          |二分类/非线性可分           |         |0.92          |x       |x        |             |
|svmc ovo      |多分类/非线性可分           |         |              |        |         |             |
|naive bayes   |多分类/非线性可分           |         |              |        |         |             |
|dt-cart       |多分类/非线性可分           |         |              |0.956   |         |             |
|random forest |多分类/非线性可分           |         |              |        |         |             |
|ada boost     |二分类/非线性可分           |0.98     |0.97          |x       |x        |当前最强分类器|
|gradient boost|多分类/非线性可分           |         |              |        |         |             |
|xgboost       |多分类/非线性可分           |         |              |        |         |             |
|mlp           |多分类/非线性可分           |         |              |        |         |             |
|cnn           |多分类/非线性可分           |         |              |        |         |             |


**Q. 分类问题和回归问题的处理思路差别**
<br>回答参考：lihang书本P19-P21
- 分类问题其实就是看预测得到的数据集label是否具有更小的经验熵，所以机器学习和深度学习都是用熵作为评价工具;
- 回归问题其实就是回归得到的预测值与真值之间是否具有更小的方差，所以通常都用平方损失或者mse loss作为评价工具。

1. 分类问题的过程：
    - 分类问题是在一组训练数据((x1,y1), (x2,y2),...(xn,yk))，其中xi为一个样本(可包含多个特征列)共计n个样本，yk为k个类别，
      建立模型从而可以建立一个概率函数P(y=yk|x=xi)或者分类函数yk=f(xi)，在已知xn+1时来预测属于某一类别的概率p或者一个类别值yk
    
2. 回归问题的过程：
    - 回归问题是在一组训练数据((x1,y1), (x2,y2),...(xn,yn))，其中xi为一个样本可包含多个特征列共计n个样本，yn为n个对应值，
      可包含多个特征列，建立模型从而可以拟合出一个映射函数yi=f(xi)，在已知xn+1时来预测一个连续输出yn+1值。
    - 回归根据一个样本中特征个数多少，分为一元回归(一个特征)和多元回归(多个特征)
    - 回归最常用的损失函数是平方损失函数mse，因为该损失函数可以通过著名的最小二乘法来求解。(最小二乘法的过程？？？)
      而从另外一个角度来说，平方损失其实就是每个数跟均值的距离平方的均值，也可以理解为每个数的方差，只要总方差越来越小，每个数就越来越接近自己的目标值，
      也就拟合得越好。


**Q. 什么是机器学习模型的方差-偏差的平衡？**
1. 如下图中，很好描述了预测值的偏差，预测值的期望(样本平均值)，预测值的方差之间的差别。
   预测值的偏差就是预测值与真实值之间的距离(大圆半径)，而预测值的方差就是各预测值跟预测期望的距离(小圆半径)。
   所以可以看出高偏差输出是大圆半径很大，高方差输出就是小圆半径大。
<div align=center><img src="https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/demo/bias_variance_tradeoff2.png"/></div>

2. 什么是高方差模型输出：就是针对同样的测试值，预测输出分散度很高，主要是因为预测模型太复杂想要拟合每个训练样本导致模型过拟合。
   此时，在训练样本中偏差较低，但在测试样本中偏差较高。(也就是过拟合)
   
3. 什么是高偏差模型输出：就是针对同样的测试值，预测的偏差很高，主要是因为预测模型太简单没有很好的拟合训练样本导致模型欠拟合。
   此时，在训练样本中偏差较大，在测试样本中偏差也大。(也就是欠拟合)
   
4. 具体到各种模型，如何比较方差与偏差：
- 一般具有很大灵活性的非参数学习方法都具有很高方差也容易过拟合，比如knn，svm
<div align=center><img src="https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/demo/bias_variance_tradeoff.png"/></div>

   
5. 什么是方差-偏差的平衡：也就是bias-variance-tradeoff，也就是模型既不能欠拟合也不能过拟合。
从可视化角度来说就是模型泛化误差是等于偏差+方差+噪声，而随着训练程度加深(模型复杂度增大)，偏差减小，方差增大，泛化误差呈现先减小后增大的曲线，
所以需要在泛化误差出现拐点的位置找到方差与偏差的平衡点。如下图
<div align=center><img src="https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/demo/bias_variance_tradeoff3.png"/></div>

- 通常采用正则化的方式来进行方差-偏差的平衡，也就是在损失函数表达式中增加lambda*L2或lambda*L1，即采用L2范数 ||x||2 = sqrt(sum(xi^2))，或者L1范数||x||1 = sum(|xi|)
  其中lamba叫做惩罚因子，lamba越大说明惩罚越大，说明模型越不愿意放弃离群点，所以模型也越复杂。
- 正则化之所以能够简化模型防止过拟合，是因为他在loss中增加了一项控制参数w的惩罚项(一般用L2正则)，减小惩罚因子就相当于减小loss的总和，也就相当于简化模型。
  
6. 解决模型高方差和高偏差的方案：
- 首先判断模型到底是高偏差还是高方差，也就是欠拟合还是过拟合，这从训练集和测试集的表现可看出。
- 高偏差(欠拟合)，可以考虑：尝试获取更多特征(等效于特征升维，寻找简化的线性模型)，尝试增加多项式特征(等效于特征升维，寻找简化的线性模型)，
  尝试增加惩罚因子(增加模型复杂度)，线性模型增加高次项，神经网络增加隐层或神经元个数。
- 高方差(过拟合)，可以考虑：尝试获取更多样本，尝试减少特征个数，尝试减小惩罚因子(减小模型复杂度)。


**Q. 如何判断过拟合，如何避免过拟合？**
<div align=center><img src="https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/demo/svm_c_sigma.png"/></div>
<br>什么叫过拟合，就是模型学习到的参数只能针对训练特征，而对测试特征却效果不好，也就是模型泛化能力不行。
而从偏差方差平衡角度来说，过拟合就是指模型是高方差模型(预测分散度大导致精度不好)。
比如上图第二排就是一个从欠拟合到过拟合的过程：sigma(0.1)较大时内层没有泛化预测到，sigma(0.05)时模型基本把数据全部分开，
sigma(0.01)较小时模型对训练集完全预测准确但对测试集却效果很差，模型过拟合了。

<br>判断过拟合的方法：
- 方式1：分别在训练集与测试集上进行精度计算，如果训练集精度很高，而测试集精度很低，说明过拟合。
- 方式2：绘制交叉验证曲线？？？
- 方式2：可先对特征降维到2个维度，然后绘制出分割面，看看是否有过拟合的情况。

<br>解决过拟合的方法：
- 增加特征数量：此时模型复杂度会降低
- 增加多项式特征：此时在模型复杂度不变情况下，增加了高维特征，也就增加了高维可分的可能性，变相相当于模型复杂度降低。
- 增加正则项：相当于权值衰减，也就相当于降低了模型复杂度，也就更不容易过拟合。


**Q. 什么是熵？机器学习中如何定义损失函数？**
<br>参考https://blog.csdn.net/dQCFKyQDXYm3F8rB0/article/details/80892165

<br>首先要知道什么是信息量：信息量是一个跟事件概率反相关的量，概率越大说明信息量越小，所以信息量I = -log(p(x0)).
<br>其次要知道熵的本质：熵的本质是信息量的期望(均值)，熵越大说明信息量越大，说明概率越小，H(x) = -sum(p(xi)*log(p(xi)))
<br>几个典型的熵：
    - 经验熵/条件经验熵：这两个都是标准的熵的形式，比如经验熵H(D) = -sum(p*log(p))，条件经验熵H(D|A) = sum(di/d * H)
      有了经验熵和条件经验熵，就可以求出信息增益也就是系统不纯度 = H(D) - H(D|A)
    - 相对熵(KL散度)：用来表示两个分布的信息增量，也就是两个分布相对熵越小，两个分布越接近，这就类似欧式距离的概念。
      相对熵的公式D = sum(p*log(p/q))，其中p,q分别是两个分布的概率，往往用p表示真实分布，q表示预测分布。
    - 交叉熵：就是把相对熵进行展开，忽略前一项不变项，剩下后一项就是交叉熵D = -sum(p*log(q))，这正好跟熵的形式非常接近。
      只不过经验熵是用来描述某一个分布的信息量，而交叉熵是用来描述两个分布的差异，所以是交叉概率形式而不是经验熵的同一概率形式。

<br>在机器学习中如何定义损失函数
1. 思路1：基于极大似然估计

2. 思路2：直接基于熵
- 决策树中系统不纯度 = 经验熵H - 条件经验熵 = - sum(pk*log(pk)), 其中pk为分割后的概率[0~1]

- 其他分类问题的交叉熵：交叉熵天然就是用来描述两个分布之间的相关度，类似于欧式距离天然用来描述两个样本的距离。
  所以用交叉熵就可以直接作为损失函数，损失函数越小也就是交叉熵越小，表示两个分布越接近，也就表示分类效果越好。
  H = -(y*log(y') + (1-y)*log(1-y'))，其中y为标签[0,1]， y'为概率[0~1]


**Q. 如何评估一个模型的精度，有哪些指标？**
<br>首先需要了解四个参数TP(真阳性), TN(真阴性), FP(假阳性), FN(假阴性)，
其中TP是指把正样本判断为正样本(正确)，TN是指把负样本判断为负样本(正确)，FP是把正样本判断为负样本(错误)，FN是把负样本判断为正样本(错误)。
<br>混淆矩阵就是用来分别得到TP/TN/FP/FN的四格矩阵
1. 模型准确率acc，即accuracy = (TP+TN)/(TP+TN+FP+FN)，也就是预测正确的量在所有样本的占比。
   缺点是如果是不平衡样本，比如正样本很少负样本很多(比如预测恐怖分子人数)，误报多个正样本也不会影响模型准确率，因为TN>>TP
   
2. 模型精确率P，即precision，是指P = TP/(TP+FP)，也就是判断正确的数量在给出的所有判断中的占比，即所有样本中有多少正样本被预测出来了。
3. 模型召回率，即recall，是指R = TP/(TP+FN)，也就是判断正确的数量在真正的正样本中的站比，即正样本中有多少正样本被预测出来了。
   这两个指标P和R都很重要，但是相互制约，一方高另一方就低，所以单独用一个指标都不能完整评价一个模型，所以才会有F1 score的出现。
   
4. F1 score，是精确率和召回率的调和平均，F1 = 2*P*R/(P+R)

5. ROC曲线和AUC：ROC(receiver operating characteristic)曲线叫受试者特征曲线，用于对召回率和精确率进行可视化，其中x轴为FP_rate, y轴为TP_rate，
   ROC曲线跟x轴的面积就是AUC(area under curve)，用于评估分类模型总体性能(类似F1的功能)



**Q.什么是模型的正则化？有哪些正则化方法，有什么区别？**
1. 什么是模型的正则化：
    - 模型如果欠拟合，极端情况就是大部分w=0, 也就是大部分特征根本没有使用，侧面说明w越接近0，模型越简单。
    - 模型如果过拟合，说明模型过度匹配训练数据，也就是权值过度更新，或者说w过大，模型越复杂。(大部分过拟合都是因为w值过大造成)
    - 为了抑制模型过拟合，采用的正则化也叫作权重衰减，因为正则化的本质是减小过大的权重值。
      对权重对应的损失增加正则项，通常正则项等于权重绝对值之和，或者权重平方值之和，
      可以看到正则项是一个跟w取值相关的函数r(w)，也是一个跟模型复杂度相关的项，w越大会引起正则项越大。
    - 基于正则项的特点，把他作为一个惩罚加到损失表达式中去，如果某些w数值过大导致r(w)增大，从而loss也就增加，反过来促使模型减小对应w来减小对应w的loss.
      这也是为什么正则化也叫权重衰减的原因。
    - 正则化实施的特点：虽然正则化是作为惩罚加到损失函数，然后通过梯度反向传播影响每一个w的更新，
      所以常规的实施方式应该是在损失函数对象内部，对损失的输出增加正则项，并对损失的梯度增加正则梯度进行反传去更新参数。
      这种方式的正则项需要计算整个网络所有层的W的累计平方和或绝对值和，执行起来不太方便。
      而实际实施的便捷方式是直接在每个w的优化器中进行正则化操作，对该w的grad添加正则项的梯度weight_decay*W (这是l2正则化梯度表达式)。
      这样实施的好处是，每一个w的正则化是分别进行的，且跟这个w的梯度直接相关。
      上面两种实施的区别：第一种是把所有w的值的影响进行统一，得到一个正则项，并反传到每个w进行参数更新；
      第二种是每个w的值只影响自己的梯度，单独进行正则项，两种方式都能有正则化效果。  
    - 一个有意思的地方：正则化对loss的影响并不会影响梯度，所以实际上只要更新梯度公式就能实现正则化了。

2. 两种正则化的区别？
    - 两种正则化都是生成矩阵，对每个w进行精确正则化。
    - l1正则化：采用所有权值w的绝对值作为正则项
        此时loss = loss + weight_decay * |w|
        此时grad = grad + weight_decay * w
    - l2正则化：采用所有权值w的平方作为正则项
        此时loss = loss + 0.5 * weight_decay * w^2
        此时grad = grad + weight_decay * w
    - 从数学的角度上说：
        l1正则是稀疏化
        l2正则是???

3. 如何选择正则化参数？
    - weight_decay的选择：取值越大则惩罚越大，通常取0.1

**Q. 什么是优化器optimizer? 他有什么用？不同优化器有什么区别？**

参考：http://ruder.io/optimizing-gradient-descent/index.html (里边形成了一篇arxiv文章)
<br>优化器的作用：优化器本质是一种算法，就是用来求解无约束条件下函数fn(x1,x2..xn)的极值方法，
可以求得极值条件下的x1..xn的取值，以及对应的min fn或max fn。
比如深度学习框架就是用优化器求函数Loss(w1..wn)的极值同时得到min loss下的w1..wn

<br>优化器算法的机理：为了求得极值，一般是把目标函数fn进行泰勒展开。
- 如果是目标函数一阶可导，可利用一阶导数的泰勒公式展开目标函数，这种优化器就叫做梯度下降法。此时：
  f(x) = f(xk) + f'(xk)*(x-xk)
  由于总是能通过反梯度方向找到x(k+1) = x(k) - lr*grad,使f(x(k+1))比f(xk)更小，
  也就总是能找到更小的f(x(k+1))直到min(f(x))，这就是梯度下降法的理论基础。
  
- 如果是目标函数二阶可导，可利用二阶导数的泰勒公式展开目标函数，这种优化器就叫做牛顿法或拟牛顿法。此时：
  f(xk) = f(x0) + 

<br>梯度下降算法实现的不同方式
- SGD: 最基础的梯度下降，就是反复求xi所在位置的梯度，然后沿着梯度方法更新一小步函数自变量xi = xi - lr*grad
        直到xi在多个epochs之后接近函数极点。
- SGDM: 带动量的梯度下降算法，即不是直接基于梯度更新自变量xi，而是



**Q. 常规优化器只能求解无约束条件下函数极值，那如何求解有约束条件函数极值？**
<br> 对于有约束条件的函数极值问题，需要采用拉格朗日对偶方法。




**Q. 什么是动量momentu，在优化器SGD中如何应用？在batchnorm2d中如何应用？**
<br>增加动量的必要性：如果不增加动量参数，
参考：https://blog.csdn.net/ssswill/article/details/86686686 里边有可以绘制出动量影响的代码。
```
class SGDM():
    def __init__(self, lr, momentum=0.9):
        self.lr = lr
        self.momentum = momentum
        self.tmp_w = None
    
    def update(self, w, grad):
        if self.tmp_w is None:
            self.tmp_w = np.zeros_like(w)
        self.tmp_w = self.momentum * self.tmp_w + (1 - self.momentum) * grad  # 计算更新m
        w -= self.lr * self.tmp_w
        return w
```

**Q. 什么是激活函数？有什么作用？**

有个疑问：既然全连接串联多次依然相当于线性变换，那为什么多层感知机却能够实现异或这种非线性分类？

参考：https://cloud.tencent.com/developer/news/235905
参考：https：整个神://blog.csdn.net/kangyi411/article/details/78969642
<br>激活函数的作用经网络作为一个万能函数，激活函数提供非线性能力。
因为一般的神经网络比如全连接，在一维是w*x，这只是一个线性变换，即使串联无数层，也等于一个线性变换w(w(w*x+w0)+w0)+w0，展开还是一个线性公式。
而加入激活函数，就是加入非线性变换的过程，极大提高神经网络的学习能力。

<br>激活函数的要求：由于核心是提供非线性变换，就要求
- 激活函数是非线性的：这样才能提供非线性变换能力。这里注意relu看似x>0是线性函数，但他在x<0时输出置0，所以也属于非线性。
- 激活函数必须可导：这样反向传播才能进行。可导也就是就切线(注意连续不一定可导，但可导一定连续，比如尖角位置不可导但连续)。

<br>不同激活函数的优缺点：激活函数是一个动态发展，逐步解决缺陷的过程
主要的问题包括：1梯度消失问题，2输出偏移问题，3计算量问题，4神经元死掉问题

- sigmoid(): 缺点1是在x>0过大，或者x<0过小，他的梯度都接近于0，导致梯度消失，这是最核心缺陷。
             他导致无法训练超过5层以上的模型，它导致神经网络几十年没有发展。
             缺点2是输出永远大于0，使特征产生偏移，不再以0为均值。
             缺点3是有指数运算，计算量偏大
- tanh(): 改进了缺点2，输出变为以0为中心。不再有特征偏移问题
              缺点1：梯度消失问题依然存在
              缺点3：计算量也不小
- relu(): 部分解决了缺点1，在x>0的正区间不再有梯度消失的问题，但在x<0时依然有梯度消失问题。
          完全解决了缺点3，前向计算为线性y=x计算量小，反向计算梯度=1计算量也很小。
              缺点2: 也有输出永远大于0的特征偏移问题(不过现在有bn了，这不算大问题)
              缺点4：前向计算x<0时，输出=0，导致部分神经元没有相当于死掉。
- elu(): 部分解决了缺点1，在x>0的正区间不再有梯度消失的问题，但在x<0时依然有梯度消失问题。
         完全解决了缺点2，在x<0依然有较小的一个输出
         完全解决了缺点4，输出不会等于0
             缺点3：引入了指数运算，计算量较大
- leaky_relu: 解决缺点1：不再有梯度消失问题
         完全解决缺点2：输出有正有负，没有特征偏移问题
         完全解决缺点3：在正负区间都是线性函数，计算量小
         完全解决缺点4：输出不会等于0

**Q. 什么是学习？逻辑回归的学习，多层感知机的学习，全连接层的学习，已经卷积层的学习有什么区别？**

<br>这是最近的一个感悟，由于深度学习模型其实就是一个万能函数，所以学习其实本质上是拟合。
而拟合的本质都是线性变换+非线性激活，所以学习的本质都是线性变换(矩阵内积)+非线性激活(relu)。
不同学习类型的区别是学习对象的不同。

<br>具体到每种学习类型：
- 逻辑回归/softmax回归的学习：是一个样本作为整体进行学习，本质就是一层全连接，由于没有非线性激活，所以只具有线性分类能力。
- 多层感知机的学习：是一个样本作为整体进行学习，本质就是多层全连接，进一步加强非线性能力。

- 全连接层的学习：是一个样本作为整体进行学习，一个样本的所有特征(x1,x2,...xn)dot(w1,w2,...wn)得到一个数值yi, 10个类别就得到10个数y0,y1...y9作为预测(中间经过softmax进行概率变换)

- 卷积层的学习：是一个样本的局部进行学习，一个3*3的样本区域，对应一次卷积学习(x0..x8)dot(w0..w8)得到一个数值yi，代表的是任何抽象意义。
  因此卷积层的学习除了全连接的非线性能力之外，还呈现2个特点，第一是具有位置特征：因为他学习的是局部位置，每个局部的位置特征就被保留下来了。
  第二是具有逐层学习递进的关系：浅层的学习，每个特征值xi代表的是局部颜色/梯度，所以学习的输出值yi是局部形状/边缘；
  而深层的学习，每个特征值xi也就是前一层的yi代表的是局部形状/边缘，所以学习的输出值yi代表的是局部结构/物体；
  而更深层的学习，每个特征值xi也就是前一层的yi代表的是局部结构/物体，所以学习的输出值yi就能够表示具体的类别物体。

- 池化层的学习：池化层本身并不是用来学习的，而是用来在保留特征的前提下，达到特征降维的目的，同时扩大感受野。
  

**Q. 什么是参数量和计算量的平衡？**
<br>这个主题可参考deep learning from scratch, P249
- 参数量：参数量最大的是linear层，占了大部分网络参数量的80%以上的。
- 计算量：计算量最大的是conv层，占了大部分网络计算量的80%以上。（所以带卷积的模型计算量就会暴增）


  
-------------------------------------------------------------------------------
## PART 1. knn classifier
**Q. knn的超参数k怎么选择？**
<br>最好选择k为奇数，防止投票产生平票
<br>k值太小不好，使用太少的样本判断，极端情况就是只用一个样本，则模型预测太容易受噪声干扰，也就是模型只对训练数据有效果，泛化能力不行，也就是过拟合了。
<br>k值太大也不好，极端情况就是k值等于整个训练样本数，此时模型基本不需要训练，会直接预测出整个样本的最多类，说明模型太简单了，欠拟合了。

**Q. knn算法有什么缺陷，如何改进？**
<br>knn缺点：算法需要计算测试样本与训练样本的每一个样本的距离，如果训练样本很大则计算非常耗时。
<br>改进方法：kd树，预先把特征存放到二叉树中(kdtree)，从而在寻找k个样本时不需要跟整个样本空间的样本进行距离计算。
这在特征维度很高/样本数量很大时节省的时间就很多，不过在特征维度一般/样本数少的情况下，差别不大。
<br>kd树具体的算法过程：
- 先把样本保存到一个二叉树中(循环按照某一特征维度进行分割，以该维中位数作为分割点，生成二叉)
- 预测过程包括下行和上行两部分：下行就是从根节点出发，往下找到最接近测试样本的叶子结点(即左右子节点均为None的节点)。
而上行就是从该叶子节点往上，寻找k个点，逻辑是每往上爬一个节点就可以存放一个，如果超过k个则比较距离大小。
- 最后在找到的k个节点中，投票决定测试样本的类别。
- 可见kdtree算法也是找k个近邻来投票，跟knn区别在于先把特征保存成kdtree，然后搜索kdtree的方法比较高效。

- 假设有一个目标点x要预测，则先从根节点出发，判断每一维度大小，
比节点小往左分支，比节点大往右分支，直到抵达一个叶节点，该叶节点就是当前最近点。
- 从该叶节点回退，在每个节点进行距离计算，如果比当前最近点更近，则更新最近点坐标，


-------------------------------------------------------------------------------
## PART 2. logistic regression classifier
**Q. 为什么明明是分类算法，却叫逻辑回归？**
<br>我的理解是这个算法是对类别概率值的直接计算得出，相当于是对概率值的回归，所以叫逻辑回归。

**Q. 逻辑回归算法基本流程？**
<br>逻辑回归是机器学习算法中第一个采用映射思想的模型，把一组特征经过线性变换和非线性变换映射到另一个空间变成概率。
其中线性变换就是wx, 而非线性变换就是sigmoid函数。整个变换过程是通过参数w来控制，所以要通过训练找到这组w作为二分类。
这种思想跟卷积神经网络是一样的，通过神经网络的线性变换+激活函数的非线性变换，最后映射到另一个空间变成概率。
<br>得到预测概率后，还要把标签值也看成概率(0,1)，这也是为什么标签要取0和1，其他值就要转换成0,1。这也是交叉熵损失函数
的本质，就是预测概率和真实概率下计算系统的熵是否能越来越小。且如果是多分类，就必须把标签值转换成独热编码，本质也就是概率化。
这样想，就把逻辑回归跟交叉熵联系在一起，也把二分类跟多分类联系在一起，也把逻辑回归跟深度神经网络联系在一起了。

<br>获得预测概率后如何得到损失函数公式：一方面可以基于最大似然推导得到损失函数loss=-log(p),该推导过程需要引入最大似然，参考李航书本。
另一方面可以基于系统熵最小化直接用交叉熵公式得到loss = -(y*logy' + (1-y)*log(1-y'))，这种思考过程类似于决策树中分割点的选择原则就是系统熵最小化(比如id3的信息增益=经验熵-条件熵)。
这种交叉熵公式，也同样适用于多分类的softmax：因为多分类的交叉熵公式只不过是对每个类别(是与不是)进行二分类交叉熵计算。

<br>获得损失函数后如何得到梯度公式： 这就需要对损失函数公式相对w求导得到grad = -(y-y')*X

**Q. 逻辑回归是否适合多分类？**
<br>直接的逻辑回归不适合多分类，但有如下三个思路可对逻辑回归算法进行改造使之适合多分类
- 扩展逻辑回归的外延，把-log(p)的p定义成softmax的输出，就可以适合多分类了，也就相当与softmax reg
- 采用一对一的方法：每一个类别之间进行一对一的分类，产生(n_class-1)的阶乘个分类器，然后投票决定预测结果
- 采用一对多的方法


-------------------------------------------------------------------------------
## PART 3. softmax regression classifier
**Q. softmax回归的原理跟logistic回归有什么区别**
<br>理论参考：https://blog.csdn.net/Gipsy_Danger/article/details/81292148, 以及赵志勇的书



-------------------------------------------------------------------------------
## PART 4. perceptron classifier



-------------------------------------------------------------------------------
## PART 5. svm classifier
**Q. svm是否适合部分线性可分特征？对算法有什么要求？**
<br>线性svm只适合线性可分特征，而对于线性不可分特征，需要引入松弛系数，使每个样本的函数间隔减去一个松弛系数epsiloni，也就是函数间隔可以小于1，使yi*(w*xi +b) >= 1 - epsiloni。
松弛系数的加入，意味着可以放弃线性不可分的点的精确分类，放弃也就意味着分隔面不必向这些点的方向去移动，从而可以得到更大的几何间隔。
训练结果最终只有不可分的点有不为0的松弛系数，而可分点的松弛系统等于0，松弛系数越大，点就离群越远。
<br>同时，对每个松弛系数，损失函数(min f(w,b))需要增加支付一个代价C*sum(epsiloni)，这里C为惩罚系数。
C越大则说明对目标函数惩罚越大，说明你越重视离群点，也越难获得可收敛的解。
合理的调试方式就是定义一个C，然后求解得到一个分类器看看，如果过拟合了，可以考虑减小C，放弃一些错分点。

**Q. svm是否适合非线性可分特征？对算法有什么要求？**
<br>线性svm只适合线性可分和部分线性可分，而对于非线性可分，则需要把特征升维，使在低维线性不可分的特征变为高维线性可分的特征。
从而可以用线性svm的理论对非线性可分特征进行分类。
<br>而要计算得到高维线性可分特征需要分两步：第一步找到特征从低维向高维的映射函数，第二步计算每两个样本的内积
(之所以要计算两个样本内积，是因为线性svm求解采用了对偶求解方法，其公式中包含两个样本的内积)。
但这里第一步找到的特征从低维到高维的映射函数往往形式很复杂，不仅寻找麻烦而且计算过程麻烦，但两个样本
的映射函数的内积函数却有可能很简单，所以为了简化运算，引入核函数K(xi, xj)就定义成两个样本特征升维并内积的映射函数。
这种核函数就是把两步走的过程集成在一步映射完成，并且获得了非常简单的函数表达式。
<br>已经有一些现成的核函数，形式简单的表示出了特征升维后两个样本内积的结果，比如高斯核函数，比如二项式核函数。
注意核函数的输出结果是一个标量。

**Q. svm是否适合多分类特征？对算法有什么要求？**
<br>无论线性svm还是非线性svm，都只适合二分类问题，如果特征是多分类问题，则需要改造：
- 采用一对一的方法(这也是libsvm采用的方法)
- 采用一对多的方法

**Q. svm如何选择核函数？**
<br>有两类核函数：
- 线性可分问题，采用线性核函数，也就是不用核函数，K(xi, xj) = <xi, xj> = np.dot(xi, xj)即直接内积计算
- 非线性可分问题，优先采用高斯核函数，因为他只有一个参数sigma，便于调参。多项式核函数参数有3个，较难调参。

**Q. 为什么高斯核函数的sigma越小，模型越复杂？**
<br>高斯核函数相当于

**Q. svm的超参数如何选择：C, sigma？**
<div align=center><img src="https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/demo/svm_c_sigma.png"/></div>
<br>对于C，如第一排的图，可以先尝试一个比较小的C，此时模型对离群点不够重视，可能放弃了太多离群点。
然后加大C，此时对目标函数惩罚较大，也代表对离群点更重视，不希望放弃太多离群点。
如果继续加大C，此时模型收敛更难，也更可能因为复杂的模型导致过拟合。

<br>对于sigma，如第二排的图，越小表明模型越复杂，越有可能过拟合，越大则模型越简单。
sigma(0.1)较大时内层没有泛化预测到，sigma(0.05)时模型基本把数据全部分开，
sigma(0.01)较小时模型对训练集完全预测准确但对测试集却效果很差，模型过拟合了。

**Q. svm在线性分类器及非线性分类器中有什么优势？**
<br>在线性分类器中，常用的是perceptron/logistic reg和svm，但perceptron采用的函数间隔(wx+b)来区分负样本，
也就无法对正负样本的相互距离关系进行评价；而svm采用的几何间隔，能够让正负样本的几何间隔都最大化，从而保证
正负样本的支持向量距离分隔面距离相同，属于最优化的分隔面。

<br>在非线性分类器中，常用的两种是knn和svm，但knn无法调参数，他对于局部样本不平衡的情况无法干预，
会导致分隔面往样本少的方向侵入，不是最优化的分隔方式；而svm由于在局部是采用最大化几何间隔来实现，
所以属于在最优化的分隔面，样本不平衡问题对svm没有影响。如下对比knn与svm的图片可以看出knn分隔面往样不少方向的入侵问题。
<div align=center><img src="https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/demo/compoare_knn_svm.png"/></div>

-------------------------------------------------------------------------------
## PART 6. naive bayes classifier
**Q. 朴素贝叶斯是否适合连续性特征的分类？**
<br>朴素贝叶斯可以适合于离散性特征和连续性特征，共同点都是基于条件独立性假设下的条件概率公式
P(Y=ck|X=x) = argmax P(Y=ck)*连乘积P(Xj=xj|Y=ck)来计算样本属于每个类的概率，其中概率最大的就是预测值。

<br>朴素贝叶斯分类方法在处理离散性特征和连续性特征的区别在于连乘积P(Xj=xj|Y=ck)的计算方式
- 对于离散性特征，采用统计个数的方式来计算在某个类别下，每个离散特征值的出现个数来计算概率。
- 对于连续性特征，是在条件独立性假设前提下进一步假设条件服从高斯分布(条件独立性假设是假设特征之间相互独立)，
从而采用高斯概率密度的值来表示P(Xj=xj|Y=ck),从而用多个高斯概率密度的乘积来表示连乘积P(Xj=xj|Y=ck)。

**Q. 朴素贝叶斯对非线性特征的拟合能力强吗，为什么？**
<br>朴素贝叶斯分类算法，从理论分析和我的试验看，在所有非线性分类算法中(knn/svm/cart/nb)受限制最大，效果也不好。
主要原因在与朴素贝叶斯的连续特征分类算法是假定每个特征都是正态分布的前提下去估计概率，
而对于大部分非线性特征(比如典型的moon数据集)，其分布往往跟正态分布相差很远，所以分类的效果就很差。而对于那些离散的
或者是无规律分散的特征(比如circle数据集)，往往其分布是正态分布，所以效果就会不错。其他非线性算法由于不受特征
分布的影响，所以效果会比朴素贝叶斯更好。如下图示：
<div align=center><img src="https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/demo/naive_bayes_continuous2.png"/></div>


-------------------------------------------------------------------------------
## PART 7. decision tree classifier
**Q. 决策树算法描述**
<br>
<br>
<br>创建一棵决策树的过程就是对数据集进行分割的过程，分割点的选择有多种方法，但都是为了降低系统不纯度或者叫系统不确定度，使分割后的系统更加确定而有序。
1. 

**Q. CART决策树有什么优缺点？**
1. CART优点：可同时适合于离散数据和连续数据，非线性拟合能力极强(可以跟svm媲美)，甚至很容易过拟合
2. CART缺点：容易过拟合。为了方式过拟合可以尝试：
- 预剪枝(增加对最少分支样本个数控制)：防止过于细分
- 预剪枝(增加对最大层数的控制)：防止过于细分
- 后剪枝(尝试增加剪枝算法优化生成的树结构)：实现细节
- 尝试采用随机森林代替决策树: 为什么随机森林不容易过拟合？？？


**Q. 分类决策树与回归决策树有什么区别？**
<br>参考机器学习中分类问题和回归问题的差别：
- 分类问题其实就是分开后的子集是否具有更小的经验熵，所以机器学习和深度学习都是用熵作为评价工具;
- 回归问题其实就是回归得到的预测值与真值之间是否具有更小的方差，所以通常都用平方损失或者mse loss作为评价工具。
<br>以下是对不同决策树差异对比
<br>注意：针对连续特征值，分类方法一般简化成大于等于某特征值为一组，小于某特征值为另一组, 从而划分数据集为2份。
而针对离散特征值，分类方法则采用等于某特征值为一组，该特征有多少类就有多少组, 从而划分数据集为n_class份。
1. 采用的最优分支划分方法不同：
- ID3分类树采用信息增益，也就是经验熵缩减量，来评估系统不纯度。
    经验熵H(D)=-sum(p*log(p)), 分割后条件熵H(D|A)=p1*H(D1) +p2*H(D2), 信息增益info_gain= H(D)-(p1*H(D1)+p2*H(D2))
    所以评价信息增益即可，信息增益越大，系统越纯净
- C4.5分类树采用信息增益比，也就是增益/熵，来评估系统不纯度。
    (因为信息增益的原则会倾向于选择那些特征类别比较多的分割特征值，类别多相应细分后系统确定性更高，也就增益更大，这需要被抑制)
    信息增益比g(D,A)=
    所以评价信息增益即可，信息增益越大，系统越纯净

- CART分类树采用基尼缩减，也就是基尼指数缩减量，来评估系统不纯度.
    基尼指数gini(D)=1-sum(p^2), 分割后gini(D,A)=1-sum(p*p), 基尼缩减gini_reduction = gini(D-(p1*gini(D1)+p2*gini(D2))
    所以评价基尼缩减即可，基尼缩减越大，系统越纯净
- CART回归树采用平方缩减，也就等效于方差缩减(预测值与目标值的总方差)，即分出来的两个子数据集是否能让总的方差减小，极限情况就是全都按类别分好，则总方差=0。
  所有回归问题基本都是使用mse loss，本质也就是总方差损失，loss越小说明总方差越小，也就是回归得到的数据跟目标数据越接近。

-------------------------------------------------------------------------------
## PART 8. random forest classifier
**Q. 随机森林的算法描述？**
<br>输入：特征(n_sample, n_feat), 标签(n_sample,)
<br>输出：分类器G，包含k个子分类器
1. 对训练数据集采用有放回抽样，随机抽取m个样本，n个特征，组成一个新的子数据集，总计抽取K个子数据集。
   其中m一般取原样本数*(1/2)，n一般取sqrt(原特征数)。
2. 基于K个子数据集，创建K棵分类树模型，并记录每棵子树的特征列选择。
3. 预测过程：
    - 一个单样本，基于每棵子树的抽取特征列信息，抽取单样本的对应特征列值，送入每棵子树进行预测
    - 汇总所有子树的预测结果，投票得到票数最高的标签类别作为最终预测类别

**Q. 随机森林是否可以采用其他子分类器？**
<br>默认采用的子分类器是cart树/ID3数/C45树，我的观点是换成别的子分类器，依然是先分拆数据集，创建子分类器，然后结果投票，
应该也是可以达到目的。

-------------------------------------------------------------------------------
## PART 9. ada boost classifier
**Q. ada boost的算法描述？**
<br>输入：训练数据集T
<br>输出：分类器G(x)
1. 初始化权值分布w1 = (w11,w12,..w1N), w1i=1/N，其中1N代表第1次权值，N个样本，用1/N作为每个权值的初始化值，这样保证所有w相加为1，即w概率化
2. 

**Q. ada boost的样本权重和模型权重公式的设计方法和目的？**
1. 样本权重的设计：把他设计成概率的形式，初始化就保证和为1, 更新后也会做归一化操作，它代表所有样本中为错分样本的概率，如果错分则该概率权重提高。
  这样做优点是计算error方便，直接用错分样本的w相加即可。
2. 模型权重的设计：把它设计成0.5*log((1-error)/error)，是因为error取值范围已被模型固定在[0-0.5]之间，在error=0.5时权重为0, 模型不提供贡献；
  而在[0,0.5)区间，该权重与error正好是反相关，所以保证error越小的模型获得越大的权重(其实这个函数用什么样子都可以，就看怎么定这个权重等级)。
  
**Q. ada boost是否可以采用其他分类器？且为什么一定要采用弱分类器？**
<br>默认一般用一个决策树的树桩(也就是1个root加2个leaf), 如果想要采用其他分类器作为子分类器，则需要选择弱分类器
而不是强分类器，这样才能让不同子分类器拥有更大的差异性，对错分样本的处置针对性也就不同，更有利于集成之后的精度提高。
<br>之所以要采用弱分类器做子分类器，是因为弱分类器相互之间差异性更大，有利于错分样本在不同分类器得到不同的处理。
而如果采用强分类器，比如svm，错分样本的分布基本是一样的，也就是说不同的svm强分类器都处理不了类似的错分样本，因此
强分类器的组合其分类精度也不会有提高，甚至会有下降。

**Q. bagging随机森林和boosting在算法上有什么区别？**

1. 串并行的差异：两种算法都是在多个分类器上的增强，但bagging是并行的多个分类器投票，另一个boosting是串行改变错分样本权重, 生成多个带不同权重的分类器。
而并行的好处是可以用分布式计算得到更高的训练效率，但串行由于后一分类器依赖前一分类器，所以无法做分布式训练。
不过在boost家族中，xgboost却是并行方式，所以也可以做分布式训练
  
2. 分类对象的差异：两种算法针对的分类场景区别：随机森林针对二分类和多分类，而ada boost只针对二分类。

3. 集成提升精度的逻辑差异： 
- 随机森林采用的子分类器本身不弱，目标是降低方差而获得更好精度；而ada boosting采用的分类器是弱分类器，目标是降低偏差来获得更好精度。

- 随机森林属于bagging的思想：分解数据集成多个子集，并行创建多个子分类器，然后用子分类器的预测结果进行汇总投票决定最终预测。
  随机森林的子分类器虽然不是弱分类器，但通过把子样本缩减样本数和特征数而影响树的分支方式，达到分离错分样本的目的。
  由于子分类器针对的是子样本，也就没有办法提取每个子样本针对总的样本的分类精度。
  
- ada boost属于boosting的思想：在整个数据集上，串行创建多个弱分类器，一方面定义出每个弱分类器自身的权重alpha，预测精度越高则权重越大；
  另一方面每个弱分类器也会串行更新训练样本的权重w，让每轮被错分的训练样本拥有更高的权重，从而造成下一轮这些错分样本因为权重被提高。
  而造成更高的误差(err=sum(w[y!=prediction]))，从而下一轮就会更倾向于找到对这些错分样本预测误差低的弱分类器。虽然每个弱分类器的平均
  误差不是逐步提高(案例中5个弱分类器acc分别是0.86,0.87,0.80,0.77,0.81), 但这些弱分类器会对不同的错分样本进行处置，也就是不同弱分类器
  会找到不同的强项，让不同错分样本被不同分类器解决掉，最后再让分类器权重来强化精度高的分类器，也就是多个弱分类器结果进行加权计算得到最终预测。
  也就保证最终的分类器精度超过每个弱分类器精度。如下是一组5个人弱分类器组合成强分类器ada boost的数据：
```
current CLF acc: 0.84270, current alpha: 0.84
current CLF acc: 0.82857, current alpha: 0.79
current CLF acc: 0.82882, current alpha: 0.79
current CLF acc: 0.79866, current alpha: 0.69
current CLF acc: 0.77491, current alpha: 0.62
Accuracy: 0.9101123595505618
```
- 两种算法对子分类器的性能要求不同：如果是用弱分类器作为子分类器做组合增强，优先采用ada boost方法；
  而如果采用相对强分类器做组合，则优先采用bagging即随机森林的方法，而通过特征弱化来达到分治错分样本。
  
- 基于不同的增强原理，两种分类器要求的子分类器个数也不同。
  比如随机森林是基于投票原则，需要更多的分类器才更有可能覆盖更多错分样本，一般在50-100个。
  而ada boost是基于不同弱分类器处理不同错分样本的原则，取决于弱分类器的分类效果，如果弱分类器都能达到0.7以上，那么可能5-10个就可以了，
  但如果弱分类器只能达到0.5多一点，那有可能需要100-200个。因为ada boost本质上相当于n个线性分类器的组合，如果分类对象不是很好的线性可分，
  那么自然需要更多的子分类器，比如moon数据集，线性可分性好一些，所以需要子分类器也就10-20个，而circle数据集，线性可分性基本不可能，则需要
  大概100-200个子分类器。

-------------------------------------------------------------------------------
## PART 10. gradient boost decision tree/gradient boost machine(gbdt/gbm) classifier
**Q. gbdt的算法描述？**
<br>首先需要理解boost方法和提升树算法：
- boost方法：就是用多个弱分类器，通过加法模型(也就是弱分类器的线性组合)组合成强分类器。
- 对boost方法的加法模型的求解，等价于损失函数极小化问题；
- 而boost方法采用了前向分布算法来求解损失函数极小化问题，也就是从第一个弱分类器开始，每一步只学习一个基函数和他的加权系数，
  然后学到最后一个弱分类器逐步逼近目标函数，也就是损失函数极小化。 
- 重点参考lihang书P148-p149的例子：残差的定义是真值与分割出来的子集中每个元素的差值，而每棵树就是在每个元素的残差基础上进行回归，
  得到残差平均值最小的分割方式，其中第一棵树分割时由于没有预测值，残差就是原数据，分割得到的平均值也就是原数据的方差最小的平均值，
  而后续每棵树就只是分割残差值得到残差值的平均值，最后所有分类树做加法(线性组合)，就相当于第一棵数的均值与后边每轮的残差进行相加，
  也就相当于反复调整均值的偏差，最后得到方差最小的均值也就是最后的强分类器了。
1. 先计算残差ri = yi - f(xi)，其中yi为真值，fm-1(xi)为第m-1个分类器的输出预测。当第m个分类器是第一个时，也就
   不用计算这个残差，因为ri = yi
2. 基于残差进行分类树的创建T(x)：也就是寻找方差最小的划分点，均值计算叶子节点的输出。
3. 计算强分类器的输出fm(x) = fm-1(x) + Tm(x)，其中fm-1为前一个强分类器，Tm(x)为当前第m个子分类树，fm为当前强分类器
4. 返回第一步，循环创建多个基于残差数据的子分类树，最后得到加法组合的强分类器fm(x) = sum(Tm(x))
<br>上面就是完整的提升树算法中回归树的创建过程，而具体到gbdt梯度提升分类树，重要的区别在第1步，
是采用分类损失函数交叉熵的梯度值的负数，作为残差值的近似值(如果是平方损失函数，则其负梯度就是残差，
而如果是其他损失函数比如熵，则其负梯度就是残差的近似)，来得到每一步的回归树。


**Q. 为什么gbdt分类算法要采用回归树作为基函数(子分类器)？**
1. 因为gbdt本质是对残差进行预测，即每一个分类器都是对前一分类器的结果的残差进行预测，最终是会把所有预测结果进行累加，
而这种累加是无法通过分类完成，因此gbdt的树都是回归树而不是分类树。
2. 无论是分类树还是回归树，本质上都是对训练数据的标签进行一个划分，分类树是通过majority_vote得到主要的标签，而回归树则是
通过mean_of_y求标签的平均值。所以gbdt采用回归树就能获得标签的平均值，再通过学习残差去获得这个预测平均值与真值的差异，并且由于
从回归得到的是具体的数值，也就可以通过加法模型把所有树的预测结果累加就得到最终最接近预测值的结果。这种累加如果换成分类树显然无法
实现。


**Q. 为什么gbdt中可以用负梯度来代替残差？**
<br>参考lihang书里P148, 如果是mse损失函数，则改写mse损失函数loss = (1/n)sum((y-y')^2)为loss = (1/n)sum((y - y'm-1 - T(x))^2),
也就是把预测值y'换成上一轮预测+本轮子树的输出，然后简化得loss = (1/n)sum((rm - T(x))^2)，从而loss求导的梯度

而如果是其他损失函数比如分类问题的经验熵，则这个梯度只是残差的近似值。

**Q. ada boost和gradient boost有什么联系和区别？**
1. 共同点：都是串行创建多个弱分类器，通过加法模型把弱分类器线性组合成强分类器
2. 差异点：
    - ada boost：创建分类树，串行改变错分样本权重，使
    - gradient boost: 创建回归树，串行学习残差，使损失函数最小化


-------------------------------------------------------------------------------
## PART 11. XGBoost Classifier
**Q. XGBoost的**
<br>核心公式参考：https://xgboost.readthedocs.io/en/latest/tutorials/model.html


**Q. 泰勒展开式**
<br>一阶导数是什么，是变化率是切线斜率。二阶导数是什么，是凹凸性。导数的导数的导数呢？
对于泰勒展开式来说，就是用一个新的多项式g(x)来代替f(x)，因为多项式g(x)比较好计算。但是如何保证g(x)=f(x)?
只要保证在某点x0下f(x0)与g(x0)的n阶导数的值相等，其中n等于1,2,3...n，则就能找到这样一个g(x).
例如：对于f(x)=cos(x),想用g(x)代替，则令g(x) = a0 + a1*x + a2*x^2 + a3*x^3 + ...为了求出a0,a1...an
可令x0=0，列出f'(0) = g'(0), f''(0) = g''(0), ...联立方程式，就可以解出a0,a1...an。
参考：http://www.dataguru.cn/article-13453-1.html
<br>结论是：
0. 泰勒展开式本质：是用多项式(x-x0)^k来代替复杂函数f(x)，因为多项式是我们比较容易处理的对象。每一项都是3部分组成：常数f''(x0),常数1/n!,变量(x-x0)^n
1. 泰勒展开的背后：n阶倒数相当于对函数曲线的形状的固化程度，阶数越高固定，固化程度越高，所以两个1阶导数相等，保证两者有1个点重合，
  两个2阶导数相等，保证两者有初始点和一段凹线相等，3阶则有更长一段相等...n阶导数相等则两个函数基本曲线重合

2. 泰勒展开式的写法：
  - f(x) = f(x0) + f'(x0)(x-x0)/1! + f''(x0)(x-x0)^2/2! + ....fn(x0)(x-x0)^n/n!, 这是从x0等于任何一点展开,fn表示f的n阶导数
  - f(x) = f(0) + f'(0)(x)/1! + f''(0)(x)/2! + ....fn(0)(x)/n!, 这是从x0=0处展开,fn表示f的n阶导数

3. 泰勒展开式的一个重要应用：
- 切线不等式exp(x) >= (x+1)，他可以用泰勒展开式证明，形象的几何意义是f(x)=exp(x)的切线是g(x)=x+1，所以f(x)的曲线都在g(x)上面,所以一定f(x)>g(x)
- 切线不等式x >= ln(x+1), 其形象的几何意义也是g(x)=x就是f(x)=ln(x+1)的切线，只不过这个切线是在上面，所以永远g(x)>f(x)


4. 用于xgboost的部分：是把f(xi)残差看成变量x, (yi,yi')看成x0，基于泰勒展开式
  把损失函数l(yi, yi'+f(xi))在已知点(yi,yi')展开为l(yi, yi') + l'*f(xi) + l''*f(xi)/2!
  从而目标函数obj = sum(l(yi, yi'+f(xi))) + 正则项, 变为obj = sum(l(yi, yi') + gi*f(xi) + 0.5*hi*f(xi)) + 正则项
  其中gi和hi就是损失函数l(yi, yi')的一阶l'和二阶导数l''，这两部分都是已知可算出来的。

<br>最终对xgboost公式的解读：
gain = 0.5*(Gl^2/(Hl)



**Q. Xgboost跟gbdt有什么区别？**




-------------------------------------------------------------------------------
## PART 1x. cnn
**Q. 卷积神经网络的算法过程**
<br>参考斯坦福计算机视觉课上有名的动图如下(该网页上动图可以暂停)：http://cs231n.github.io/convolutional-networks/
<div align=center><img src="https://github.com/ximitiejiang/machine_learning_algorithm/blob/master/demo/cnn.gif"/></div>


**Q. 用于卷积神经网络的参数优化的算法叫梯度下降算法，有哪些不同种类的梯度下降算法？**
1. 卷积神经网络的核心就是2个，第一定义损失函数来逐步缩小预测与真值的差距(前向)，第二定义梯度下降算法逐步更新模型参数(反向)
2. 


**Q. 什么是空洞卷积, 目的是什么？**
1. 空洞卷积也就是dilation conv，动态过程参考https://www.zhihu.com/question/54149221

2. 


**Q. 什么是batchnorm层，BN/LN/GN有什么区别？**
参考：https://blog.csdn.net/liuxiao214/article/details/81037416 (每种的代码都不多，很好理解)
1. 有个问题是：到底batchnorm在计算均值时，是以哪个轴为基础？是axis=0, 还是axis=(0,2,3)?


-------------------------------------------------------------------------------
## PART 1x. linear regressor/lasso regressor/rigid regressor
**Q. 线性回归算法过程**
1. 假定存在一个线性平面可以拟合出xi,yi，则首先定义以w0,w1..wn为参数的线性方程y' = wi*xi, 其中y'就是作为预测值。
然后以mse loss作为损失函数mse_loss = mean(0.5*(y' - y)^2)，也就是取所有点的距离之和的均值作为损失。
2. 计算损失函数的梯度grad = 
3. 更新参数w = w - lr*grad


-------------------------------------------------------------------------------
## PART 1x. polynomial regressor



-------------------------------------------------------------------------------
## PART 1x. CARTReg regressor


-------------------------------------------------------------------------------
## PART 1x. kmean


-------------------------------------------------------------------------------
## PART 1x. dbscan


-------------------------------------------------------------------------------
## PART 1x. PCA

**Q. PCA的作用和理论**
<br>PCA主成分分析，主要用来给特征降维，也就是找到方差最大的特征。
<br>PCA主成分分析过程:
1. 计算每一列的均值x1mean, x2mean, x3mean, x4mean...
2. 计算所有特征之间的协方差矩阵C(cov(X1,X1), cov(X1,X2), cov(X1,X3,...)。
```
C = (cov(X,X), cov(X,Y), cov(X,Z),
     cov(Y,X), cov(Y,Y), cov(Y,Z),
     cov(Z,X), cov(Z,Y), cov(Z,Z)) 
```
对于协方差矩阵种的值，也就是协方差值，如果值大于0，则两个特征正相关。如果值小于0，则两个特征负相关。如果值等于0，则两个特征相互独立

3. 计算该协方差矩阵的特征值和特征向量：有两种方法，一种是特征值分解协方差矩阵，另一种是奇异值分解协方差矩阵。
其中基于特征值分解协方差矩阵就是传统线性代数的知识()
4. 排序特征值，提取最大的k个特征值和特征向量。




