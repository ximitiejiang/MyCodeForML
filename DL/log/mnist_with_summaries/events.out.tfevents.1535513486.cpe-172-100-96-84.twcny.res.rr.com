       £K"	  АгДб÷Abrain.Event:2`ЕGпщ=     Эј	ЕгДб÷A"мы
P
PlaceholderPlaceholder*
shape:*
dtype0*
_output_shapes
:
R
Placeholder_1Placeholder*
dtype0*
_output_shapes
:*
shape:
]
random_normal/shapeConst*
valueB:*
dtype0*
_output_shapes
:
W
random_normal/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Y
random_normal/stddevConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Ъ
"random_normal/RandomStandardNormalRandomStandardNormalrandom_normal/shape*
T0*
dtype0*
_output_shapes
:*
seed2 *

seed 
w
random_normal/mulMul"random_normal/RandomStandardNormalrandom_normal/stddev*
_output_shapes
:*
T0
`
random_normalAddrandom_normal/mulrandom_normal/mean*
T0*
_output_shapes
:
r
weight
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
Ч
weight/AssignAssignweightrandom_normal*
use_locking(*
T0*
_class
loc:@weight*
validate_shape(*
_output_shapes
:
_
weight/readIdentityweight*
_output_shapes
:*
T0*
_class
loc:@weight
R
zerosConst*
dtype0*
_output_shapes
:*
valueB*    
p
bias
VariableV2*
shape:*
shared_name *
dtype0*
_output_shapes
:*
	container 
Й
bias/AssignAssignbiaszeros*
use_locking(*
T0*
_class
	loc:@bias*
validate_shape(*
_output_shapes
:
Y
	bias/readIdentitybias*
T0*
_class
	loc:@bias*
_output_shapes
:
G
MulMulPlaceholderweight/read*
T0*
_output_shapes
:
=
addAddMul	bias/read*
T0*
_output_shapes
:
A
subSubPlaceholder_1add*
T0*
_output_shapes
:
8
SquareSquaresub*
T0*
_output_shapes
:
5
RankRankSquare*
T0*
_output_shapes
: 
M
range/startConst*
value	B : *
dtype0*
_output_shapes
: 
M
range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
_
rangeRangerange/startRankrange/delta*#
_output_shapes
:€€€€€€€€€*

Tidx0
Y
MeanMeanSquarerange*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
R
gradients/ShapeConst*
dtype0*
_output_shapes
: *
valueB 
X
gradients/grad_ys_0Const*
dtype0*
_output_shapes
: *
valueB
 *  А?
o
gradients/FillFillgradients/Shapegradients/grad_ys_0*
T0*

index_type0*
_output_shapes
: 
h
gradients/Mean_grad/ShapeShapeSquare*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
Ъ
gradients/Mean_grad/SizeSizegradients/Mean_grad/Shape*
_output_shapes
: *
T0*,
_class"
 loc:@gradients/Mean_grad/Shape*
out_type0
Ы
gradients/Mean_grad/addAddrangegradients/Mean_grad/Size*
T0*,
_class"
 loc:@gradients/Mean_grad/Shape*#
_output_shapes
:€€€€€€€€€
≤
gradients/Mean_grad/modFloorModgradients/Mean_grad/addgradients/Mean_grad/Size*
T0*,
_class"
 loc:@gradients/Mean_grad/Shape*#
_output_shapes
:€€€€€€€€€
†
gradients/Mean_grad/Shape_1Shapegradients/Mean_grad/mod*
T0*,
_class"
 loc:@gradients/Mean_grad/Shape*
out_type0*
_output_shapes
:
П
gradients/Mean_grad/range/startConst*
dtype0*
_output_shapes
: *,
_class"
 loc:@gradients/Mean_grad/Shape*
value	B : 
П
gradients/Mean_grad/range/deltaConst*,
_class"
 loc:@gradients/Mean_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
Ё
gradients/Mean_grad/rangeRangegradients/Mean_grad/range/startgradients/Mean_grad/Sizegradients/Mean_grad/range/delta*,
_class"
 loc:@gradients/Mean_grad/Shape*#
_output_shapes
:€€€€€€€€€*

Tidx0
О
gradients/Mean_grad/Fill/valueConst*,
_class"
 loc:@gradients/Mean_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
Ћ
gradients/Mean_grad/FillFillgradients/Mean_grad/Shape_1gradients/Mean_grad/Fill/value*
T0*,
_class"
 loc:@gradients/Mean_grad/Shape*

index_type0*#
_output_shapes
:€€€€€€€€€
А
!gradients/Mean_grad/DynamicStitchDynamicStitchgradients/Mean_grad/rangegradients/Mean_grad/modgradients/Mean_grad/Shapegradients/Mean_grad/Fill*
T0*,
_class"
 loc:@gradients/Mean_grad/Shape*
N*#
_output_shapes
:€€€€€€€€€
Н
gradients/Mean_grad/Maximum/yConst*
dtype0*
_output_shapes
: *,
_class"
 loc:@gradients/Mean_grad/Shape*
value	B :
ƒ
gradients/Mean_grad/MaximumMaximum!gradients/Mean_grad/DynamicStitchgradients/Mean_grad/Maximum/y*
T0*,
_class"
 loc:@gradients/Mean_grad/Shape*#
_output_shapes
:€€€€€€€€€
Љ
gradients/Mean_grad/floordivFloorDivgradients/Mean_grad/Shapegradients/Mean_grad/Maximum*
T0*,
_class"
 loc:@gradients/Mean_grad/Shape*#
_output_shapes
:€€€€€€€€€
К
gradients/Mean_grad/ReshapeReshapegradients/Fill!gradients/Mean_grad/DynamicStitch*
T0*
Tshape0*
_output_shapes
:
Р
gradients/Mean_grad/TileTilegradients/Mean_grad/Reshapegradients/Mean_grad/floordiv*
_output_shapes
:*

Tmultiples0*
T0
j
gradients/Mean_grad/Shape_2ShapeSquare*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
^
gradients/Mean_grad/Shape_3Const*
valueB *
dtype0*
_output_shapes
: 
c
gradients/Mean_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:
Ц
gradients/Mean_grad/ProdProdgradients/Mean_grad/Shape_2gradients/Mean_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
e
gradients/Mean_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
Ъ
gradients/Mean_grad/Prod_1Prodgradients/Mean_grad/Shape_3gradients/Mean_grad/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
a
gradients/Mean_grad/Maximum_1/yConst*
value	B :*
dtype0*
_output_shapes
: 
Ж
gradients/Mean_grad/Maximum_1Maximumgradients/Mean_grad/Prod_1gradients/Mean_grad/Maximum_1/y*
_output_shapes
: *
T0
Д
gradients/Mean_grad/floordiv_1FloorDivgradients/Mean_grad/Prodgradients/Mean_grad/Maximum_1*
T0*
_output_shapes
: 
p
gradients/Mean_grad/CastCastgradients/Mean_grad/floordiv_1*

SrcT0*
_output_shapes
: *

DstT0
}
gradients/Mean_grad/truedivRealDivgradients/Mean_grad/Tilegradients/Mean_grad/Cast*
T0*
_output_shapes
:
~
gradients/Square_grad/ConstConst^gradients/Mean_grad/truediv*
valueB
 *   @*
dtype0*
_output_shapes
: 
e
gradients/Square_grad/MulMulsubgradients/Square_grad/Const*
T0*
_output_shapes
:
}
gradients/Square_grad/Mul_1Mulgradients/Mean_grad/truedivgradients/Square_grad/Mul*
T0*
_output_shapes
:
n
gradients/sub_grad/ShapeShapePlaceholder_1*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
f
gradients/sub_grad/Shape_1Shapeadd*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
і
(gradients/sub_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_grad/Shapegradients/sub_grad/Shape_1*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€*
T0
§
gradients/sub_grad/SumSumgradients/Square_grad/Mul_1(gradients/sub_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
И
gradients/sub_grad/ReshapeReshapegradients/sub_grad/Sumgradients/sub_grad/Shape*
T0*
Tshape0*
_output_shapes
:
®
gradients/sub_grad/Sum_1Sumgradients/Square_grad/Mul_1*gradients/sub_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Z
gradients/sub_grad/NegNeggradients/sub_grad/Sum_1*
T0*
_output_shapes
:
М
gradients/sub_grad/Reshape_1Reshapegradients/sub_grad/Neggradients/sub_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
g
#gradients/sub_grad/tuple/group_depsNoOp^gradients/sub_grad/Reshape^gradients/sub_grad/Reshape_1
Ћ
+gradients/sub_grad/tuple/control_dependencyIdentitygradients/sub_grad/Reshape$^gradients/sub_grad/tuple/group_deps*
_output_shapes
:*
T0*-
_class#
!loc:@gradients/sub_grad/Reshape
—
-gradients/sub_grad/tuple/control_dependency_1Identitygradients/sub_grad/Reshape_1$^gradients/sub_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/sub_grad/Reshape_1*
_output_shapes
:
d
gradients/add_grad/ShapeShapeMul*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
d
gradients/add_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
і
(gradients/add_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_grad/Shapegradients/add_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
ґ
gradients/add_grad/SumSum-gradients/sub_grad/tuple/control_dependency_1(gradients/add_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
И
gradients/add_grad/ReshapeReshapegradients/add_grad/Sumgradients/add_grad/Shape*
T0*
Tshape0*
_output_shapes
:
Ї
gradients/add_grad/Sum_1Sum-gradients/sub_grad/tuple/control_dependency_1*gradients/add_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Р
gradients/add_grad/Reshape_1Reshapegradients/add_grad/Sum_1gradients/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
g
#gradients/add_grad/tuple/group_depsNoOp^gradients/add_grad/Reshape^gradients/add_grad/Reshape_1
Ћ
+gradients/add_grad/tuple/control_dependencyIdentitygradients/add_grad/Reshape$^gradients/add_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/add_grad/Reshape*
_output_shapes
:
”
-gradients/add_grad/tuple/control_dependency_1Identitygradients/add_grad/Reshape_1$^gradients/add_grad/tuple/group_deps*
_output_shapes
:*
T0*/
_class%
#!loc:@gradients/add_grad/Reshape_1
l
gradients/Mul_grad/ShapeShapePlaceholder*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
d
gradients/Mul_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
і
(gradients/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/Mul_grad/Shapegradients/Mul_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
z
gradients/Mul_grad/MulMul+gradients/add_grad/tuple/control_dependencyweight/read*
T0*
_output_shapes
:
Я
gradients/Mul_grad/SumSumgradients/Mul_grad/Mul(gradients/Mul_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
И
gradients/Mul_grad/ReshapeReshapegradients/Mul_grad/Sumgradients/Mul_grad/Shape*
T0*
Tshape0*
_output_shapes
:
|
gradients/Mul_grad/Mul_1MulPlaceholder+gradients/add_grad/tuple/control_dependency*
T0*
_output_shapes
:
•
gradients/Mul_grad/Sum_1Sumgradients/Mul_grad/Mul_1*gradients/Mul_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Р
gradients/Mul_grad/Reshape_1Reshapegradients/Mul_grad/Sum_1gradients/Mul_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
g
#gradients/Mul_grad/tuple/group_depsNoOp^gradients/Mul_grad/Reshape^gradients/Mul_grad/Reshape_1
Ћ
+gradients/Mul_grad/tuple/control_dependencyIdentitygradients/Mul_grad/Reshape$^gradients/Mul_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/Mul_grad/Reshape*
_output_shapes
:
”
-gradients/Mul_grad/tuple/control_dependency_1Identitygradients/Mul_grad/Reshape_1$^gradients/Mul_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/Mul_grad/Reshape_1*
_output_shapes
:
b
GradientDescent/learning_rateConst*
valueB
 *
„#<*
dtype0*
_output_shapes
: 
у
2GradientDescent/update_weight/ApplyGradientDescentApplyGradientDescentweightGradientDescent/learning_rate-gradients/Mul_grad/tuple/control_dependency_1*
_output_shapes
:*
use_locking( *
T0*
_class
loc:@weight
н
0GradientDescent/update_bias/ApplyGradientDescentApplyGradientDescentbiasGradientDescent/learning_rate-gradients/add_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
	loc:@bias*
_output_shapes
:

GradientDescentNoOp1^GradientDescent/update_bias/ApplyGradientDescent3^GradientDescent/update_weight/ApplyGradientDescent
*
initNoOp^bias/Assign^weight/Assign
R
Placeholder_2Placeholder*
shape:*
dtype0*
_output_shapes
:
R
Placeholder_3Placeholder*
dtype0*
_output_shapes
:*
shape:
_
random_normal_1/shapeConst*
valueB:*
dtype0*
_output_shapes
:
Y
random_normal_1/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
random_normal_1/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *  А?
Ю
$random_normal_1/RandomStandardNormalRandomStandardNormalrandom_normal_1/shape*
T0*
dtype0*
_output_shapes
:*
seed2 *

seed 
}
random_normal_1/mulMul$random_normal_1/RandomStandardNormalrandom_normal_1/stddev*
T0*
_output_shapes
:
f
random_normal_1Addrandom_normal_1/mulrandom_normal_1/mean*
T0*
_output_shapes
:
t
weight_1
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
Я
weight_1/AssignAssignweight_1random_normal_1*
use_locking(*
T0*
_class
loc:@weight_1*
validate_shape(*
_output_shapes
:
e
weight_1/readIdentityweight_1*
T0*
_class
loc:@weight_1*
_output_shapes
:
T
zeros_1Const*
valueB*    *
dtype0*
_output_shapes
:
r
bias_1
VariableV2*
shared_name *
dtype0*
_output_shapes
:*
	container *
shape:
С
bias_1/AssignAssignbias_1zeros_1*
use_locking(*
T0*
_class
loc:@bias_1*
validate_shape(*
_output_shapes
:
_
bias_1/readIdentitybias_1*
T0*
_class
loc:@bias_1*
_output_shapes
:
M
Mul_1MulPlaceholder_2weight_1/read*
T0*
_output_shapes
:
C
add_1AddMul_1bias_1/read*
T0*
_output_shapes
:
E
sub_1SubPlaceholder_3add_1*
T0*
_output_shapes
:
<
Square_1Squaresub_1*
T0*
_output_shapes
:
9
Rank_1RankSquare_1*
_output_shapes
: *
T0
O
range_1/startConst*
dtype0*
_output_shapes
: *
value	B : 
O
range_1/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
g
range_1Rangerange_1/startRank_1range_1/delta*#
_output_shapes
:€€€€€€€€€*

Tidx0
_
Mean_1MeanSquare_1range_1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
T
gradients_1/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
Z
gradients_1/grad_ys_0Const*
valueB
 *  А?*
dtype0*
_output_shapes
: 
u
gradients_1/FillFillgradients_1/Shapegradients_1/grad_ys_0*
T0*

index_type0*
_output_shapes
: 
n
gradients_1/Mean_1_grad/ShapeShapeSquare_1*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
¶
gradients_1/Mean_1_grad/SizeSizegradients_1/Mean_1_grad/Shape*
_output_shapes
: *
T0*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*
out_type0
©
gradients_1/Mean_1_grad/addAddrange_1gradients_1/Mean_1_grad/Size*
T0*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*#
_output_shapes
:€€€€€€€€€
¬
gradients_1/Mean_1_grad/modFloorModgradients_1/Mean_1_grad/addgradients_1/Mean_1_grad/Size*
T0*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*#
_output_shapes
:€€€€€€€€€
ђ
gradients_1/Mean_1_grad/Shape_1Shapegradients_1/Mean_1_grad/mod*
T0*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*
out_type0*
_output_shapes
:
Ч
#gradients_1/Mean_1_grad/range/startConst*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*
value	B : *
dtype0*
_output_shapes
: 
Ч
#gradients_1/Mean_1_grad/range/deltaConst*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
с
gradients_1/Mean_1_grad/rangeRange#gradients_1/Mean_1_grad/range/startgradients_1/Mean_1_grad/Size#gradients_1/Mean_1_grad/range/delta*#
_output_shapes
:€€€€€€€€€*

Tidx0*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape
Ц
"gradients_1/Mean_1_grad/Fill/valueConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*
value	B :
џ
gradients_1/Mean_1_grad/FillFillgradients_1/Mean_1_grad/Shape_1"gradients_1/Mean_1_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*

index_type0*#
_output_shapes
:€€€€€€€€€
Ш
%gradients_1/Mean_1_grad/DynamicStitchDynamicStitchgradients_1/Mean_1_grad/rangegradients_1/Mean_1_grad/modgradients_1/Mean_1_grad/Shapegradients_1/Mean_1_grad/Fill*
T0*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*
N*#
_output_shapes
:€€€€€€€€€
Х
!gradients_1/Mean_1_grad/Maximum/yConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*
value	B :
‘
gradients_1/Mean_1_grad/MaximumMaximum%gradients_1/Mean_1_grad/DynamicStitch!gradients_1/Mean_1_grad/Maximum/y*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape
ћ
 gradients_1/Mean_1_grad/floordivFloorDivgradients_1/Mean_1_grad/Shapegradients_1/Mean_1_grad/Maximum*
T0*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ф
gradients_1/Mean_1_grad/ReshapeReshapegradients_1/Fill%gradients_1/Mean_1_grad/DynamicStitch*
T0*
Tshape0*
_output_shapes
:
Ь
gradients_1/Mean_1_grad/TileTilegradients_1/Mean_1_grad/Reshape gradients_1/Mean_1_grad/floordiv*

Tmultiples0*
T0*
_output_shapes
:
p
gradients_1/Mean_1_grad/Shape_2ShapeSquare_1*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
b
gradients_1/Mean_1_grad/Shape_3Const*
dtype0*
_output_shapes
: *
valueB 
g
gradients_1/Mean_1_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:
Ґ
gradients_1/Mean_1_grad/ProdProdgradients_1/Mean_1_grad/Shape_2gradients_1/Mean_1_grad/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
i
gradients_1/Mean_1_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
¶
gradients_1/Mean_1_grad/Prod_1Prodgradients_1/Mean_1_grad/Shape_3gradients_1/Mean_1_grad/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
e
#gradients_1/Mean_1_grad/Maximum_1/yConst*
value	B :*
dtype0*
_output_shapes
: 
Т
!gradients_1/Mean_1_grad/Maximum_1Maximumgradients_1/Mean_1_grad/Prod_1#gradients_1/Mean_1_grad/Maximum_1/y*
T0*
_output_shapes
: 
Р
"gradients_1/Mean_1_grad/floordiv_1FloorDivgradients_1/Mean_1_grad/Prod!gradients_1/Mean_1_grad/Maximum_1*
_output_shapes
: *
T0
x
gradients_1/Mean_1_grad/CastCast"gradients_1/Mean_1_grad/floordiv_1*

SrcT0*
_output_shapes
: *

DstT0
Й
gradients_1/Mean_1_grad/truedivRealDivgradients_1/Mean_1_grad/Tilegradients_1/Mean_1_grad/Cast*
T0*
_output_shapes
:
Ж
gradients_1/Square_1_grad/ConstConst ^gradients_1/Mean_1_grad/truediv*
valueB
 *   @*
dtype0*
_output_shapes
: 
o
gradients_1/Square_1_grad/MulMulsub_1gradients_1/Square_1_grad/Const*
T0*
_output_shapes
:
Й
gradients_1/Square_1_grad/Mul_1Mulgradients_1/Mean_1_grad/truedivgradients_1/Square_1_grad/Mul*
_output_shapes
:*
T0
r
gradients_1/sub_1_grad/ShapeShapePlaceholder_3*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
l
gradients_1/sub_1_grad/Shape_1Shapeadd_1*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
ј
,gradients_1/sub_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/sub_1_grad/Shapegradients_1/sub_1_grad/Shape_1*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€*
T0
∞
gradients_1/sub_1_grad/SumSumgradients_1/Square_1_grad/Mul_1,gradients_1/sub_1_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ф
gradients_1/sub_1_grad/ReshapeReshapegradients_1/sub_1_grad/Sumgradients_1/sub_1_grad/Shape*
T0*
Tshape0*
_output_shapes
:
і
gradients_1/sub_1_grad/Sum_1Sumgradients_1/Square_1_grad/Mul_1.gradients_1/sub_1_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
b
gradients_1/sub_1_grad/NegNeggradients_1/sub_1_grad/Sum_1*
_output_shapes
:*
T0
Ш
 gradients_1/sub_1_grad/Reshape_1Reshapegradients_1/sub_1_grad/Neggradients_1/sub_1_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
s
'gradients_1/sub_1_grad/tuple/group_depsNoOp^gradients_1/sub_1_grad/Reshape!^gradients_1/sub_1_grad/Reshape_1
џ
/gradients_1/sub_1_grad/tuple/control_dependencyIdentitygradients_1/sub_1_grad/Reshape(^gradients_1/sub_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/sub_1_grad/Reshape*
_output_shapes
:
б
1gradients_1/sub_1_grad/tuple/control_dependency_1Identity gradients_1/sub_1_grad/Reshape_1(^gradients_1/sub_1_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/sub_1_grad/Reshape_1*
_output_shapes
:
j
gradients_1/add_1_grad/ShapeShapeMul_1*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_1/add_1_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_1/add_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/add_1_grad/Shapegradients_1/add_1_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
¬
gradients_1/add_1_grad/SumSum1gradients_1/sub_1_grad/tuple/control_dependency_1,gradients_1/add_1_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ф
gradients_1/add_1_grad/ReshapeReshapegradients_1/add_1_grad/Sumgradients_1/add_1_grad/Shape*
T0*
Tshape0*
_output_shapes
:
∆
gradients_1/add_1_grad/Sum_1Sum1gradients_1/sub_1_grad/tuple/control_dependency_1.gradients_1/add_1_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ь
 gradients_1/add_1_grad/Reshape_1Reshapegradients_1/add_1_grad/Sum_1gradients_1/add_1_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_1/add_1_grad/tuple/group_depsNoOp^gradients_1/add_1_grad/Reshape!^gradients_1/add_1_grad/Reshape_1
џ
/gradients_1/add_1_grad/tuple/control_dependencyIdentitygradients_1/add_1_grad/Reshape(^gradients_1/add_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/add_1_grad/Reshape*
_output_shapes
:
г
1gradients_1/add_1_grad/tuple/control_dependency_1Identity gradients_1/add_1_grad/Reshape_1(^gradients_1/add_1_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/add_1_grad/Reshape_1*
_output_shapes
:
r
gradients_1/Mul_1_grad/ShapeShapePlaceholder_2*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_1/Mul_1_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_1/Mul_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/Mul_1_grad/Shapegradients_1/Mul_1_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Д
gradients_1/Mul_1_grad/MulMul/gradients_1/add_1_grad/tuple/control_dependencyweight_1/read*
T0*
_output_shapes
:
Ђ
gradients_1/Mul_1_grad/SumSumgradients_1/Mul_1_grad/Mul,gradients_1/Mul_1_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_1/Mul_1_grad/ReshapeReshapegradients_1/Mul_1_grad/Sumgradients_1/Mul_1_grad/Shape*
T0*
Tshape0*
_output_shapes
:
Ж
gradients_1/Mul_1_grad/Mul_1MulPlaceholder_2/gradients_1/add_1_grad/tuple/control_dependency*
T0*
_output_shapes
:
±
gradients_1/Mul_1_grad/Sum_1Sumgradients_1/Mul_1_grad/Mul_1.gradients_1/Mul_1_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ь
 gradients_1/Mul_1_grad/Reshape_1Reshapegradients_1/Mul_1_grad/Sum_1gradients_1/Mul_1_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
s
'gradients_1/Mul_1_grad/tuple/group_depsNoOp^gradients_1/Mul_1_grad/Reshape!^gradients_1/Mul_1_grad/Reshape_1
џ
/gradients_1/Mul_1_grad/tuple/control_dependencyIdentitygradients_1/Mul_1_grad/Reshape(^gradients_1/Mul_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/Mul_1_grad/Reshape*
_output_shapes
:
г
1gradients_1/Mul_1_grad/tuple/control_dependency_1Identity gradients_1/Mul_1_grad/Reshape_1(^gradients_1/Mul_1_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/Mul_1_grad/Reshape_1*
_output_shapes
:
d
GradientDescent_1/learning_rateConst*
valueB
 *
„#<*
dtype0*
_output_shapes
: 
Б
6GradientDescent_1/update_weight_1/ApplyGradientDescentApplyGradientDescentweight_1GradientDescent_1/learning_rate1gradients_1/Mul_1_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@weight_1*
_output_shapes
:
ы
4GradientDescent_1/update_bias_1/ApplyGradientDescentApplyGradientDescentbias_1GradientDescent_1/learning_rate1gradients_1/add_1_grad/tuple/control_dependency_1*
T0*
_class
loc:@bias_1*
_output_shapes
:*
use_locking( 
Й
GradientDescent_1NoOp5^GradientDescent_1/update_bias_1/ApplyGradientDescent7^GradientDescent_1/update_weight_1/ApplyGradientDescent
N
init_1NoOp^bias/Assign^bias_1/Assign^weight/Assign^weight_1/Assign
R
Placeholder_4Placeholder*
shape:*
dtype0*
_output_shapes
:
R
Placeholder_5Placeholder*
dtype0*
_output_shapes
:*
shape:
_
random_normal_2/shapeConst*
dtype0*
_output_shapes
:*
valueB:
Y
random_normal_2/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
random_normal_2/stddevConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Ю
$random_normal_2/RandomStandardNormalRandomStandardNormalrandom_normal_2/shape*
dtype0*
_output_shapes
:*
seed2 *

seed *
T0
}
random_normal_2/mulMul$random_normal_2/RandomStandardNormalrandom_normal_2/stddev*
_output_shapes
:*
T0
f
random_normal_2Addrandom_normal_2/mulrandom_normal_2/mean*
T0*
_output_shapes
:
t
weight_2
VariableV2*
shape:*
shared_name *
dtype0*
_output_shapes
:*
	container 
Я
weight_2/AssignAssignweight_2random_normal_2*
use_locking(*
T0*
_class
loc:@weight_2*
validate_shape(*
_output_shapes
:
e
weight_2/readIdentityweight_2*
T0*
_class
loc:@weight_2*
_output_shapes
:
T
zeros_2Const*
valueB*    *
dtype0*
_output_shapes
:
r
bias_2
VariableV2*
shared_name *
dtype0*
_output_shapes
:*
	container *
shape:
С
bias_2/AssignAssignbias_2zeros_2*
use_locking(*
T0*
_class
loc:@bias_2*
validate_shape(*
_output_shapes
:
_
bias_2/readIdentitybias_2*
_output_shapes
:*
T0*
_class
loc:@bias_2
M
Mul_2MulPlaceholder_4weight_2/read*
_output_shapes
:*
T0
C
add_2AddMul_2bias_2/read*
T0*
_output_shapes
:
E
sub_2SubPlaceholder_5add_2*
_output_shapes
:*
T0
<
Square_2Squaresub_2*
T0*
_output_shapes
:
9
Rank_2RankSquare_2*
T0*
_output_shapes
: 
O
range_2/startConst*
value	B : *
dtype0*
_output_shapes
: 
O
range_2/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
g
range_2Rangerange_2/startRank_2range_2/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
_
Mean_2MeanSquare_2range_2*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
T
gradients_2/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
Z
gradients_2/grad_ys_0Const*
valueB
 *  А?*
dtype0*
_output_shapes
: 
u
gradients_2/FillFillgradients_2/Shapegradients_2/grad_ys_0*
T0*

index_type0*
_output_shapes
: 
n
gradients_2/Mean_2_grad/ShapeShapeSquare_2*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
¶
gradients_2/Mean_2_grad/SizeSizegradients_2/Mean_2_grad/Shape*
_output_shapes
: *
T0*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*
out_type0
©
gradients_2/Mean_2_grad/addAddrange_2gradients_2/Mean_2_grad/Size*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape
¬
gradients_2/Mean_2_grad/modFloorModgradients_2/Mean_2_grad/addgradients_2/Mean_2_grad/Size*
T0*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*#
_output_shapes
:€€€€€€€€€
ђ
gradients_2/Mean_2_grad/Shape_1Shapegradients_2/Mean_2_grad/mod*
T0*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*
out_type0*
_output_shapes
:
Ч
#gradients_2/Mean_2_grad/range/startConst*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*
value	B : *
dtype0*
_output_shapes
: 
Ч
#gradients_2/Mean_2_grad/range/deltaConst*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
с
gradients_2/Mean_2_grad/rangeRange#gradients_2/Mean_2_grad/range/startgradients_2/Mean_2_grad/Size#gradients_2/Mean_2_grad/range/delta*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*#
_output_shapes
:€€€€€€€€€*

Tidx0
Ц
"gradients_2/Mean_2_grad/Fill/valueConst*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
џ
gradients_2/Mean_2_grad/FillFillgradients_2/Mean_2_grad/Shape_1"gradients_2/Mean_2_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*

index_type0*#
_output_shapes
:€€€€€€€€€
Ш
%gradients_2/Mean_2_grad/DynamicStitchDynamicStitchgradients_2/Mean_2_grad/rangegradients_2/Mean_2_grad/modgradients_2/Mean_2_grad/Shapegradients_2/Mean_2_grad/Fill*
T0*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*
N*#
_output_shapes
:€€€€€€€€€
Х
!gradients_2/Mean_2_grad/Maximum/yConst*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
‘
gradients_2/Mean_2_grad/MaximumMaximum%gradients_2/Mean_2_grad/DynamicStitch!gradients_2/Mean_2_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*#
_output_shapes
:€€€€€€€€€
ћ
 gradients_2/Mean_2_grad/floordivFloorDivgradients_2/Mean_2_grad/Shapegradients_2/Mean_2_grad/Maximum*
T0*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ф
gradients_2/Mean_2_grad/ReshapeReshapegradients_2/Fill%gradients_2/Mean_2_grad/DynamicStitch*
_output_shapes
:*
T0*
Tshape0
Ь
gradients_2/Mean_2_grad/TileTilegradients_2/Mean_2_grad/Reshape gradients_2/Mean_2_grad/floordiv*
T0*
_output_shapes
:*

Tmultiples0
p
gradients_2/Mean_2_grad/Shape_2ShapeSquare_2*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
b
gradients_2/Mean_2_grad/Shape_3Const*
valueB *
dtype0*
_output_shapes
: 
g
gradients_2/Mean_2_grad/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
Ґ
gradients_2/Mean_2_grad/ProdProdgradients_2/Mean_2_grad/Shape_2gradients_2/Mean_2_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
i
gradients_2/Mean_2_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
¶
gradients_2/Mean_2_grad/Prod_1Prodgradients_2/Mean_2_grad/Shape_3gradients_2/Mean_2_grad/Const_1*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
e
#gradients_2/Mean_2_grad/Maximum_1/yConst*
value	B :*
dtype0*
_output_shapes
: 
Т
!gradients_2/Mean_2_grad/Maximum_1Maximumgradients_2/Mean_2_grad/Prod_1#gradients_2/Mean_2_grad/Maximum_1/y*
_output_shapes
: *
T0
Р
"gradients_2/Mean_2_grad/floordiv_1FloorDivgradients_2/Mean_2_grad/Prod!gradients_2/Mean_2_grad/Maximum_1*
T0*
_output_shapes
: 
x
gradients_2/Mean_2_grad/CastCast"gradients_2/Mean_2_grad/floordiv_1*

SrcT0*
_output_shapes
: *

DstT0
Й
gradients_2/Mean_2_grad/truedivRealDivgradients_2/Mean_2_grad/Tilegradients_2/Mean_2_grad/Cast*
_output_shapes
:*
T0
Ж
gradients_2/Square_2_grad/ConstConst ^gradients_2/Mean_2_grad/truediv*
valueB
 *   @*
dtype0*
_output_shapes
: 
o
gradients_2/Square_2_grad/MulMulsub_2gradients_2/Square_2_grad/Const*
T0*
_output_shapes
:
Й
gradients_2/Square_2_grad/Mul_1Mulgradients_2/Mean_2_grad/truedivgradients_2/Square_2_grad/Mul*
T0*
_output_shapes
:
r
gradients_2/sub_2_grad/ShapeShapePlaceholder_5*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
l
gradients_2/sub_2_grad/Shape_1Shapeadd_2*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
ј
,gradients_2/sub_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/sub_2_grad/Shapegradients_2/sub_2_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
∞
gradients_2/sub_2_grad/SumSumgradients_2/Square_2_grad/Mul_1,gradients_2/sub_2_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_2/sub_2_grad/ReshapeReshapegradients_2/sub_2_grad/Sumgradients_2/sub_2_grad/Shape*
T0*
Tshape0*
_output_shapes
:
і
gradients_2/sub_2_grad/Sum_1Sumgradients_2/Square_2_grad/Mul_1.gradients_2/sub_2_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
b
gradients_2/sub_2_grad/NegNeggradients_2/sub_2_grad/Sum_1*
_output_shapes
:*
T0
Ш
 gradients_2/sub_2_grad/Reshape_1Reshapegradients_2/sub_2_grad/Neggradients_2/sub_2_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_2/sub_2_grad/tuple/group_depsNoOp^gradients_2/sub_2_grad/Reshape!^gradients_2/sub_2_grad/Reshape_1
џ
/gradients_2/sub_2_grad/tuple/control_dependencyIdentitygradients_2/sub_2_grad/Reshape(^gradients_2/sub_2_grad/tuple/group_deps*
_output_shapes
:*
T0*1
_class'
%#loc:@gradients_2/sub_2_grad/Reshape
б
1gradients_2/sub_2_grad/tuple/control_dependency_1Identity gradients_2/sub_2_grad/Reshape_1(^gradients_2/sub_2_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_2/sub_2_grad/Reshape_1*
_output_shapes
:
j
gradients_2/add_2_grad/ShapeShapeMul_2*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
h
gradients_2/add_2_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_2/add_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/add_2_grad/Shapegradients_2/add_2_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
¬
gradients_2/add_2_grad/SumSum1gradients_2/sub_2_grad/tuple/control_dependency_1,gradients_2/add_2_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_2/add_2_grad/ReshapeReshapegradients_2/add_2_grad/Sumgradients_2/add_2_grad/Shape*
T0*
Tshape0*
_output_shapes
:
∆
gradients_2/add_2_grad/Sum_1Sum1gradients_2/sub_2_grad/tuple/control_dependency_1.gradients_2/add_2_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ь
 gradients_2/add_2_grad/Reshape_1Reshapegradients_2/add_2_grad/Sum_1gradients_2/add_2_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
s
'gradients_2/add_2_grad/tuple/group_depsNoOp^gradients_2/add_2_grad/Reshape!^gradients_2/add_2_grad/Reshape_1
џ
/gradients_2/add_2_grad/tuple/control_dependencyIdentitygradients_2/add_2_grad/Reshape(^gradients_2/add_2_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_2/add_2_grad/Reshape*
_output_shapes
:
г
1gradients_2/add_2_grad/tuple/control_dependency_1Identity gradients_2/add_2_grad/Reshape_1(^gradients_2/add_2_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_2/add_2_grad/Reshape_1*
_output_shapes
:
r
gradients_2/Mul_2_grad/ShapeShapePlaceholder_4*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_2/Mul_2_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_2/Mul_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/Mul_2_grad/Shapegradients_2/Mul_2_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Д
gradients_2/Mul_2_grad/MulMul/gradients_2/add_2_grad/tuple/control_dependencyweight_2/read*
T0*
_output_shapes
:
Ђ
gradients_2/Mul_2_grad/SumSumgradients_2/Mul_2_grad/Mul,gradients_2/Mul_2_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ф
gradients_2/Mul_2_grad/ReshapeReshapegradients_2/Mul_2_grad/Sumgradients_2/Mul_2_grad/Shape*
T0*
Tshape0*
_output_shapes
:
Ж
gradients_2/Mul_2_grad/Mul_1MulPlaceholder_4/gradients_2/add_2_grad/tuple/control_dependency*
T0*
_output_shapes
:
±
gradients_2/Mul_2_grad/Sum_1Sumgradients_2/Mul_2_grad/Mul_1.gradients_2/Mul_2_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ь
 gradients_2/Mul_2_grad/Reshape_1Reshapegradients_2/Mul_2_grad/Sum_1gradients_2/Mul_2_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
s
'gradients_2/Mul_2_grad/tuple/group_depsNoOp^gradients_2/Mul_2_grad/Reshape!^gradients_2/Mul_2_grad/Reshape_1
џ
/gradients_2/Mul_2_grad/tuple/control_dependencyIdentitygradients_2/Mul_2_grad/Reshape(^gradients_2/Mul_2_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_2/Mul_2_grad/Reshape*
_output_shapes
:
г
1gradients_2/Mul_2_grad/tuple/control_dependency_1Identity gradients_2/Mul_2_grad/Reshape_1(^gradients_2/Mul_2_grad/tuple/group_deps*
_output_shapes
:*
T0*3
_class)
'%loc:@gradients_2/Mul_2_grad/Reshape_1
d
GradientDescent_2/learning_rateConst*
valueB
 *
„#<*
dtype0*
_output_shapes
: 
Б
6GradientDescent_2/update_weight_2/ApplyGradientDescentApplyGradientDescentweight_2GradientDescent_2/learning_rate1gradients_2/Mul_2_grad/tuple/control_dependency_1*
_output_shapes
:*
use_locking( *
T0*
_class
loc:@weight_2
ы
4GradientDescent_2/update_bias_2/ApplyGradientDescentApplyGradientDescentbias_2GradientDescent_2/learning_rate1gradients_2/add_2_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@bias_2*
_output_shapes
:
Й
GradientDescent_2NoOp5^GradientDescent_2/update_bias_2/ApplyGradientDescent7^GradientDescent_2/update_weight_2/ApplyGradientDescent
p
init_2NoOp^bias/Assign^bias_1/Assign^bias_2/Assign^weight/Assign^weight_1/Assign^weight_2/Assign
R
Placeholder_6Placeholder*
dtype0*
_output_shapes
:*
shape:
R
Placeholder_7Placeholder*
dtype0*
_output_shapes
:*
shape:
_
random_normal_3/shapeConst*
dtype0*
_output_shapes
:*
valueB:
Y
random_normal_3/meanConst*
dtype0*
_output_shapes
: *
valueB
 *    
[
random_normal_3/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *  А?
Ю
$random_normal_3/RandomStandardNormalRandomStandardNormalrandom_normal_3/shape*
T0*
dtype0*
_output_shapes
:*
seed2 *

seed 
}
random_normal_3/mulMul$random_normal_3/RandomStandardNormalrandom_normal_3/stddev*
T0*
_output_shapes
:
f
random_normal_3Addrandom_normal_3/mulrandom_normal_3/mean*
_output_shapes
:*
T0
t
weight_3
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
Я
weight_3/AssignAssignweight_3random_normal_3*
use_locking(*
T0*
_class
loc:@weight_3*
validate_shape(*
_output_shapes
:
e
weight_3/readIdentityweight_3*
T0*
_class
loc:@weight_3*
_output_shapes
:
T
zeros_3Const*
valueB*    *
dtype0*
_output_shapes
:
r
bias_3
VariableV2*
shared_name *
dtype0*
_output_shapes
:*
	container *
shape:
С
bias_3/AssignAssignbias_3zeros_3*
T0*
_class
loc:@bias_3*
validate_shape(*
_output_shapes
:*
use_locking(
_
bias_3/readIdentitybias_3*
_output_shapes
:*
T0*
_class
loc:@bias_3
M
Mul_3MulPlaceholder_6weight_3/read*
T0*
_output_shapes
:
C
add_3AddMul_3bias_3/read*
T0*
_output_shapes
:
E
sub_3SubPlaceholder_7add_3*
T0*
_output_shapes
:
<
Square_3Squaresub_3*
T0*
_output_shapes
:
9
Rank_3RankSquare_3*
T0*
_output_shapes
: 
O
range_3/startConst*
value	B : *
dtype0*
_output_shapes
: 
O
range_3/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
g
range_3Rangerange_3/startRank_3range_3/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
_
Mean_3MeanSquare_3range_3*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
T
gradients_3/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
Z
gradients_3/grad_ys_0Const*
valueB
 *  А?*
dtype0*
_output_shapes
: 
u
gradients_3/FillFillgradients_3/Shapegradients_3/grad_ys_0*
T0*

index_type0*
_output_shapes
: 
n
gradients_3/Mean_3_grad/ShapeShapeSquare_3*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
¶
gradients_3/Mean_3_grad/SizeSizegradients_3/Mean_3_grad/Shape*
T0*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*
out_type0*
_output_shapes
: 
©
gradients_3/Mean_3_grad/addAddrange_3gradients_3/Mean_3_grad/Size*
T0*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*#
_output_shapes
:€€€€€€€€€
¬
gradients_3/Mean_3_grad/modFloorModgradients_3/Mean_3_grad/addgradients_3/Mean_3_grad/Size*
T0*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*#
_output_shapes
:€€€€€€€€€
ђ
gradients_3/Mean_3_grad/Shape_1Shapegradients_3/Mean_3_grad/mod*
T0*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*
out_type0*
_output_shapes
:
Ч
#gradients_3/Mean_3_grad/range/startConst*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*
value	B : *
dtype0*
_output_shapes
: 
Ч
#gradients_3/Mean_3_grad/range/deltaConst*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
с
gradients_3/Mean_3_grad/rangeRange#gradients_3/Mean_3_grad/range/startgradients_3/Mean_3_grad/Size#gradients_3/Mean_3_grad/range/delta*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*#
_output_shapes
:€€€€€€€€€*

Tidx0
Ц
"gradients_3/Mean_3_grad/Fill/valueConst*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
џ
gradients_3/Mean_3_grad/FillFillgradients_3/Mean_3_grad/Shape_1"gradients_3/Mean_3_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*

index_type0*#
_output_shapes
:€€€€€€€€€
Ш
%gradients_3/Mean_3_grad/DynamicStitchDynamicStitchgradients_3/Mean_3_grad/rangegradients_3/Mean_3_grad/modgradients_3/Mean_3_grad/Shapegradients_3/Mean_3_grad/Fill*
T0*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*
N*#
_output_shapes
:€€€€€€€€€
Х
!gradients_3/Mean_3_grad/Maximum/yConst*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
‘
gradients_3/Mean_3_grad/MaximumMaximum%gradients_3/Mean_3_grad/DynamicStitch!gradients_3/Mean_3_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*#
_output_shapes
:€€€€€€€€€
ћ
 gradients_3/Mean_3_grad/floordivFloorDivgradients_3/Mean_3_grad/Shapegradients_3/Mean_3_grad/Maximum*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape
Ф
gradients_3/Mean_3_grad/ReshapeReshapegradients_3/Fill%gradients_3/Mean_3_grad/DynamicStitch*
_output_shapes
:*
T0*
Tshape0
Ь
gradients_3/Mean_3_grad/TileTilegradients_3/Mean_3_grad/Reshape gradients_3/Mean_3_grad/floordiv*
_output_shapes
:*

Tmultiples0*
T0
p
gradients_3/Mean_3_grad/Shape_2ShapeSquare_3*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
b
gradients_3/Mean_3_grad/Shape_3Const*
dtype0*
_output_shapes
: *
valueB 
g
gradients_3/Mean_3_grad/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
Ґ
gradients_3/Mean_3_grad/ProdProdgradients_3/Mean_3_grad/Shape_2gradients_3/Mean_3_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
i
gradients_3/Mean_3_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
¶
gradients_3/Mean_3_grad/Prod_1Prodgradients_3/Mean_3_grad/Shape_3gradients_3/Mean_3_grad/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
e
#gradients_3/Mean_3_grad/Maximum_1/yConst*
value	B :*
dtype0*
_output_shapes
: 
Т
!gradients_3/Mean_3_grad/Maximum_1Maximumgradients_3/Mean_3_grad/Prod_1#gradients_3/Mean_3_grad/Maximum_1/y*
T0*
_output_shapes
: 
Р
"gradients_3/Mean_3_grad/floordiv_1FloorDivgradients_3/Mean_3_grad/Prod!gradients_3/Mean_3_grad/Maximum_1*
T0*
_output_shapes
: 
x
gradients_3/Mean_3_grad/CastCast"gradients_3/Mean_3_grad/floordiv_1*

SrcT0*
_output_shapes
: *

DstT0
Й
gradients_3/Mean_3_grad/truedivRealDivgradients_3/Mean_3_grad/Tilegradients_3/Mean_3_grad/Cast*
T0*
_output_shapes
:
Ж
gradients_3/Square_3_grad/ConstConst ^gradients_3/Mean_3_grad/truediv*
valueB
 *   @*
dtype0*
_output_shapes
: 
o
gradients_3/Square_3_grad/MulMulsub_3gradients_3/Square_3_grad/Const*
T0*
_output_shapes
:
Й
gradients_3/Square_3_grad/Mul_1Mulgradients_3/Mean_3_grad/truedivgradients_3/Square_3_grad/Mul*
T0*
_output_shapes
:
r
gradients_3/sub_3_grad/ShapeShapePlaceholder_7*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
l
gradients_3/sub_3_grad/Shape_1Shapeadd_3*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
ј
,gradients_3/sub_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_3/sub_3_grad/Shapegradients_3/sub_3_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
∞
gradients_3/sub_3_grad/SumSumgradients_3/Square_3_grad/Mul_1,gradients_3/sub_3_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ф
gradients_3/sub_3_grad/ReshapeReshapegradients_3/sub_3_grad/Sumgradients_3/sub_3_grad/Shape*
T0*
Tshape0*
_output_shapes
:
і
gradients_3/sub_3_grad/Sum_1Sumgradients_3/Square_3_grad/Mul_1.gradients_3/sub_3_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
b
gradients_3/sub_3_grad/NegNeggradients_3/sub_3_grad/Sum_1*
T0*
_output_shapes
:
Ш
 gradients_3/sub_3_grad/Reshape_1Reshapegradients_3/sub_3_grad/Neggradients_3/sub_3_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
s
'gradients_3/sub_3_grad/tuple/group_depsNoOp^gradients_3/sub_3_grad/Reshape!^gradients_3/sub_3_grad/Reshape_1
џ
/gradients_3/sub_3_grad/tuple/control_dependencyIdentitygradients_3/sub_3_grad/Reshape(^gradients_3/sub_3_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_3/sub_3_grad/Reshape*
_output_shapes
:
б
1gradients_3/sub_3_grad/tuple/control_dependency_1Identity gradients_3/sub_3_grad/Reshape_1(^gradients_3/sub_3_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_3/sub_3_grad/Reshape_1*
_output_shapes
:
j
gradients_3/add_3_grad/ShapeShapeMul_3*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_3/add_3_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_3/add_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_3/add_3_grad/Shapegradients_3/add_3_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
¬
gradients_3/add_3_grad/SumSum1gradients_3/sub_3_grad/tuple/control_dependency_1,gradients_3/add_3_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ф
gradients_3/add_3_grad/ReshapeReshapegradients_3/add_3_grad/Sumgradients_3/add_3_grad/Shape*
T0*
Tshape0*
_output_shapes
:
∆
gradients_3/add_3_grad/Sum_1Sum1gradients_3/sub_3_grad/tuple/control_dependency_1.gradients_3/add_3_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ь
 gradients_3/add_3_grad/Reshape_1Reshapegradients_3/add_3_grad/Sum_1gradients_3/add_3_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
s
'gradients_3/add_3_grad/tuple/group_depsNoOp^gradients_3/add_3_grad/Reshape!^gradients_3/add_3_grad/Reshape_1
џ
/gradients_3/add_3_grad/tuple/control_dependencyIdentitygradients_3/add_3_grad/Reshape(^gradients_3/add_3_grad/tuple/group_deps*
_output_shapes
:*
T0*1
_class'
%#loc:@gradients_3/add_3_grad/Reshape
г
1gradients_3/add_3_grad/tuple/control_dependency_1Identity gradients_3/add_3_grad/Reshape_1(^gradients_3/add_3_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_3/add_3_grad/Reshape_1*
_output_shapes
:
r
gradients_3/Mul_3_grad/ShapeShapePlaceholder_6*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
h
gradients_3/Mul_3_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_3/Mul_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_3/Mul_3_grad/Shapegradients_3/Mul_3_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Д
gradients_3/Mul_3_grad/MulMul/gradients_3/add_3_grad/tuple/control_dependencyweight_3/read*
_output_shapes
:*
T0
Ђ
gradients_3/Mul_3_grad/SumSumgradients_3/Mul_3_grad/Mul,gradients_3/Mul_3_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ф
gradients_3/Mul_3_grad/ReshapeReshapegradients_3/Mul_3_grad/Sumgradients_3/Mul_3_grad/Shape*
_output_shapes
:*
T0*
Tshape0
Ж
gradients_3/Mul_3_grad/Mul_1MulPlaceholder_6/gradients_3/add_3_grad/tuple/control_dependency*
T0*
_output_shapes
:
±
gradients_3/Mul_3_grad/Sum_1Sumgradients_3/Mul_3_grad/Mul_1.gradients_3/Mul_3_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ь
 gradients_3/Mul_3_grad/Reshape_1Reshapegradients_3/Mul_3_grad/Sum_1gradients_3/Mul_3_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_3/Mul_3_grad/tuple/group_depsNoOp^gradients_3/Mul_3_grad/Reshape!^gradients_3/Mul_3_grad/Reshape_1
џ
/gradients_3/Mul_3_grad/tuple/control_dependencyIdentitygradients_3/Mul_3_grad/Reshape(^gradients_3/Mul_3_grad/tuple/group_deps*
_output_shapes
:*
T0*1
_class'
%#loc:@gradients_3/Mul_3_grad/Reshape
г
1gradients_3/Mul_3_grad/tuple/control_dependency_1Identity gradients_3/Mul_3_grad/Reshape_1(^gradients_3/Mul_3_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_3/Mul_3_grad/Reshape_1*
_output_shapes
:
d
GradientDescent_3/learning_rateConst*
valueB
 *
„#<*
dtype0*
_output_shapes
: 
Б
6GradientDescent_3/update_weight_3/ApplyGradientDescentApplyGradientDescentweight_3GradientDescent_3/learning_rate1gradients_3/Mul_3_grad/tuple/control_dependency_1*
_output_shapes
:*
use_locking( *
T0*
_class
loc:@weight_3
ы
4GradientDescent_3/update_bias_3/ApplyGradientDescentApplyGradientDescentbias_3GradientDescent_3/learning_rate1gradients_3/add_3_grad/tuple/control_dependency_1*
_output_shapes
:*
use_locking( *
T0*
_class
loc:@bias_3
Й
GradientDescent_3NoOp5^GradientDescent_3/update_bias_3/ApplyGradientDescent7^GradientDescent_3/update_weight_3/ApplyGradientDescent
Т
init_3NoOp^bias/Assign^bias_1/Assign^bias_2/Assign^bias_3/Assign^weight/Assign^weight_1/Assign^weight_2/Assign^weight_3/Assign
R
Placeholder_8Placeholder*
dtype0*
_output_shapes
:*
shape:
R
Placeholder_9Placeholder*
dtype0*
_output_shapes
:*
shape:
_
random_normal_4/shapeConst*
valueB:*
dtype0*
_output_shapes
:
Y
random_normal_4/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
random_normal_4/stddevConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Ю
$random_normal_4/RandomStandardNormalRandomStandardNormalrandom_normal_4/shape*
dtype0*
_output_shapes
:*
seed2 *

seed *
T0
}
random_normal_4/mulMul$random_normal_4/RandomStandardNormalrandom_normal_4/stddev*
T0*
_output_shapes
:
f
random_normal_4Addrandom_normal_4/mulrandom_normal_4/mean*
T0*
_output_shapes
:
t
weight_4
VariableV2*
shared_name *
dtype0*
_output_shapes
:*
	container *
shape:
Я
weight_4/AssignAssignweight_4random_normal_4*
use_locking(*
T0*
_class
loc:@weight_4*
validate_shape(*
_output_shapes
:
e
weight_4/readIdentityweight_4*
T0*
_class
loc:@weight_4*
_output_shapes
:
T
zeros_4Const*
valueB*    *
dtype0*
_output_shapes
:
r
bias_4
VariableV2*
shared_name *
dtype0*
_output_shapes
:*
	container *
shape:
С
bias_4/AssignAssignbias_4zeros_4*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@bias_4
_
bias_4/readIdentitybias_4*
T0*
_class
loc:@bias_4*
_output_shapes
:
M
Mul_4MulPlaceholder_8weight_4/read*
_output_shapes
:*
T0
C
add_4AddMul_4bias_4/read*
T0*
_output_shapes
:
E
sub_4SubPlaceholder_9add_4*
T0*
_output_shapes
:
<
Square_4Squaresub_4*
T0*
_output_shapes
:
9
Rank_4RankSquare_4*
T0*
_output_shapes
: 
O
range_4/startConst*
value	B : *
dtype0*
_output_shapes
: 
O
range_4/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
g
range_4Rangerange_4/startRank_4range_4/delta*#
_output_shapes
:€€€€€€€€€*

Tidx0
_
Mean_4MeanSquare_4range_4*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
T
gradients_4/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
Z
gradients_4/grad_ys_0Const*
valueB
 *  А?*
dtype0*
_output_shapes
: 
u
gradients_4/FillFillgradients_4/Shapegradients_4/grad_ys_0*
T0*

index_type0*
_output_shapes
: 
n
gradients_4/Mean_4_grad/ShapeShapeSquare_4*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
¶
gradients_4/Mean_4_grad/SizeSizegradients_4/Mean_4_grad/Shape*
T0*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*
out_type0*
_output_shapes
: 
©
gradients_4/Mean_4_grad/addAddrange_4gradients_4/Mean_4_grad/Size*
T0*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*#
_output_shapes
:€€€€€€€€€
¬
gradients_4/Mean_4_grad/modFloorModgradients_4/Mean_4_grad/addgradients_4/Mean_4_grad/Size*
T0*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*#
_output_shapes
:€€€€€€€€€
ђ
gradients_4/Mean_4_grad/Shape_1Shapegradients_4/Mean_4_grad/mod*
T0*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*
out_type0*
_output_shapes
:
Ч
#gradients_4/Mean_4_grad/range/startConst*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*
value	B : *
dtype0*
_output_shapes
: 
Ч
#gradients_4/Mean_4_grad/range/deltaConst*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
с
gradients_4/Mean_4_grad/rangeRange#gradients_4/Mean_4_grad/range/startgradients_4/Mean_4_grad/Size#gradients_4/Mean_4_grad/range/delta*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*#
_output_shapes
:€€€€€€€€€*

Tidx0
Ц
"gradients_4/Mean_4_grad/Fill/valueConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*
value	B :
џ
gradients_4/Mean_4_grad/FillFillgradients_4/Mean_4_grad/Shape_1"gradients_4/Mean_4_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*

index_type0*#
_output_shapes
:€€€€€€€€€
Ш
%gradients_4/Mean_4_grad/DynamicStitchDynamicStitchgradients_4/Mean_4_grad/rangegradients_4/Mean_4_grad/modgradients_4/Mean_4_grad/Shapegradients_4/Mean_4_grad/Fill*
T0*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*
N*#
_output_shapes
:€€€€€€€€€
Х
!gradients_4/Mean_4_grad/Maximum/yConst*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
‘
gradients_4/Mean_4_grad/MaximumMaximum%gradients_4/Mean_4_grad/DynamicStitch!gradients_4/Mean_4_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*#
_output_shapes
:€€€€€€€€€
ћ
 gradients_4/Mean_4_grad/floordivFloorDivgradients_4/Mean_4_grad/Shapegradients_4/Mean_4_grad/Maximum*
T0*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ф
gradients_4/Mean_4_grad/ReshapeReshapegradients_4/Fill%gradients_4/Mean_4_grad/DynamicStitch*
T0*
Tshape0*
_output_shapes
:
Ь
gradients_4/Mean_4_grad/TileTilegradients_4/Mean_4_grad/Reshape gradients_4/Mean_4_grad/floordiv*

Tmultiples0*
T0*
_output_shapes
:
p
gradients_4/Mean_4_grad/Shape_2ShapeSquare_4*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
b
gradients_4/Mean_4_grad/Shape_3Const*
valueB *
dtype0*
_output_shapes
: 
g
gradients_4/Mean_4_grad/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
Ґ
gradients_4/Mean_4_grad/ProdProdgradients_4/Mean_4_grad/Shape_2gradients_4/Mean_4_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
i
gradients_4/Mean_4_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
¶
gradients_4/Mean_4_grad/Prod_1Prodgradients_4/Mean_4_grad/Shape_3gradients_4/Mean_4_grad/Const_1*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
e
#gradients_4/Mean_4_grad/Maximum_1/yConst*
value	B :*
dtype0*
_output_shapes
: 
Т
!gradients_4/Mean_4_grad/Maximum_1Maximumgradients_4/Mean_4_grad/Prod_1#gradients_4/Mean_4_grad/Maximum_1/y*
T0*
_output_shapes
: 
Р
"gradients_4/Mean_4_grad/floordiv_1FloorDivgradients_4/Mean_4_grad/Prod!gradients_4/Mean_4_grad/Maximum_1*
T0*
_output_shapes
: 
x
gradients_4/Mean_4_grad/CastCast"gradients_4/Mean_4_grad/floordiv_1*
_output_shapes
: *

DstT0*

SrcT0
Й
gradients_4/Mean_4_grad/truedivRealDivgradients_4/Mean_4_grad/Tilegradients_4/Mean_4_grad/Cast*
T0*
_output_shapes
:
Ж
gradients_4/Square_4_grad/ConstConst ^gradients_4/Mean_4_grad/truediv*
valueB
 *   @*
dtype0*
_output_shapes
: 
o
gradients_4/Square_4_grad/MulMulsub_4gradients_4/Square_4_grad/Const*
T0*
_output_shapes
:
Й
gradients_4/Square_4_grad/Mul_1Mulgradients_4/Mean_4_grad/truedivgradients_4/Square_4_grad/Mul*
T0*
_output_shapes
:
r
gradients_4/sub_4_grad/ShapeShapePlaceholder_9*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
l
gradients_4/sub_4_grad/Shape_1Shapeadd_4*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
ј
,gradients_4/sub_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_4/sub_4_grad/Shapegradients_4/sub_4_grad/Shape_1*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€*
T0
∞
gradients_4/sub_4_grad/SumSumgradients_4/Square_4_grad/Mul_1,gradients_4/sub_4_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ф
gradients_4/sub_4_grad/ReshapeReshapegradients_4/sub_4_grad/Sumgradients_4/sub_4_grad/Shape*
T0*
Tshape0*
_output_shapes
:
і
gradients_4/sub_4_grad/Sum_1Sumgradients_4/Square_4_grad/Mul_1.gradients_4/sub_4_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
b
gradients_4/sub_4_grad/NegNeggradients_4/sub_4_grad/Sum_1*
T0*
_output_shapes
:
Ш
 gradients_4/sub_4_grad/Reshape_1Reshapegradients_4/sub_4_grad/Neggradients_4/sub_4_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_4/sub_4_grad/tuple/group_depsNoOp^gradients_4/sub_4_grad/Reshape!^gradients_4/sub_4_grad/Reshape_1
џ
/gradients_4/sub_4_grad/tuple/control_dependencyIdentitygradients_4/sub_4_grad/Reshape(^gradients_4/sub_4_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_4/sub_4_grad/Reshape*
_output_shapes
:
б
1gradients_4/sub_4_grad/tuple/control_dependency_1Identity gradients_4/sub_4_grad/Reshape_1(^gradients_4/sub_4_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_4/sub_4_grad/Reshape_1*
_output_shapes
:
j
gradients_4/add_4_grad/ShapeShapeMul_4*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
h
gradients_4/add_4_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_4/add_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_4/add_4_grad/Shapegradients_4/add_4_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
¬
gradients_4/add_4_grad/SumSum1gradients_4/sub_4_grad/tuple/control_dependency_1,gradients_4/add_4_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_4/add_4_grad/ReshapeReshapegradients_4/add_4_grad/Sumgradients_4/add_4_grad/Shape*
T0*
Tshape0*
_output_shapes
:
∆
gradients_4/add_4_grad/Sum_1Sum1gradients_4/sub_4_grad/tuple/control_dependency_1.gradients_4/add_4_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ь
 gradients_4/add_4_grad/Reshape_1Reshapegradients_4/add_4_grad/Sum_1gradients_4/add_4_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_4/add_4_grad/tuple/group_depsNoOp^gradients_4/add_4_grad/Reshape!^gradients_4/add_4_grad/Reshape_1
џ
/gradients_4/add_4_grad/tuple/control_dependencyIdentitygradients_4/add_4_grad/Reshape(^gradients_4/add_4_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_4/add_4_grad/Reshape*
_output_shapes
:
г
1gradients_4/add_4_grad/tuple/control_dependency_1Identity gradients_4/add_4_grad/Reshape_1(^gradients_4/add_4_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_4/add_4_grad/Reshape_1*
_output_shapes
:
r
gradients_4/Mul_4_grad/ShapeShapePlaceholder_8*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_4/Mul_4_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
ј
,gradients_4/Mul_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_4/Mul_4_grad/Shapegradients_4/Mul_4_grad/Shape_1*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€*
T0
Д
gradients_4/Mul_4_grad/MulMul/gradients_4/add_4_grad/tuple/control_dependencyweight_4/read*
T0*
_output_shapes
:
Ђ
gradients_4/Mul_4_grad/SumSumgradients_4/Mul_4_grad/Mul,gradients_4/Mul_4_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_4/Mul_4_grad/ReshapeReshapegradients_4/Mul_4_grad/Sumgradients_4/Mul_4_grad/Shape*
T0*
Tshape0*
_output_shapes
:
Ж
gradients_4/Mul_4_grad/Mul_1MulPlaceholder_8/gradients_4/add_4_grad/tuple/control_dependency*
T0*
_output_shapes
:
±
gradients_4/Mul_4_grad/Sum_1Sumgradients_4/Mul_4_grad/Mul_1.gradients_4/Mul_4_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ь
 gradients_4/Mul_4_grad/Reshape_1Reshapegradients_4/Mul_4_grad/Sum_1gradients_4/Mul_4_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
s
'gradients_4/Mul_4_grad/tuple/group_depsNoOp^gradients_4/Mul_4_grad/Reshape!^gradients_4/Mul_4_grad/Reshape_1
џ
/gradients_4/Mul_4_grad/tuple/control_dependencyIdentitygradients_4/Mul_4_grad/Reshape(^gradients_4/Mul_4_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_4/Mul_4_grad/Reshape*
_output_shapes
:
г
1gradients_4/Mul_4_grad/tuple/control_dependency_1Identity gradients_4/Mul_4_grad/Reshape_1(^gradients_4/Mul_4_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_4/Mul_4_grad/Reshape_1*
_output_shapes
:
d
GradientDescent_4/learning_rateConst*
valueB
 *
„#<*
dtype0*
_output_shapes
: 
Б
6GradientDescent_4/update_weight_4/ApplyGradientDescentApplyGradientDescentweight_4GradientDescent_4/learning_rate1gradients_4/Mul_4_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@weight_4*
_output_shapes
:
ы
4GradientDescent_4/update_bias_4/ApplyGradientDescentApplyGradientDescentbias_4GradientDescent_4/learning_rate1gradients_4/add_4_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@bias_4*
_output_shapes
:
Й
GradientDescent_4NoOp5^GradientDescent_4/update_bias_4/ApplyGradientDescent7^GradientDescent_4/update_weight_4/ApplyGradientDescent
і
init_4NoOp^bias/Assign^bias_1/Assign^bias_2/Assign^bias_3/Assign^bias_4/Assign^weight/Assign^weight_1/Assign^weight_2/Assign^weight_3/Assign^weight_4/Assign
S
Placeholder_10Placeholder*
shape:*
dtype0*
_output_shapes
:
S
Placeholder_11Placeholder*
dtype0*
_output_shapes
:*
shape:
_
random_normal_5/shapeConst*
valueB:*
dtype0*
_output_shapes
:
Y
random_normal_5/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
random_normal_5/stddevConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Ю
$random_normal_5/RandomStandardNormalRandomStandardNormalrandom_normal_5/shape*
T0*
dtype0*
_output_shapes
:*
seed2 *

seed 
}
random_normal_5/mulMul$random_normal_5/RandomStandardNormalrandom_normal_5/stddev*
_output_shapes
:*
T0
f
random_normal_5Addrandom_normal_5/mulrandom_normal_5/mean*
T0*
_output_shapes
:
t
weight_5
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
Я
weight_5/AssignAssignweight_5random_normal_5*
use_locking(*
T0*
_class
loc:@weight_5*
validate_shape(*
_output_shapes
:
e
weight_5/readIdentityweight_5*
T0*
_class
loc:@weight_5*
_output_shapes
:
T
zeros_5Const*
valueB*    *
dtype0*
_output_shapes
:
r
bias_5
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
С
bias_5/AssignAssignbias_5zeros_5*
T0*
_class
loc:@bias_5*
validate_shape(*
_output_shapes
:*
use_locking(
_
bias_5/readIdentitybias_5*
_output_shapes
:*
T0*
_class
loc:@bias_5
N
Mul_5MulPlaceholder_10weight_5/read*
_output_shapes
:*
T0
C
add_5AddMul_5bias_5/read*
T0*
_output_shapes
:
F
sub_5SubPlaceholder_11add_5*
T0*
_output_shapes
:
<
Square_5Squaresub_5*
T0*
_output_shapes
:
9
Rank_5RankSquare_5*
T0*
_output_shapes
: 
O
range_5/startConst*
value	B : *
dtype0*
_output_shapes
: 
O
range_5/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
g
range_5Rangerange_5/startRank_5range_5/delta*#
_output_shapes
:€€€€€€€€€*

Tidx0
_
Mean_5MeanSquare_5range_5*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
T
gradients_5/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
Z
gradients_5/grad_ys_0Const*
valueB
 *  А?*
dtype0*
_output_shapes
: 
u
gradients_5/FillFillgradients_5/Shapegradients_5/grad_ys_0*
T0*

index_type0*
_output_shapes
: 
n
gradients_5/Mean_5_grad/ShapeShapeSquare_5*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
¶
gradients_5/Mean_5_grad/SizeSizegradients_5/Mean_5_grad/Shape*
_output_shapes
: *
T0*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*
out_type0
©
gradients_5/Mean_5_grad/addAddrange_5gradients_5/Mean_5_grad/Size*
T0*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*#
_output_shapes
:€€€€€€€€€
¬
gradients_5/Mean_5_grad/modFloorModgradients_5/Mean_5_grad/addgradients_5/Mean_5_grad/Size*
T0*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*#
_output_shapes
:€€€€€€€€€
ђ
gradients_5/Mean_5_grad/Shape_1Shapegradients_5/Mean_5_grad/mod*
T0*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*
out_type0*
_output_shapes
:
Ч
#gradients_5/Mean_5_grad/range/startConst*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*
value	B : *
dtype0*
_output_shapes
: 
Ч
#gradients_5/Mean_5_grad/range/deltaConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*
value	B :
с
gradients_5/Mean_5_grad/rangeRange#gradients_5/Mean_5_grad/range/startgradients_5/Mean_5_grad/Size#gradients_5/Mean_5_grad/range/delta*

Tidx0*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ц
"gradients_5/Mean_5_grad/Fill/valueConst*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
џ
gradients_5/Mean_5_grad/FillFillgradients_5/Mean_5_grad/Shape_1"gradients_5/Mean_5_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*

index_type0*#
_output_shapes
:€€€€€€€€€
Ш
%gradients_5/Mean_5_grad/DynamicStitchDynamicStitchgradients_5/Mean_5_grad/rangegradients_5/Mean_5_grad/modgradients_5/Mean_5_grad/Shapegradients_5/Mean_5_grad/Fill*
T0*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*
N*#
_output_shapes
:€€€€€€€€€
Х
!gradients_5/Mean_5_grad/Maximum/yConst*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
‘
gradients_5/Mean_5_grad/MaximumMaximum%gradients_5/Mean_5_grad/DynamicStitch!gradients_5/Mean_5_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*#
_output_shapes
:€€€€€€€€€
ћ
 gradients_5/Mean_5_grad/floordivFloorDivgradients_5/Mean_5_grad/Shapegradients_5/Mean_5_grad/Maximum*
T0*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ф
gradients_5/Mean_5_grad/ReshapeReshapegradients_5/Fill%gradients_5/Mean_5_grad/DynamicStitch*
T0*
Tshape0*
_output_shapes
:
Ь
gradients_5/Mean_5_grad/TileTilegradients_5/Mean_5_grad/Reshape gradients_5/Mean_5_grad/floordiv*
T0*
_output_shapes
:*

Tmultiples0
p
gradients_5/Mean_5_grad/Shape_2ShapeSquare_5*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
b
gradients_5/Mean_5_grad/Shape_3Const*
valueB *
dtype0*
_output_shapes
: 
g
gradients_5/Mean_5_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:
Ґ
gradients_5/Mean_5_grad/ProdProdgradients_5/Mean_5_grad/Shape_2gradients_5/Mean_5_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
i
gradients_5/Mean_5_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
¶
gradients_5/Mean_5_grad/Prod_1Prodgradients_5/Mean_5_grad/Shape_3gradients_5/Mean_5_grad/Const_1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
e
#gradients_5/Mean_5_grad/Maximum_1/yConst*
value	B :*
dtype0*
_output_shapes
: 
Т
!gradients_5/Mean_5_grad/Maximum_1Maximumgradients_5/Mean_5_grad/Prod_1#gradients_5/Mean_5_grad/Maximum_1/y*
T0*
_output_shapes
: 
Р
"gradients_5/Mean_5_grad/floordiv_1FloorDivgradients_5/Mean_5_grad/Prod!gradients_5/Mean_5_grad/Maximum_1*
T0*
_output_shapes
: 
x
gradients_5/Mean_5_grad/CastCast"gradients_5/Mean_5_grad/floordiv_1*

SrcT0*
_output_shapes
: *

DstT0
Й
gradients_5/Mean_5_grad/truedivRealDivgradients_5/Mean_5_grad/Tilegradients_5/Mean_5_grad/Cast*
_output_shapes
:*
T0
Ж
gradients_5/Square_5_grad/ConstConst ^gradients_5/Mean_5_grad/truediv*
valueB
 *   @*
dtype0*
_output_shapes
: 
o
gradients_5/Square_5_grad/MulMulsub_5gradients_5/Square_5_grad/Const*
T0*
_output_shapes
:
Й
gradients_5/Square_5_grad/Mul_1Mulgradients_5/Mean_5_grad/truedivgradients_5/Square_5_grad/Mul*
T0*
_output_shapes
:
s
gradients_5/sub_5_grad/ShapeShapePlaceholder_11*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
l
gradients_5/sub_5_grad/Shape_1Shapeadd_5*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
ј
,gradients_5/sub_5_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_5/sub_5_grad/Shapegradients_5/sub_5_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
∞
gradients_5/sub_5_grad/SumSumgradients_5/Square_5_grad/Mul_1,gradients_5/sub_5_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_5/sub_5_grad/ReshapeReshapegradients_5/sub_5_grad/Sumgradients_5/sub_5_grad/Shape*
T0*
Tshape0*
_output_shapes
:
і
gradients_5/sub_5_grad/Sum_1Sumgradients_5/Square_5_grad/Mul_1.gradients_5/sub_5_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
b
gradients_5/sub_5_grad/NegNeggradients_5/sub_5_grad/Sum_1*
T0*
_output_shapes
:
Ш
 gradients_5/sub_5_grad/Reshape_1Reshapegradients_5/sub_5_grad/Neggradients_5/sub_5_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_5/sub_5_grad/tuple/group_depsNoOp^gradients_5/sub_5_grad/Reshape!^gradients_5/sub_5_grad/Reshape_1
џ
/gradients_5/sub_5_grad/tuple/control_dependencyIdentitygradients_5/sub_5_grad/Reshape(^gradients_5/sub_5_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_5/sub_5_grad/Reshape*
_output_shapes
:
б
1gradients_5/sub_5_grad/tuple/control_dependency_1Identity gradients_5/sub_5_grad/Reshape_1(^gradients_5/sub_5_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_5/sub_5_grad/Reshape_1*
_output_shapes
:
j
gradients_5/add_5_grad/ShapeShapeMul_5*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
h
gradients_5/add_5_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
ј
,gradients_5/add_5_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_5/add_5_grad/Shapegradients_5/add_5_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
¬
gradients_5/add_5_grad/SumSum1gradients_5/sub_5_grad/tuple/control_dependency_1,gradients_5/add_5_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_5/add_5_grad/ReshapeReshapegradients_5/add_5_grad/Sumgradients_5/add_5_grad/Shape*
T0*
Tshape0*
_output_shapes
:
∆
gradients_5/add_5_grad/Sum_1Sum1gradients_5/sub_5_grad/tuple/control_dependency_1.gradients_5/add_5_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ь
 gradients_5/add_5_grad/Reshape_1Reshapegradients_5/add_5_grad/Sum_1gradients_5/add_5_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_5/add_5_grad/tuple/group_depsNoOp^gradients_5/add_5_grad/Reshape!^gradients_5/add_5_grad/Reshape_1
џ
/gradients_5/add_5_grad/tuple/control_dependencyIdentitygradients_5/add_5_grad/Reshape(^gradients_5/add_5_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_5/add_5_grad/Reshape*
_output_shapes
:
г
1gradients_5/add_5_grad/tuple/control_dependency_1Identity gradients_5/add_5_grad/Reshape_1(^gradients_5/add_5_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_5/add_5_grad/Reshape_1*
_output_shapes
:
s
gradients_5/Mul_5_grad/ShapeShapePlaceholder_10*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_5/Mul_5_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_5/Mul_5_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_5/Mul_5_grad/Shapegradients_5/Mul_5_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Д
gradients_5/Mul_5_grad/MulMul/gradients_5/add_5_grad/tuple/control_dependencyweight_5/read*
_output_shapes
:*
T0
Ђ
gradients_5/Mul_5_grad/SumSumgradients_5/Mul_5_grad/Mul,gradients_5/Mul_5_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_5/Mul_5_grad/ReshapeReshapegradients_5/Mul_5_grad/Sumgradients_5/Mul_5_grad/Shape*
_output_shapes
:*
T0*
Tshape0
З
gradients_5/Mul_5_grad/Mul_1MulPlaceholder_10/gradients_5/add_5_grad/tuple/control_dependency*
T0*
_output_shapes
:
±
gradients_5/Mul_5_grad/Sum_1Sumgradients_5/Mul_5_grad/Mul_1.gradients_5/Mul_5_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ь
 gradients_5/Mul_5_grad/Reshape_1Reshapegradients_5/Mul_5_grad/Sum_1gradients_5/Mul_5_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_5/Mul_5_grad/tuple/group_depsNoOp^gradients_5/Mul_5_grad/Reshape!^gradients_5/Mul_5_grad/Reshape_1
џ
/gradients_5/Mul_5_grad/tuple/control_dependencyIdentitygradients_5/Mul_5_grad/Reshape(^gradients_5/Mul_5_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_5/Mul_5_grad/Reshape*
_output_shapes
:
г
1gradients_5/Mul_5_grad/tuple/control_dependency_1Identity gradients_5/Mul_5_grad/Reshape_1(^gradients_5/Mul_5_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_5/Mul_5_grad/Reshape_1*
_output_shapes
:
d
GradientDescent_5/learning_rateConst*
valueB
 *
„#<*
dtype0*
_output_shapes
: 
Б
6GradientDescent_5/update_weight_5/ApplyGradientDescentApplyGradientDescentweight_5GradientDescent_5/learning_rate1gradients_5/Mul_5_grad/tuple/control_dependency_1*
T0*
_class
loc:@weight_5*
_output_shapes
:*
use_locking( 
ы
4GradientDescent_5/update_bias_5/ApplyGradientDescentApplyGradientDescentbias_5GradientDescent_5/learning_rate1gradients_5/add_5_grad/tuple/control_dependency_1*
T0*
_class
loc:@bias_5*
_output_shapes
:*
use_locking( 
Й
GradientDescent_5NoOp5^GradientDescent_5/update_bias_5/ApplyGradientDescent7^GradientDescent_5/update_weight_5/ApplyGradientDescent
÷
init_5NoOp^bias/Assign^bias_1/Assign^bias_2/Assign^bias_3/Assign^bias_4/Assign^bias_5/Assign^weight/Assign^weight_1/Assign^weight_2/Assign^weight_3/Assign^weight_4/Assign^weight_5/Assign
S
Placeholder_12Placeholder*
shape:*
dtype0*
_output_shapes
:
S
Placeholder_13Placeholder*
shape:*
dtype0*
_output_shapes
:
_
random_normal_6/shapeConst*
valueB:*
dtype0*
_output_shapes
:
Y
random_normal_6/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
random_normal_6/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *  А?
Ю
$random_normal_6/RandomStandardNormalRandomStandardNormalrandom_normal_6/shape*
T0*
dtype0*
_output_shapes
:*
seed2 *

seed 
}
random_normal_6/mulMul$random_normal_6/RandomStandardNormalrandom_normal_6/stddev*
T0*
_output_shapes
:
f
random_normal_6Addrandom_normal_6/mulrandom_normal_6/mean*
T0*
_output_shapes
:
t
weight_6
VariableV2*
shape:*
shared_name *
dtype0*
_output_shapes
:*
	container 
Я
weight_6/AssignAssignweight_6random_normal_6*
use_locking(*
T0*
_class
loc:@weight_6*
validate_shape(*
_output_shapes
:
e
weight_6/readIdentityweight_6*
T0*
_class
loc:@weight_6*
_output_shapes
:
T
zeros_6Const*
valueB*    *
dtype0*
_output_shapes
:
r
bias_6
VariableV2*
shared_name *
dtype0*
_output_shapes
:*
	container *
shape:
С
bias_6/AssignAssignbias_6zeros_6*
use_locking(*
T0*
_class
loc:@bias_6*
validate_shape(*
_output_shapes
:
_
bias_6/readIdentitybias_6*
T0*
_class
loc:@bias_6*
_output_shapes
:
N
Mul_6MulPlaceholder_12weight_6/read*
T0*
_output_shapes
:
C
add_6AddMul_6bias_6/read*
T0*
_output_shapes
:
F
sub_6SubPlaceholder_13add_6*
T0*
_output_shapes
:
<
Square_6Squaresub_6*
T0*
_output_shapes
:
9
Rank_6RankSquare_6*
_output_shapes
: *
T0
O
range_6/startConst*
dtype0*
_output_shapes
: *
value	B : 
O
range_6/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
g
range_6Rangerange_6/startRank_6range_6/delta*#
_output_shapes
:€€€€€€€€€*

Tidx0
_
Mean_6MeanSquare_6range_6*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
T
gradients_6/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
Z
gradients_6/grad_ys_0Const*
valueB
 *  А?*
dtype0*
_output_shapes
: 
u
gradients_6/FillFillgradients_6/Shapegradients_6/grad_ys_0*
T0*

index_type0*
_output_shapes
: 
n
gradients_6/Mean_6_grad/ShapeShapeSquare_6*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
¶
gradients_6/Mean_6_grad/SizeSizegradients_6/Mean_6_grad/Shape*
_output_shapes
: *
T0*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*
out_type0
©
gradients_6/Mean_6_grad/addAddrange_6gradients_6/Mean_6_grad/Size*
T0*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*#
_output_shapes
:€€€€€€€€€
¬
gradients_6/Mean_6_grad/modFloorModgradients_6/Mean_6_grad/addgradients_6/Mean_6_grad/Size*
T0*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*#
_output_shapes
:€€€€€€€€€
ђ
gradients_6/Mean_6_grad/Shape_1Shapegradients_6/Mean_6_grad/mod*
T0*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*
out_type0*
_output_shapes
:
Ч
#gradients_6/Mean_6_grad/range/startConst*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*
value	B : *
dtype0*
_output_shapes
: 
Ч
#gradients_6/Mean_6_grad/range/deltaConst*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
с
gradients_6/Mean_6_grad/rangeRange#gradients_6/Mean_6_grad/range/startgradients_6/Mean_6_grad/Size#gradients_6/Mean_6_grad/range/delta*

Tidx0*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ц
"gradients_6/Mean_6_grad/Fill/valueConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*
value	B :
џ
gradients_6/Mean_6_grad/FillFillgradients_6/Mean_6_grad/Shape_1"gradients_6/Mean_6_grad/Fill/value*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*

index_type0
Ш
%gradients_6/Mean_6_grad/DynamicStitchDynamicStitchgradients_6/Mean_6_grad/rangegradients_6/Mean_6_grad/modgradients_6/Mean_6_grad/Shapegradients_6/Mean_6_grad/Fill*
T0*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*
N*#
_output_shapes
:€€€€€€€€€
Х
!gradients_6/Mean_6_grad/Maximum/yConst*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
‘
gradients_6/Mean_6_grad/MaximumMaximum%gradients_6/Mean_6_grad/DynamicStitch!gradients_6/Mean_6_grad/Maximum/y*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape
ћ
 gradients_6/Mean_6_grad/floordivFloorDivgradients_6/Mean_6_grad/Shapegradients_6/Mean_6_grad/Maximum*
T0*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ф
gradients_6/Mean_6_grad/ReshapeReshapegradients_6/Fill%gradients_6/Mean_6_grad/DynamicStitch*
T0*
Tshape0*
_output_shapes
:
Ь
gradients_6/Mean_6_grad/TileTilegradients_6/Mean_6_grad/Reshape gradients_6/Mean_6_grad/floordiv*

Tmultiples0*
T0*
_output_shapes
:
p
gradients_6/Mean_6_grad/Shape_2ShapeSquare_6*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
b
gradients_6/Mean_6_grad/Shape_3Const*
valueB *
dtype0*
_output_shapes
: 
g
gradients_6/Mean_6_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:
Ґ
gradients_6/Mean_6_grad/ProdProdgradients_6/Mean_6_grad/Shape_2gradients_6/Mean_6_grad/Const*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
i
gradients_6/Mean_6_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
¶
gradients_6/Mean_6_grad/Prod_1Prodgradients_6/Mean_6_grad/Shape_3gradients_6/Mean_6_grad/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
e
#gradients_6/Mean_6_grad/Maximum_1/yConst*
value	B :*
dtype0*
_output_shapes
: 
Т
!gradients_6/Mean_6_grad/Maximum_1Maximumgradients_6/Mean_6_grad/Prod_1#gradients_6/Mean_6_grad/Maximum_1/y*
T0*
_output_shapes
: 
Р
"gradients_6/Mean_6_grad/floordiv_1FloorDivgradients_6/Mean_6_grad/Prod!gradients_6/Mean_6_grad/Maximum_1*
T0*
_output_shapes
: 
x
gradients_6/Mean_6_grad/CastCast"gradients_6/Mean_6_grad/floordiv_1*

SrcT0*
_output_shapes
: *

DstT0
Й
gradients_6/Mean_6_grad/truedivRealDivgradients_6/Mean_6_grad/Tilegradients_6/Mean_6_grad/Cast*
T0*
_output_shapes
:
Ж
gradients_6/Square_6_grad/ConstConst ^gradients_6/Mean_6_grad/truediv*
dtype0*
_output_shapes
: *
valueB
 *   @
o
gradients_6/Square_6_grad/MulMulsub_6gradients_6/Square_6_grad/Const*
T0*
_output_shapes
:
Й
gradients_6/Square_6_grad/Mul_1Mulgradients_6/Mean_6_grad/truedivgradients_6/Square_6_grad/Mul*
_output_shapes
:*
T0
s
gradients_6/sub_6_grad/ShapeShapePlaceholder_13*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
l
gradients_6/sub_6_grad/Shape_1Shapeadd_6*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
ј
,gradients_6/sub_6_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_6/sub_6_grad/Shapegradients_6/sub_6_grad/Shape_1*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€*
T0
∞
gradients_6/sub_6_grad/SumSumgradients_6/Square_6_grad/Mul_1,gradients_6/sub_6_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ф
gradients_6/sub_6_grad/ReshapeReshapegradients_6/sub_6_grad/Sumgradients_6/sub_6_grad/Shape*
T0*
Tshape0*
_output_shapes
:
і
gradients_6/sub_6_grad/Sum_1Sumgradients_6/Square_6_grad/Mul_1.gradients_6/sub_6_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
b
gradients_6/sub_6_grad/NegNeggradients_6/sub_6_grad/Sum_1*
T0*
_output_shapes
:
Ш
 gradients_6/sub_6_grad/Reshape_1Reshapegradients_6/sub_6_grad/Neggradients_6/sub_6_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_6/sub_6_grad/tuple/group_depsNoOp^gradients_6/sub_6_grad/Reshape!^gradients_6/sub_6_grad/Reshape_1
џ
/gradients_6/sub_6_grad/tuple/control_dependencyIdentitygradients_6/sub_6_grad/Reshape(^gradients_6/sub_6_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_6/sub_6_grad/Reshape*
_output_shapes
:
б
1gradients_6/sub_6_grad/tuple/control_dependency_1Identity gradients_6/sub_6_grad/Reshape_1(^gradients_6/sub_6_grad/tuple/group_deps*
_output_shapes
:*
T0*3
_class)
'%loc:@gradients_6/sub_6_grad/Reshape_1
j
gradients_6/add_6_grad/ShapeShapeMul_6*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_6/add_6_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_6/add_6_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_6/add_6_grad/Shapegradients_6/add_6_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
¬
gradients_6/add_6_grad/SumSum1gradients_6/sub_6_grad/tuple/control_dependency_1,gradients_6/add_6_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ф
gradients_6/add_6_grad/ReshapeReshapegradients_6/add_6_grad/Sumgradients_6/add_6_grad/Shape*
_output_shapes
:*
T0*
Tshape0
∆
gradients_6/add_6_grad/Sum_1Sum1gradients_6/sub_6_grad/tuple/control_dependency_1.gradients_6/add_6_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ь
 gradients_6/add_6_grad/Reshape_1Reshapegradients_6/add_6_grad/Sum_1gradients_6/add_6_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_6/add_6_grad/tuple/group_depsNoOp^gradients_6/add_6_grad/Reshape!^gradients_6/add_6_grad/Reshape_1
џ
/gradients_6/add_6_grad/tuple/control_dependencyIdentitygradients_6/add_6_grad/Reshape(^gradients_6/add_6_grad/tuple/group_deps*
_output_shapes
:*
T0*1
_class'
%#loc:@gradients_6/add_6_grad/Reshape
г
1gradients_6/add_6_grad/tuple/control_dependency_1Identity gradients_6/add_6_grad/Reshape_1(^gradients_6/add_6_grad/tuple/group_deps*
_output_shapes
:*
T0*3
_class)
'%loc:@gradients_6/add_6_grad/Reshape_1
s
gradients_6/Mul_6_grad/ShapeShapePlaceholder_12*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
h
gradients_6/Mul_6_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_6/Mul_6_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_6/Mul_6_grad/Shapegradients_6/Mul_6_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Д
gradients_6/Mul_6_grad/MulMul/gradients_6/add_6_grad/tuple/control_dependencyweight_6/read*
T0*
_output_shapes
:
Ђ
gradients_6/Mul_6_grad/SumSumgradients_6/Mul_6_grad/Mul,gradients_6/Mul_6_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_6/Mul_6_grad/ReshapeReshapegradients_6/Mul_6_grad/Sumgradients_6/Mul_6_grad/Shape*
T0*
Tshape0*
_output_shapes
:
З
gradients_6/Mul_6_grad/Mul_1MulPlaceholder_12/gradients_6/add_6_grad/tuple/control_dependency*
T0*
_output_shapes
:
±
gradients_6/Mul_6_grad/Sum_1Sumgradients_6/Mul_6_grad/Mul_1.gradients_6/Mul_6_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ь
 gradients_6/Mul_6_grad/Reshape_1Reshapegradients_6/Mul_6_grad/Sum_1gradients_6/Mul_6_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
s
'gradients_6/Mul_6_grad/tuple/group_depsNoOp^gradients_6/Mul_6_grad/Reshape!^gradients_6/Mul_6_grad/Reshape_1
џ
/gradients_6/Mul_6_grad/tuple/control_dependencyIdentitygradients_6/Mul_6_grad/Reshape(^gradients_6/Mul_6_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_6/Mul_6_grad/Reshape*
_output_shapes
:
г
1gradients_6/Mul_6_grad/tuple/control_dependency_1Identity gradients_6/Mul_6_grad/Reshape_1(^gradients_6/Mul_6_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_6/Mul_6_grad/Reshape_1*
_output_shapes
:
d
GradientDescent_6/learning_rateConst*
valueB
 *
„#<*
dtype0*
_output_shapes
: 
Б
6GradientDescent_6/update_weight_6/ApplyGradientDescentApplyGradientDescentweight_6GradientDescent_6/learning_rate1gradients_6/Mul_6_grad/tuple/control_dependency_1*
T0*
_class
loc:@weight_6*
_output_shapes
:*
use_locking( 
ы
4GradientDescent_6/update_bias_6/ApplyGradientDescentApplyGradientDescentbias_6GradientDescent_6/learning_rate1gradients_6/add_6_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@bias_6*
_output_shapes
:
Й
GradientDescent_6NoOp5^GradientDescent_6/update_bias_6/ApplyGradientDescent7^GradientDescent_6/update_weight_6/ApplyGradientDescent
ш
init_6NoOp^bias/Assign^bias_1/Assign^bias_2/Assign^bias_3/Assign^bias_4/Assign^bias_5/Assign^bias_6/Assign^weight/Assign^weight_1/Assign^weight_2/Assign^weight_3/Assign^weight_4/Assign^weight_5/Assign^weight_6/Assign
S
Placeholder_14Placeholder*
dtype0*
_output_shapes
:*
shape:
S
Placeholder_15Placeholder*
dtype0*
_output_shapes
:*
shape:
_
random_normal_7/shapeConst*
dtype0*
_output_shapes
:*
valueB:
Y
random_normal_7/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
random_normal_7/stddevConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Ю
$random_normal_7/RandomStandardNormalRandomStandardNormalrandom_normal_7/shape*
T0*
dtype0*
_output_shapes
:*
seed2 *

seed 
}
random_normal_7/mulMul$random_normal_7/RandomStandardNormalrandom_normal_7/stddev*
_output_shapes
:*
T0
f
random_normal_7Addrandom_normal_7/mulrandom_normal_7/mean*
T0*
_output_shapes
:
t
weight_7
VariableV2*
shape:*
shared_name *
dtype0*
_output_shapes
:*
	container 
Я
weight_7/AssignAssignweight_7random_normal_7*
T0*
_class
loc:@weight_7*
validate_shape(*
_output_shapes
:*
use_locking(
e
weight_7/readIdentityweight_7*
T0*
_class
loc:@weight_7*
_output_shapes
:
T
zeros_7Const*
valueB*    *
dtype0*
_output_shapes
:
r
bias_7
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
С
bias_7/AssignAssignbias_7zeros_7*
T0*
_class
loc:@bias_7*
validate_shape(*
_output_shapes
:*
use_locking(
_
bias_7/readIdentitybias_7*
T0*
_class
loc:@bias_7*
_output_shapes
:
N
Mul_7MulPlaceholder_14weight_7/read*
_output_shapes
:*
T0
C
add_7AddMul_7bias_7/read*
_output_shapes
:*
T0
F
sub_7SubPlaceholder_15add_7*
_output_shapes
:*
T0
<
Square_7Squaresub_7*
_output_shapes
:*
T0
9
Rank_7RankSquare_7*
T0*
_output_shapes
: 
O
range_7/startConst*
dtype0*
_output_shapes
: *
value	B : 
O
range_7/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
g
range_7Rangerange_7/startRank_7range_7/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
_
Mean_7MeanSquare_7range_7*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
T
gradients_7/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
Z
gradients_7/grad_ys_0Const*
valueB
 *  А?*
dtype0*
_output_shapes
: 
u
gradients_7/FillFillgradients_7/Shapegradients_7/grad_ys_0*
T0*

index_type0*
_output_shapes
: 
n
gradients_7/Mean_7_grad/ShapeShapeSquare_7*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
¶
gradients_7/Mean_7_grad/SizeSizegradients_7/Mean_7_grad/Shape*
T0*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*
out_type0*
_output_shapes
: 
©
gradients_7/Mean_7_grad/addAddrange_7gradients_7/Mean_7_grad/Size*
T0*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*#
_output_shapes
:€€€€€€€€€
¬
gradients_7/Mean_7_grad/modFloorModgradients_7/Mean_7_grad/addgradients_7/Mean_7_grad/Size*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape
ђ
gradients_7/Mean_7_grad/Shape_1Shapegradients_7/Mean_7_grad/mod*
_output_shapes
:*
T0*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*
out_type0
Ч
#gradients_7/Mean_7_grad/range/startConst*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*
value	B : *
dtype0*
_output_shapes
: 
Ч
#gradients_7/Mean_7_grad/range/deltaConst*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
с
gradients_7/Mean_7_grad/rangeRange#gradients_7/Mean_7_grad/range/startgradients_7/Mean_7_grad/Size#gradients_7/Mean_7_grad/range/delta*

Tidx0*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ц
"gradients_7/Mean_7_grad/Fill/valueConst*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
џ
gradients_7/Mean_7_grad/FillFillgradients_7/Mean_7_grad/Shape_1"gradients_7/Mean_7_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*

index_type0*#
_output_shapes
:€€€€€€€€€
Ш
%gradients_7/Mean_7_grad/DynamicStitchDynamicStitchgradients_7/Mean_7_grad/rangegradients_7/Mean_7_grad/modgradients_7/Mean_7_grad/Shapegradients_7/Mean_7_grad/Fill*
T0*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*
N*#
_output_shapes
:€€€€€€€€€
Х
!gradients_7/Mean_7_grad/Maximum/yConst*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
‘
gradients_7/Mean_7_grad/MaximumMaximum%gradients_7/Mean_7_grad/DynamicStitch!gradients_7/Mean_7_grad/Maximum/y*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape
ћ
 gradients_7/Mean_7_grad/floordivFloorDivgradients_7/Mean_7_grad/Shapegradients_7/Mean_7_grad/Maximum*
T0*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ф
gradients_7/Mean_7_grad/ReshapeReshapegradients_7/Fill%gradients_7/Mean_7_grad/DynamicStitch*
_output_shapes
:*
T0*
Tshape0
Ь
gradients_7/Mean_7_grad/TileTilegradients_7/Mean_7_grad/Reshape gradients_7/Mean_7_grad/floordiv*
_output_shapes
:*

Tmultiples0*
T0
p
gradients_7/Mean_7_grad/Shape_2ShapeSquare_7*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
b
gradients_7/Mean_7_grad/Shape_3Const*
valueB *
dtype0*
_output_shapes
: 
g
gradients_7/Mean_7_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:
Ґ
gradients_7/Mean_7_grad/ProdProdgradients_7/Mean_7_grad/Shape_2gradients_7/Mean_7_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
i
gradients_7/Mean_7_grad/Const_1Const*
dtype0*
_output_shapes
:*
valueB: 
¶
gradients_7/Mean_7_grad/Prod_1Prodgradients_7/Mean_7_grad/Shape_3gradients_7/Mean_7_grad/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
e
#gradients_7/Mean_7_grad/Maximum_1/yConst*
dtype0*
_output_shapes
: *
value	B :
Т
!gradients_7/Mean_7_grad/Maximum_1Maximumgradients_7/Mean_7_grad/Prod_1#gradients_7/Mean_7_grad/Maximum_1/y*
T0*
_output_shapes
: 
Р
"gradients_7/Mean_7_grad/floordiv_1FloorDivgradients_7/Mean_7_grad/Prod!gradients_7/Mean_7_grad/Maximum_1*
T0*
_output_shapes
: 
x
gradients_7/Mean_7_grad/CastCast"gradients_7/Mean_7_grad/floordiv_1*

SrcT0*
_output_shapes
: *

DstT0
Й
gradients_7/Mean_7_grad/truedivRealDivgradients_7/Mean_7_grad/Tilegradients_7/Mean_7_grad/Cast*
_output_shapes
:*
T0
Ж
gradients_7/Square_7_grad/ConstConst ^gradients_7/Mean_7_grad/truediv*
valueB
 *   @*
dtype0*
_output_shapes
: 
o
gradients_7/Square_7_grad/MulMulsub_7gradients_7/Square_7_grad/Const*
T0*
_output_shapes
:
Й
gradients_7/Square_7_grad/Mul_1Mulgradients_7/Mean_7_grad/truedivgradients_7/Square_7_grad/Mul*
T0*
_output_shapes
:
s
gradients_7/sub_7_grad/ShapeShapePlaceholder_15*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
l
gradients_7/sub_7_grad/Shape_1Shapeadd_7*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
ј
,gradients_7/sub_7_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_7/sub_7_grad/Shapegradients_7/sub_7_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
∞
gradients_7/sub_7_grad/SumSumgradients_7/Square_7_grad/Mul_1,gradients_7/sub_7_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_7/sub_7_grad/ReshapeReshapegradients_7/sub_7_grad/Sumgradients_7/sub_7_grad/Shape*
T0*
Tshape0*
_output_shapes
:
і
gradients_7/sub_7_grad/Sum_1Sumgradients_7/Square_7_grad/Mul_1.gradients_7/sub_7_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
b
gradients_7/sub_7_grad/NegNeggradients_7/sub_7_grad/Sum_1*
T0*
_output_shapes
:
Ш
 gradients_7/sub_7_grad/Reshape_1Reshapegradients_7/sub_7_grad/Neggradients_7/sub_7_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_7/sub_7_grad/tuple/group_depsNoOp^gradients_7/sub_7_grad/Reshape!^gradients_7/sub_7_grad/Reshape_1
џ
/gradients_7/sub_7_grad/tuple/control_dependencyIdentitygradients_7/sub_7_grad/Reshape(^gradients_7/sub_7_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_7/sub_7_grad/Reshape*
_output_shapes
:
б
1gradients_7/sub_7_grad/tuple/control_dependency_1Identity gradients_7/sub_7_grad/Reshape_1(^gradients_7/sub_7_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_7/sub_7_grad/Reshape_1*
_output_shapes
:
j
gradients_7/add_7_grad/ShapeShapeMul_7*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
h
gradients_7/add_7_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_7/add_7_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_7/add_7_grad/Shapegradients_7/add_7_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
¬
gradients_7/add_7_grad/SumSum1gradients_7/sub_7_grad/tuple/control_dependency_1,gradients_7/add_7_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ф
gradients_7/add_7_grad/ReshapeReshapegradients_7/add_7_grad/Sumgradients_7/add_7_grad/Shape*
T0*
Tshape0*
_output_shapes
:
∆
gradients_7/add_7_grad/Sum_1Sum1gradients_7/sub_7_grad/tuple/control_dependency_1.gradients_7/add_7_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ь
 gradients_7/add_7_grad/Reshape_1Reshapegradients_7/add_7_grad/Sum_1gradients_7/add_7_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_7/add_7_grad/tuple/group_depsNoOp^gradients_7/add_7_grad/Reshape!^gradients_7/add_7_grad/Reshape_1
џ
/gradients_7/add_7_grad/tuple/control_dependencyIdentitygradients_7/add_7_grad/Reshape(^gradients_7/add_7_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_7/add_7_grad/Reshape*
_output_shapes
:
г
1gradients_7/add_7_grad/tuple/control_dependency_1Identity gradients_7/add_7_grad/Reshape_1(^gradients_7/add_7_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_7/add_7_grad/Reshape_1*
_output_shapes
:
s
gradients_7/Mul_7_grad/ShapeShapePlaceholder_14*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_7/Mul_7_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
ј
,gradients_7/Mul_7_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_7/Mul_7_grad/Shapegradients_7/Mul_7_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Д
gradients_7/Mul_7_grad/MulMul/gradients_7/add_7_grad/tuple/control_dependencyweight_7/read*
T0*
_output_shapes
:
Ђ
gradients_7/Mul_7_grad/SumSumgradients_7/Mul_7_grad/Mul,gradients_7/Mul_7_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ф
gradients_7/Mul_7_grad/ReshapeReshapegradients_7/Mul_7_grad/Sumgradients_7/Mul_7_grad/Shape*
T0*
Tshape0*
_output_shapes
:
З
gradients_7/Mul_7_grad/Mul_1MulPlaceholder_14/gradients_7/add_7_grad/tuple/control_dependency*
T0*
_output_shapes
:
±
gradients_7/Mul_7_grad/Sum_1Sumgradients_7/Mul_7_grad/Mul_1.gradients_7/Mul_7_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ь
 gradients_7/Mul_7_grad/Reshape_1Reshapegradients_7/Mul_7_grad/Sum_1gradients_7/Mul_7_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_7/Mul_7_grad/tuple/group_depsNoOp^gradients_7/Mul_7_grad/Reshape!^gradients_7/Mul_7_grad/Reshape_1
џ
/gradients_7/Mul_7_grad/tuple/control_dependencyIdentitygradients_7/Mul_7_grad/Reshape(^gradients_7/Mul_7_grad/tuple/group_deps*
_output_shapes
:*
T0*1
_class'
%#loc:@gradients_7/Mul_7_grad/Reshape
г
1gradients_7/Mul_7_grad/tuple/control_dependency_1Identity gradients_7/Mul_7_grad/Reshape_1(^gradients_7/Mul_7_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_7/Mul_7_grad/Reshape_1*
_output_shapes
:
d
GradientDescent_7/learning_rateConst*
valueB
 *
„#<*
dtype0*
_output_shapes
: 
Б
6GradientDescent_7/update_weight_7/ApplyGradientDescentApplyGradientDescentweight_7GradientDescent_7/learning_rate1gradients_7/Mul_7_grad/tuple/control_dependency_1*
_output_shapes
:*
use_locking( *
T0*
_class
loc:@weight_7
ы
4GradientDescent_7/update_bias_7/ApplyGradientDescentApplyGradientDescentbias_7GradientDescent_7/learning_rate1gradients_7/add_7_grad/tuple/control_dependency_1*
T0*
_class
loc:@bias_7*
_output_shapes
:*
use_locking( 
Й
GradientDescent_7NoOp5^GradientDescent_7/update_bias_7/ApplyGradientDescent7^GradientDescent_7/update_weight_7/ApplyGradientDescent
Ъ
init_7NoOp^bias/Assign^bias_1/Assign^bias_2/Assign^bias_3/Assign^bias_4/Assign^bias_5/Assign^bias_6/Assign^bias_7/Assign^weight/Assign^weight_1/Assign^weight_2/Assign^weight_3/Assign^weight_4/Assign^weight_5/Assign^weight_6/Assign^weight_7/Assign
S
Placeholder_16Placeholder*
dtype0*
_output_shapes
:*
shape:
S
Placeholder_17Placeholder*
dtype0*
_output_shapes
:*
shape:
_
random_normal_8/shapeConst*
valueB:*
dtype0*
_output_shapes
:
Y
random_normal_8/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
random_normal_8/stddevConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Ю
$random_normal_8/RandomStandardNormalRandomStandardNormalrandom_normal_8/shape*
T0*
dtype0*
_output_shapes
:*
seed2 *

seed 
}
random_normal_8/mulMul$random_normal_8/RandomStandardNormalrandom_normal_8/stddev*
T0*
_output_shapes
:
f
random_normal_8Addrandom_normal_8/mulrandom_normal_8/mean*
T0*
_output_shapes
:
t
weight_8
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
Я
weight_8/AssignAssignweight_8random_normal_8*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@weight_8
e
weight_8/readIdentityweight_8*
T0*
_class
loc:@weight_8*
_output_shapes
:
T
zeros_8Const*
valueB*    *
dtype0*
_output_shapes
:
r
bias_8
VariableV2*
shared_name *
dtype0*
_output_shapes
:*
	container *
shape:
С
bias_8/AssignAssignbias_8zeros_8*
T0*
_class
loc:@bias_8*
validate_shape(*
_output_shapes
:*
use_locking(
_
bias_8/readIdentitybias_8*
_output_shapes
:*
T0*
_class
loc:@bias_8
N
Mul_8MulPlaceholder_16weight_8/read*
_output_shapes
:*
T0
C
add_8AddMul_8bias_8/read*
_output_shapes
:*
T0
F
sub_8SubPlaceholder_17add_8*
T0*
_output_shapes
:
<
Square_8Squaresub_8*
T0*
_output_shapes
:
9
Rank_8RankSquare_8*
_output_shapes
: *
T0
O
range_8/startConst*
value	B : *
dtype0*
_output_shapes
: 
O
range_8/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
g
range_8Rangerange_8/startRank_8range_8/delta*#
_output_shapes
:€€€€€€€€€*

Tidx0
_
Mean_8MeanSquare_8range_8*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
T
gradients_8/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
Z
gradients_8/grad_ys_0Const*
valueB
 *  А?*
dtype0*
_output_shapes
: 
u
gradients_8/FillFillgradients_8/Shapegradients_8/grad_ys_0*
T0*

index_type0*
_output_shapes
: 
n
gradients_8/Mean_8_grad/ShapeShapeSquare_8*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
¶
gradients_8/Mean_8_grad/SizeSizegradients_8/Mean_8_grad/Shape*
T0*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*
out_type0*
_output_shapes
: 
©
gradients_8/Mean_8_grad/addAddrange_8gradients_8/Mean_8_grad/Size*
T0*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*#
_output_shapes
:€€€€€€€€€
¬
gradients_8/Mean_8_grad/modFloorModgradients_8/Mean_8_grad/addgradients_8/Mean_8_grad/Size*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape
ђ
gradients_8/Mean_8_grad/Shape_1Shapegradients_8/Mean_8_grad/mod*
T0*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*
out_type0*
_output_shapes
:
Ч
#gradients_8/Mean_8_grad/range/startConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*
value	B : 
Ч
#gradients_8/Mean_8_grad/range/deltaConst*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
с
gradients_8/Mean_8_grad/rangeRange#gradients_8/Mean_8_grad/range/startgradients_8/Mean_8_grad/Size#gradients_8/Mean_8_grad/range/delta*

Tidx0*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ц
"gradients_8/Mean_8_grad/Fill/valueConst*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
џ
gradients_8/Mean_8_grad/FillFillgradients_8/Mean_8_grad/Shape_1"gradients_8/Mean_8_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*

index_type0*#
_output_shapes
:€€€€€€€€€
Ш
%gradients_8/Mean_8_grad/DynamicStitchDynamicStitchgradients_8/Mean_8_grad/rangegradients_8/Mean_8_grad/modgradients_8/Mean_8_grad/Shapegradients_8/Mean_8_grad/Fill*
T0*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*
N*#
_output_shapes
:€€€€€€€€€
Х
!gradients_8/Mean_8_grad/Maximum/yConst*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
‘
gradients_8/Mean_8_grad/MaximumMaximum%gradients_8/Mean_8_grad/DynamicStitch!gradients_8/Mean_8_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*#
_output_shapes
:€€€€€€€€€
ћ
 gradients_8/Mean_8_grad/floordivFloorDivgradients_8/Mean_8_grad/Shapegradients_8/Mean_8_grad/Maximum*
T0*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ф
gradients_8/Mean_8_grad/ReshapeReshapegradients_8/Fill%gradients_8/Mean_8_grad/DynamicStitch*
T0*
Tshape0*
_output_shapes
:
Ь
gradients_8/Mean_8_grad/TileTilegradients_8/Mean_8_grad/Reshape gradients_8/Mean_8_grad/floordiv*
T0*
_output_shapes
:*

Tmultiples0
p
gradients_8/Mean_8_grad/Shape_2ShapeSquare_8*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
b
gradients_8/Mean_8_grad/Shape_3Const*
valueB *
dtype0*
_output_shapes
: 
g
gradients_8/Mean_8_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:
Ґ
gradients_8/Mean_8_grad/ProdProdgradients_8/Mean_8_grad/Shape_2gradients_8/Mean_8_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
i
gradients_8/Mean_8_grad/Const_1Const*
dtype0*
_output_shapes
:*
valueB: 
¶
gradients_8/Mean_8_grad/Prod_1Prodgradients_8/Mean_8_grad/Shape_3gradients_8/Mean_8_grad/Const_1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
e
#gradients_8/Mean_8_grad/Maximum_1/yConst*
value	B :*
dtype0*
_output_shapes
: 
Т
!gradients_8/Mean_8_grad/Maximum_1Maximumgradients_8/Mean_8_grad/Prod_1#gradients_8/Mean_8_grad/Maximum_1/y*
_output_shapes
: *
T0
Р
"gradients_8/Mean_8_grad/floordiv_1FloorDivgradients_8/Mean_8_grad/Prod!gradients_8/Mean_8_grad/Maximum_1*
_output_shapes
: *
T0
x
gradients_8/Mean_8_grad/CastCast"gradients_8/Mean_8_grad/floordiv_1*

SrcT0*
_output_shapes
: *

DstT0
Й
gradients_8/Mean_8_grad/truedivRealDivgradients_8/Mean_8_grad/Tilegradients_8/Mean_8_grad/Cast*
_output_shapes
:*
T0
Ж
gradients_8/Square_8_grad/ConstConst ^gradients_8/Mean_8_grad/truediv*
dtype0*
_output_shapes
: *
valueB
 *   @
o
gradients_8/Square_8_grad/MulMulsub_8gradients_8/Square_8_grad/Const*
T0*
_output_shapes
:
Й
gradients_8/Square_8_grad/Mul_1Mulgradients_8/Mean_8_grad/truedivgradients_8/Square_8_grad/Mul*
T0*
_output_shapes
:
s
gradients_8/sub_8_grad/ShapeShapePlaceholder_17*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
l
gradients_8/sub_8_grad/Shape_1Shapeadd_8*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
ј
,gradients_8/sub_8_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_8/sub_8_grad/Shapegradients_8/sub_8_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
∞
gradients_8/sub_8_grad/SumSumgradients_8/Square_8_grad/Mul_1,gradients_8/sub_8_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_8/sub_8_grad/ReshapeReshapegradients_8/sub_8_grad/Sumgradients_8/sub_8_grad/Shape*
T0*
Tshape0*
_output_shapes
:
і
gradients_8/sub_8_grad/Sum_1Sumgradients_8/Square_8_grad/Mul_1.gradients_8/sub_8_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
b
gradients_8/sub_8_grad/NegNeggradients_8/sub_8_grad/Sum_1*
_output_shapes
:*
T0
Ш
 gradients_8/sub_8_grad/Reshape_1Reshapegradients_8/sub_8_grad/Neggradients_8/sub_8_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
s
'gradients_8/sub_8_grad/tuple/group_depsNoOp^gradients_8/sub_8_grad/Reshape!^gradients_8/sub_8_grad/Reshape_1
џ
/gradients_8/sub_8_grad/tuple/control_dependencyIdentitygradients_8/sub_8_grad/Reshape(^gradients_8/sub_8_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_8/sub_8_grad/Reshape*
_output_shapes
:
б
1gradients_8/sub_8_grad/tuple/control_dependency_1Identity gradients_8/sub_8_grad/Reshape_1(^gradients_8/sub_8_grad/tuple/group_deps*
_output_shapes
:*
T0*3
_class)
'%loc:@gradients_8/sub_8_grad/Reshape_1
j
gradients_8/add_8_grad/ShapeShapeMul_8*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_8/add_8_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
ј
,gradients_8/add_8_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_8/add_8_grad/Shapegradients_8/add_8_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
¬
gradients_8/add_8_grad/SumSum1gradients_8/sub_8_grad/tuple/control_dependency_1,gradients_8/add_8_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_8/add_8_grad/ReshapeReshapegradients_8/add_8_grad/Sumgradients_8/add_8_grad/Shape*
T0*
Tshape0*
_output_shapes
:
∆
gradients_8/add_8_grad/Sum_1Sum1gradients_8/sub_8_grad/tuple/control_dependency_1.gradients_8/add_8_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ь
 gradients_8/add_8_grad/Reshape_1Reshapegradients_8/add_8_grad/Sum_1gradients_8/add_8_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_8/add_8_grad/tuple/group_depsNoOp^gradients_8/add_8_grad/Reshape!^gradients_8/add_8_grad/Reshape_1
џ
/gradients_8/add_8_grad/tuple/control_dependencyIdentitygradients_8/add_8_grad/Reshape(^gradients_8/add_8_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_8/add_8_grad/Reshape*
_output_shapes
:
г
1gradients_8/add_8_grad/tuple/control_dependency_1Identity gradients_8/add_8_grad/Reshape_1(^gradients_8/add_8_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_8/add_8_grad/Reshape_1*
_output_shapes
:
s
gradients_8/Mul_8_grad/ShapeShapePlaceholder_16*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
h
gradients_8/Mul_8_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
ј
,gradients_8/Mul_8_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_8/Mul_8_grad/Shapegradients_8/Mul_8_grad/Shape_1*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€*
T0
Д
gradients_8/Mul_8_grad/MulMul/gradients_8/add_8_grad/tuple/control_dependencyweight_8/read*
T0*
_output_shapes
:
Ђ
gradients_8/Mul_8_grad/SumSumgradients_8/Mul_8_grad/Mul,gradients_8/Mul_8_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ф
gradients_8/Mul_8_grad/ReshapeReshapegradients_8/Mul_8_grad/Sumgradients_8/Mul_8_grad/Shape*
_output_shapes
:*
T0*
Tshape0
З
gradients_8/Mul_8_grad/Mul_1MulPlaceholder_16/gradients_8/add_8_grad/tuple/control_dependency*
T0*
_output_shapes
:
±
gradients_8/Mul_8_grad/Sum_1Sumgradients_8/Mul_8_grad/Mul_1.gradients_8/Mul_8_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ь
 gradients_8/Mul_8_grad/Reshape_1Reshapegradients_8/Mul_8_grad/Sum_1gradients_8/Mul_8_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_8/Mul_8_grad/tuple/group_depsNoOp^gradients_8/Mul_8_grad/Reshape!^gradients_8/Mul_8_grad/Reshape_1
џ
/gradients_8/Mul_8_grad/tuple/control_dependencyIdentitygradients_8/Mul_8_grad/Reshape(^gradients_8/Mul_8_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_8/Mul_8_grad/Reshape*
_output_shapes
:
г
1gradients_8/Mul_8_grad/tuple/control_dependency_1Identity gradients_8/Mul_8_grad/Reshape_1(^gradients_8/Mul_8_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_8/Mul_8_grad/Reshape_1*
_output_shapes
:
d
GradientDescent_8/learning_rateConst*
dtype0*
_output_shapes
: *
valueB
 *
„#<
Б
6GradientDescent_8/update_weight_8/ApplyGradientDescentApplyGradientDescentweight_8GradientDescent_8/learning_rate1gradients_8/Mul_8_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@weight_8*
_output_shapes
:
ы
4GradientDescent_8/update_bias_8/ApplyGradientDescentApplyGradientDescentbias_8GradientDescent_8/learning_rate1gradients_8/add_8_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@bias_8*
_output_shapes
:
Й
GradientDescent_8NoOp5^GradientDescent_8/update_bias_8/ApplyGradientDescent7^GradientDescent_8/update_weight_8/ApplyGradientDescent
Љ
init_8NoOp^bias/Assign^bias_1/Assign^bias_2/Assign^bias_3/Assign^bias_4/Assign^bias_5/Assign^bias_6/Assign^bias_7/Assign^bias_8/Assign^weight/Assign^weight_1/Assign^weight_2/Assign^weight_3/Assign^weight_4/Assign^weight_5/Assign^weight_6/Assign^weight_7/Assign^weight_8/Assign
P

save/ConstConst*
dtype0*
_output_shapes
: *
valueB Bmodel
А
save/SaveV2/tensor_namesConst*≥
value©B¶BbiasBbias_1Bbias_2Bbias_3Bbias_4Bbias_5Bbias_6Bbias_7Bbias_8BweightBweight_1Bweight_2Bweight_3Bweight_4Bweight_5Bweight_6Bweight_7Bweight_8*
dtype0*
_output_shapes
:
З
save/SaveV2/shape_and_slicesConst*7
value.B,B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
Щ
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesbiasbias_1bias_2bias_3bias_4bias_5bias_6bias_7bias_8weightweight_1weight_2weight_3weight_4weight_5weight_6weight_7weight_8* 
dtypes
2
}
save/control_dependencyIdentity
save/Const^save/SaveV2*
T0*
_class
loc:@save/Const*
_output_shapes
: 
Т
save/RestoreV2/tensor_namesConst"/device:CPU:0*≥
value©B¶BbiasBbias_1Bbias_2Bbias_3Bbias_4Bbias_5Bbias_6Bbias_7Bbias_8BweightBweight_1Bweight_2Bweight_3Bweight_4Bweight_5Bweight_6Bweight_7Bweight_8*
dtype0*
_output_shapes
:
Щ
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*7
value.B,B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
ф
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*\
_output_shapesJ
H::::::::::::::::::* 
dtypes
2
Т
save/AssignAssignbiassave/RestoreV2*
use_locking(*
T0*
_class
	loc:@bias*
validate_shape(*
_output_shapes
:
Ъ
save/Assign_1Assignbias_1save/RestoreV2:1*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@bias_1
Ъ
save/Assign_2Assignbias_2save/RestoreV2:2*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@bias_2
Ъ
save/Assign_3Assignbias_3save/RestoreV2:3*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@bias_3
Ъ
save/Assign_4Assignbias_4save/RestoreV2:4*
T0*
_class
loc:@bias_4*
validate_shape(*
_output_shapes
:*
use_locking(
Ъ
save/Assign_5Assignbias_5save/RestoreV2:5*
use_locking(*
T0*
_class
loc:@bias_5*
validate_shape(*
_output_shapes
:
Ъ
save/Assign_6Assignbias_6save/RestoreV2:6*
use_locking(*
T0*
_class
loc:@bias_6*
validate_shape(*
_output_shapes
:
Ъ
save/Assign_7Assignbias_7save/RestoreV2:7*
T0*
_class
loc:@bias_7*
validate_shape(*
_output_shapes
:*
use_locking(
Ъ
save/Assign_8Assignbias_8save/RestoreV2:8*
T0*
_class
loc:@bias_8*
validate_shape(*
_output_shapes
:*
use_locking(
Ъ
save/Assign_9Assignweightsave/RestoreV2:9*
use_locking(*
T0*
_class
loc:@weight*
validate_shape(*
_output_shapes
:
†
save/Assign_10Assignweight_1save/RestoreV2:10*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@weight_1
†
save/Assign_11Assignweight_2save/RestoreV2:11*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@weight_2
†
save/Assign_12Assignweight_3save/RestoreV2:12*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@weight_3
†
save/Assign_13Assignweight_4save/RestoreV2:13*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@weight_4
†
save/Assign_14Assignweight_5save/RestoreV2:14*
use_locking(*
T0*
_class
loc:@weight_5*
validate_shape(*
_output_shapes
:
†
save/Assign_15Assignweight_6save/RestoreV2:15*
use_locking(*
T0*
_class
loc:@weight_6*
validate_shape(*
_output_shapes
:
†
save/Assign_16Assignweight_7save/RestoreV2:16*
use_locking(*
T0*
_class
loc:@weight_7*
validate_shape(*
_output_shapes
:
†
save/Assign_17Assignweight_8save/RestoreV2:17*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@weight_8
Њ
save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9
S
Placeholder_18Placeholder*
dtype0*
_output_shapes
:*
shape:
S
Placeholder_19Placeholder*
dtype0*
_output_shapes
:*
shape:
_
random_normal_9/shapeConst*
valueB:*
dtype0*
_output_shapes
:
Y
random_normal_9/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
random_normal_9/stddevConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Ю
$random_normal_9/RandomStandardNormalRandomStandardNormalrandom_normal_9/shape*
T0*
dtype0*
_output_shapes
:*
seed2 *

seed 
}
random_normal_9/mulMul$random_normal_9/RandomStandardNormalrandom_normal_9/stddev*
T0*
_output_shapes
:
f
random_normal_9Addrandom_normal_9/mulrandom_normal_9/mean*
T0*
_output_shapes
:
t
weight_9
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
Я
weight_9/AssignAssignweight_9random_normal_9*
use_locking(*
T0*
_class
loc:@weight_9*
validate_shape(*
_output_shapes
:
e
weight_9/readIdentityweight_9*
T0*
_class
loc:@weight_9*
_output_shapes
:
T
zeros_9Const*
valueB*    *
dtype0*
_output_shapes
:
r
bias_9
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
С
bias_9/AssignAssignbias_9zeros_9*
T0*
_class
loc:@bias_9*
validate_shape(*
_output_shapes
:*
use_locking(
_
bias_9/readIdentitybias_9*
_output_shapes
:*
T0*
_class
loc:@bias_9
N
Mul_9MulPlaceholder_18weight_9/read*
T0*
_output_shapes
:
C
add_9AddMul_9bias_9/read*
T0*
_output_shapes
:
G
z/tagConst*
value	B Bz*
dtype0*
_output_shapes
: 
D
zHistogramSummaryz/tagadd_9*
T0*
_output_shapes
: 
F
sub_9SubPlaceholder_19add_9*
T0*
_output_shapes
:
<
Square_9Squaresub_9*
_output_shapes
:*
T0
9
Rank_9RankSquare_9*
T0*
_output_shapes
: 
O
range_9/startConst*
value	B : *
dtype0*
_output_shapes
: 
O
range_9/deltaConst*
dtype0*
_output_shapes
: *
value	B :
g
range_9Rangerange_9/startRank_9range_9/delta*#
_output_shapes
:€€€€€€€€€*

Tidx0
_
Mean_9MeanSquare_9range_9*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
`
loss_function/tagsConst*
valueB Bloss_function*
dtype0*
_output_shapes
: 
[
loss_functionScalarSummaryloss_function/tagsMean_9*
T0*
_output_shapes
: 
T
gradients_9/ShapeConst*
dtype0*
_output_shapes
: *
valueB 
Z
gradients_9/grad_ys_0Const*
valueB
 *  А?*
dtype0*
_output_shapes
: 
u
gradients_9/FillFillgradients_9/Shapegradients_9/grad_ys_0*
T0*

index_type0*
_output_shapes
: 
n
gradients_9/Mean_9_grad/ShapeShapeSquare_9*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
¶
gradients_9/Mean_9_grad/SizeSizegradients_9/Mean_9_grad/Shape*
_output_shapes
: *
T0*0
_class&
$"loc:@gradients_9/Mean_9_grad/Shape*
out_type0
©
gradients_9/Mean_9_grad/addAddrange_9gradients_9/Mean_9_grad/Size*
T0*0
_class&
$"loc:@gradients_9/Mean_9_grad/Shape*#
_output_shapes
:€€€€€€€€€
¬
gradients_9/Mean_9_grad/modFloorModgradients_9/Mean_9_grad/addgradients_9/Mean_9_grad/Size*
T0*0
_class&
$"loc:@gradients_9/Mean_9_grad/Shape*#
_output_shapes
:€€€€€€€€€
ђ
gradients_9/Mean_9_grad/Shape_1Shapegradients_9/Mean_9_grad/mod*
T0*0
_class&
$"loc:@gradients_9/Mean_9_grad/Shape*
out_type0*
_output_shapes
:
Ч
#gradients_9/Mean_9_grad/range/startConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@gradients_9/Mean_9_grad/Shape*
value	B : 
Ч
#gradients_9/Mean_9_grad/range/deltaConst*0
_class&
$"loc:@gradients_9/Mean_9_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
с
gradients_9/Mean_9_grad/rangeRange#gradients_9/Mean_9_grad/range/startgradients_9/Mean_9_grad/Size#gradients_9/Mean_9_grad/range/delta*

Tidx0*0
_class&
$"loc:@gradients_9/Mean_9_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ц
"gradients_9/Mean_9_grad/Fill/valueConst*0
_class&
$"loc:@gradients_9/Mean_9_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
џ
gradients_9/Mean_9_grad/FillFillgradients_9/Mean_9_grad/Shape_1"gradients_9/Mean_9_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_9/Mean_9_grad/Shape*

index_type0*#
_output_shapes
:€€€€€€€€€
Ш
%gradients_9/Mean_9_grad/DynamicStitchDynamicStitchgradients_9/Mean_9_grad/rangegradients_9/Mean_9_grad/modgradients_9/Mean_9_grad/Shapegradients_9/Mean_9_grad/Fill*
T0*0
_class&
$"loc:@gradients_9/Mean_9_grad/Shape*
N*#
_output_shapes
:€€€€€€€€€
Х
!gradients_9/Mean_9_grad/Maximum/yConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@gradients_9/Mean_9_grad/Shape*
value	B :
‘
gradients_9/Mean_9_grad/MaximumMaximum%gradients_9/Mean_9_grad/DynamicStitch!gradients_9/Mean_9_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_9/Mean_9_grad/Shape*#
_output_shapes
:€€€€€€€€€
ћ
 gradients_9/Mean_9_grad/floordivFloorDivgradients_9/Mean_9_grad/Shapegradients_9/Mean_9_grad/Maximum*
T0*0
_class&
$"loc:@gradients_9/Mean_9_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ф
gradients_9/Mean_9_grad/ReshapeReshapegradients_9/Fill%gradients_9/Mean_9_grad/DynamicStitch*
_output_shapes
:*
T0*
Tshape0
Ь
gradients_9/Mean_9_grad/TileTilegradients_9/Mean_9_grad/Reshape gradients_9/Mean_9_grad/floordiv*
T0*
_output_shapes
:*

Tmultiples0
p
gradients_9/Mean_9_grad/Shape_2ShapeSquare_9*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
b
gradients_9/Mean_9_grad/Shape_3Const*
dtype0*
_output_shapes
: *
valueB 
g
gradients_9/Mean_9_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:
Ґ
gradients_9/Mean_9_grad/ProdProdgradients_9/Mean_9_grad/Shape_2gradients_9/Mean_9_grad/Const*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
i
gradients_9/Mean_9_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
¶
gradients_9/Mean_9_grad/Prod_1Prodgradients_9/Mean_9_grad/Shape_3gradients_9/Mean_9_grad/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
e
#gradients_9/Mean_9_grad/Maximum_1/yConst*
dtype0*
_output_shapes
: *
value	B :
Т
!gradients_9/Mean_9_grad/Maximum_1Maximumgradients_9/Mean_9_grad/Prod_1#gradients_9/Mean_9_grad/Maximum_1/y*
T0*
_output_shapes
: 
Р
"gradients_9/Mean_9_grad/floordiv_1FloorDivgradients_9/Mean_9_grad/Prod!gradients_9/Mean_9_grad/Maximum_1*
_output_shapes
: *
T0
x
gradients_9/Mean_9_grad/CastCast"gradients_9/Mean_9_grad/floordiv_1*

SrcT0*
_output_shapes
: *

DstT0
Й
gradients_9/Mean_9_grad/truedivRealDivgradients_9/Mean_9_grad/Tilegradients_9/Mean_9_grad/Cast*
T0*
_output_shapes
:
Ж
gradients_9/Square_9_grad/ConstConst ^gradients_9/Mean_9_grad/truediv*
valueB
 *   @*
dtype0*
_output_shapes
: 
o
gradients_9/Square_9_grad/MulMulsub_9gradients_9/Square_9_grad/Const*
T0*
_output_shapes
:
Й
gradients_9/Square_9_grad/Mul_1Mulgradients_9/Mean_9_grad/truedivgradients_9/Square_9_grad/Mul*
T0*
_output_shapes
:
s
gradients_9/sub_9_grad/ShapeShapePlaceholder_19*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
l
gradients_9/sub_9_grad/Shape_1Shapeadd_9*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
ј
,gradients_9/sub_9_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_9/sub_9_grad/Shapegradients_9/sub_9_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
∞
gradients_9/sub_9_grad/SumSumgradients_9/Square_9_grad/Mul_1,gradients_9/sub_9_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_9/sub_9_grad/ReshapeReshapegradients_9/sub_9_grad/Sumgradients_9/sub_9_grad/Shape*
T0*
Tshape0*
_output_shapes
:
і
gradients_9/sub_9_grad/Sum_1Sumgradients_9/Square_9_grad/Mul_1.gradients_9/sub_9_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
b
gradients_9/sub_9_grad/NegNeggradients_9/sub_9_grad/Sum_1*
_output_shapes
:*
T0
Ш
 gradients_9/sub_9_grad/Reshape_1Reshapegradients_9/sub_9_grad/Neggradients_9/sub_9_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_9/sub_9_grad/tuple/group_depsNoOp^gradients_9/sub_9_grad/Reshape!^gradients_9/sub_9_grad/Reshape_1
џ
/gradients_9/sub_9_grad/tuple/control_dependencyIdentitygradients_9/sub_9_grad/Reshape(^gradients_9/sub_9_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_9/sub_9_grad/Reshape*
_output_shapes
:
б
1gradients_9/sub_9_grad/tuple/control_dependency_1Identity gradients_9/sub_9_grad/Reshape_1(^gradients_9/sub_9_grad/tuple/group_deps*
_output_shapes
:*
T0*3
_class)
'%loc:@gradients_9/sub_9_grad/Reshape_1
j
gradients_9/add_9_grad/ShapeShapeMul_9*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_9/add_9_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_9/add_9_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_9/add_9_grad/Shapegradients_9/add_9_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
¬
gradients_9/add_9_grad/SumSum1gradients_9/sub_9_grad/tuple/control_dependency_1,gradients_9/add_9_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_9/add_9_grad/ReshapeReshapegradients_9/add_9_grad/Sumgradients_9/add_9_grad/Shape*
_output_shapes
:*
T0*
Tshape0
∆
gradients_9/add_9_grad/Sum_1Sum1gradients_9/sub_9_grad/tuple/control_dependency_1.gradients_9/add_9_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ь
 gradients_9/add_9_grad/Reshape_1Reshapegradients_9/add_9_grad/Sum_1gradients_9/add_9_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_9/add_9_grad/tuple/group_depsNoOp^gradients_9/add_9_grad/Reshape!^gradients_9/add_9_grad/Reshape_1
џ
/gradients_9/add_9_grad/tuple/control_dependencyIdentitygradients_9/add_9_grad/Reshape(^gradients_9/add_9_grad/tuple/group_deps*
_output_shapes
:*
T0*1
_class'
%#loc:@gradients_9/add_9_grad/Reshape
г
1gradients_9/add_9_grad/tuple/control_dependency_1Identity gradients_9/add_9_grad/Reshape_1(^gradients_9/add_9_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_9/add_9_grad/Reshape_1*
_output_shapes
:
s
gradients_9/Mul_9_grad/ShapeShapePlaceholder_18*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_9/Mul_9_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_9/Mul_9_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_9/Mul_9_grad/Shapegradients_9/Mul_9_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Д
gradients_9/Mul_9_grad/MulMul/gradients_9/add_9_grad/tuple/control_dependencyweight_9/read*
T0*
_output_shapes
:
Ђ
gradients_9/Mul_9_grad/SumSumgradients_9/Mul_9_grad/Mul,gradients_9/Mul_9_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ф
gradients_9/Mul_9_grad/ReshapeReshapegradients_9/Mul_9_grad/Sumgradients_9/Mul_9_grad/Shape*
_output_shapes
:*
T0*
Tshape0
З
gradients_9/Mul_9_grad/Mul_1MulPlaceholder_18/gradients_9/add_9_grad/tuple/control_dependency*
T0*
_output_shapes
:
±
gradients_9/Mul_9_grad/Sum_1Sumgradients_9/Mul_9_grad/Mul_1.gradients_9/Mul_9_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ь
 gradients_9/Mul_9_grad/Reshape_1Reshapegradients_9/Mul_9_grad/Sum_1gradients_9/Mul_9_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_9/Mul_9_grad/tuple/group_depsNoOp^gradients_9/Mul_9_grad/Reshape!^gradients_9/Mul_9_grad/Reshape_1
џ
/gradients_9/Mul_9_grad/tuple/control_dependencyIdentitygradients_9/Mul_9_grad/Reshape(^gradients_9/Mul_9_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_9/Mul_9_grad/Reshape*
_output_shapes
:
г
1gradients_9/Mul_9_grad/tuple/control_dependency_1Identity gradients_9/Mul_9_grad/Reshape_1(^gradients_9/Mul_9_grad/tuple/group_deps*
_output_shapes
:*
T0*3
_class)
'%loc:@gradients_9/Mul_9_grad/Reshape_1
d
GradientDescent_9/learning_rateConst*
dtype0*
_output_shapes
: *
valueB
 *
„#<
Б
6GradientDescent_9/update_weight_9/ApplyGradientDescentApplyGradientDescentweight_9GradientDescent_9/learning_rate1gradients_9/Mul_9_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@weight_9*
_output_shapes
:
ы
4GradientDescent_9/update_bias_9/ApplyGradientDescentApplyGradientDescentbias_9GradientDescent_9/learning_rate1gradients_9/add_9_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@bias_9*
_output_shapes
:
Й
GradientDescent_9NoOp5^GradientDescent_9/update_bias_9/ApplyGradientDescent7^GradientDescent_9/update_weight_9/ApplyGradientDescent
ё
init_9NoOp^bias/Assign^bias_1/Assign^bias_2/Assign^bias_3/Assign^bias_4/Assign^bias_5/Assign^bias_6/Assign^bias_7/Assign^bias_8/Assign^bias_9/Assign^weight/Assign^weight_1/Assign^weight_2/Assign^weight_3/Assign^weight_4/Assign^weight_5/Assign^weight_6/Assign^weight_7/Assign^weight_8/Assign^weight_9/Assign
R
save_1/ConstConst*
dtype0*
_output_shapes
: *
valueB Bmodel
Ф
save_1/SaveV2/tensor_namesConst*
dtype0*
_output_shapes
:*≈
valueїBЄBbiasBbias_1Bbias_2Bbias_3Bbias_4Bbias_5Bbias_6Bbias_7Bbias_8Bbias_9BweightBweight_1Bweight_2Bweight_3Bweight_4Bweight_5Bweight_6Bweight_7Bweight_8Bweight_9
Н
save_1/SaveV2/shape_and_slicesConst*
dtype0*
_output_shapes
:*;
value2B0B B B B B B B B B B B B B B B B B B B B 
µ
save_1/SaveV2SaveV2save_1/Constsave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slicesbiasbias_1bias_2bias_3bias_4bias_5bias_6bias_7bias_8bias_9weightweight_1weight_2weight_3weight_4weight_5weight_6weight_7weight_8weight_9*"
dtypes
2
Е
save_1/control_dependencyIdentitysave_1/Const^save_1/SaveV2*
T0*
_class
loc:@save_1/Const*
_output_shapes
: 
¶
save_1/RestoreV2/tensor_namesConst"/device:CPU:0*≈
valueїBЄBbiasBbias_1Bbias_2Bbias_3Bbias_4Bbias_5Bbias_6Bbias_7Bbias_8Bbias_9BweightBweight_1Bweight_2Bweight_3Bweight_4Bweight_5Bweight_6Bweight_7Bweight_8Bweight_9*
dtype0*
_output_shapes
:
Я
!save_1/RestoreV2/shape_and_slicesConst"/device:CPU:0*;
value2B0B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
Ж
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices"/device:CPU:0*d
_output_shapesR
P::::::::::::::::::::*"
dtypes
2
Ц
save_1/AssignAssignbiassave_1/RestoreV2*
use_locking(*
T0*
_class
	loc:@bias*
validate_shape(*
_output_shapes
:
Ю
save_1/Assign_1Assignbias_1save_1/RestoreV2:1*
T0*
_class
loc:@bias_1*
validate_shape(*
_output_shapes
:*
use_locking(
Ю
save_1/Assign_2Assignbias_2save_1/RestoreV2:2*
use_locking(*
T0*
_class
loc:@bias_2*
validate_shape(*
_output_shapes
:
Ю
save_1/Assign_3Assignbias_3save_1/RestoreV2:3*
T0*
_class
loc:@bias_3*
validate_shape(*
_output_shapes
:*
use_locking(
Ю
save_1/Assign_4Assignbias_4save_1/RestoreV2:4*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@bias_4
Ю
save_1/Assign_5Assignbias_5save_1/RestoreV2:5*
T0*
_class
loc:@bias_5*
validate_shape(*
_output_shapes
:*
use_locking(
Ю
save_1/Assign_6Assignbias_6save_1/RestoreV2:6*
use_locking(*
T0*
_class
loc:@bias_6*
validate_shape(*
_output_shapes
:
Ю
save_1/Assign_7Assignbias_7save_1/RestoreV2:7*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@bias_7
Ю
save_1/Assign_8Assignbias_8save_1/RestoreV2:8*
use_locking(*
T0*
_class
loc:@bias_8*
validate_shape(*
_output_shapes
:
Ю
save_1/Assign_9Assignbias_9save_1/RestoreV2:9*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@bias_9
†
save_1/Assign_10Assignweightsave_1/RestoreV2:10*
use_locking(*
T0*
_class
loc:@weight*
validate_shape(*
_output_shapes
:
§
save_1/Assign_11Assignweight_1save_1/RestoreV2:11*
use_locking(*
T0*
_class
loc:@weight_1*
validate_shape(*
_output_shapes
:
§
save_1/Assign_12Assignweight_2save_1/RestoreV2:12*
T0*
_class
loc:@weight_2*
validate_shape(*
_output_shapes
:*
use_locking(
§
save_1/Assign_13Assignweight_3save_1/RestoreV2:13*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@weight_3
§
save_1/Assign_14Assignweight_4save_1/RestoreV2:14*
use_locking(*
T0*
_class
loc:@weight_4*
validate_shape(*
_output_shapes
:
§
save_1/Assign_15Assignweight_5save_1/RestoreV2:15*
T0*
_class
loc:@weight_5*
validate_shape(*
_output_shapes
:*
use_locking(
§
save_1/Assign_16Assignweight_6save_1/RestoreV2:16*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@weight_6
§
save_1/Assign_17Assignweight_7save_1/RestoreV2:17*
T0*
_class
loc:@weight_7*
validate_shape(*
_output_shapes
:*
use_locking(
§
save_1/Assign_18Assignweight_8save_1/RestoreV2:18*
use_locking(*
T0*
_class
loc:@weight_8*
validate_shape(*
_output_shapes
:
§
save_1/Assign_19Assignweight_9save_1/RestoreV2:19*
use_locking(*
T0*
_class
loc:@weight_9*
validate_shape(*
_output_shapes
:
К
save_1/restore_allNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_10^save_1/Assign_11^save_1/Assign_12^save_1/Assign_13^save_1/Assign_14^save_1/Assign_15^save_1/Assign_16^save_1/Assign_17^save_1/Assign_18^save_1/Assign_19^save_1/Assign_2^save_1/Assign_3^save_1/Assign_4^save_1/Assign_5^save_1/Assign_6^save_1/Assign_7^save_1/Assign_8^save_1/Assign_9
U
Merge/MergeSummaryMergeSummaryzloss_function*
N*
_output_shapes
: "m©GT     ї‘hk	Ю
ЙгДб÷AJЇ®	
Пп
:
Add
x"T
y"T
z"T"
Ttype:
2	
Г
ApplyGradientDescent
var"TА

alpha"T

delta"T
out"TА" 
Ttype:
2	"
use_lockingbool( 
x
Assign
ref"TА

value"T

output_ref"TА"	
Ttype"
validate_shapebool("
use_lockingbool(Ш
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
8
Const
output"dtype"
valuetensor"
dtypetype
S
DynamicStitch
indices*N
data"T*N
merged"T"
Nint(0"	
Ttype
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
?
FloorDiv
x"T
y"T
z"T"
Ttype:
2	
9
FloorMod
x"T
y"T
z"T"
Ttype:

2	
V
HistogramSummary
tag
values"T
summary"
Ttype0:
2	
.
Identity

input"T
output"T"	
Ttype
;
Maximum
x"T
y"T
z"T"
Ttype:

2	Р
Н
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
8
MergeSummary
inputs*N
summary"
Nint(0
=
Mul
x"T
y"T
z"T"
Ttype:
2	Р
.
Neg
x"T
y"T"
Ttype:

2	

NoOp
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
Н
Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
Е
RandomStandardNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	И
a
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:	
2	
)
Rank

input"T

output"	
Ttype
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
P
ScalarSummary
tags
values"T
summary"
Ttype:
2	
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
O
Size

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
1
Square
x"T
y"T"
Ttype:

2	
:
Sub
x"T
y"T
z"T"
Ttype:
2	
М
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
s

VariableV2
ref"dtypeА"
shapeshape"
dtypetype"
	containerstring "
shared_namestring И*1.9.02v1.9.0-0-g25c197e023мы
P
PlaceholderPlaceholder*
dtype0*
_output_shapes
:*
shape:
R
Placeholder_1Placeholder*
dtype0*
_output_shapes
:*
shape:
]
random_normal/shapeConst*
valueB:*
dtype0*
_output_shapes
:
W
random_normal/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Y
random_normal/stddevConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Ъ
"random_normal/RandomStandardNormalRandomStandardNormalrandom_normal/shape*
dtype0*
_output_shapes
:*
seed2 *

seed *
T0
w
random_normal/mulMul"random_normal/RandomStandardNormalrandom_normal/stddev*
T0*
_output_shapes
:
`
random_normalAddrandom_normal/mulrandom_normal/mean*
T0*
_output_shapes
:
r
weight
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
Ч
weight/AssignAssignweightrandom_normal*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@weight
_
weight/readIdentityweight*
T0*
_class
loc:@weight*
_output_shapes
:
R
zerosConst*
valueB*    *
dtype0*
_output_shapes
:
p
bias
VariableV2*
shared_name *
dtype0*
_output_shapes
:*
	container *
shape:
Й
bias/AssignAssignbiaszeros*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
	loc:@bias
Y
	bias/readIdentitybias*
T0*
_class
	loc:@bias*
_output_shapes
:
G
MulMulPlaceholderweight/read*
_output_shapes
:*
T0
=
addAddMul	bias/read*
T0*
_output_shapes
:
A
subSubPlaceholder_1add*
T0*
_output_shapes
:
8
SquareSquaresub*
T0*
_output_shapes
:
5
RankRankSquare*
_output_shapes
: *
T0
M
range/startConst*
dtype0*
_output_shapes
: *
value	B : 
M
range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
_
rangeRangerange/startRankrange/delta*#
_output_shapes
:€€€€€€€€€*

Tidx0
Y
MeanMeanSquarerange*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
R
gradients/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
X
gradients/grad_ys_0Const*
valueB
 *  А?*
dtype0*
_output_shapes
: 
o
gradients/FillFillgradients/Shapegradients/grad_ys_0*
_output_shapes
: *
T0*

index_type0
h
gradients/Mean_grad/ShapeShapeSquare*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
Ъ
gradients/Mean_grad/SizeSizegradients/Mean_grad/Shape*
_output_shapes
: *
T0*,
_class"
 loc:@gradients/Mean_grad/Shape*
out_type0
Ы
gradients/Mean_grad/addAddrangegradients/Mean_grad/Size*
T0*,
_class"
 loc:@gradients/Mean_grad/Shape*#
_output_shapes
:€€€€€€€€€
≤
gradients/Mean_grad/modFloorModgradients/Mean_grad/addgradients/Mean_grad/Size*
T0*,
_class"
 loc:@gradients/Mean_grad/Shape*#
_output_shapes
:€€€€€€€€€
†
gradients/Mean_grad/Shape_1Shapegradients/Mean_grad/mod*
T0*,
_class"
 loc:@gradients/Mean_grad/Shape*
out_type0*
_output_shapes
:
П
gradients/Mean_grad/range/startConst*,
_class"
 loc:@gradients/Mean_grad/Shape*
value	B : *
dtype0*
_output_shapes
: 
П
gradients/Mean_grad/range/deltaConst*,
_class"
 loc:@gradients/Mean_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
Ё
gradients/Mean_grad/rangeRangegradients/Mean_grad/range/startgradients/Mean_grad/Sizegradients/Mean_grad/range/delta*,
_class"
 loc:@gradients/Mean_grad/Shape*#
_output_shapes
:€€€€€€€€€*

Tidx0
О
gradients/Mean_grad/Fill/valueConst*,
_class"
 loc:@gradients/Mean_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
Ћ
gradients/Mean_grad/FillFillgradients/Mean_grad/Shape_1gradients/Mean_grad/Fill/value*
T0*,
_class"
 loc:@gradients/Mean_grad/Shape*

index_type0*#
_output_shapes
:€€€€€€€€€
А
!gradients/Mean_grad/DynamicStitchDynamicStitchgradients/Mean_grad/rangegradients/Mean_grad/modgradients/Mean_grad/Shapegradients/Mean_grad/Fill*
T0*,
_class"
 loc:@gradients/Mean_grad/Shape*
N*#
_output_shapes
:€€€€€€€€€
Н
gradients/Mean_grad/Maximum/yConst*,
_class"
 loc:@gradients/Mean_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
ƒ
gradients/Mean_grad/MaximumMaximum!gradients/Mean_grad/DynamicStitchgradients/Mean_grad/Maximum/y*
T0*,
_class"
 loc:@gradients/Mean_grad/Shape*#
_output_shapes
:€€€€€€€€€
Љ
gradients/Mean_grad/floordivFloorDivgradients/Mean_grad/Shapegradients/Mean_grad/Maximum*
T0*,
_class"
 loc:@gradients/Mean_grad/Shape*#
_output_shapes
:€€€€€€€€€
К
gradients/Mean_grad/ReshapeReshapegradients/Fill!gradients/Mean_grad/DynamicStitch*
T0*
Tshape0*
_output_shapes
:
Р
gradients/Mean_grad/TileTilegradients/Mean_grad/Reshapegradients/Mean_grad/floordiv*
T0*
_output_shapes
:*

Tmultiples0
j
gradients/Mean_grad/Shape_2ShapeSquare*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
^
gradients/Mean_grad/Shape_3Const*
dtype0*
_output_shapes
: *
valueB 
c
gradients/Mean_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:
Ц
gradients/Mean_grad/ProdProdgradients/Mean_grad/Shape_2gradients/Mean_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
e
gradients/Mean_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
Ъ
gradients/Mean_grad/Prod_1Prodgradients/Mean_grad/Shape_3gradients/Mean_grad/Const_1*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
a
gradients/Mean_grad/Maximum_1/yConst*
value	B :*
dtype0*
_output_shapes
: 
Ж
gradients/Mean_grad/Maximum_1Maximumgradients/Mean_grad/Prod_1gradients/Mean_grad/Maximum_1/y*
T0*
_output_shapes
: 
Д
gradients/Mean_grad/floordiv_1FloorDivgradients/Mean_grad/Prodgradients/Mean_grad/Maximum_1*
_output_shapes
: *
T0
p
gradients/Mean_grad/CastCastgradients/Mean_grad/floordiv_1*

SrcT0*
_output_shapes
: *

DstT0
}
gradients/Mean_grad/truedivRealDivgradients/Mean_grad/Tilegradients/Mean_grad/Cast*
T0*
_output_shapes
:
~
gradients/Square_grad/ConstConst^gradients/Mean_grad/truediv*
valueB
 *   @*
dtype0*
_output_shapes
: 
e
gradients/Square_grad/MulMulsubgradients/Square_grad/Const*
T0*
_output_shapes
:
}
gradients/Square_grad/Mul_1Mulgradients/Mean_grad/truedivgradients/Square_grad/Mul*
T0*
_output_shapes
:
n
gradients/sub_grad/ShapeShapePlaceholder_1*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
f
gradients/sub_grad/Shape_1Shapeadd*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
і
(gradients/sub_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_grad/Shapegradients/sub_grad/Shape_1*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€*
T0
§
gradients/sub_grad/SumSumgradients/Square_grad/Mul_1(gradients/sub_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
И
gradients/sub_grad/ReshapeReshapegradients/sub_grad/Sumgradients/sub_grad/Shape*
T0*
Tshape0*
_output_shapes
:
®
gradients/sub_grad/Sum_1Sumgradients/Square_grad/Mul_1*gradients/sub_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Z
gradients/sub_grad/NegNeggradients/sub_grad/Sum_1*
T0*
_output_shapes
:
М
gradients/sub_grad/Reshape_1Reshapegradients/sub_grad/Neggradients/sub_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
g
#gradients/sub_grad/tuple/group_depsNoOp^gradients/sub_grad/Reshape^gradients/sub_grad/Reshape_1
Ћ
+gradients/sub_grad/tuple/control_dependencyIdentitygradients/sub_grad/Reshape$^gradients/sub_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/sub_grad/Reshape*
_output_shapes
:
—
-gradients/sub_grad/tuple/control_dependency_1Identitygradients/sub_grad/Reshape_1$^gradients/sub_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/sub_grad/Reshape_1*
_output_shapes
:
d
gradients/add_grad/ShapeShapeMul*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
d
gradients/add_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
і
(gradients/add_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_grad/Shapegradients/add_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
ґ
gradients/add_grad/SumSum-gradients/sub_grad/tuple/control_dependency_1(gradients/add_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
И
gradients/add_grad/ReshapeReshapegradients/add_grad/Sumgradients/add_grad/Shape*
T0*
Tshape0*
_output_shapes
:
Ї
gradients/add_grad/Sum_1Sum-gradients/sub_grad/tuple/control_dependency_1*gradients/add_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Р
gradients/add_grad/Reshape_1Reshapegradients/add_grad/Sum_1gradients/add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
g
#gradients/add_grad/tuple/group_depsNoOp^gradients/add_grad/Reshape^gradients/add_grad/Reshape_1
Ћ
+gradients/add_grad/tuple/control_dependencyIdentitygradients/add_grad/Reshape$^gradients/add_grad/tuple/group_deps*
_output_shapes
:*
T0*-
_class#
!loc:@gradients/add_grad/Reshape
”
-gradients/add_grad/tuple/control_dependency_1Identitygradients/add_grad/Reshape_1$^gradients/add_grad/tuple/group_deps*
_output_shapes
:*
T0*/
_class%
#!loc:@gradients/add_grad/Reshape_1
l
gradients/Mul_grad/ShapeShapePlaceholder*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
d
gradients/Mul_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
і
(gradients/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/Mul_grad/Shapegradients/Mul_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
z
gradients/Mul_grad/MulMul+gradients/add_grad/tuple/control_dependencyweight/read*
_output_shapes
:*
T0
Я
gradients/Mul_grad/SumSumgradients/Mul_grad/Mul(gradients/Mul_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
И
gradients/Mul_grad/ReshapeReshapegradients/Mul_grad/Sumgradients/Mul_grad/Shape*
T0*
Tshape0*
_output_shapes
:
|
gradients/Mul_grad/Mul_1MulPlaceholder+gradients/add_grad/tuple/control_dependency*
_output_shapes
:*
T0
•
gradients/Mul_grad/Sum_1Sumgradients/Mul_grad/Mul_1*gradients/Mul_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Р
gradients/Mul_grad/Reshape_1Reshapegradients/Mul_grad/Sum_1gradients/Mul_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
g
#gradients/Mul_grad/tuple/group_depsNoOp^gradients/Mul_grad/Reshape^gradients/Mul_grad/Reshape_1
Ћ
+gradients/Mul_grad/tuple/control_dependencyIdentitygradients/Mul_grad/Reshape$^gradients/Mul_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/Mul_grad/Reshape*
_output_shapes
:
”
-gradients/Mul_grad/tuple/control_dependency_1Identitygradients/Mul_grad/Reshape_1$^gradients/Mul_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/Mul_grad/Reshape_1*
_output_shapes
:
b
GradientDescent/learning_rateConst*
valueB
 *
„#<*
dtype0*
_output_shapes
: 
у
2GradientDescent/update_weight/ApplyGradientDescentApplyGradientDescentweightGradientDescent/learning_rate-gradients/Mul_grad/tuple/control_dependency_1*
_output_shapes
:*
use_locking( *
T0*
_class
loc:@weight
н
0GradientDescent/update_bias/ApplyGradientDescentApplyGradientDescentbiasGradientDescent/learning_rate-gradients/add_grad/tuple/control_dependency_1*
_output_shapes
:*
use_locking( *
T0*
_class
	loc:@bias

GradientDescentNoOp1^GradientDescent/update_bias/ApplyGradientDescent3^GradientDescent/update_weight/ApplyGradientDescent
*
initNoOp^bias/Assign^weight/Assign
R
Placeholder_2Placeholder*
dtype0*
_output_shapes
:*
shape:
R
Placeholder_3Placeholder*
dtype0*
_output_shapes
:*
shape:
_
random_normal_1/shapeConst*
valueB:*
dtype0*
_output_shapes
:
Y
random_normal_1/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
random_normal_1/stddevConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Ю
$random_normal_1/RandomStandardNormalRandomStandardNormalrandom_normal_1/shape*

seed *
T0*
dtype0*
_output_shapes
:*
seed2 
}
random_normal_1/mulMul$random_normal_1/RandomStandardNormalrandom_normal_1/stddev*
_output_shapes
:*
T0
f
random_normal_1Addrandom_normal_1/mulrandom_normal_1/mean*
_output_shapes
:*
T0
t
weight_1
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
Я
weight_1/AssignAssignweight_1random_normal_1*
use_locking(*
T0*
_class
loc:@weight_1*
validate_shape(*
_output_shapes
:
e
weight_1/readIdentityweight_1*
T0*
_class
loc:@weight_1*
_output_shapes
:
T
zeros_1Const*
valueB*    *
dtype0*
_output_shapes
:
r
bias_1
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
С
bias_1/AssignAssignbias_1zeros_1*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@bias_1
_
bias_1/readIdentitybias_1*
T0*
_class
loc:@bias_1*
_output_shapes
:
M
Mul_1MulPlaceholder_2weight_1/read*
T0*
_output_shapes
:
C
add_1AddMul_1bias_1/read*
T0*
_output_shapes
:
E
sub_1SubPlaceholder_3add_1*
_output_shapes
:*
T0
<
Square_1Squaresub_1*
T0*
_output_shapes
:
9
Rank_1RankSquare_1*
T0*
_output_shapes
: 
O
range_1/startConst*
value	B : *
dtype0*
_output_shapes
: 
O
range_1/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
g
range_1Rangerange_1/startRank_1range_1/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
_
Mean_1MeanSquare_1range_1*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
T
gradients_1/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
Z
gradients_1/grad_ys_0Const*
valueB
 *  А?*
dtype0*
_output_shapes
: 
u
gradients_1/FillFillgradients_1/Shapegradients_1/grad_ys_0*
_output_shapes
: *
T0*

index_type0
n
gradients_1/Mean_1_grad/ShapeShapeSquare_1*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
¶
gradients_1/Mean_1_grad/SizeSizegradients_1/Mean_1_grad/Shape*
T0*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*
out_type0*
_output_shapes
: 
©
gradients_1/Mean_1_grad/addAddrange_1gradients_1/Mean_1_grad/Size*
T0*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*#
_output_shapes
:€€€€€€€€€
¬
gradients_1/Mean_1_grad/modFloorModgradients_1/Mean_1_grad/addgradients_1/Mean_1_grad/Size*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape
ђ
gradients_1/Mean_1_grad/Shape_1Shapegradients_1/Mean_1_grad/mod*
_output_shapes
:*
T0*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*
out_type0
Ч
#gradients_1/Mean_1_grad/range/startConst*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*
value	B : *
dtype0*
_output_shapes
: 
Ч
#gradients_1/Mean_1_grad/range/deltaConst*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
с
gradients_1/Mean_1_grad/rangeRange#gradients_1/Mean_1_grad/range/startgradients_1/Mean_1_grad/Size#gradients_1/Mean_1_grad/range/delta*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*#
_output_shapes
:€€€€€€€€€*

Tidx0
Ц
"gradients_1/Mean_1_grad/Fill/valueConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*
value	B :
џ
gradients_1/Mean_1_grad/FillFillgradients_1/Mean_1_grad/Shape_1"gradients_1/Mean_1_grad/Fill/value*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*

index_type0
Ш
%gradients_1/Mean_1_grad/DynamicStitchDynamicStitchgradients_1/Mean_1_grad/rangegradients_1/Mean_1_grad/modgradients_1/Mean_1_grad/Shapegradients_1/Mean_1_grad/Fill*
T0*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*
N*#
_output_shapes
:€€€€€€€€€
Х
!gradients_1/Mean_1_grad/Maximum/yConst*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
‘
gradients_1/Mean_1_grad/MaximumMaximum%gradients_1/Mean_1_grad/DynamicStitch!gradients_1/Mean_1_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*#
_output_shapes
:€€€€€€€€€
ћ
 gradients_1/Mean_1_grad/floordivFloorDivgradients_1/Mean_1_grad/Shapegradients_1/Mean_1_grad/Maximum*
T0*0
_class&
$"loc:@gradients_1/Mean_1_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ф
gradients_1/Mean_1_grad/ReshapeReshapegradients_1/Fill%gradients_1/Mean_1_grad/DynamicStitch*
T0*
Tshape0*
_output_shapes
:
Ь
gradients_1/Mean_1_grad/TileTilegradients_1/Mean_1_grad/Reshape gradients_1/Mean_1_grad/floordiv*
T0*
_output_shapes
:*

Tmultiples0
p
gradients_1/Mean_1_grad/Shape_2ShapeSquare_1*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
b
gradients_1/Mean_1_grad/Shape_3Const*
valueB *
dtype0*
_output_shapes
: 
g
gradients_1/Mean_1_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:
Ґ
gradients_1/Mean_1_grad/ProdProdgradients_1/Mean_1_grad/Shape_2gradients_1/Mean_1_grad/Const*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
i
gradients_1/Mean_1_grad/Const_1Const*
dtype0*
_output_shapes
:*
valueB: 
¶
gradients_1/Mean_1_grad/Prod_1Prodgradients_1/Mean_1_grad/Shape_3gradients_1/Mean_1_grad/Const_1*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
e
#gradients_1/Mean_1_grad/Maximum_1/yConst*
value	B :*
dtype0*
_output_shapes
: 
Т
!gradients_1/Mean_1_grad/Maximum_1Maximumgradients_1/Mean_1_grad/Prod_1#gradients_1/Mean_1_grad/Maximum_1/y*
T0*
_output_shapes
: 
Р
"gradients_1/Mean_1_grad/floordiv_1FloorDivgradients_1/Mean_1_grad/Prod!gradients_1/Mean_1_grad/Maximum_1*
T0*
_output_shapes
: 
x
gradients_1/Mean_1_grad/CastCast"gradients_1/Mean_1_grad/floordiv_1*

SrcT0*
_output_shapes
: *

DstT0
Й
gradients_1/Mean_1_grad/truedivRealDivgradients_1/Mean_1_grad/Tilegradients_1/Mean_1_grad/Cast*
T0*
_output_shapes
:
Ж
gradients_1/Square_1_grad/ConstConst ^gradients_1/Mean_1_grad/truediv*
valueB
 *   @*
dtype0*
_output_shapes
: 
o
gradients_1/Square_1_grad/MulMulsub_1gradients_1/Square_1_grad/Const*
_output_shapes
:*
T0
Й
gradients_1/Square_1_grad/Mul_1Mulgradients_1/Mean_1_grad/truedivgradients_1/Square_1_grad/Mul*
T0*
_output_shapes
:
r
gradients_1/sub_1_grad/ShapeShapePlaceholder_3*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
l
gradients_1/sub_1_grad/Shape_1Shapeadd_1*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
ј
,gradients_1/sub_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/sub_1_grad/Shapegradients_1/sub_1_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
∞
gradients_1/sub_1_grad/SumSumgradients_1/Square_1_grad/Mul_1,gradients_1/sub_1_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ф
gradients_1/sub_1_grad/ReshapeReshapegradients_1/sub_1_grad/Sumgradients_1/sub_1_grad/Shape*
T0*
Tshape0*
_output_shapes
:
і
gradients_1/sub_1_grad/Sum_1Sumgradients_1/Square_1_grad/Mul_1.gradients_1/sub_1_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
b
gradients_1/sub_1_grad/NegNeggradients_1/sub_1_grad/Sum_1*
_output_shapes
:*
T0
Ш
 gradients_1/sub_1_grad/Reshape_1Reshapegradients_1/sub_1_grad/Neggradients_1/sub_1_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
s
'gradients_1/sub_1_grad/tuple/group_depsNoOp^gradients_1/sub_1_grad/Reshape!^gradients_1/sub_1_grad/Reshape_1
џ
/gradients_1/sub_1_grad/tuple/control_dependencyIdentitygradients_1/sub_1_grad/Reshape(^gradients_1/sub_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/sub_1_grad/Reshape*
_output_shapes
:
б
1gradients_1/sub_1_grad/tuple/control_dependency_1Identity gradients_1/sub_1_grad/Reshape_1(^gradients_1/sub_1_grad/tuple/group_deps*
_output_shapes
:*
T0*3
_class)
'%loc:@gradients_1/sub_1_grad/Reshape_1
j
gradients_1/add_1_grad/ShapeShapeMul_1*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_1/add_1_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_1/add_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/add_1_grad/Shapegradients_1/add_1_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
¬
gradients_1/add_1_grad/SumSum1gradients_1/sub_1_grad/tuple/control_dependency_1,gradients_1/add_1_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_1/add_1_grad/ReshapeReshapegradients_1/add_1_grad/Sumgradients_1/add_1_grad/Shape*
T0*
Tshape0*
_output_shapes
:
∆
gradients_1/add_1_grad/Sum_1Sum1gradients_1/sub_1_grad/tuple/control_dependency_1.gradients_1/add_1_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ь
 gradients_1/add_1_grad/Reshape_1Reshapegradients_1/add_1_grad/Sum_1gradients_1/add_1_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_1/add_1_grad/tuple/group_depsNoOp^gradients_1/add_1_grad/Reshape!^gradients_1/add_1_grad/Reshape_1
џ
/gradients_1/add_1_grad/tuple/control_dependencyIdentitygradients_1/add_1_grad/Reshape(^gradients_1/add_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/add_1_grad/Reshape*
_output_shapes
:
г
1gradients_1/add_1_grad/tuple/control_dependency_1Identity gradients_1/add_1_grad/Reshape_1(^gradients_1/add_1_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/add_1_grad/Reshape_1*
_output_shapes
:
r
gradients_1/Mul_1_grad/ShapeShapePlaceholder_2*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_1/Mul_1_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_1/Mul_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/Mul_1_grad/Shapegradients_1/Mul_1_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Д
gradients_1/Mul_1_grad/MulMul/gradients_1/add_1_grad/tuple/control_dependencyweight_1/read*
_output_shapes
:*
T0
Ђ
gradients_1/Mul_1_grad/SumSumgradients_1/Mul_1_grad/Mul,gradients_1/Mul_1_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_1/Mul_1_grad/ReshapeReshapegradients_1/Mul_1_grad/Sumgradients_1/Mul_1_grad/Shape*
T0*
Tshape0*
_output_shapes
:
Ж
gradients_1/Mul_1_grad/Mul_1MulPlaceholder_2/gradients_1/add_1_grad/tuple/control_dependency*
T0*
_output_shapes
:
±
gradients_1/Mul_1_grad/Sum_1Sumgradients_1/Mul_1_grad/Mul_1.gradients_1/Mul_1_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ь
 gradients_1/Mul_1_grad/Reshape_1Reshapegradients_1/Mul_1_grad/Sum_1gradients_1/Mul_1_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
s
'gradients_1/Mul_1_grad/tuple/group_depsNoOp^gradients_1/Mul_1_grad/Reshape!^gradients_1/Mul_1_grad/Reshape_1
џ
/gradients_1/Mul_1_grad/tuple/control_dependencyIdentitygradients_1/Mul_1_grad/Reshape(^gradients_1/Mul_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/Mul_1_grad/Reshape*
_output_shapes
:
г
1gradients_1/Mul_1_grad/tuple/control_dependency_1Identity gradients_1/Mul_1_grad/Reshape_1(^gradients_1/Mul_1_grad/tuple/group_deps*
_output_shapes
:*
T0*3
_class)
'%loc:@gradients_1/Mul_1_grad/Reshape_1
d
GradientDescent_1/learning_rateConst*
dtype0*
_output_shapes
: *
valueB
 *
„#<
Б
6GradientDescent_1/update_weight_1/ApplyGradientDescentApplyGradientDescentweight_1GradientDescent_1/learning_rate1gradients_1/Mul_1_grad/tuple/control_dependency_1*
T0*
_class
loc:@weight_1*
_output_shapes
:*
use_locking( 
ы
4GradientDescent_1/update_bias_1/ApplyGradientDescentApplyGradientDescentbias_1GradientDescent_1/learning_rate1gradients_1/add_1_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@bias_1*
_output_shapes
:
Й
GradientDescent_1NoOp5^GradientDescent_1/update_bias_1/ApplyGradientDescent7^GradientDescent_1/update_weight_1/ApplyGradientDescent
N
init_1NoOp^bias/Assign^bias_1/Assign^weight/Assign^weight_1/Assign
R
Placeholder_4Placeholder*
shape:*
dtype0*
_output_shapes
:
R
Placeholder_5Placeholder*
shape:*
dtype0*
_output_shapes
:
_
random_normal_2/shapeConst*
valueB:*
dtype0*
_output_shapes
:
Y
random_normal_2/meanConst*
dtype0*
_output_shapes
: *
valueB
 *    
[
random_normal_2/stddevConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Ю
$random_normal_2/RandomStandardNormalRandomStandardNormalrandom_normal_2/shape*
T0*
dtype0*
_output_shapes
:*
seed2 *

seed 
}
random_normal_2/mulMul$random_normal_2/RandomStandardNormalrandom_normal_2/stddev*
T0*
_output_shapes
:
f
random_normal_2Addrandom_normal_2/mulrandom_normal_2/mean*
T0*
_output_shapes
:
t
weight_2
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
Я
weight_2/AssignAssignweight_2random_normal_2*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@weight_2
e
weight_2/readIdentityweight_2*
_output_shapes
:*
T0*
_class
loc:@weight_2
T
zeros_2Const*
valueB*    *
dtype0*
_output_shapes
:
r
bias_2
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
С
bias_2/AssignAssignbias_2zeros_2*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@bias_2
_
bias_2/readIdentitybias_2*
T0*
_class
loc:@bias_2*
_output_shapes
:
M
Mul_2MulPlaceholder_4weight_2/read*
_output_shapes
:*
T0
C
add_2AddMul_2bias_2/read*
T0*
_output_shapes
:
E
sub_2SubPlaceholder_5add_2*
T0*
_output_shapes
:
<
Square_2Squaresub_2*
_output_shapes
:*
T0
9
Rank_2RankSquare_2*
T0*
_output_shapes
: 
O
range_2/startConst*
value	B : *
dtype0*
_output_shapes
: 
O
range_2/deltaConst*
dtype0*
_output_shapes
: *
value	B :
g
range_2Rangerange_2/startRank_2range_2/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
_
Mean_2MeanSquare_2range_2*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
T
gradients_2/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
Z
gradients_2/grad_ys_0Const*
valueB
 *  А?*
dtype0*
_output_shapes
: 
u
gradients_2/FillFillgradients_2/Shapegradients_2/grad_ys_0*
_output_shapes
: *
T0*

index_type0
n
gradients_2/Mean_2_grad/ShapeShapeSquare_2*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
¶
gradients_2/Mean_2_grad/SizeSizegradients_2/Mean_2_grad/Shape*
T0*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*
out_type0*
_output_shapes
: 
©
gradients_2/Mean_2_grad/addAddrange_2gradients_2/Mean_2_grad/Size*
T0*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*#
_output_shapes
:€€€€€€€€€
¬
gradients_2/Mean_2_grad/modFloorModgradients_2/Mean_2_grad/addgradients_2/Mean_2_grad/Size*
T0*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*#
_output_shapes
:€€€€€€€€€
ђ
gradients_2/Mean_2_grad/Shape_1Shapegradients_2/Mean_2_grad/mod*
T0*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*
out_type0*
_output_shapes
:
Ч
#gradients_2/Mean_2_grad/range/startConst*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*
value	B : *
dtype0*
_output_shapes
: 
Ч
#gradients_2/Mean_2_grad/range/deltaConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*
value	B :
с
gradients_2/Mean_2_grad/rangeRange#gradients_2/Mean_2_grad/range/startgradients_2/Mean_2_grad/Size#gradients_2/Mean_2_grad/range/delta*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*#
_output_shapes
:€€€€€€€€€*

Tidx0
Ц
"gradients_2/Mean_2_grad/Fill/valueConst*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
џ
gradients_2/Mean_2_grad/FillFillgradients_2/Mean_2_grad/Shape_1"gradients_2/Mean_2_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*

index_type0*#
_output_shapes
:€€€€€€€€€
Ш
%gradients_2/Mean_2_grad/DynamicStitchDynamicStitchgradients_2/Mean_2_grad/rangegradients_2/Mean_2_grad/modgradients_2/Mean_2_grad/Shapegradients_2/Mean_2_grad/Fill*
T0*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*
N*#
_output_shapes
:€€€€€€€€€
Х
!gradients_2/Mean_2_grad/Maximum/yConst*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
‘
gradients_2/Mean_2_grad/MaximumMaximum%gradients_2/Mean_2_grad/DynamicStitch!gradients_2/Mean_2_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*#
_output_shapes
:€€€€€€€€€
ћ
 gradients_2/Mean_2_grad/floordivFloorDivgradients_2/Mean_2_grad/Shapegradients_2/Mean_2_grad/Maximum*
T0*0
_class&
$"loc:@gradients_2/Mean_2_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ф
gradients_2/Mean_2_grad/ReshapeReshapegradients_2/Fill%gradients_2/Mean_2_grad/DynamicStitch*
T0*
Tshape0*
_output_shapes
:
Ь
gradients_2/Mean_2_grad/TileTilegradients_2/Mean_2_grad/Reshape gradients_2/Mean_2_grad/floordiv*

Tmultiples0*
T0*
_output_shapes
:
p
gradients_2/Mean_2_grad/Shape_2ShapeSquare_2*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
b
gradients_2/Mean_2_grad/Shape_3Const*
valueB *
dtype0*
_output_shapes
: 
g
gradients_2/Mean_2_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:
Ґ
gradients_2/Mean_2_grad/ProdProdgradients_2/Mean_2_grad/Shape_2gradients_2/Mean_2_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
i
gradients_2/Mean_2_grad/Const_1Const*
dtype0*
_output_shapes
:*
valueB: 
¶
gradients_2/Mean_2_grad/Prod_1Prodgradients_2/Mean_2_grad/Shape_3gradients_2/Mean_2_grad/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
e
#gradients_2/Mean_2_grad/Maximum_1/yConst*
value	B :*
dtype0*
_output_shapes
: 
Т
!gradients_2/Mean_2_grad/Maximum_1Maximumgradients_2/Mean_2_grad/Prod_1#gradients_2/Mean_2_grad/Maximum_1/y*
T0*
_output_shapes
: 
Р
"gradients_2/Mean_2_grad/floordiv_1FloorDivgradients_2/Mean_2_grad/Prod!gradients_2/Mean_2_grad/Maximum_1*
_output_shapes
: *
T0
x
gradients_2/Mean_2_grad/CastCast"gradients_2/Mean_2_grad/floordiv_1*

SrcT0*
_output_shapes
: *

DstT0
Й
gradients_2/Mean_2_grad/truedivRealDivgradients_2/Mean_2_grad/Tilegradients_2/Mean_2_grad/Cast*
T0*
_output_shapes
:
Ж
gradients_2/Square_2_grad/ConstConst ^gradients_2/Mean_2_grad/truediv*
valueB
 *   @*
dtype0*
_output_shapes
: 
o
gradients_2/Square_2_grad/MulMulsub_2gradients_2/Square_2_grad/Const*
T0*
_output_shapes
:
Й
gradients_2/Square_2_grad/Mul_1Mulgradients_2/Mean_2_grad/truedivgradients_2/Square_2_grad/Mul*
T0*
_output_shapes
:
r
gradients_2/sub_2_grad/ShapeShapePlaceholder_5*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
l
gradients_2/sub_2_grad/Shape_1Shapeadd_2*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
ј
,gradients_2/sub_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/sub_2_grad/Shapegradients_2/sub_2_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
∞
gradients_2/sub_2_grad/SumSumgradients_2/Square_2_grad/Mul_1,gradients_2/sub_2_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ф
gradients_2/sub_2_grad/ReshapeReshapegradients_2/sub_2_grad/Sumgradients_2/sub_2_grad/Shape*
T0*
Tshape0*
_output_shapes
:
і
gradients_2/sub_2_grad/Sum_1Sumgradients_2/Square_2_grad/Mul_1.gradients_2/sub_2_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
b
gradients_2/sub_2_grad/NegNeggradients_2/sub_2_grad/Sum_1*
T0*
_output_shapes
:
Ш
 gradients_2/sub_2_grad/Reshape_1Reshapegradients_2/sub_2_grad/Neggradients_2/sub_2_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
s
'gradients_2/sub_2_grad/tuple/group_depsNoOp^gradients_2/sub_2_grad/Reshape!^gradients_2/sub_2_grad/Reshape_1
џ
/gradients_2/sub_2_grad/tuple/control_dependencyIdentitygradients_2/sub_2_grad/Reshape(^gradients_2/sub_2_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_2/sub_2_grad/Reshape*
_output_shapes
:
б
1gradients_2/sub_2_grad/tuple/control_dependency_1Identity gradients_2/sub_2_grad/Reshape_1(^gradients_2/sub_2_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_2/sub_2_grad/Reshape_1*
_output_shapes
:
j
gradients_2/add_2_grad/ShapeShapeMul_2*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_2/add_2_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
ј
,gradients_2/add_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/add_2_grad/Shapegradients_2/add_2_grad/Shape_1*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€*
T0
¬
gradients_2/add_2_grad/SumSum1gradients_2/sub_2_grad/tuple/control_dependency_1,gradients_2/add_2_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ф
gradients_2/add_2_grad/ReshapeReshapegradients_2/add_2_grad/Sumgradients_2/add_2_grad/Shape*
T0*
Tshape0*
_output_shapes
:
∆
gradients_2/add_2_grad/Sum_1Sum1gradients_2/sub_2_grad/tuple/control_dependency_1.gradients_2/add_2_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ь
 gradients_2/add_2_grad/Reshape_1Reshapegradients_2/add_2_grad/Sum_1gradients_2/add_2_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_2/add_2_grad/tuple/group_depsNoOp^gradients_2/add_2_grad/Reshape!^gradients_2/add_2_grad/Reshape_1
џ
/gradients_2/add_2_grad/tuple/control_dependencyIdentitygradients_2/add_2_grad/Reshape(^gradients_2/add_2_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_2/add_2_grad/Reshape*
_output_shapes
:
г
1gradients_2/add_2_grad/tuple/control_dependency_1Identity gradients_2/add_2_grad/Reshape_1(^gradients_2/add_2_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_2/add_2_grad/Reshape_1*
_output_shapes
:
r
gradients_2/Mul_2_grad/ShapeShapePlaceholder_4*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
h
gradients_2/Mul_2_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_2/Mul_2_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/Mul_2_grad/Shapegradients_2/Mul_2_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Д
gradients_2/Mul_2_grad/MulMul/gradients_2/add_2_grad/tuple/control_dependencyweight_2/read*
_output_shapes
:*
T0
Ђ
gradients_2/Mul_2_grad/SumSumgradients_2/Mul_2_grad/Mul,gradients_2/Mul_2_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ф
gradients_2/Mul_2_grad/ReshapeReshapegradients_2/Mul_2_grad/Sumgradients_2/Mul_2_grad/Shape*
T0*
Tshape0*
_output_shapes
:
Ж
gradients_2/Mul_2_grad/Mul_1MulPlaceholder_4/gradients_2/add_2_grad/tuple/control_dependency*
_output_shapes
:*
T0
±
gradients_2/Mul_2_grad/Sum_1Sumgradients_2/Mul_2_grad/Mul_1.gradients_2/Mul_2_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ь
 gradients_2/Mul_2_grad/Reshape_1Reshapegradients_2/Mul_2_grad/Sum_1gradients_2/Mul_2_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_2/Mul_2_grad/tuple/group_depsNoOp^gradients_2/Mul_2_grad/Reshape!^gradients_2/Mul_2_grad/Reshape_1
џ
/gradients_2/Mul_2_grad/tuple/control_dependencyIdentitygradients_2/Mul_2_grad/Reshape(^gradients_2/Mul_2_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_2/Mul_2_grad/Reshape*
_output_shapes
:
г
1gradients_2/Mul_2_grad/tuple/control_dependency_1Identity gradients_2/Mul_2_grad/Reshape_1(^gradients_2/Mul_2_grad/tuple/group_deps*
_output_shapes
:*
T0*3
_class)
'%loc:@gradients_2/Mul_2_grad/Reshape_1
d
GradientDescent_2/learning_rateConst*
valueB
 *
„#<*
dtype0*
_output_shapes
: 
Б
6GradientDescent_2/update_weight_2/ApplyGradientDescentApplyGradientDescentweight_2GradientDescent_2/learning_rate1gradients_2/Mul_2_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@weight_2*
_output_shapes
:
ы
4GradientDescent_2/update_bias_2/ApplyGradientDescentApplyGradientDescentbias_2GradientDescent_2/learning_rate1gradients_2/add_2_grad/tuple/control_dependency_1*
T0*
_class
loc:@bias_2*
_output_shapes
:*
use_locking( 
Й
GradientDescent_2NoOp5^GradientDescent_2/update_bias_2/ApplyGradientDescent7^GradientDescent_2/update_weight_2/ApplyGradientDescent
p
init_2NoOp^bias/Assign^bias_1/Assign^bias_2/Assign^weight/Assign^weight_1/Assign^weight_2/Assign
R
Placeholder_6Placeholder*
shape:*
dtype0*
_output_shapes
:
R
Placeholder_7Placeholder*
shape:*
dtype0*
_output_shapes
:
_
random_normal_3/shapeConst*
valueB:*
dtype0*
_output_shapes
:
Y
random_normal_3/meanConst*
dtype0*
_output_shapes
: *
valueB
 *    
[
random_normal_3/stddevConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Ю
$random_normal_3/RandomStandardNormalRandomStandardNormalrandom_normal_3/shape*
T0*
dtype0*
_output_shapes
:*
seed2 *

seed 
}
random_normal_3/mulMul$random_normal_3/RandomStandardNormalrandom_normal_3/stddev*
T0*
_output_shapes
:
f
random_normal_3Addrandom_normal_3/mulrandom_normal_3/mean*
_output_shapes
:*
T0
t
weight_3
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
Я
weight_3/AssignAssignweight_3random_normal_3*
T0*
_class
loc:@weight_3*
validate_shape(*
_output_shapes
:*
use_locking(
e
weight_3/readIdentityweight_3*
T0*
_class
loc:@weight_3*
_output_shapes
:
T
zeros_3Const*
valueB*    *
dtype0*
_output_shapes
:
r
bias_3
VariableV2*
shape:*
shared_name *
dtype0*
_output_shapes
:*
	container 
С
bias_3/AssignAssignbias_3zeros_3*
T0*
_class
loc:@bias_3*
validate_shape(*
_output_shapes
:*
use_locking(
_
bias_3/readIdentitybias_3*
T0*
_class
loc:@bias_3*
_output_shapes
:
M
Mul_3MulPlaceholder_6weight_3/read*
T0*
_output_shapes
:
C
add_3AddMul_3bias_3/read*
T0*
_output_shapes
:
E
sub_3SubPlaceholder_7add_3*
T0*
_output_shapes
:
<
Square_3Squaresub_3*
T0*
_output_shapes
:
9
Rank_3RankSquare_3*
_output_shapes
: *
T0
O
range_3/startConst*
value	B : *
dtype0*
_output_shapes
: 
O
range_3/deltaConst*
dtype0*
_output_shapes
: *
value	B :
g
range_3Rangerange_3/startRank_3range_3/delta*#
_output_shapes
:€€€€€€€€€*

Tidx0
_
Mean_3MeanSquare_3range_3*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
T
gradients_3/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
Z
gradients_3/grad_ys_0Const*
dtype0*
_output_shapes
: *
valueB
 *  А?
u
gradients_3/FillFillgradients_3/Shapegradients_3/grad_ys_0*
_output_shapes
: *
T0*

index_type0
n
gradients_3/Mean_3_grad/ShapeShapeSquare_3*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
¶
gradients_3/Mean_3_grad/SizeSizegradients_3/Mean_3_grad/Shape*
_output_shapes
: *
T0*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*
out_type0
©
gradients_3/Mean_3_grad/addAddrange_3gradients_3/Mean_3_grad/Size*
T0*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*#
_output_shapes
:€€€€€€€€€
¬
gradients_3/Mean_3_grad/modFloorModgradients_3/Mean_3_grad/addgradients_3/Mean_3_grad/Size*
T0*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*#
_output_shapes
:€€€€€€€€€
ђ
gradients_3/Mean_3_grad/Shape_1Shapegradients_3/Mean_3_grad/mod*
T0*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*
out_type0*
_output_shapes
:
Ч
#gradients_3/Mean_3_grad/range/startConst*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*
value	B : *
dtype0*
_output_shapes
: 
Ч
#gradients_3/Mean_3_grad/range/deltaConst*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
с
gradients_3/Mean_3_grad/rangeRange#gradients_3/Mean_3_grad/range/startgradients_3/Mean_3_grad/Size#gradients_3/Mean_3_grad/range/delta*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*#
_output_shapes
:€€€€€€€€€*

Tidx0
Ц
"gradients_3/Mean_3_grad/Fill/valueConst*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
џ
gradients_3/Mean_3_grad/FillFillgradients_3/Mean_3_grad/Shape_1"gradients_3/Mean_3_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*

index_type0*#
_output_shapes
:€€€€€€€€€
Ш
%gradients_3/Mean_3_grad/DynamicStitchDynamicStitchgradients_3/Mean_3_grad/rangegradients_3/Mean_3_grad/modgradients_3/Mean_3_grad/Shapegradients_3/Mean_3_grad/Fill*
T0*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*
N*#
_output_shapes
:€€€€€€€€€
Х
!gradients_3/Mean_3_grad/Maximum/yConst*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
‘
gradients_3/Mean_3_grad/MaximumMaximum%gradients_3/Mean_3_grad/DynamicStitch!gradients_3/Mean_3_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*#
_output_shapes
:€€€€€€€€€
ћ
 gradients_3/Mean_3_grad/floordivFloorDivgradients_3/Mean_3_grad/Shapegradients_3/Mean_3_grad/Maximum*
T0*0
_class&
$"loc:@gradients_3/Mean_3_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ф
gradients_3/Mean_3_grad/ReshapeReshapegradients_3/Fill%gradients_3/Mean_3_grad/DynamicStitch*
T0*
Tshape0*
_output_shapes
:
Ь
gradients_3/Mean_3_grad/TileTilegradients_3/Mean_3_grad/Reshape gradients_3/Mean_3_grad/floordiv*
T0*
_output_shapes
:*

Tmultiples0
p
gradients_3/Mean_3_grad/Shape_2ShapeSquare_3*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
b
gradients_3/Mean_3_grad/Shape_3Const*
dtype0*
_output_shapes
: *
valueB 
g
gradients_3/Mean_3_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:
Ґ
gradients_3/Mean_3_grad/ProdProdgradients_3/Mean_3_grad/Shape_2gradients_3/Mean_3_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
i
gradients_3/Mean_3_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
¶
gradients_3/Mean_3_grad/Prod_1Prodgradients_3/Mean_3_grad/Shape_3gradients_3/Mean_3_grad/Const_1*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
e
#gradients_3/Mean_3_grad/Maximum_1/yConst*
dtype0*
_output_shapes
: *
value	B :
Т
!gradients_3/Mean_3_grad/Maximum_1Maximumgradients_3/Mean_3_grad/Prod_1#gradients_3/Mean_3_grad/Maximum_1/y*
T0*
_output_shapes
: 
Р
"gradients_3/Mean_3_grad/floordiv_1FloorDivgradients_3/Mean_3_grad/Prod!gradients_3/Mean_3_grad/Maximum_1*
T0*
_output_shapes
: 
x
gradients_3/Mean_3_grad/CastCast"gradients_3/Mean_3_grad/floordiv_1*

SrcT0*
_output_shapes
: *

DstT0
Й
gradients_3/Mean_3_grad/truedivRealDivgradients_3/Mean_3_grad/Tilegradients_3/Mean_3_grad/Cast*
T0*
_output_shapes
:
Ж
gradients_3/Square_3_grad/ConstConst ^gradients_3/Mean_3_grad/truediv*
valueB
 *   @*
dtype0*
_output_shapes
: 
o
gradients_3/Square_3_grad/MulMulsub_3gradients_3/Square_3_grad/Const*
T0*
_output_shapes
:
Й
gradients_3/Square_3_grad/Mul_1Mulgradients_3/Mean_3_grad/truedivgradients_3/Square_3_grad/Mul*
T0*
_output_shapes
:
r
gradients_3/sub_3_grad/ShapeShapePlaceholder_7*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
l
gradients_3/sub_3_grad/Shape_1Shapeadd_3*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
ј
,gradients_3/sub_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_3/sub_3_grad/Shapegradients_3/sub_3_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
∞
gradients_3/sub_3_grad/SumSumgradients_3/Square_3_grad/Mul_1,gradients_3/sub_3_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ф
gradients_3/sub_3_grad/ReshapeReshapegradients_3/sub_3_grad/Sumgradients_3/sub_3_grad/Shape*
T0*
Tshape0*
_output_shapes
:
і
gradients_3/sub_3_grad/Sum_1Sumgradients_3/Square_3_grad/Mul_1.gradients_3/sub_3_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
b
gradients_3/sub_3_grad/NegNeggradients_3/sub_3_grad/Sum_1*
T0*
_output_shapes
:
Ш
 gradients_3/sub_3_grad/Reshape_1Reshapegradients_3/sub_3_grad/Neggradients_3/sub_3_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_3/sub_3_grad/tuple/group_depsNoOp^gradients_3/sub_3_grad/Reshape!^gradients_3/sub_3_grad/Reshape_1
џ
/gradients_3/sub_3_grad/tuple/control_dependencyIdentitygradients_3/sub_3_grad/Reshape(^gradients_3/sub_3_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_3/sub_3_grad/Reshape*
_output_shapes
:
б
1gradients_3/sub_3_grad/tuple/control_dependency_1Identity gradients_3/sub_3_grad/Reshape_1(^gradients_3/sub_3_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_3/sub_3_grad/Reshape_1*
_output_shapes
:
j
gradients_3/add_3_grad/ShapeShapeMul_3*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_3/add_3_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_3/add_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_3/add_3_grad/Shapegradients_3/add_3_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
¬
gradients_3/add_3_grad/SumSum1gradients_3/sub_3_grad/tuple/control_dependency_1,gradients_3/add_3_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_3/add_3_grad/ReshapeReshapegradients_3/add_3_grad/Sumgradients_3/add_3_grad/Shape*
T0*
Tshape0*
_output_shapes
:
∆
gradients_3/add_3_grad/Sum_1Sum1gradients_3/sub_3_grad/tuple/control_dependency_1.gradients_3/add_3_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ь
 gradients_3/add_3_grad/Reshape_1Reshapegradients_3/add_3_grad/Sum_1gradients_3/add_3_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_3/add_3_grad/tuple/group_depsNoOp^gradients_3/add_3_grad/Reshape!^gradients_3/add_3_grad/Reshape_1
џ
/gradients_3/add_3_grad/tuple/control_dependencyIdentitygradients_3/add_3_grad/Reshape(^gradients_3/add_3_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_3/add_3_grad/Reshape*
_output_shapes
:
г
1gradients_3/add_3_grad/tuple/control_dependency_1Identity gradients_3/add_3_grad/Reshape_1(^gradients_3/add_3_grad/tuple/group_deps*
_output_shapes
:*
T0*3
_class)
'%loc:@gradients_3/add_3_grad/Reshape_1
r
gradients_3/Mul_3_grad/ShapeShapePlaceholder_6*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_3/Mul_3_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
ј
,gradients_3/Mul_3_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_3/Mul_3_grad/Shapegradients_3/Mul_3_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Д
gradients_3/Mul_3_grad/MulMul/gradients_3/add_3_grad/tuple/control_dependencyweight_3/read*
T0*
_output_shapes
:
Ђ
gradients_3/Mul_3_grad/SumSumgradients_3/Mul_3_grad/Mul,gradients_3/Mul_3_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_3/Mul_3_grad/ReshapeReshapegradients_3/Mul_3_grad/Sumgradients_3/Mul_3_grad/Shape*
T0*
Tshape0*
_output_shapes
:
Ж
gradients_3/Mul_3_grad/Mul_1MulPlaceholder_6/gradients_3/add_3_grad/tuple/control_dependency*
T0*
_output_shapes
:
±
gradients_3/Mul_3_grad/Sum_1Sumgradients_3/Mul_3_grad/Mul_1.gradients_3/Mul_3_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ь
 gradients_3/Mul_3_grad/Reshape_1Reshapegradients_3/Mul_3_grad/Sum_1gradients_3/Mul_3_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_3/Mul_3_grad/tuple/group_depsNoOp^gradients_3/Mul_3_grad/Reshape!^gradients_3/Mul_3_grad/Reshape_1
џ
/gradients_3/Mul_3_grad/tuple/control_dependencyIdentitygradients_3/Mul_3_grad/Reshape(^gradients_3/Mul_3_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_3/Mul_3_grad/Reshape*
_output_shapes
:
г
1gradients_3/Mul_3_grad/tuple/control_dependency_1Identity gradients_3/Mul_3_grad/Reshape_1(^gradients_3/Mul_3_grad/tuple/group_deps*
_output_shapes
:*
T0*3
_class)
'%loc:@gradients_3/Mul_3_grad/Reshape_1
d
GradientDescent_3/learning_rateConst*
valueB
 *
„#<*
dtype0*
_output_shapes
: 
Б
6GradientDescent_3/update_weight_3/ApplyGradientDescentApplyGradientDescentweight_3GradientDescent_3/learning_rate1gradients_3/Mul_3_grad/tuple/control_dependency_1*
T0*
_class
loc:@weight_3*
_output_shapes
:*
use_locking( 
ы
4GradientDescent_3/update_bias_3/ApplyGradientDescentApplyGradientDescentbias_3GradientDescent_3/learning_rate1gradients_3/add_3_grad/tuple/control_dependency_1*
_output_shapes
:*
use_locking( *
T0*
_class
loc:@bias_3
Й
GradientDescent_3NoOp5^GradientDescent_3/update_bias_3/ApplyGradientDescent7^GradientDescent_3/update_weight_3/ApplyGradientDescent
Т
init_3NoOp^bias/Assign^bias_1/Assign^bias_2/Assign^bias_3/Assign^weight/Assign^weight_1/Assign^weight_2/Assign^weight_3/Assign
R
Placeholder_8Placeholder*
shape:*
dtype0*
_output_shapes
:
R
Placeholder_9Placeholder*
dtype0*
_output_shapes
:*
shape:
_
random_normal_4/shapeConst*
dtype0*
_output_shapes
:*
valueB:
Y
random_normal_4/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
random_normal_4/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *  А?
Ю
$random_normal_4/RandomStandardNormalRandomStandardNormalrandom_normal_4/shape*
dtype0*
_output_shapes
:*
seed2 *

seed *
T0
}
random_normal_4/mulMul$random_normal_4/RandomStandardNormalrandom_normal_4/stddev*
T0*
_output_shapes
:
f
random_normal_4Addrandom_normal_4/mulrandom_normal_4/mean*
_output_shapes
:*
T0
t
weight_4
VariableV2*
shape:*
shared_name *
dtype0*
_output_shapes
:*
	container 
Я
weight_4/AssignAssignweight_4random_normal_4*
T0*
_class
loc:@weight_4*
validate_shape(*
_output_shapes
:*
use_locking(
e
weight_4/readIdentityweight_4*
T0*
_class
loc:@weight_4*
_output_shapes
:
T
zeros_4Const*
dtype0*
_output_shapes
:*
valueB*    
r
bias_4
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
С
bias_4/AssignAssignbias_4zeros_4*
use_locking(*
T0*
_class
loc:@bias_4*
validate_shape(*
_output_shapes
:
_
bias_4/readIdentitybias_4*
T0*
_class
loc:@bias_4*
_output_shapes
:
M
Mul_4MulPlaceholder_8weight_4/read*
T0*
_output_shapes
:
C
add_4AddMul_4bias_4/read*
T0*
_output_shapes
:
E
sub_4SubPlaceholder_9add_4*
T0*
_output_shapes
:
<
Square_4Squaresub_4*
T0*
_output_shapes
:
9
Rank_4RankSquare_4*
_output_shapes
: *
T0
O
range_4/startConst*
value	B : *
dtype0*
_output_shapes
: 
O
range_4/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
g
range_4Rangerange_4/startRank_4range_4/delta*#
_output_shapes
:€€€€€€€€€*

Tidx0
_
Mean_4MeanSquare_4range_4*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
T
gradients_4/ShapeConst*
dtype0*
_output_shapes
: *
valueB 
Z
gradients_4/grad_ys_0Const*
valueB
 *  А?*
dtype0*
_output_shapes
: 
u
gradients_4/FillFillgradients_4/Shapegradients_4/grad_ys_0*
_output_shapes
: *
T0*

index_type0
n
gradients_4/Mean_4_grad/ShapeShapeSquare_4*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
¶
gradients_4/Mean_4_grad/SizeSizegradients_4/Mean_4_grad/Shape*
T0*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*
out_type0*
_output_shapes
: 
©
gradients_4/Mean_4_grad/addAddrange_4gradients_4/Mean_4_grad/Size*
T0*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*#
_output_shapes
:€€€€€€€€€
¬
gradients_4/Mean_4_grad/modFloorModgradients_4/Mean_4_grad/addgradients_4/Mean_4_grad/Size*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape
ђ
gradients_4/Mean_4_grad/Shape_1Shapegradients_4/Mean_4_grad/mod*
T0*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*
out_type0*
_output_shapes
:
Ч
#gradients_4/Mean_4_grad/range/startConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*
value	B : 
Ч
#gradients_4/Mean_4_grad/range/deltaConst*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
с
gradients_4/Mean_4_grad/rangeRange#gradients_4/Mean_4_grad/range/startgradients_4/Mean_4_grad/Size#gradients_4/Mean_4_grad/range/delta*

Tidx0*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ц
"gradients_4/Mean_4_grad/Fill/valueConst*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
џ
gradients_4/Mean_4_grad/FillFillgradients_4/Mean_4_grad/Shape_1"gradients_4/Mean_4_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*

index_type0*#
_output_shapes
:€€€€€€€€€
Ш
%gradients_4/Mean_4_grad/DynamicStitchDynamicStitchgradients_4/Mean_4_grad/rangegradients_4/Mean_4_grad/modgradients_4/Mean_4_grad/Shapegradients_4/Mean_4_grad/Fill*
T0*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*
N*#
_output_shapes
:€€€€€€€€€
Х
!gradients_4/Mean_4_grad/Maximum/yConst*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
‘
gradients_4/Mean_4_grad/MaximumMaximum%gradients_4/Mean_4_grad/DynamicStitch!gradients_4/Mean_4_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape*#
_output_shapes
:€€€€€€€€€
ћ
 gradients_4/Mean_4_grad/floordivFloorDivgradients_4/Mean_4_grad/Shapegradients_4/Mean_4_grad/Maximum*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@gradients_4/Mean_4_grad/Shape
Ф
gradients_4/Mean_4_grad/ReshapeReshapegradients_4/Fill%gradients_4/Mean_4_grad/DynamicStitch*
T0*
Tshape0*
_output_shapes
:
Ь
gradients_4/Mean_4_grad/TileTilegradients_4/Mean_4_grad/Reshape gradients_4/Mean_4_grad/floordiv*
_output_shapes
:*

Tmultiples0*
T0
p
gradients_4/Mean_4_grad/Shape_2ShapeSquare_4*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
b
gradients_4/Mean_4_grad/Shape_3Const*
valueB *
dtype0*
_output_shapes
: 
g
gradients_4/Mean_4_grad/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
Ґ
gradients_4/Mean_4_grad/ProdProdgradients_4/Mean_4_grad/Shape_2gradients_4/Mean_4_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
i
gradients_4/Mean_4_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
¶
gradients_4/Mean_4_grad/Prod_1Prodgradients_4/Mean_4_grad/Shape_3gradients_4/Mean_4_grad/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
e
#gradients_4/Mean_4_grad/Maximum_1/yConst*
value	B :*
dtype0*
_output_shapes
: 
Т
!gradients_4/Mean_4_grad/Maximum_1Maximumgradients_4/Mean_4_grad/Prod_1#gradients_4/Mean_4_grad/Maximum_1/y*
T0*
_output_shapes
: 
Р
"gradients_4/Mean_4_grad/floordiv_1FloorDivgradients_4/Mean_4_grad/Prod!gradients_4/Mean_4_grad/Maximum_1*
T0*
_output_shapes
: 
x
gradients_4/Mean_4_grad/CastCast"gradients_4/Mean_4_grad/floordiv_1*

SrcT0*
_output_shapes
: *

DstT0
Й
gradients_4/Mean_4_grad/truedivRealDivgradients_4/Mean_4_grad/Tilegradients_4/Mean_4_grad/Cast*
T0*
_output_shapes
:
Ж
gradients_4/Square_4_grad/ConstConst ^gradients_4/Mean_4_grad/truediv*
valueB
 *   @*
dtype0*
_output_shapes
: 
o
gradients_4/Square_4_grad/MulMulsub_4gradients_4/Square_4_grad/Const*
_output_shapes
:*
T0
Й
gradients_4/Square_4_grad/Mul_1Mulgradients_4/Mean_4_grad/truedivgradients_4/Square_4_grad/Mul*
_output_shapes
:*
T0
r
gradients_4/sub_4_grad/ShapeShapePlaceholder_9*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
l
gradients_4/sub_4_grad/Shape_1Shapeadd_4*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
ј
,gradients_4/sub_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_4/sub_4_grad/Shapegradients_4/sub_4_grad/Shape_1*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€*
T0
∞
gradients_4/sub_4_grad/SumSumgradients_4/Square_4_grad/Mul_1,gradients_4/sub_4_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_4/sub_4_grad/ReshapeReshapegradients_4/sub_4_grad/Sumgradients_4/sub_4_grad/Shape*
T0*
Tshape0*
_output_shapes
:
і
gradients_4/sub_4_grad/Sum_1Sumgradients_4/Square_4_grad/Mul_1.gradients_4/sub_4_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
b
gradients_4/sub_4_grad/NegNeggradients_4/sub_4_grad/Sum_1*
T0*
_output_shapes
:
Ш
 gradients_4/sub_4_grad/Reshape_1Reshapegradients_4/sub_4_grad/Neggradients_4/sub_4_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_4/sub_4_grad/tuple/group_depsNoOp^gradients_4/sub_4_grad/Reshape!^gradients_4/sub_4_grad/Reshape_1
џ
/gradients_4/sub_4_grad/tuple/control_dependencyIdentitygradients_4/sub_4_grad/Reshape(^gradients_4/sub_4_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_4/sub_4_grad/Reshape*
_output_shapes
:
б
1gradients_4/sub_4_grad/tuple/control_dependency_1Identity gradients_4/sub_4_grad/Reshape_1(^gradients_4/sub_4_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_4/sub_4_grad/Reshape_1*
_output_shapes
:
j
gradients_4/add_4_grad/ShapeShapeMul_4*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_4/add_4_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_4/add_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_4/add_4_grad/Shapegradients_4/add_4_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
¬
gradients_4/add_4_grad/SumSum1gradients_4/sub_4_grad/tuple/control_dependency_1,gradients_4/add_4_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_4/add_4_grad/ReshapeReshapegradients_4/add_4_grad/Sumgradients_4/add_4_grad/Shape*
T0*
Tshape0*
_output_shapes
:
∆
gradients_4/add_4_grad/Sum_1Sum1gradients_4/sub_4_grad/tuple/control_dependency_1.gradients_4/add_4_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ь
 gradients_4/add_4_grad/Reshape_1Reshapegradients_4/add_4_grad/Sum_1gradients_4/add_4_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_4/add_4_grad/tuple/group_depsNoOp^gradients_4/add_4_grad/Reshape!^gradients_4/add_4_grad/Reshape_1
џ
/gradients_4/add_4_grad/tuple/control_dependencyIdentitygradients_4/add_4_grad/Reshape(^gradients_4/add_4_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_4/add_4_grad/Reshape*
_output_shapes
:
г
1gradients_4/add_4_grad/tuple/control_dependency_1Identity gradients_4/add_4_grad/Reshape_1(^gradients_4/add_4_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_4/add_4_grad/Reshape_1*
_output_shapes
:
r
gradients_4/Mul_4_grad/ShapeShapePlaceholder_8*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_4/Mul_4_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
ј
,gradients_4/Mul_4_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_4/Mul_4_grad/Shapegradients_4/Mul_4_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Д
gradients_4/Mul_4_grad/MulMul/gradients_4/add_4_grad/tuple/control_dependencyweight_4/read*
_output_shapes
:*
T0
Ђ
gradients_4/Mul_4_grad/SumSumgradients_4/Mul_4_grad/Mul,gradients_4/Mul_4_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_4/Mul_4_grad/ReshapeReshapegradients_4/Mul_4_grad/Sumgradients_4/Mul_4_grad/Shape*
T0*
Tshape0*
_output_shapes
:
Ж
gradients_4/Mul_4_grad/Mul_1MulPlaceholder_8/gradients_4/add_4_grad/tuple/control_dependency*
T0*
_output_shapes
:
±
gradients_4/Mul_4_grad/Sum_1Sumgradients_4/Mul_4_grad/Mul_1.gradients_4/Mul_4_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ь
 gradients_4/Mul_4_grad/Reshape_1Reshapegradients_4/Mul_4_grad/Sum_1gradients_4/Mul_4_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
s
'gradients_4/Mul_4_grad/tuple/group_depsNoOp^gradients_4/Mul_4_grad/Reshape!^gradients_4/Mul_4_grad/Reshape_1
џ
/gradients_4/Mul_4_grad/tuple/control_dependencyIdentitygradients_4/Mul_4_grad/Reshape(^gradients_4/Mul_4_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_4/Mul_4_grad/Reshape*
_output_shapes
:
г
1gradients_4/Mul_4_grad/tuple/control_dependency_1Identity gradients_4/Mul_4_grad/Reshape_1(^gradients_4/Mul_4_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_4/Mul_4_grad/Reshape_1*
_output_shapes
:
d
GradientDescent_4/learning_rateConst*
valueB
 *
„#<*
dtype0*
_output_shapes
: 
Б
6GradientDescent_4/update_weight_4/ApplyGradientDescentApplyGradientDescentweight_4GradientDescent_4/learning_rate1gradients_4/Mul_4_grad/tuple/control_dependency_1*
_output_shapes
:*
use_locking( *
T0*
_class
loc:@weight_4
ы
4GradientDescent_4/update_bias_4/ApplyGradientDescentApplyGradientDescentbias_4GradientDescent_4/learning_rate1gradients_4/add_4_grad/tuple/control_dependency_1*
_output_shapes
:*
use_locking( *
T0*
_class
loc:@bias_4
Й
GradientDescent_4NoOp5^GradientDescent_4/update_bias_4/ApplyGradientDescent7^GradientDescent_4/update_weight_4/ApplyGradientDescent
і
init_4NoOp^bias/Assign^bias_1/Assign^bias_2/Assign^bias_3/Assign^bias_4/Assign^weight/Assign^weight_1/Assign^weight_2/Assign^weight_3/Assign^weight_4/Assign
S
Placeholder_10Placeholder*
dtype0*
_output_shapes
:*
shape:
S
Placeholder_11Placeholder*
shape:*
dtype0*
_output_shapes
:
_
random_normal_5/shapeConst*
valueB:*
dtype0*
_output_shapes
:
Y
random_normal_5/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
random_normal_5/stddevConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Ю
$random_normal_5/RandomStandardNormalRandomStandardNormalrandom_normal_5/shape*
T0*
dtype0*
_output_shapes
:*
seed2 *

seed 
}
random_normal_5/mulMul$random_normal_5/RandomStandardNormalrandom_normal_5/stddev*
T0*
_output_shapes
:
f
random_normal_5Addrandom_normal_5/mulrandom_normal_5/mean*
_output_shapes
:*
T0
t
weight_5
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
Я
weight_5/AssignAssignweight_5random_normal_5*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@weight_5
e
weight_5/readIdentityweight_5*
T0*
_class
loc:@weight_5*
_output_shapes
:
T
zeros_5Const*
dtype0*
_output_shapes
:*
valueB*    
r
bias_5
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
С
bias_5/AssignAssignbias_5zeros_5*
T0*
_class
loc:@bias_5*
validate_shape(*
_output_shapes
:*
use_locking(
_
bias_5/readIdentitybias_5*
T0*
_class
loc:@bias_5*
_output_shapes
:
N
Mul_5MulPlaceholder_10weight_5/read*
T0*
_output_shapes
:
C
add_5AddMul_5bias_5/read*
T0*
_output_shapes
:
F
sub_5SubPlaceholder_11add_5*
_output_shapes
:*
T0
<
Square_5Squaresub_5*
_output_shapes
:*
T0
9
Rank_5RankSquare_5*
T0*
_output_shapes
: 
O
range_5/startConst*
value	B : *
dtype0*
_output_shapes
: 
O
range_5/deltaConst*
dtype0*
_output_shapes
: *
value	B :
g
range_5Rangerange_5/startRank_5range_5/delta*#
_output_shapes
:€€€€€€€€€*

Tidx0
_
Mean_5MeanSquare_5range_5*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
T
gradients_5/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
Z
gradients_5/grad_ys_0Const*
valueB
 *  А?*
dtype0*
_output_shapes
: 
u
gradients_5/FillFillgradients_5/Shapegradients_5/grad_ys_0*
T0*

index_type0*
_output_shapes
: 
n
gradients_5/Mean_5_grad/ShapeShapeSquare_5*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
¶
gradients_5/Mean_5_grad/SizeSizegradients_5/Mean_5_grad/Shape*
T0*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*
out_type0*
_output_shapes
: 
©
gradients_5/Mean_5_grad/addAddrange_5gradients_5/Mean_5_grad/Size*
T0*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*#
_output_shapes
:€€€€€€€€€
¬
gradients_5/Mean_5_grad/modFloorModgradients_5/Mean_5_grad/addgradients_5/Mean_5_grad/Size*
T0*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*#
_output_shapes
:€€€€€€€€€
ђ
gradients_5/Mean_5_grad/Shape_1Shapegradients_5/Mean_5_grad/mod*
_output_shapes
:*
T0*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*
out_type0
Ч
#gradients_5/Mean_5_grad/range/startConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*
value	B : 
Ч
#gradients_5/Mean_5_grad/range/deltaConst*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
с
gradients_5/Mean_5_grad/rangeRange#gradients_5/Mean_5_grad/range/startgradients_5/Mean_5_grad/Size#gradients_5/Mean_5_grad/range/delta*#
_output_shapes
:€€€€€€€€€*

Tidx0*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape
Ц
"gradients_5/Mean_5_grad/Fill/valueConst*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
џ
gradients_5/Mean_5_grad/FillFillgradients_5/Mean_5_grad/Shape_1"gradients_5/Mean_5_grad/Fill/value*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*

index_type0
Ш
%gradients_5/Mean_5_grad/DynamicStitchDynamicStitchgradients_5/Mean_5_grad/rangegradients_5/Mean_5_grad/modgradients_5/Mean_5_grad/Shapegradients_5/Mean_5_grad/Fill*
T0*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*
N*#
_output_shapes
:€€€€€€€€€
Х
!gradients_5/Mean_5_grad/Maximum/yConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*
value	B :
‘
gradients_5/Mean_5_grad/MaximumMaximum%gradients_5/Mean_5_grad/DynamicStitch!gradients_5/Mean_5_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*#
_output_shapes
:€€€€€€€€€
ћ
 gradients_5/Mean_5_grad/floordivFloorDivgradients_5/Mean_5_grad/Shapegradients_5/Mean_5_grad/Maximum*
T0*0
_class&
$"loc:@gradients_5/Mean_5_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ф
gradients_5/Mean_5_grad/ReshapeReshapegradients_5/Fill%gradients_5/Mean_5_grad/DynamicStitch*
_output_shapes
:*
T0*
Tshape0
Ь
gradients_5/Mean_5_grad/TileTilegradients_5/Mean_5_grad/Reshape gradients_5/Mean_5_grad/floordiv*
T0*
_output_shapes
:*

Tmultiples0
p
gradients_5/Mean_5_grad/Shape_2ShapeSquare_5*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
b
gradients_5/Mean_5_grad/Shape_3Const*
valueB *
dtype0*
_output_shapes
: 
g
gradients_5/Mean_5_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:
Ґ
gradients_5/Mean_5_grad/ProdProdgradients_5/Mean_5_grad/Shape_2gradients_5/Mean_5_grad/Const*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
i
gradients_5/Mean_5_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
¶
gradients_5/Mean_5_grad/Prod_1Prodgradients_5/Mean_5_grad/Shape_3gradients_5/Mean_5_grad/Const_1*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
e
#gradients_5/Mean_5_grad/Maximum_1/yConst*
value	B :*
dtype0*
_output_shapes
: 
Т
!gradients_5/Mean_5_grad/Maximum_1Maximumgradients_5/Mean_5_grad/Prod_1#gradients_5/Mean_5_grad/Maximum_1/y*
T0*
_output_shapes
: 
Р
"gradients_5/Mean_5_grad/floordiv_1FloorDivgradients_5/Mean_5_grad/Prod!gradients_5/Mean_5_grad/Maximum_1*
T0*
_output_shapes
: 
x
gradients_5/Mean_5_grad/CastCast"gradients_5/Mean_5_grad/floordiv_1*

SrcT0*
_output_shapes
: *

DstT0
Й
gradients_5/Mean_5_grad/truedivRealDivgradients_5/Mean_5_grad/Tilegradients_5/Mean_5_grad/Cast*
T0*
_output_shapes
:
Ж
gradients_5/Square_5_grad/ConstConst ^gradients_5/Mean_5_grad/truediv*
valueB
 *   @*
dtype0*
_output_shapes
: 
o
gradients_5/Square_5_grad/MulMulsub_5gradients_5/Square_5_grad/Const*
_output_shapes
:*
T0
Й
gradients_5/Square_5_grad/Mul_1Mulgradients_5/Mean_5_grad/truedivgradients_5/Square_5_grad/Mul*
T0*
_output_shapes
:
s
gradients_5/sub_5_grad/ShapeShapePlaceholder_11*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
l
gradients_5/sub_5_grad/Shape_1Shapeadd_5*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
ј
,gradients_5/sub_5_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_5/sub_5_grad/Shapegradients_5/sub_5_grad/Shape_1*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€*
T0
∞
gradients_5/sub_5_grad/SumSumgradients_5/Square_5_grad/Mul_1,gradients_5/sub_5_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ф
gradients_5/sub_5_grad/ReshapeReshapegradients_5/sub_5_grad/Sumgradients_5/sub_5_grad/Shape*
T0*
Tshape0*
_output_shapes
:
і
gradients_5/sub_5_grad/Sum_1Sumgradients_5/Square_5_grad/Mul_1.gradients_5/sub_5_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
b
gradients_5/sub_5_grad/NegNeggradients_5/sub_5_grad/Sum_1*
T0*
_output_shapes
:
Ш
 gradients_5/sub_5_grad/Reshape_1Reshapegradients_5/sub_5_grad/Neggradients_5/sub_5_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_5/sub_5_grad/tuple/group_depsNoOp^gradients_5/sub_5_grad/Reshape!^gradients_5/sub_5_grad/Reshape_1
џ
/gradients_5/sub_5_grad/tuple/control_dependencyIdentitygradients_5/sub_5_grad/Reshape(^gradients_5/sub_5_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_5/sub_5_grad/Reshape*
_output_shapes
:
б
1gradients_5/sub_5_grad/tuple/control_dependency_1Identity gradients_5/sub_5_grad/Reshape_1(^gradients_5/sub_5_grad/tuple/group_deps*
_output_shapes
:*
T0*3
_class)
'%loc:@gradients_5/sub_5_grad/Reshape_1
j
gradients_5/add_5_grad/ShapeShapeMul_5*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_5/add_5_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
ј
,gradients_5/add_5_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_5/add_5_grad/Shapegradients_5/add_5_grad/Shape_1*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€*
T0
¬
gradients_5/add_5_grad/SumSum1gradients_5/sub_5_grad/tuple/control_dependency_1,gradients_5/add_5_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ф
gradients_5/add_5_grad/ReshapeReshapegradients_5/add_5_grad/Sumgradients_5/add_5_grad/Shape*
T0*
Tshape0*
_output_shapes
:
∆
gradients_5/add_5_grad/Sum_1Sum1gradients_5/sub_5_grad/tuple/control_dependency_1.gradients_5/add_5_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ь
 gradients_5/add_5_grad/Reshape_1Reshapegradients_5/add_5_grad/Sum_1gradients_5/add_5_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_5/add_5_grad/tuple/group_depsNoOp^gradients_5/add_5_grad/Reshape!^gradients_5/add_5_grad/Reshape_1
џ
/gradients_5/add_5_grad/tuple/control_dependencyIdentitygradients_5/add_5_grad/Reshape(^gradients_5/add_5_grad/tuple/group_deps*
_output_shapes
:*
T0*1
_class'
%#loc:@gradients_5/add_5_grad/Reshape
г
1gradients_5/add_5_grad/tuple/control_dependency_1Identity gradients_5/add_5_grad/Reshape_1(^gradients_5/add_5_grad/tuple/group_deps*
_output_shapes
:*
T0*3
_class)
'%loc:@gradients_5/add_5_grad/Reshape_1
s
gradients_5/Mul_5_grad/ShapeShapePlaceholder_10*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_5/Mul_5_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_5/Mul_5_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_5/Mul_5_grad/Shapegradients_5/Mul_5_grad/Shape_1*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€*
T0
Д
gradients_5/Mul_5_grad/MulMul/gradients_5/add_5_grad/tuple/control_dependencyweight_5/read*
_output_shapes
:*
T0
Ђ
gradients_5/Mul_5_grad/SumSumgradients_5/Mul_5_grad/Mul,gradients_5/Mul_5_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_5/Mul_5_grad/ReshapeReshapegradients_5/Mul_5_grad/Sumgradients_5/Mul_5_grad/Shape*
T0*
Tshape0*
_output_shapes
:
З
gradients_5/Mul_5_grad/Mul_1MulPlaceholder_10/gradients_5/add_5_grad/tuple/control_dependency*
_output_shapes
:*
T0
±
gradients_5/Mul_5_grad/Sum_1Sumgradients_5/Mul_5_grad/Mul_1.gradients_5/Mul_5_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ь
 gradients_5/Mul_5_grad/Reshape_1Reshapegradients_5/Mul_5_grad/Sum_1gradients_5/Mul_5_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_5/Mul_5_grad/tuple/group_depsNoOp^gradients_5/Mul_5_grad/Reshape!^gradients_5/Mul_5_grad/Reshape_1
џ
/gradients_5/Mul_5_grad/tuple/control_dependencyIdentitygradients_5/Mul_5_grad/Reshape(^gradients_5/Mul_5_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_5/Mul_5_grad/Reshape*
_output_shapes
:
г
1gradients_5/Mul_5_grad/tuple/control_dependency_1Identity gradients_5/Mul_5_grad/Reshape_1(^gradients_5/Mul_5_grad/tuple/group_deps*
_output_shapes
:*
T0*3
_class)
'%loc:@gradients_5/Mul_5_grad/Reshape_1
d
GradientDescent_5/learning_rateConst*
valueB
 *
„#<*
dtype0*
_output_shapes
: 
Б
6GradientDescent_5/update_weight_5/ApplyGradientDescentApplyGradientDescentweight_5GradientDescent_5/learning_rate1gradients_5/Mul_5_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@weight_5*
_output_shapes
:
ы
4GradientDescent_5/update_bias_5/ApplyGradientDescentApplyGradientDescentbias_5GradientDescent_5/learning_rate1gradients_5/add_5_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@bias_5*
_output_shapes
:
Й
GradientDescent_5NoOp5^GradientDescent_5/update_bias_5/ApplyGradientDescent7^GradientDescent_5/update_weight_5/ApplyGradientDescent
÷
init_5NoOp^bias/Assign^bias_1/Assign^bias_2/Assign^bias_3/Assign^bias_4/Assign^bias_5/Assign^weight/Assign^weight_1/Assign^weight_2/Assign^weight_3/Assign^weight_4/Assign^weight_5/Assign
S
Placeholder_12Placeholder*
dtype0*
_output_shapes
:*
shape:
S
Placeholder_13Placeholder*
dtype0*
_output_shapes
:*
shape:
_
random_normal_6/shapeConst*
valueB:*
dtype0*
_output_shapes
:
Y
random_normal_6/meanConst*
dtype0*
_output_shapes
: *
valueB
 *    
[
random_normal_6/stddevConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Ю
$random_normal_6/RandomStandardNormalRandomStandardNormalrandom_normal_6/shape*
T0*
dtype0*
_output_shapes
:*
seed2 *

seed 
}
random_normal_6/mulMul$random_normal_6/RandomStandardNormalrandom_normal_6/stddev*
T0*
_output_shapes
:
f
random_normal_6Addrandom_normal_6/mulrandom_normal_6/mean*
_output_shapes
:*
T0
t
weight_6
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
Я
weight_6/AssignAssignweight_6random_normal_6*
T0*
_class
loc:@weight_6*
validate_shape(*
_output_shapes
:*
use_locking(
e
weight_6/readIdentityweight_6*
T0*
_class
loc:@weight_6*
_output_shapes
:
T
zeros_6Const*
dtype0*
_output_shapes
:*
valueB*    
r
bias_6
VariableV2*
shape:*
shared_name *
dtype0*
_output_shapes
:*
	container 
С
bias_6/AssignAssignbias_6zeros_6*
T0*
_class
loc:@bias_6*
validate_shape(*
_output_shapes
:*
use_locking(
_
bias_6/readIdentitybias_6*
T0*
_class
loc:@bias_6*
_output_shapes
:
N
Mul_6MulPlaceholder_12weight_6/read*
_output_shapes
:*
T0
C
add_6AddMul_6bias_6/read*
T0*
_output_shapes
:
F
sub_6SubPlaceholder_13add_6*
T0*
_output_shapes
:
<
Square_6Squaresub_6*
T0*
_output_shapes
:
9
Rank_6RankSquare_6*
_output_shapes
: *
T0
O
range_6/startConst*
value	B : *
dtype0*
_output_shapes
: 
O
range_6/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
g
range_6Rangerange_6/startRank_6range_6/delta*#
_output_shapes
:€€€€€€€€€*

Tidx0
_
Mean_6MeanSquare_6range_6*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
T
gradients_6/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
Z
gradients_6/grad_ys_0Const*
valueB
 *  А?*
dtype0*
_output_shapes
: 
u
gradients_6/FillFillgradients_6/Shapegradients_6/grad_ys_0*
T0*

index_type0*
_output_shapes
: 
n
gradients_6/Mean_6_grad/ShapeShapeSquare_6*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
¶
gradients_6/Mean_6_grad/SizeSizegradients_6/Mean_6_grad/Shape*
T0*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*
out_type0*
_output_shapes
: 
©
gradients_6/Mean_6_grad/addAddrange_6gradients_6/Mean_6_grad/Size*
T0*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*#
_output_shapes
:€€€€€€€€€
¬
gradients_6/Mean_6_grad/modFloorModgradients_6/Mean_6_grad/addgradients_6/Mean_6_grad/Size*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape
ђ
gradients_6/Mean_6_grad/Shape_1Shapegradients_6/Mean_6_grad/mod*
T0*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*
out_type0*
_output_shapes
:
Ч
#gradients_6/Mean_6_grad/range/startConst*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*
value	B : *
dtype0*
_output_shapes
: 
Ч
#gradients_6/Mean_6_grad/range/deltaConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*
value	B :
с
gradients_6/Mean_6_grad/rangeRange#gradients_6/Mean_6_grad/range/startgradients_6/Mean_6_grad/Size#gradients_6/Mean_6_grad/range/delta*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*#
_output_shapes
:€€€€€€€€€*

Tidx0
Ц
"gradients_6/Mean_6_grad/Fill/valueConst*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
џ
gradients_6/Mean_6_grad/FillFillgradients_6/Mean_6_grad/Shape_1"gradients_6/Mean_6_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*

index_type0*#
_output_shapes
:€€€€€€€€€
Ш
%gradients_6/Mean_6_grad/DynamicStitchDynamicStitchgradients_6/Mean_6_grad/rangegradients_6/Mean_6_grad/modgradients_6/Mean_6_grad/Shapegradients_6/Mean_6_grad/Fill*
N*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape
Х
!gradients_6/Mean_6_grad/Maximum/yConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*
value	B :
‘
gradients_6/Mean_6_grad/MaximumMaximum%gradients_6/Mean_6_grad/DynamicStitch!gradients_6/Mean_6_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*#
_output_shapes
:€€€€€€€€€
ћ
 gradients_6/Mean_6_grad/floordivFloorDivgradients_6/Mean_6_grad/Shapegradients_6/Mean_6_grad/Maximum*
T0*0
_class&
$"loc:@gradients_6/Mean_6_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ф
gradients_6/Mean_6_grad/ReshapeReshapegradients_6/Fill%gradients_6/Mean_6_grad/DynamicStitch*
_output_shapes
:*
T0*
Tshape0
Ь
gradients_6/Mean_6_grad/TileTilegradients_6/Mean_6_grad/Reshape gradients_6/Mean_6_grad/floordiv*

Tmultiples0*
T0*
_output_shapes
:
p
gradients_6/Mean_6_grad/Shape_2ShapeSquare_6*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
b
gradients_6/Mean_6_grad/Shape_3Const*
valueB *
dtype0*
_output_shapes
: 
g
gradients_6/Mean_6_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:
Ґ
gradients_6/Mean_6_grad/ProdProdgradients_6/Mean_6_grad/Shape_2gradients_6/Mean_6_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
i
gradients_6/Mean_6_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
¶
gradients_6/Mean_6_grad/Prod_1Prodgradients_6/Mean_6_grad/Shape_3gradients_6/Mean_6_grad/Const_1*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
e
#gradients_6/Mean_6_grad/Maximum_1/yConst*
value	B :*
dtype0*
_output_shapes
: 
Т
!gradients_6/Mean_6_grad/Maximum_1Maximumgradients_6/Mean_6_grad/Prod_1#gradients_6/Mean_6_grad/Maximum_1/y*
T0*
_output_shapes
: 
Р
"gradients_6/Mean_6_grad/floordiv_1FloorDivgradients_6/Mean_6_grad/Prod!gradients_6/Mean_6_grad/Maximum_1*
T0*
_output_shapes
: 
x
gradients_6/Mean_6_grad/CastCast"gradients_6/Mean_6_grad/floordiv_1*
_output_shapes
: *

DstT0*

SrcT0
Й
gradients_6/Mean_6_grad/truedivRealDivgradients_6/Mean_6_grad/Tilegradients_6/Mean_6_grad/Cast*
T0*
_output_shapes
:
Ж
gradients_6/Square_6_grad/ConstConst ^gradients_6/Mean_6_grad/truediv*
dtype0*
_output_shapes
: *
valueB
 *   @
o
gradients_6/Square_6_grad/MulMulsub_6gradients_6/Square_6_grad/Const*
T0*
_output_shapes
:
Й
gradients_6/Square_6_grad/Mul_1Mulgradients_6/Mean_6_grad/truedivgradients_6/Square_6_grad/Mul*
T0*
_output_shapes
:
s
gradients_6/sub_6_grad/ShapeShapePlaceholder_13*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
l
gradients_6/sub_6_grad/Shape_1Shapeadd_6*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
ј
,gradients_6/sub_6_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_6/sub_6_grad/Shapegradients_6/sub_6_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
∞
gradients_6/sub_6_grad/SumSumgradients_6/Square_6_grad/Mul_1,gradients_6/sub_6_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ф
gradients_6/sub_6_grad/ReshapeReshapegradients_6/sub_6_grad/Sumgradients_6/sub_6_grad/Shape*
_output_shapes
:*
T0*
Tshape0
і
gradients_6/sub_6_grad/Sum_1Sumgradients_6/Square_6_grad/Mul_1.gradients_6/sub_6_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
b
gradients_6/sub_6_grad/NegNeggradients_6/sub_6_grad/Sum_1*
_output_shapes
:*
T0
Ш
 gradients_6/sub_6_grad/Reshape_1Reshapegradients_6/sub_6_grad/Neggradients_6/sub_6_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_6/sub_6_grad/tuple/group_depsNoOp^gradients_6/sub_6_grad/Reshape!^gradients_6/sub_6_grad/Reshape_1
џ
/gradients_6/sub_6_grad/tuple/control_dependencyIdentitygradients_6/sub_6_grad/Reshape(^gradients_6/sub_6_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_6/sub_6_grad/Reshape*
_output_shapes
:
б
1gradients_6/sub_6_grad/tuple/control_dependency_1Identity gradients_6/sub_6_grad/Reshape_1(^gradients_6/sub_6_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_6/sub_6_grad/Reshape_1*
_output_shapes
:
j
gradients_6/add_6_grad/ShapeShapeMul_6*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_6/add_6_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
ј
,gradients_6/add_6_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_6/add_6_grad/Shapegradients_6/add_6_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
¬
gradients_6/add_6_grad/SumSum1gradients_6/sub_6_grad/tuple/control_dependency_1,gradients_6/add_6_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ф
gradients_6/add_6_grad/ReshapeReshapegradients_6/add_6_grad/Sumgradients_6/add_6_grad/Shape*
T0*
Tshape0*
_output_shapes
:
∆
gradients_6/add_6_grad/Sum_1Sum1gradients_6/sub_6_grad/tuple/control_dependency_1.gradients_6/add_6_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ь
 gradients_6/add_6_grad/Reshape_1Reshapegradients_6/add_6_grad/Sum_1gradients_6/add_6_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_6/add_6_grad/tuple/group_depsNoOp^gradients_6/add_6_grad/Reshape!^gradients_6/add_6_grad/Reshape_1
џ
/gradients_6/add_6_grad/tuple/control_dependencyIdentitygradients_6/add_6_grad/Reshape(^gradients_6/add_6_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_6/add_6_grad/Reshape*
_output_shapes
:
г
1gradients_6/add_6_grad/tuple/control_dependency_1Identity gradients_6/add_6_grad/Reshape_1(^gradients_6/add_6_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_6/add_6_grad/Reshape_1*
_output_shapes
:
s
gradients_6/Mul_6_grad/ShapeShapePlaceholder_12*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_6/Mul_6_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_6/Mul_6_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_6/Mul_6_grad/Shapegradients_6/Mul_6_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Д
gradients_6/Mul_6_grad/MulMul/gradients_6/add_6_grad/tuple/control_dependencyweight_6/read*
T0*
_output_shapes
:
Ђ
gradients_6/Mul_6_grad/SumSumgradients_6/Mul_6_grad/Mul,gradients_6/Mul_6_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_6/Mul_6_grad/ReshapeReshapegradients_6/Mul_6_grad/Sumgradients_6/Mul_6_grad/Shape*
_output_shapes
:*
T0*
Tshape0
З
gradients_6/Mul_6_grad/Mul_1MulPlaceholder_12/gradients_6/add_6_grad/tuple/control_dependency*
_output_shapes
:*
T0
±
gradients_6/Mul_6_grad/Sum_1Sumgradients_6/Mul_6_grad/Mul_1.gradients_6/Mul_6_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ь
 gradients_6/Mul_6_grad/Reshape_1Reshapegradients_6/Mul_6_grad/Sum_1gradients_6/Mul_6_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_6/Mul_6_grad/tuple/group_depsNoOp^gradients_6/Mul_6_grad/Reshape!^gradients_6/Mul_6_grad/Reshape_1
џ
/gradients_6/Mul_6_grad/tuple/control_dependencyIdentitygradients_6/Mul_6_grad/Reshape(^gradients_6/Mul_6_grad/tuple/group_deps*
_output_shapes
:*
T0*1
_class'
%#loc:@gradients_6/Mul_6_grad/Reshape
г
1gradients_6/Mul_6_grad/tuple/control_dependency_1Identity gradients_6/Mul_6_grad/Reshape_1(^gradients_6/Mul_6_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_6/Mul_6_grad/Reshape_1*
_output_shapes
:
d
GradientDescent_6/learning_rateConst*
valueB
 *
„#<*
dtype0*
_output_shapes
: 
Б
6GradientDescent_6/update_weight_6/ApplyGradientDescentApplyGradientDescentweight_6GradientDescent_6/learning_rate1gradients_6/Mul_6_grad/tuple/control_dependency_1*
_output_shapes
:*
use_locking( *
T0*
_class
loc:@weight_6
ы
4GradientDescent_6/update_bias_6/ApplyGradientDescentApplyGradientDescentbias_6GradientDescent_6/learning_rate1gradients_6/add_6_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@bias_6*
_output_shapes
:
Й
GradientDescent_6NoOp5^GradientDescent_6/update_bias_6/ApplyGradientDescent7^GradientDescent_6/update_weight_6/ApplyGradientDescent
ш
init_6NoOp^bias/Assign^bias_1/Assign^bias_2/Assign^bias_3/Assign^bias_4/Assign^bias_5/Assign^bias_6/Assign^weight/Assign^weight_1/Assign^weight_2/Assign^weight_3/Assign^weight_4/Assign^weight_5/Assign^weight_6/Assign
S
Placeholder_14Placeholder*
shape:*
dtype0*
_output_shapes
:
S
Placeholder_15Placeholder*
shape:*
dtype0*
_output_shapes
:
_
random_normal_7/shapeConst*
valueB:*
dtype0*
_output_shapes
:
Y
random_normal_7/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
random_normal_7/stddevConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Ю
$random_normal_7/RandomStandardNormalRandomStandardNormalrandom_normal_7/shape*

seed *
T0*
dtype0*
_output_shapes
:*
seed2 
}
random_normal_7/mulMul$random_normal_7/RandomStandardNormalrandom_normal_7/stddev*
T0*
_output_shapes
:
f
random_normal_7Addrandom_normal_7/mulrandom_normal_7/mean*
T0*
_output_shapes
:
t
weight_7
VariableV2*
shared_name *
dtype0*
_output_shapes
:*
	container *
shape:
Я
weight_7/AssignAssignweight_7random_normal_7*
use_locking(*
T0*
_class
loc:@weight_7*
validate_shape(*
_output_shapes
:
e
weight_7/readIdentityweight_7*
_output_shapes
:*
T0*
_class
loc:@weight_7
T
zeros_7Const*
valueB*    *
dtype0*
_output_shapes
:
r
bias_7
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
С
bias_7/AssignAssignbias_7zeros_7*
use_locking(*
T0*
_class
loc:@bias_7*
validate_shape(*
_output_shapes
:
_
bias_7/readIdentitybias_7*
T0*
_class
loc:@bias_7*
_output_shapes
:
N
Mul_7MulPlaceholder_14weight_7/read*
T0*
_output_shapes
:
C
add_7AddMul_7bias_7/read*
_output_shapes
:*
T0
F
sub_7SubPlaceholder_15add_7*
T0*
_output_shapes
:
<
Square_7Squaresub_7*
_output_shapes
:*
T0
9
Rank_7RankSquare_7*
T0*
_output_shapes
: 
O
range_7/startConst*
value	B : *
dtype0*
_output_shapes
: 
O
range_7/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
g
range_7Rangerange_7/startRank_7range_7/delta*

Tidx0*#
_output_shapes
:€€€€€€€€€
_
Mean_7MeanSquare_7range_7*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
T
gradients_7/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
Z
gradients_7/grad_ys_0Const*
valueB
 *  А?*
dtype0*
_output_shapes
: 
u
gradients_7/FillFillgradients_7/Shapegradients_7/grad_ys_0*
T0*

index_type0*
_output_shapes
: 
n
gradients_7/Mean_7_grad/ShapeShapeSquare_7*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
¶
gradients_7/Mean_7_grad/SizeSizegradients_7/Mean_7_grad/Shape*
T0*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*
out_type0*
_output_shapes
: 
©
gradients_7/Mean_7_grad/addAddrange_7gradients_7/Mean_7_grad/Size*
T0*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*#
_output_shapes
:€€€€€€€€€
¬
gradients_7/Mean_7_grad/modFloorModgradients_7/Mean_7_grad/addgradients_7/Mean_7_grad/Size*
T0*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*#
_output_shapes
:€€€€€€€€€
ђ
gradients_7/Mean_7_grad/Shape_1Shapegradients_7/Mean_7_grad/mod*
T0*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*
out_type0*
_output_shapes
:
Ч
#gradients_7/Mean_7_grad/range/startConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*
value	B : 
Ч
#gradients_7/Mean_7_grad/range/deltaConst*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
с
gradients_7/Mean_7_grad/rangeRange#gradients_7/Mean_7_grad/range/startgradients_7/Mean_7_grad/Size#gradients_7/Mean_7_grad/range/delta*

Tidx0*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ц
"gradients_7/Mean_7_grad/Fill/valueConst*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
џ
gradients_7/Mean_7_grad/FillFillgradients_7/Mean_7_grad/Shape_1"gradients_7/Mean_7_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*

index_type0*#
_output_shapes
:€€€€€€€€€
Ш
%gradients_7/Mean_7_grad/DynamicStitchDynamicStitchgradients_7/Mean_7_grad/rangegradients_7/Mean_7_grad/modgradients_7/Mean_7_grad/Shapegradients_7/Mean_7_grad/Fill*
N*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape
Х
!gradients_7/Mean_7_grad/Maximum/yConst*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
‘
gradients_7/Mean_7_grad/MaximumMaximum%gradients_7/Mean_7_grad/DynamicStitch!gradients_7/Mean_7_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*#
_output_shapes
:€€€€€€€€€
ћ
 gradients_7/Mean_7_grad/floordivFloorDivgradients_7/Mean_7_grad/Shapegradients_7/Mean_7_grad/Maximum*
T0*0
_class&
$"loc:@gradients_7/Mean_7_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ф
gradients_7/Mean_7_grad/ReshapeReshapegradients_7/Fill%gradients_7/Mean_7_grad/DynamicStitch*
T0*
Tshape0*
_output_shapes
:
Ь
gradients_7/Mean_7_grad/TileTilegradients_7/Mean_7_grad/Reshape gradients_7/Mean_7_grad/floordiv*
T0*
_output_shapes
:*

Tmultiples0
p
gradients_7/Mean_7_grad/Shape_2ShapeSquare_7*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
b
gradients_7/Mean_7_grad/Shape_3Const*
valueB *
dtype0*
_output_shapes
: 
g
gradients_7/Mean_7_grad/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
Ґ
gradients_7/Mean_7_grad/ProdProdgradients_7/Mean_7_grad/Shape_2gradients_7/Mean_7_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
i
gradients_7/Mean_7_grad/Const_1Const*
dtype0*
_output_shapes
:*
valueB: 
¶
gradients_7/Mean_7_grad/Prod_1Prodgradients_7/Mean_7_grad/Shape_3gradients_7/Mean_7_grad/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
e
#gradients_7/Mean_7_grad/Maximum_1/yConst*
dtype0*
_output_shapes
: *
value	B :
Т
!gradients_7/Mean_7_grad/Maximum_1Maximumgradients_7/Mean_7_grad/Prod_1#gradients_7/Mean_7_grad/Maximum_1/y*
T0*
_output_shapes
: 
Р
"gradients_7/Mean_7_grad/floordiv_1FloorDivgradients_7/Mean_7_grad/Prod!gradients_7/Mean_7_grad/Maximum_1*
T0*
_output_shapes
: 
x
gradients_7/Mean_7_grad/CastCast"gradients_7/Mean_7_grad/floordiv_1*
_output_shapes
: *

DstT0*

SrcT0
Й
gradients_7/Mean_7_grad/truedivRealDivgradients_7/Mean_7_grad/Tilegradients_7/Mean_7_grad/Cast*
T0*
_output_shapes
:
Ж
gradients_7/Square_7_grad/ConstConst ^gradients_7/Mean_7_grad/truediv*
valueB
 *   @*
dtype0*
_output_shapes
: 
o
gradients_7/Square_7_grad/MulMulsub_7gradients_7/Square_7_grad/Const*
T0*
_output_shapes
:
Й
gradients_7/Square_7_grad/Mul_1Mulgradients_7/Mean_7_grad/truedivgradients_7/Square_7_grad/Mul*
T0*
_output_shapes
:
s
gradients_7/sub_7_grad/ShapeShapePlaceholder_15*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
l
gradients_7/sub_7_grad/Shape_1Shapeadd_7*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
ј
,gradients_7/sub_7_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_7/sub_7_grad/Shapegradients_7/sub_7_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
∞
gradients_7/sub_7_grad/SumSumgradients_7/Square_7_grad/Mul_1,gradients_7/sub_7_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ф
gradients_7/sub_7_grad/ReshapeReshapegradients_7/sub_7_grad/Sumgradients_7/sub_7_grad/Shape*
T0*
Tshape0*
_output_shapes
:
і
gradients_7/sub_7_grad/Sum_1Sumgradients_7/Square_7_grad/Mul_1.gradients_7/sub_7_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
b
gradients_7/sub_7_grad/NegNeggradients_7/sub_7_grad/Sum_1*
_output_shapes
:*
T0
Ш
 gradients_7/sub_7_grad/Reshape_1Reshapegradients_7/sub_7_grad/Neggradients_7/sub_7_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_7/sub_7_grad/tuple/group_depsNoOp^gradients_7/sub_7_grad/Reshape!^gradients_7/sub_7_grad/Reshape_1
џ
/gradients_7/sub_7_grad/tuple/control_dependencyIdentitygradients_7/sub_7_grad/Reshape(^gradients_7/sub_7_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_7/sub_7_grad/Reshape*
_output_shapes
:
б
1gradients_7/sub_7_grad/tuple/control_dependency_1Identity gradients_7/sub_7_grad/Reshape_1(^gradients_7/sub_7_grad/tuple/group_deps*
_output_shapes
:*
T0*3
_class)
'%loc:@gradients_7/sub_7_grad/Reshape_1
j
gradients_7/add_7_grad/ShapeShapeMul_7*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
h
gradients_7/add_7_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_7/add_7_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_7/add_7_grad/Shapegradients_7/add_7_grad/Shape_1*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€*
T0
¬
gradients_7/add_7_grad/SumSum1gradients_7/sub_7_grad/tuple/control_dependency_1,gradients_7/add_7_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ф
gradients_7/add_7_grad/ReshapeReshapegradients_7/add_7_grad/Sumgradients_7/add_7_grad/Shape*
T0*
Tshape0*
_output_shapes
:
∆
gradients_7/add_7_grad/Sum_1Sum1gradients_7/sub_7_grad/tuple/control_dependency_1.gradients_7/add_7_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0
Ь
 gradients_7/add_7_grad/Reshape_1Reshapegradients_7/add_7_grad/Sum_1gradients_7/add_7_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_7/add_7_grad/tuple/group_depsNoOp^gradients_7/add_7_grad/Reshape!^gradients_7/add_7_grad/Reshape_1
џ
/gradients_7/add_7_grad/tuple/control_dependencyIdentitygradients_7/add_7_grad/Reshape(^gradients_7/add_7_grad/tuple/group_deps*
_output_shapes
:*
T0*1
_class'
%#loc:@gradients_7/add_7_grad/Reshape
г
1gradients_7/add_7_grad/tuple/control_dependency_1Identity gradients_7/add_7_grad/Reshape_1(^gradients_7/add_7_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_7/add_7_grad/Reshape_1*
_output_shapes
:
s
gradients_7/Mul_7_grad/ShapeShapePlaceholder_14*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_7/Mul_7_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_7/Mul_7_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_7/Mul_7_grad/Shapegradients_7/Mul_7_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Д
gradients_7/Mul_7_grad/MulMul/gradients_7/add_7_grad/tuple/control_dependencyweight_7/read*
T0*
_output_shapes
:
Ђ
gradients_7/Mul_7_grad/SumSumgradients_7/Mul_7_grad/Mul,gradients_7/Mul_7_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_7/Mul_7_grad/ReshapeReshapegradients_7/Mul_7_grad/Sumgradients_7/Mul_7_grad/Shape*
_output_shapes
:*
T0*
Tshape0
З
gradients_7/Mul_7_grad/Mul_1MulPlaceholder_14/gradients_7/add_7_grad/tuple/control_dependency*
T0*
_output_shapes
:
±
gradients_7/Mul_7_grad/Sum_1Sumgradients_7/Mul_7_grad/Mul_1.gradients_7/Mul_7_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ь
 gradients_7/Mul_7_grad/Reshape_1Reshapegradients_7/Mul_7_grad/Sum_1gradients_7/Mul_7_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_7/Mul_7_grad/tuple/group_depsNoOp^gradients_7/Mul_7_grad/Reshape!^gradients_7/Mul_7_grad/Reshape_1
џ
/gradients_7/Mul_7_grad/tuple/control_dependencyIdentitygradients_7/Mul_7_grad/Reshape(^gradients_7/Mul_7_grad/tuple/group_deps*
_output_shapes
:*
T0*1
_class'
%#loc:@gradients_7/Mul_7_grad/Reshape
г
1gradients_7/Mul_7_grad/tuple/control_dependency_1Identity gradients_7/Mul_7_grad/Reshape_1(^gradients_7/Mul_7_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_7/Mul_7_grad/Reshape_1*
_output_shapes
:
d
GradientDescent_7/learning_rateConst*
valueB
 *
„#<*
dtype0*
_output_shapes
: 
Б
6GradientDescent_7/update_weight_7/ApplyGradientDescentApplyGradientDescentweight_7GradientDescent_7/learning_rate1gradients_7/Mul_7_grad/tuple/control_dependency_1*
T0*
_class
loc:@weight_7*
_output_shapes
:*
use_locking( 
ы
4GradientDescent_7/update_bias_7/ApplyGradientDescentApplyGradientDescentbias_7GradientDescent_7/learning_rate1gradients_7/add_7_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@bias_7*
_output_shapes
:
Й
GradientDescent_7NoOp5^GradientDescent_7/update_bias_7/ApplyGradientDescent7^GradientDescent_7/update_weight_7/ApplyGradientDescent
Ъ
init_7NoOp^bias/Assign^bias_1/Assign^bias_2/Assign^bias_3/Assign^bias_4/Assign^bias_5/Assign^bias_6/Assign^bias_7/Assign^weight/Assign^weight_1/Assign^weight_2/Assign^weight_3/Assign^weight_4/Assign^weight_5/Assign^weight_6/Assign^weight_7/Assign
S
Placeholder_16Placeholder*
dtype0*
_output_shapes
:*
shape:
S
Placeholder_17Placeholder*
dtype0*
_output_shapes
:*
shape:
_
random_normal_8/shapeConst*
valueB:*
dtype0*
_output_shapes
:
Y
random_normal_8/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
random_normal_8/stddevConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Ю
$random_normal_8/RandomStandardNormalRandomStandardNormalrandom_normal_8/shape*
T0*
dtype0*
_output_shapes
:*
seed2 *

seed 
}
random_normal_8/mulMul$random_normal_8/RandomStandardNormalrandom_normal_8/stddev*
T0*
_output_shapes
:
f
random_normal_8Addrandom_normal_8/mulrandom_normal_8/mean*
T0*
_output_shapes
:
t
weight_8
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
Я
weight_8/AssignAssignweight_8random_normal_8*
T0*
_class
loc:@weight_8*
validate_shape(*
_output_shapes
:*
use_locking(
e
weight_8/readIdentityweight_8*
T0*
_class
loc:@weight_8*
_output_shapes
:
T
zeros_8Const*
valueB*    *
dtype0*
_output_shapes
:
r
bias_8
VariableV2*
shape:*
shared_name *
dtype0*
_output_shapes
:*
	container 
С
bias_8/AssignAssignbias_8zeros_8*
use_locking(*
T0*
_class
loc:@bias_8*
validate_shape(*
_output_shapes
:
_
bias_8/readIdentitybias_8*
T0*
_class
loc:@bias_8*
_output_shapes
:
N
Mul_8MulPlaceholder_16weight_8/read*
T0*
_output_shapes
:
C
add_8AddMul_8bias_8/read*
T0*
_output_shapes
:
F
sub_8SubPlaceholder_17add_8*
T0*
_output_shapes
:
<
Square_8Squaresub_8*
T0*
_output_shapes
:
9
Rank_8RankSquare_8*
T0*
_output_shapes
: 
O
range_8/startConst*
value	B : *
dtype0*
_output_shapes
: 
O
range_8/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
g
range_8Rangerange_8/startRank_8range_8/delta*#
_output_shapes
:€€€€€€€€€*

Tidx0
_
Mean_8MeanSquare_8range_8*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
T
gradients_8/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
Z
gradients_8/grad_ys_0Const*
valueB
 *  А?*
dtype0*
_output_shapes
: 
u
gradients_8/FillFillgradients_8/Shapegradients_8/grad_ys_0*
T0*

index_type0*
_output_shapes
: 
n
gradients_8/Mean_8_grad/ShapeShapeSquare_8*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
¶
gradients_8/Mean_8_grad/SizeSizegradients_8/Mean_8_grad/Shape*
_output_shapes
: *
T0*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*
out_type0
©
gradients_8/Mean_8_grad/addAddrange_8gradients_8/Mean_8_grad/Size*
T0*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*#
_output_shapes
:€€€€€€€€€
¬
gradients_8/Mean_8_grad/modFloorModgradients_8/Mean_8_grad/addgradients_8/Mean_8_grad/Size*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape
ђ
gradients_8/Mean_8_grad/Shape_1Shapegradients_8/Mean_8_grad/mod*
T0*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*
out_type0*
_output_shapes
:
Ч
#gradients_8/Mean_8_grad/range/startConst*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*
value	B : *
dtype0*
_output_shapes
: 
Ч
#gradients_8/Mean_8_grad/range/deltaConst*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
с
gradients_8/Mean_8_grad/rangeRange#gradients_8/Mean_8_grad/range/startgradients_8/Mean_8_grad/Size#gradients_8/Mean_8_grad/range/delta*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*#
_output_shapes
:€€€€€€€€€*

Tidx0
Ц
"gradients_8/Mean_8_grad/Fill/valueConst*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
џ
gradients_8/Mean_8_grad/FillFillgradients_8/Mean_8_grad/Shape_1"gradients_8/Mean_8_grad/Fill/value*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*

index_type0
Ш
%gradients_8/Mean_8_grad/DynamicStitchDynamicStitchgradients_8/Mean_8_grad/rangegradients_8/Mean_8_grad/modgradients_8/Mean_8_grad/Shapegradients_8/Mean_8_grad/Fill*
T0*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*
N*#
_output_shapes
:€€€€€€€€€
Х
!gradients_8/Mean_8_grad/Maximum/yConst*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*
value	B :*
dtype0*
_output_shapes
: 
‘
gradients_8/Mean_8_grad/MaximumMaximum%gradients_8/Mean_8_grad/DynamicStitch!gradients_8/Mean_8_grad/Maximum/y*
T0*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*#
_output_shapes
:€€€€€€€€€
ћ
 gradients_8/Mean_8_grad/floordivFloorDivgradients_8/Mean_8_grad/Shapegradients_8/Mean_8_grad/Maximum*
T0*0
_class&
$"loc:@gradients_8/Mean_8_grad/Shape*#
_output_shapes
:€€€€€€€€€
Ф
gradients_8/Mean_8_grad/ReshapeReshapegradients_8/Fill%gradients_8/Mean_8_grad/DynamicStitch*
T0*
Tshape0*
_output_shapes
:
Ь
gradients_8/Mean_8_grad/TileTilegradients_8/Mean_8_grad/Reshape gradients_8/Mean_8_grad/floordiv*
T0*
_output_shapes
:*

Tmultiples0
p
gradients_8/Mean_8_grad/Shape_2ShapeSquare_8*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
b
gradients_8/Mean_8_grad/Shape_3Const*
valueB *
dtype0*
_output_shapes
: 
g
gradients_8/Mean_8_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:
Ґ
gradients_8/Mean_8_grad/ProdProdgradients_8/Mean_8_grad/Shape_2gradients_8/Mean_8_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
i
gradients_8/Mean_8_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
¶
gradients_8/Mean_8_grad/Prod_1Prodgradients_8/Mean_8_grad/Shape_3gradients_8/Mean_8_grad/Const_1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
e
#gradients_8/Mean_8_grad/Maximum_1/yConst*
dtype0*
_output_shapes
: *
value	B :
Т
!gradients_8/Mean_8_grad/Maximum_1Maximumgradients_8/Mean_8_grad/Prod_1#gradients_8/Mean_8_grad/Maximum_1/y*
T0*
_output_shapes
: 
Р
"gradients_8/Mean_8_grad/floordiv_1FloorDivgradients_8/Mean_8_grad/Prod!gradients_8/Mean_8_grad/Maximum_1*
T0*
_output_shapes
: 
x
gradients_8/Mean_8_grad/CastCast"gradients_8/Mean_8_grad/floordiv_1*

SrcT0*
_output_shapes
: *

DstT0
Й
gradients_8/Mean_8_grad/truedivRealDivgradients_8/Mean_8_grad/Tilegradients_8/Mean_8_grad/Cast*
T0*
_output_shapes
:
Ж
gradients_8/Square_8_grad/ConstConst ^gradients_8/Mean_8_grad/truediv*
dtype0*
_output_shapes
: *
valueB
 *   @
o
gradients_8/Square_8_grad/MulMulsub_8gradients_8/Square_8_grad/Const*
T0*
_output_shapes
:
Й
gradients_8/Square_8_grad/Mul_1Mulgradients_8/Mean_8_grad/truedivgradients_8/Square_8_grad/Mul*
T0*
_output_shapes
:
s
gradients_8/sub_8_grad/ShapeShapePlaceholder_17*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
l
gradients_8/sub_8_grad/Shape_1Shapeadd_8*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
ј
,gradients_8/sub_8_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_8/sub_8_grad/Shapegradients_8/sub_8_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
∞
gradients_8/sub_8_grad/SumSumgradients_8/Square_8_grad/Mul_1,gradients_8/sub_8_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ф
gradients_8/sub_8_grad/ReshapeReshapegradients_8/sub_8_grad/Sumgradients_8/sub_8_grad/Shape*
T0*
Tshape0*
_output_shapes
:
і
gradients_8/sub_8_grad/Sum_1Sumgradients_8/Square_8_grad/Mul_1.gradients_8/sub_8_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
b
gradients_8/sub_8_grad/NegNeggradients_8/sub_8_grad/Sum_1*
_output_shapes
:*
T0
Ш
 gradients_8/sub_8_grad/Reshape_1Reshapegradients_8/sub_8_grad/Neggradients_8/sub_8_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_8/sub_8_grad/tuple/group_depsNoOp^gradients_8/sub_8_grad/Reshape!^gradients_8/sub_8_grad/Reshape_1
џ
/gradients_8/sub_8_grad/tuple/control_dependencyIdentitygradients_8/sub_8_grad/Reshape(^gradients_8/sub_8_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_8/sub_8_grad/Reshape*
_output_shapes
:
б
1gradients_8/sub_8_grad/tuple/control_dependency_1Identity gradients_8/sub_8_grad/Reshape_1(^gradients_8/sub_8_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_8/sub_8_grad/Reshape_1*
_output_shapes
:
j
gradients_8/add_8_grad/ShapeShapeMul_8*
T0*
out_type0*#
_output_shapes
:€€€€€€€€€
h
gradients_8/add_8_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
ј
,gradients_8/add_8_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_8/add_8_grad/Shapegradients_8/add_8_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
¬
gradients_8/add_8_grad/SumSum1gradients_8/sub_8_grad/tuple/control_dependency_1,gradients_8/add_8_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_8/add_8_grad/ReshapeReshapegradients_8/add_8_grad/Sumgradients_8/add_8_grad/Shape*
T0*
Tshape0*
_output_shapes
:
∆
gradients_8/add_8_grad/Sum_1Sum1gradients_8/sub_8_grad/tuple/control_dependency_1.gradients_8/add_8_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ь
 gradients_8/add_8_grad/Reshape_1Reshapegradients_8/add_8_grad/Sum_1gradients_8/add_8_grad/Shape_1*
_output_shapes
:*
T0*
Tshape0
s
'gradients_8/add_8_grad/tuple/group_depsNoOp^gradients_8/add_8_grad/Reshape!^gradients_8/add_8_grad/Reshape_1
џ
/gradients_8/add_8_grad/tuple/control_dependencyIdentitygradients_8/add_8_grad/Reshape(^gradients_8/add_8_grad/tuple/group_deps*
_output_shapes
:*
T0*1
_class'
%#loc:@gradients_8/add_8_grad/Reshape
г
1gradients_8/add_8_grad/tuple/control_dependency_1Identity gradients_8/add_8_grad/Reshape_1(^gradients_8/add_8_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_8/add_8_grad/Reshape_1*
_output_shapes
:
s
gradients_8/Mul_8_grad/ShapeShapePlaceholder_16*#
_output_shapes
:€€€€€€€€€*
T0*
out_type0
h
gradients_8/Mul_8_grad/Shape_1Const*
valueB:*
dtype0*
_output_shapes
:
ј
,gradients_8/Mul_8_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_8/Mul_8_grad/Shapegradients_8/Mul_8_grad/Shape_1*
T0*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Д
gradients_8/Mul_8_grad/MulMul/gradients_8/add_8_grad/tuple/control_dependencyweight_8/read*
T0*
_output_shapes
:
Ђ
gradients_8/Mul_8_grad/SumSumgradients_8/Mul_8_grad/Mul,gradients_8/Mul_8_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ф
gradients_8/Mul_8_grad/ReshapeReshapegradients_8/Mul_8_grad/Sumgradients_8/Mul_8_grad/Shape*
T0*
Tshape0*
_output_shapes
:
З
gradients_8/Mul_8_grad/Mul_1MulPlaceholder_16/gradients_8/add_8_grad/tuple/control_dependency*
T0*
_output_shapes
:
±
gradients_8/Mul_8_grad/Sum_1Sumgradients_8/Mul_8_grad/Mul_1.gradients_8/Mul_8_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Ь
 gradients_8/Mul_8_grad/Reshape_1Reshapegradients_8/Mul_8_grad/Sum_1gradients_8/Mul_8_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
s
'gradients_8/Mul_8_grad/tuple/group_depsNoOp^gradients_8/Mul_8_grad/Reshape!^gradients_8/Mul_8_grad/Reshape_1
џ
/gradients_8/Mul_8_grad/tuple/control_dependencyIdentitygradients_8/Mul_8_grad/Reshape(^gradients_8/Mul_8_grad/tuple/group_deps*
_output_shapes
:*
T0*1
_class'
%#loc:@gradients_8/Mul_8_grad/Reshape
г
1gradients_8/Mul_8_grad/tuple/control_dependency_1Identity gradients_8/Mul_8_grad/Reshape_1(^gradients_8/Mul_8_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_8/Mul_8_grad/Reshape_1*
_output_shapes
:
d
GradientDescent_8/learning_rateConst*
valueB
 *
„#<*
dtype0*
_output_shapes
: 
Б
6GradientDescent_8/update_weight_8/ApplyGradientDescentApplyGradientDescentweight_8GradientDescent_8/learning_rate1gradients_8/Mul_8_grad/tuple/control_dependency_1*
T0*
_class
loc:@weight_8*
_output_shapes
:*
use_locking( 
ы
4GradientDescent_8/update_bias_8/ApplyGradientDescentApplyGradientDescentbias_8GradientDescent_8/learning_rate1gradients_8/add_8_grad/tuple/control_dependency_1*
_output_shapes
:*
use_locking( *
T0*
_class
loc:@bias_8
Й
GradientDescent_8NoOp5^GradientDescent_8/update_bias_8/ApplyGradientDescent7^GradientDescent_8/update_weight_8/ApplyGradientDescent
Љ
init_8NoOp^bias/Assign^bias_1/Assign^bias_2/Assign^bias_3/Assign^bias_4/Assign^bias_5/Assign^bias_6/Assign^bias_7/Assign^bias_8/Assign^weight/Assign^weight_1/Assign^weight_2/Assign^weight_3/Assign^weight_4/Assign^weight_5/Assign^weight_6/Assign^weight_7/Assign^weight_8/Assign
P

save/ConstConst*
dtype0*
_output_shapes
: *
valueB Bmodel
А
save/SaveV2/tensor_namesConst*≥
value©B¶BbiasBbias_1Bbias_2Bbias_3Bbias_4Bbias_5Bbias_6Bbias_7Bbias_8BweightBweight_1Bweight_2Bweight_3Bweight_4Bweight_5Bweight_6Bweight_7Bweight_8*
dtype0*
_output_shapes
:
З
save/SaveV2/shape_and_slicesConst*7
value.B,B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
Щ
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesbiasbias_1bias_2bias_3bias_4bias_5bias_6bias_7bias_8weightweight_1weight_2weight_3weight_4weight_5weight_6weight_7weight_8* 
dtypes
2
}
save/control_dependencyIdentity
save/Const^save/SaveV2*
T0*
_class
loc:@save/Const*
_output_shapes
: 
Т
save/RestoreV2/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*≥
value©B¶BbiasBbias_1Bbias_2Bbias_3Bbias_4Bbias_5Bbias_6Bbias_7Bbias_8BweightBweight_1Bweight_2Bweight_3Bweight_4Bweight_5Bweight_6Bweight_7Bweight_8
Щ
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*7
value.B,B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
ф
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*\
_output_shapesJ
H::::::::::::::::::* 
dtypes
2
Т
save/AssignAssignbiassave/RestoreV2*
T0*
_class
	loc:@bias*
validate_shape(*
_output_shapes
:*
use_locking(
Ъ
save/Assign_1Assignbias_1save/RestoreV2:1*
T0*
_class
loc:@bias_1*
validate_shape(*
_output_shapes
:*
use_locking(
Ъ
save/Assign_2Assignbias_2save/RestoreV2:2*
use_locking(*
T0*
_class
loc:@bias_2*
validate_shape(*
_output_shapes
:
Ъ
save/Assign_3Assignbias_3save/RestoreV2:3*
use_locking(*
T0*
_class
loc:@bias_3*
validate_shape(*
_output_shapes
:
Ъ
save/Assign_4Assignbias_4save/RestoreV2:4*
T0*
_class
loc:@bias_4*
validate_shape(*
_output_shapes
:*
use_locking(
Ъ
save/Assign_5Assignbias_5save/RestoreV2:5*
T0*
_class
loc:@bias_5*
validate_shape(*
_output_shapes
:*
use_locking(
Ъ
save/Assign_6Assignbias_6save/RestoreV2:6*
T0*
_class
loc:@bias_6*
validate_shape(*
_output_shapes
:*
use_locking(
Ъ
save/Assign_7Assignbias_7save/RestoreV2:7*
use_locking(*
T0*
_class
loc:@bias_7*
validate_shape(*
_output_shapes
:
Ъ
save/Assign_8Assignbias_8save/RestoreV2:8*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@bias_8
Ъ
save/Assign_9Assignweightsave/RestoreV2:9*
use_locking(*
T0*
_class
loc:@weight*
validate_shape(*
_output_shapes
:
†
save/Assign_10Assignweight_1save/RestoreV2:10*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@weight_1
†
save/Assign_11Assignweight_2save/RestoreV2:11*
use_locking(*
T0*
_class
loc:@weight_2*
validate_shape(*
_output_shapes
:
†
save/Assign_12Assignweight_3save/RestoreV2:12*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@weight_3
†
save/Assign_13Assignweight_4save/RestoreV2:13*
T0*
_class
loc:@weight_4*
validate_shape(*
_output_shapes
:*
use_locking(
†
save/Assign_14Assignweight_5save/RestoreV2:14*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@weight_5
†
save/Assign_15Assignweight_6save/RestoreV2:15*
use_locking(*
T0*
_class
loc:@weight_6*
validate_shape(*
_output_shapes
:
†
save/Assign_16Assignweight_7save/RestoreV2:16*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*
_class
loc:@weight_7
†
save/Assign_17Assignweight_8save/RestoreV2:17*
use_locking(*
T0*
_class
loc:@weight_8*
validate_shape(*
_output_shapes
:
Њ
save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9
S
Placeholder_18Placeholder*
shape:*
dtype0*
_output_shapes
:
S
Placeholder_19Placeholder*
dtype0*
_output_shapes
:*
shape:
_
random_normal_9/shapeConst*
valueB:*
dtype0*
_output_shapes
:
Y
random_normal_9/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: 
[
random_normal_9/stddevConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
Ю
$random_normal_9/RandomStandardNormalRandomStandardNormalrandom_normal_9/shape*
T0*
dtype0*
_output_shapes
:*
seed2 *

seed 
}
random_normal_9/mulMul$random_normal_9/RandomStandardNormalrandom_normal_9/stddev*
T0*
_output_shapes
:
f
random_normal_9Addrandom_normal_9/mulrandom_normal_9/mean*