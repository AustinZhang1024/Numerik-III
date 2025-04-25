#import "../conf.typ": conf

#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": plot, chart

#show: conf.with(exercise_num: [01])

= Basic properties of the nabla operator.

== i

With the help of the nabla operator given in the sheet,
we can get:

$
  nabla dot nabla u &= nabla dot (diff_x u, diff_y u, diff_z u)^T \
  &= diff_x diff_x u + diff_y diff_y u + diff_z diff_z u \
  &= diff_(x x)u + diff_(y y)u + diff_(z z)u
$

== ii

With theorem of Schwarz, we have:

$
  diff_(x y) v_3 = diff_(y x) v_3 \
  diff_(x z) v_2 = diff_(z x) v_2 \
  diff_(y z) v_1 = diff_(z y) v_1
$

then

$
  nabla dot (nabla times bold(v)) &= nabla dot (diff_y v_3-diff_z v_2, diff_z v_1-diff_x v_3, diff_x v_2-diff_y v_1)^T \
  &= diff_x (diff_y v_3-diff_z v_2) + diff_y (diff_z v_1-diff_x v_3) + diff_z (diff_x v_2-diff_y v_1) \
  &= diff_(x y) v_3 - diff_(x z) v_2 + diff_(y z) v_1 - diff_(y x) v_3 + diff_(z x) v_2 - diff_(z y) v_1 \
  &= diff_(x y) v_3 - diff_(x z) v_2 + diff_(y z) v_1 - diff_(x y) v_3 + diff_(x z) v_2 - diff_(y z) v_1 \
  &= 0
$

== iii

$
  nabla times (nabla u) &= nabla times (diff_x u, diff_y u, diff_z u)^T \
  &= (diff_y diff_z u - diff_z diff_y u, diff_z diff_x u - diff_x diff_z u, diff_x diff_y u - diff_y diff_x u)^T \
  &= (diff_y diff_z u - diff_y diff_z u, diff_x diff_z u - diff_x diff_z u, diff_x diff_y u - diff_x diff_y u)^T \
  &= (0, 0, 0)^T \
  &= bold(0)
$

== iv

Recall the cross product:

$
  bold(a) times bold(b) = (a_2 b_3 - a_3 b_2, a_3 b_1 - a_1 b_3, a_1 b_2 - a_2 b_1)^T
$

then we can get:

$
  nabla times (u bold(v)) &= nabla times (u (v_1, v_2, v_3)^T) \
  &= (diff_y (u v_3) - diff_z (u v_2), diff_z (u v_1) - diff_x (u v_3), diff_x (u v_2) - diff_y (u v_1))^T \
  &= vec(v_3 diff_y u + u diff_y v_3 - v_2 diff_z u - u diff_z v_2, v_1 diff_z u + u diff_z v_1 - v_3 diff_x u - u diff_x v_3, v_2 diff_x u + u diff_x v_2 - v_1 diff_y u - u diff_y v_1) \
  &= vec(u diff_y v_3 - u diff_z v_2, u diff_z v_1 - u diff_x v_3, u diff_x v_2 - u diff_y v_1) + vec(v_3 diff_y u - v_2 diff_z u, v_1 diff_z u -v_3 diff_x u, v_2 diff_x u - v_1 diff_y u) \
  &= u(nabla times bold(v)) + (nabla u times bold(v)) \
  &= u nabla times bold(v) - (bold(v) times nabla u)
$

== v

$
  nabla dot (u bold(v)) &=nabla dot (u (v_1, v_2, v_3)^T) \
  &= diff_x (u v_1) + diff_y (u v_2) + diff_z (u v_3) \
  &stretch(=)^"Product Rule" v_1 diff_x u + u diff_x v_1 + v_2 diff_y u + u diff_y v_2 + v_3 diff_z u + u diff_z v_3 \
  &= (v_1 diff_x u + v_2 diff_y u + v_3 diff_z u) + u (diff_x v_1 + diff_y v_2 + diff_z v_3) \
  &= nabla u dot bold(v) + u nabla dot bold(v)
$

= Analytic solution of a one-dimensional heat equation.

We can just pulg in $u_0$ into the equation:

$
  u(t,x) =& 1 / sqrt(4 pi t) integral_(-infinity)^(+infinity) u_0(z) e^(-(x-z)^2 / (4t)) "d"z \
  =& 1 / sqrt(4 pi t) integral_(-infinity)^(+infinity) (alpha_0 / 2+sum_(n=1)^infinity (alpha_n cos(n omega x)+beta_n sin(n omega x))) e^(-(x-z)^2 / (4t)) "d"z \
  =& 1 / sqrt(4 pi t)alpha_0 / 2 integral_(-infinity)^(+infinity) cos(0times z) e^(-(x-z)^2 / (4t))"d"z
  + 1 / sqrt(4 pi t)sum_(n=1)^infinity alpha_n integral_(-infinity)^(+infinity) cos(n omega z)"d"z\
  &+1 / sqrt(4 pi t) sum_(n=1)^infinity beta_n integral_(-infinity)^(+infinity) sin(n omega z)) e^(-(x-z)^2 / (4t)) "d"z \
  =& alpha_0 / 2 e^(-(0)^2 t) cos(0 times x)
  +sum_(n=1)^infinity alpha_n e^(-(n omega)^2 t) cos(n omega x)
  +sum_(n=1)^infinity beta_n e^(-(n omega)^2 t) sin(n omega x) \
  =& alpha_0 / 2
  +sum_(n=1)^infinity alpha_n e^(-(n omega)^2 t) cos(n omega x)
  +sum_(n=1)^infinity beta_n e^(-(n omega)^2 t) sin(n omega x)
$

== Validation of the 1st equation

$
  diff_t u =& -(n omega)^2sum_(n=1)^infinity alpha_n e^(-(n omega)^2 t) cos(n omega x)
  -(n omega)^2 sum_(n=1)^infinity beta_n e^(-(n omega)^2 t) sin(n omega x)
$

$
  diff_(x x) =& diff_x (diff_x u) \
  =& diff_x ((n omega) sum_(n=1)^infinity alpha_n e^(-(n omega)^2 t) sin(n omega x)
    -(n omega) sum_(n=1)^infinity beta_n e^(-(n omega)^2 t) cos(n omega x)) \
  =& -(n omega)^2sum_(n=1)^infinity alpha_n e^(-(n omega)^2 t) cos(n omega x)
  -(n omega)^2 sum_(n=1)^infinity beta_n e^(-(n omega)^2 t) sin(n omega x)
$

So $diff_t u-diff_(x x)u=0$ satisfied.

== Validation of the 2nd equation

$
  u(0,x) =& alpha_0 / 2
  +sum_(n=1)^infinity alpha_n e^(-(n omega)^2 times 0) cos(n omega x)
  +sum_(n=1)^infinity beta_n e^(-(n omega)^2 times 0) sin(n omega x) \
  =& alpha_0 / 2
  +sum_(n=1)^infinity alpha_n cos(n omega x)
  +sum_(n=1)^infinity beta_n sin(n omega x) \
  =& u_0(x)
$

Therefore,
$u(t,x) =& 1 / sqrt(4 pi t) integral_(-infinity)^(+infinity) u_0(z) e^(-(x-z)^2 / (4t)) "d"z$ is a solution of the one-dimensional heat equation.

= Classification of second order partial differential equations.

== i

$
  A(bold(x)) &= mat(1, 1, 0; 1, 2, 2; 0, 2, 5)
$

By calculating the determinant of $A-lambda I$,
we can get the characteristic polynomial is $-lambda^3+8lambda^2-12lambda+1$,
and the roots have $lambda_1lambda_2lambda_3>0$.

So the original equation is elliptic.

== ii

$
  A(bold(x)) &= mat(-1, e^z / 2, 0; e^z / 2, 0, 0; 0, 0, 0)
$

We have:

$
  det(A-lambda I) &= det(mat(-1-lambda, e^z / 2, 0; e^z / 2, -lambda, 0; 0, 0, -lambda))
  &= -lambda det(mat(-1-lambda, e^z / 2; e^z / 2, -lambda)) \
  &= -lambda((-1-lambda)(-lambda)-e^(2z) / 4)
$

For equation $det(A-lambda I)=0$,
one of the roots is $lambda_1=0$,
and the other two satisfy $lambda(lambda+1)=e^(2z) / 4$

To solve this equation,
suppose two functions:
$y_1=lambda(lambda+1)$ and $y_2=e^(2z) / 4$,
and we can get the intersection of $y_1$ and $y_2$ and we can get the roots.

#align(center)[
  #cetz.canvas({
    plot.plot(
      size: (5, 5),
      axis-style: "school-book",
      x-tick-step: none,
      y-tick-step: none,
      x-label: none,
      y-label: none,
      {
        plot.add(
          domain: (-1.5, 0.5),
          x => calc.exp(2 * x) / 4,
          label: $e^(2z)\/4$,
        )
        plot.add(
          domain: (-1.5, 0.5),
          x => x * (x + 1),
          label: $lambda(lambda+1)$,
        )
      },
    )
  })
]

So we can get the intersection of $y_1$ and $y_2$ is $lambda_1>0$ and $lambda_2<0$.

So the original equation is not elliptic,
hyperbolic or parabolic.

== iii

$
  A(bold(x)) &= mat(1, 2; 2, 3)
$

After solving $det(A-lambda I)=0$,
we can get $lambda_1=2+sqrt(5)>0$,
$lambda_2=2-sqrt(5)<0$.

So the original equation is hyperbolic.

== iv

$
  A(bold(x)) &= mat(a, a; a, a)
$

And $det(A-lambda I)=(a-lambda)^2-a^2=lambda^2-2a lambda=lambda(lambda-2a)$.

So the roots of $lambda(lambda-2a)=0$ are $lambda_1=0$ and $lambda_2=2a!=0$.

So the original equation is parabolic.
