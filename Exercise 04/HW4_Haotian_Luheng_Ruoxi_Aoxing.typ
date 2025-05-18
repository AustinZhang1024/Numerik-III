#import "../conf.typ": conf

#show: conf.with(exercise_num: [04])

= Matrix property, detail of the proof of Theorem 2.45.

From the question,
we know that $A, B$ are symmetric positive definite matrices
and they are commutative.
And we can find an orthogonal matrix $U$ such that $A=U^T Lambda_A U$ and $B=U^T Lambda_B U$
where $Lambda_A=op("diag")(lambda_1, dots, lambda_n)$ and $Lambda_B=op("diag")(mu_1, dots, mu_n)$ and $lambda_i$ and $mu_i$ are the eigenvalues of $A$ and $B$ respectively.

So we can get the following equations:

$
  (A underline(x), underline(x))-(B underline(x), underline(x)) &= (A underline(x))^T underline(x) - (B underline(x))^T underline(x) \
  &= underline(x)^T A underline(x) - underline(x)^T B underline(x) \
  &= underline(x)^T (A-B) underline(x) \
  &= underline(x)^T (U^T Lambda_A U-U^T Lambda_B U) underline(x) \
  &= underline(x)^T (U^T (Lambda_A-Lambda_B) U) underline(x) \
  &= (U underline(x))^T (Lambda_A-Lambda_B) (U underline(x)) \
  &>= 0
$

Because $U underline(x)$ are arbitrary vectors,
we can infer that $Lambda_A-Lambda_B$ is positive semi-definite.
Or we can say that $forall i = 1,dots,n$,
we have $lambda_i >= mu_i>0$.

To prove $norm(A underline(x))_2 >= norm(B underline(x))_2$,
we can try to prove $norm(A underline(x))_2^2 >= norm(B underline(x))_2^2$
and we can get the following equations:

$
  norm(A underline(x))_2^2 - norm(B underline(x))_2^2 &= (A underline(x), A underline(x)) - (B underline(x), B underline(x)) \
  &= underline(x)^T (A^2-B^2) underline(x) \
  &= underline(x)^T (U^T Lambda_A U U^T Lambda_A U-U^T Lambda_B U U^T Lambda_B U) underline(x) \
  &= underline(x)^T (U^T Lambda_A^2 U-U^T Lambda_B^2 U) underline(x) \
  &= (U underline(x))^T (Lambda_A^2-Lambda_B^2) (U underline(x)) \
  &>= (U underline(x))^T op("diag")(lambda_i^2-mu_i^2) (U underline(x)) \
$

Because $lambda_i >= mu_i > 0$,
we can get $lambda_i^2 >= mu_i^2$.
So $Lambda_A^2-Lambda_B^2$ is positive semi-definite.
Then we can get $A^2-B^2$ is positive semi-definite.
Thus $norm(A underline(x))_2 >= norm(B underline(x))_2$.

= Code for nine point stencil.

Recall from exercise 2,
we already know that $(diff^2 u) / (diff x^2) = 12x^2y^5+17y^2 sin(x y)$.
To get $(diff^4 u) / (diff x^2 diff y^2)$,
we need to derivative $(diff^2 u) / (diff x^2)$ twice with respect to $y$.

$
  (diff^3 u) / (diff x^2 diff y) = 60x^2y^4+34 y sin(x y) + 17x y^2 cos(x y) \
  (diff^4 u) / (diff x^2 diff y^2) = 240x^2y^3+34 sin(x y) + 34x y cos(x y) + 34x y cos(x y) - 17x^2 y^2 sin(x y)
$

And the new equation is:

$
  (diff^4 u) / (diff x^2 diff y^2) &approx Lambda_x Lambda_y u \
  &= 1/h^4(u_(i+1,j+1)-2u_(i,j+1)+u_(i-1,j+1)-2u_(i+1,j)+4u_(i j)-2u_(i-1,j)+u_(i+1,j-1)-2u_(i,j-1)+u_(i-1,j-1)) \
$
