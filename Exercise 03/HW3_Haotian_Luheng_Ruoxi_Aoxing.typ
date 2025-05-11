#import "../conf.typ": conf

#show: conf.with(exercise_num: [03])

= Five point stencil.

From the picture and five point stencil,
we can get:

$
  cases(
    1 / h^2(-4u_1+u_2+u_3+u_5+u_15) = -f_1,
    1 / h^2(-4u_2+u_1+u_6+u_8+u_10) = -f_2,
    1 / h^2(-4u_3+u_1+u_10+u_12+u_14) = -f_3,
  )
$

Thus,
we can derive the following system of equations:

$
  cases(
    1 / h^2(4u_1-u_2-u_3) = f_1+1 / h^2(u_5+u_15),
    1 / h^2(-u_1+4u_2) = f_2+1 / h^2(u_6+u_8+u_10),
    1 / h^2(-u_1+4u_3) = f_3+1 / h^2(u_10+u_12+u_14),
  )
$

Then,
we can get:

$
  A=mat(
    4 / h^2, -1 / h^2, -1 / h^2;
    -1 / h^2, 4 / h^2, 0;
    -1 / h^2, 0, 4 / h^2
  )
$

and

$
  B = mat(
    0, 1 / h^2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 / h^2;
    0, 0, 1 / h^2, 0, 1 / h^2, 0, 1 / h^2, 0, 0, 0, 0, 0;
    0, 0, 0, 0, 0, 0, 1 / h^2, 0, 1 / h^2, 0, 1 / h^2, 0;
  )
$

= Comparison lemma.

With the assumptions of Corollary 2.24,
we can get the following equations:

$
  cases(
    &abs(f(bold(x)))<= overline(f)(bold(x)) &<=> -overline(f)(bold(x))<=f(bold(x))<=overline(f)(bold(x)) quad &bold(x) in omega_h,
    &abs(g(bold(x))) <= overline(g)(bold(x)) &<=> -overline(g)(bold(x)) <= g(bold(x)) <= overline(g)(bold(x))&bold(x) in gamma_h
  )
$

== Case 1: $u(bold(x))<= overline(u)(bold(x))$

For $x in omega_h$,
we have $L_h (overline(u)(bold(x))-u(bold(x)))=L_h (overline(u)(bold(x)))-L_h (u(bold(x)))=overline(f)(bold(x))-f(bold(x))>=0$.

From Corollary 2.21,
we can get $overline(u)(bold(x)) - u(bold(x)) >=0$.

For $x in gamma_h$,
we have $overline(u)(bold(x)) - u(bold(x))=overline(g)(bold(x))-g(bold(x))>=0$.

So,
we can get $u(bold(x)) <= overline(u)(bold(x))$ for all $bold(x)in omega_h union gamma_h$.

== Case 2: $u(bold(x))>= -overline(u)(bold(x))$

For $x in omega_h$,
we have $L_h (overline(u)(bold(x))+u(bold(x)))=L_h (overline(u)(bold(x)))+L_h (u(bold(x)))=overline(f)(bold(x))+f(bold(x))>=0$.

From Corollary 2.21,
we can get $overline(u)(bold(x)) + u(bold(x)) >=0$.

For $x in gamma_h$,
we have $overline(u)(bold(x)) + u(bold(x))=overline(g)(bold(x))+g(bold(x))>=0$.

So,
we can get $u(bold(x)) >= -overline(u)(bold(x))$ for all $bold(x)in omega_h union gamma_h$.

By combining the two cases,
we can get $abs(u(bold(x)))<=overline(u)(bold(x))$ for all $bold(x)in omega_h union gamma_h$.

=

Let $overline(f)(bold(x))=abs(f(bold(x))), bold(x) in omega_h$,
and $overline(g)(bold(x))=0, bold(x) in gamma_h$.

From Corollary 2.24,
we can get $overline(u)(bold(x))>=abs(u(bold(x)))>=0$ for all $bold(x) in omega_h union gamma_h$.

Let $overline(bold(x))$ fullfills $overline(u)(overline(bold(x)))=norm(overline(u))_(l^infinity (omega_h union gamma_h))$ for all $bold(x) in omega_h union gamma_h$.

Because of $overline(u)(bold(x))=overline(g)(bold(x))=0, bold(x) in gamma_h$,
we can infer that $overline(bold(x))$ is in $omega_h$ (because $overline(u)(bold(x))>=0$).

Then,
we can get:

$
  overline(f)(bold(x)) = underbrace(d(bold(overline(x))), >0)underbrace(overline(u)(bold(overline(x))), >=0) - sum_(bold(y)in S(overline(bold(x)))) underbrace(b(overline(bold(x)), bold(y)), >0)underbrace((overline(u)(bold(y))-overline(u)(overline(bold(x)))), <=0) >= d(bold(overline(x))) overline(u)(bold(overline(x)))
$

So,
we can get:

$
  norm(u)_(l^infinity (omega_h union gamma_h))<=norm(overline(u))_(l^infinity (omega_h union gamma_h))=overline(u)(bold(overline(x))) <= (overline(f)(bold(x))) / d(bold(overline(x))) <= max_(bold(x)in omega_h) (overline(f)(bold(x))) / d(bold(overline(x))) = max_(bold(x)in omega_h) (abs(f(bold(x)))) / d(bold(overline(x)))=norm(D^(-1)f)_(l^infinity (omega_h))
$

= An eigenvalue problem connected to the five point stencil.

From the question,
we can see that $i$ of the eigenvalue problem is $i=2,3,dots,n-1$.
And $x_i=i h, i=1,2, dots,n$.

Also,
we can get:

$
    & lambda_k h^2 -2                   \
  = & 4 / h^2 h^2 sin^2((pi k h) / 2)-2 \
  = & 2( sin^2((pi k h) / 2)-1)         \
  = & -2 cos(k pi h)                    \
$

== Case 1: $i=1$

We can get the following equation:

$
  &u_(k,0)+(lambda_k h^2 -2)v_(k,1)+v_(k,2) \
  =& 0+(4 / h^2 h^2 sin^2((pi k h) / 2)-2)sqrt(2)sin(pi k h)+sqrt(2)sin(2 pi k h) \
  =& -2sqrt(2) cos(k pi h)sin(pi k h)+2sqrt(2)sin(pi k h)cos(pi k h) \
  =&0
$

== Case 2: $i=2, 3, dots, n-2$

With the help of sum-to-product identities,
we can get the following equation:

$
    & u_(k,i-1)+(lambda_k h^2 -2)v_(k,i)+v_(k,i+1)                            \
  = & sqrt(2)(sin((i-1) pi k h)+sin((i+1) pi k h)-2 cos(k pi h)sin(i k pi h)) \
  = & sqrt(2)(2 sin(i k pi h)cos(k pi h)-2 cos(k pi h)sin(i k pi h))          \
  = & 0                                                                       \
$

== Case 3: $i=n-1$

With the help of product-to-sum identities,
we can get the following equation:

$
    & u_(k,n-2)+(lambda_k h^2 -2)v_(k,n-1)+v_(k,n)                       \
  = & sqrt(2)sin((n-2) pi k h)-2sqrt(2) cos(k pi h)sin((n-1)pi k h)+0    \
  = & sqrt(2)sin((n-2) pi k h)-sqrt(2) (sin(n pi k h)+sin((n-2) k pi h)) \
  = & -sqrt(2) v_(k,n)                                                   \
  = & 0                                                                  \
$
