#import "../conf.typ": conf

#show: conf.with(exercise_num: [02])

= Basic properties of finite difference approximations.

== i

According to Definition 2.4 of the lecture notes, we have:

$
  v_(circle(x),i) = (v_(i+1)-v_(i-1)) / (2h) = 1 / 2((v_(i+1)-v_i) / h+(v_i-v_(i-1)) / h) = 1 / 2(v_(x,i)+v_(overline(x),i))
$

and

$
  v_(overline(x)x,i)= & (v_(i+1)-2v_i+v_(i-1)) / (h^2)                \
                    = & 1 / h ((v_(i+1)-v_i) / h - (v_i-v_(i-1)) / h) \
                    = & (v_(overline(x), i+1)-v_(overline(x), i)) / h \
                    = & (v_(overline(x),i))_(x,i)                     \
$

== ii

Consider the definition of $v(x_i)$ and $x_(i+1)=x_i+h$.
With the help of Taylor expansion,
we have:

$
  v_(circle(x),i) &= (v_(i+1)-v_(i-1)) / (2h) \
  &= (v(x_i+h)-v(x_i-h)) / (2h) \
  &stretch(=)^("Taylor expansion")& 1 / (2h) ((v(x_i)+v'(x_i)h+(v''(x_i)) / 2 h^2 + O(h^3)) \
    && -(v_(x_i)-v(x_i)h+(v''(x_i)) / 2 h^2 + O(h^3))) \
  &= (2v'(x_i)h+O(h^3)) / (2h) \
  &= v'(x_i)+O(h^2)
$<Eq:3>

$
  v_(overline(x)x,i) =& (v_(i+1)-2v_i+v_(i-1)) / (h^2) \
  =& (v(x_i+h)-2v(x_i)+v(x_i-h)) / (h^2) \
  =& 1 / h^2((v(x_i)+v'(x_i)h+(v''(x_i)) / 2 h^2 + (v'''(x_i)) / 6 h^3 + O(h^4)) \
    &-2v(x_i)+(v(x_i)-v'(x_i)h+(v''(x_i)) / 2 h^2 - (v'''(x_i)) / 6 h^3 + O(h^4))) \
  =& ((v''(x_i)) h^2 + O(h^4)) / h^2 \
  =& v''(x_i) + O(h^2)
$

== iii

With Taylor expansion, we have:

$
  cases(
    u(x+2h) =& u(x)+2h u'(x)+2h^2u''(x) + h^3(u'''(x)) / 3! \
    &+ 2^4 h^4(u^((4))(x)) / 4! + 2^5 h^5(u^((5))(x)) / 5! + 2^6 h^6(u^((6))(x)) / 6!+ O(h^7),
    u(x+h) =& u(x)+h u'(x)+h^2(u''(x)) / 2 + h^3(u'''(x)) / 3! \
    &+ h^4(u^((4))(x)) / 4! + h^5(u^((5))(x)) / 5! + h^6(u^((6))(x)) / 6!+ O(h^7),
    u(x-h) =& u(x)-h u'(x)+h^2(u''(x)) / 2 - h^3(u'''(x)) / 3! \
    &+ h^4(u^((4))(x)) / 4! - h^5(u^((5))(x)) / 5! + h^6(u^((6))(x)) / 6!+ O(h^7),
    u(x-2h) =& u(x)-2h u'(x)+2h^2u''(x) - h^3(u'''(x)) / 3! \
    &+ 2^4 h^4(u^((4))(x)) / 4! - 2^5 h^5(u^((5))(x)) / 5! + 2^6 h^6(u^((6))(x)) / 6!+ O(h^7),
  )
$

So we can derive:

$
  &-u(x+2h)+16u(x+h)-30u(x)+16u(x-h)-u(x-2h) \
  =& -(u(x+2h)+u(x-2h))-30u(x)+16(u(x+h)+u(x-h)) \
  =& -(2u(x)+4h^2u''(x) + 2^5 h^4(u^((4))(x)) / 4! + 2^7 h^6(u^((6))(x)) / 6!+ O(h^7)) \
  & + 16(2u(x)+h^2u''(x)+2h^4(u^((4))(x)) / 4!+2h^6(u^((6))(x)) / 6!) -30u(x+ O(h^7)) \
  =& 12h^2u''(x)+(2^5-2^7)h^6(u^((6))(x)) / 6!+ O(h^7) \
  =& 12h^2(u''(x)+O(h^4)) \
$

So the order of consistency is $4$.

= Finite difference approximation of the second order derivative for non-constant diffusion..

If $a_i=(k_i+k_(i-1)) / 2$,
then we have:

$
  (a_(i+1)-a_i) / h & = (k_(i+1)-k_(i-1)) / 2h                   \
                    & stretch(=)^(#ref(<Eq:3>)) k'(x_i) + O(h^2) \
$

$
  (a_(i+1)+a_i) / 2 &= (k_(i+1) + 2k_i + k_(i-1)) / 4 \
  &stretch(=)^("Taylor Expansion") 1 / 4 (k(x_i)+h k'(x_i)+O(h^2)+2k(x_i)-h k'(x_i)+O(h^2)) \
  &= k(x_i) + O(h^2)
$

If $a_i = k(x_i-h / 2)$,
then $a_(i+1) = k(x_i+h / 2)$,
and we can get:

$
  (a_(i+1)-a_i) / h &= (k(x_i+h / 2)-k(x_i-h / 2)) / h \
  &stretch(=)^("Taylor expansion") 1 / h ((k(x_i)+h / 2 k'(x_i)+h^2 / 4 k''(x_i)+O(h^3))\
    &-(k(x_i)-h / 2 k'(x_i)+h^2 / 4 k''(x_i)+O(h^3))) \
  &= (k'(x_i)h + O(h^3)) / h \
  &= k'(x_i) + O(h^2)
$

and

$
  (a_(i+1)+a_i) / 2 &= (k(x_i+h / 2)+k(x_i-h / 2)) / 2 \
  &stretch(=)^("Taylor expansion") 1 / 2 ((k(x_i)+h / 2 k'(x_i)+O(h^2)) \
    &+ (k(x_i)-h / 2 k'(x_i)+O(h^2))) \
  &= k(x_i) + O(h^2)
$

= Finite difference approximation of the second order derivative at a non-equidistant grid.

== i

By implementing the Taylor expansion,
we have:

$
  &abs(u''(x)-2 / (h_x^+ + h_x^-) ((u(x+h_x^+)-u(x)) / (h_x^+ )-(u(x)-u(x-h_x^-)) / ( h_x^-))) \
  =&abs(
    u''(x)-2 / (h_x^+ + h_x^-) ((h_x^+u'(x)+(h_x^+)^2 / 2u''(x)+(h_x^+)^3 / 3!u'''(x)+O((h_x^+)^4)) / (h_x^+ ) \
      & +(-h_x^-u'(x)+(h_x^-)^2 / 2u''(x)-(h_x^-)^3 / 3!u'''(x)+O((h_x^-)^4)) / (h_x^- ))
  ) \
  =&abs(-2 / (h_x^++h_x^-)(((h_x^+)^2-(h_x^-)^2) / 3! u'''(x)+O((h_x^+)^3)+O((h_x^-)^3))) \
  =&abs((h_x^+-h_x^-) / 3 u'''(x)+2 / (h_x^++h_x^-)(O((h_x^+)^3)+O((h_x^-)^3)))
$

If we let $h>=max(h_x^+, h_x^-)$,
$M=max(u'''(x))$ and we can get $phi(h)>= max(2abs(O((h_x^+)^3)), 2abs(O((h_x^-)^3)))=max(abs((h_x^+)^2O(h_x^+)), (h_x^-)^2abs(O(h_x^-)))$

So we can get:

$
  &abs(u''(x)-2 / (h_x^+ + h_x^-) ((u(x+h_x^+)-u(x)) / (h_x^+ )-(u(x)-u(x-h_x^-)) / ( h_x^-))) \
  =&abs((h_x^+-h_x^-) / 3 u'''(x)+2 / (h_x^++h_x^-)(O((h_x^+)^3)+O((h_x^-)^3))) \
  <=&(h_x^++h_x^-) / 3abs(u'''(x))+((h_x^+)^2+(h_x^-)^2+2h_x^+h_x^-) / (h_x^++h_x^-)phi(h) \
  <=&(h_x^++h_x^-)(1 / 3M+phi(h)) \
$

== ii

By implementing the Taylor expansion,
we can get:

$
  &abs(u''(x)-(alpha u(x-h_x^-)+beta u(x)+gamma u(x+h_x^+))) \
  =&abs(
    u''(x)-(alpha (u(x)-h_x^-u'(x)+(h_x^-)^2 / 2 u''(x)+O((h_x^-)^3))+beta u(x)\
      & +gamma (u(x)+h_x^+u'(x)+(h_x^+)^2 / 2 u''(x)+O((h_x^+)^3)))
  ) \
$

To make sure the constant $C$ does not explicitly depend on $u(x), u'(x)$,
and $u''(x)$,
we need to keep the coefficients of $u(x)$, $u'(x)$ and $u''(x)$ is $0$.
So:

$
  cases(
    alpha + beta + gamma = 0,
    alpha h_x^-= gamma h_x^+,
    (alpha / 2) (h_x^-)^2 + (gamma / 2) (h_x^+)^2 = 1
  )
$<Eq:14>

By solving @Eq:14,
we can get:

$
  cases(
    alpha = 2 / (h_x^-(h_x^+ + h_x^-)),
    beta = -2 / (h_x^+ + h_x^-) (1 / h_x^-+1 / h_x^+),
    gamma = 2 / (h_x^+(h_x^+ + h_x^-))
  )
$

We can see the solution is same as part i.
So there is no other approximation.

= Code for five point stencil.

Firstly,
we need to get function $f$ and $g$.

== Calculate $f$ and $g$.

According to the question,
we have $u(x,y)=x^4y^5-17sin(x y)$.

So:

$
  (diff u) / (diff x) = 4x^3y^5-17y cos(x y) \
  (diff u) / (diff y) = 5x^4y^4-17x cos(x y) \
  (diff^2 u) / (diff x^2) = 12x^2y^5+17y^2 sin(x y) \
  (diff^2 u) / (diff y^2) = 20x^4y^3+17x^2 sin(x y) \
$

Then,
we can get:

$
  f = & - Delta u                                           \
    = & - (diff^2 u) / (diff x^2) - (diff^2 u) / (diff y^2) \
    = & -12x^2y^5-17y^2 sin(x y)-20x^4y^3-17x^2 sin(x y)    \
$

About $g$,
we have:

$
  g = cases(
    0 quad & x=0,
    0 quad & y=0,
    y^5-17sin(y) quad & x=1,
    x^4-17sin(x) quad & y=1,
  )
$

== Five point stencil.

According to the lecture notes,
we have:

$
  -f = (Delta u)_(i j) approx (u_(i+1,j)-2u_(i,j)+u_(i-1,j)) / (h^2) + (u_(i,j+1)-2u_(i,j)+u_(i,j-1)) / (h^2)
$<Eq:19>

We can rewrite @Eq:19 as:

$
  u_(i-1,j)+u_(i,j-1)-4u_(i,j) + u_(i,j+1)+u_(i+1,j) &= -h^2f\
  &= h^2(12x^2y^5+17(x^2+y^2) sin(x y)+20x^4y^3)
$

Order the nodes lexicographically and we can define the five point stencil as:

$
  A bold(u)=bold(b)
$

where $bold(u)=vec(u_(0,0), u_(0,h), dots.v, u_(0,1), u_(h,0), dots.v, u_(1,1))$ and $bold(b)=h^2vec(-f(0,0), -f(0,h), dots.v, -f(0,1), -f(h,0), dots.v, -f(1,1))$

and we can get the code.
