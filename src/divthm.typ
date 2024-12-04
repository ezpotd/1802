#import "@local/evan:1.0.0":*

= Shortcut for flux: the divergence theorem <sec-divthm>

== [TEXT] The divergence theorem

Remember back when we had Green's theorem,
we could transform 2D scalar flux (which was a _line integral_)
into an area integral:
$ underbrace(oint_(cal(C)) (bf(F) dot bf(n) dif s), = oint_(cal(C)) (-q dif x + p dif y))
  = underbrace(iint_(cal(R)) nabla dot bf(F) dif A,
    = iint_(cal(R)) ((partial p) / (partial x) + (partial q) / (partial y)) dif A). $
This was nice because parametrization was annoying and straight-up area integrals are simpler.
In general, if you still have the poster, the green pictures are easier to deal with.

The divergence theorem will let you do the same thing,
transforming a flux surface integral
(which is the horrendous _surface integral_
that has been haunting you for the last couple weeks)
into a volume integral.
Which is an even bigger profit --- no parametrization, no cross product table, etc.

#figure(
  box(image("figures/divthm-cut.svg", width: auto), stroke: 1pt),
  caption: [The highlighted arrow for the divergence theorem in our poster @fig-int-chart-stokes.],
)

Here's the result:

#memo(title: [Memorize: Divergence theorem])[
  Suppose a closed surface $cal(S)$ encloses a compact solid $cal(T)$,
  and $bf(F)$ is defined everywhere in $cal(T)$.
  Then
  $ underbrace(oiint_(cal(S)) bf(F) dot bf(n) dif S,
    = iint_(cal(R)) bf(F)(bf(r)(u,v)) dot
    ((partial bf(r))/(partial u) times (partial bf(r))/(partial v)) dif u dif v)
    = underbrace(iiint_(cal(T)) nabla dot bf(F) dif V,
    = iiint_(cal(T)) ((partial p) / (partial x) + (partial q) / (partial y) + (partial r) / (partial z)) dif V). $
]

I've snuck in a new symbol $oiint_(cal(S))$, but the extra circle is analogous to before.
Just like how $oint_(cal(C))$ was a reminder that $cal(C)$ was a closed loop:
#definition(title: [Definition of $oiint$])[
  $oiint_(cal(S))$ means "$iint_(cal(S))$ but with an extra optional reminder that $cal(S)$ is a closed surface".
  (The reminder is optional, i.e. you are not obligated to add it even if $cal(S)$ is closed.)
]
Also, note there's a fine-print requirement that $cal(T)$ should be compact,
i.e. it should not extend infinitely in any direction.

#remark(title: [Remark: "Closed surface" = "holds water"])[
  If you're unclear what "closed surface" means,
  a picture to keep in your head might be "holds water", i.e.,
  you could imagine filling the interior of $cal(S)$ with a water
  (that's the volume $cal(T)$) and it shouldn't leak out.
  So the following are _not_ closed surfaces:

  - Curved part of hemisphere (e.g., bowl with no lid)
  - Curved part of cylinder (e.g., straw)

  But the following are closed surfaces:

  - Cylinder including the two caps (e.g., water bottle)
  - Sphere
  - The six faces of a rectangular prism

]

And that's pretty much it!

#sample[
  Let $R > 0$ be given.
  Compute the flux of the vector field
  $bf(F) (x , y , z) = vec(x , y , z)$ through the
  closed surface of the sphere $cal(S)$ defined by $x^2 + y^2 + z^2 = R^2$
  oriented outward, using the Divergence Theorem.
]

#soln[
  The sphere $cal(S)$ encloses a ball $cal(T)$ of radius $R$.
  The divergence is given by
  $ nabla dot bf(F) = (partial p) / (partial x) + (partial q) / (partial y) + (partial r) / (partial z) = 1 + 1 + 1 = 3 $
  Then the answer is
  $ iiint_(cal(T)) nabla dot bf(F) dif V = iiint_(cal(T)) 3 dif V = 3 op("Vol")(cal(S)) = 3 dot 4/3 pi R^3 =
    #boxed[$ 4 pi R^3 $]. #qedhere $
]

#remark(title: [Remark: Connection to surface area of sphere])[
  This was also the first example we did with the surface area trick,
  where we found that the answer was $R dot op("SurfArea")(cal(S))$ which is also $4 pi R^3$.

  Actually, put another way:
  if you know the volume of the sphere is $4/3 pi R^3$ and the divergence theorem,
  then the surface area trick lets you derive the surface area formula of $4 pi R^2$.
]

#warning(title: [Warning: beware of undefined points of $bf(F)$])[
  You need to be careful to only apply the divergence theorem if the force is actually defined
  on the entire solid $cal(T)$!
  Here's an example of what can go wrong.

  Let $cal(S)$ denote the sphere $x^2+y^2+z^2=R^2$ of radius $R$ again.
  Let $bf(G)$ be the force of gravity exerted by a point mass $m$ at the origin.
  In the last section we computed
  $ iint_(cal(S)) bf(G) dot dif bf(S) = - 4 pi G m $
  using the surface area trick.

  However, if you compute the divergence $nabla dot bf(G)$,
  you'll actually find it's _zero_ at every point --- except the origin,
  where $bf(G)$ is undefined because the gravity causes division-by-zero.
  (See @exer-gravity-div1.)
  If you blindly apply the divergence theorem and don't notice the issue with the origin,
  you would instead get the wrong answer $iiint_(cal(T)) 0 dif V = 0$,
  rather than the correct answer $-4 pi G m$.
  (That said, see @exer-gravity-div2 for a safe usage.)
]

#sample[
  Let $a > 0$ be given.
  Calculate the flux of the vector field
  $bf(F) (x , y , z) = vec(x^2 , y^2 , z^2)$ through
  the closed surface of the cube $cal(S)$ bounded by
  $0 <= x , y , z <= a$ using the Divergence Theorem.
]
#soln[
  The divergence is
  $ nabla dot bf(F) = (partial) / (partial x) (x^2) + (partial) / (partial y) (y^2) + (partial) / (partial z) (z^2) = 2 x + 2 y + 2 z. $
  Hence the flux turns into
  $ iiint_(cal(T)) (2 x + 2 y + 2 z) dif V
    = 2 iiint_(cal(T)) x dif V + 2 iiint_(cal(T)) y dif V + 2 iiint_(cal(T)) z dif V. $
  Due to the symmetry of the cube:
  $ iiint_(cal(T)) x dif V = iiint_(cal(T)) y dif V = iiint_(cal(T)) z dif V = a^3 / 2. $
  If you can't see it symmetry, you could also just explicitly calculate
  $ iiint_(cal(T)) x dif V
    = (int_(x=0)^a x dif x) (int_(y=0)^a dif y) (int_(z=0)^a dif z)
    = a/2 dot a dot a = a^3/2. $
  In any case, we get an answer of
  $ 2 dot a^3/2 + 2 dot a^3/2 + 2 dot a^3 /2 = #boxed[$ 3a^3 $] #qedhere. $
]

#sample[
  Find the flux of the vector field
  $bf(F) (x , y , z) = vec(y z , x z , x y)$
  through the closed surface $cal(S)$ defined by $x^4 + (y-5)^6 + z^8 = 2025$.
]
#soln[
  The surface $cal(S)$ is hard to describe, but it encloses _some_ solid $cal(T)$.
  However, if you compute the divergence, it is
  $ nabla dot bf(F) = (partial) / (partial x) (y z) + (partial) / (partial y) (x z) + (partial) / (partial z) (x y)
    = 0 + 0 + 0 = 0. $
  So it doesn't even matter what the solid $cal(T)$ is; the answer is just
  $ iiint_(cal(T)) 0 dif V = #boxed[$ 0 $]. #qedhere $
]


#sample[
  Compute the flux of the vector field
  $bf(F) (x , y , z) = vec(x y , y z , z x)$ through
  the closed surface $cal(S)$ formed by the paraboloid $z = x^2 + y^2$ and its
  circular base $z = 0$, where $x^2 + y^2 <= 1$, using the Divergence Theorem.
]

#soln[
  Let $cal(T)$ denote the region enclosed by $cal(S)$.
  The divergence is given by
  $ nabla dot bf(F) = (partial) / (partial x) (x y) + (partial) / (partial y) (y z) + (partial) / (partial z) (z x) = y + z + x $

  The region $cal(T)$ is bounded by $z = x^2 + y^2$ and $z = 0$, within $x^2 + y^2 <= 1$.
  So the divergence theorem means we need to calculate
  $ iint_(x^2+y^2 <= 1) int_(z=0)^(x^2+y^2) (x+y+z) dif z dif x dif y. $
  Naturally, this is best done using cylindrical coordinates.
  Writing $x = r cos theta$ and $y = r sin theta$, and remembering that
  $ dif x dif y dif z = dif V = r dif r dif theta dif z $
  then this becomes
  $ int_(r=0)^1 int_(theta=0)^(2 pi) int_(z=0)^(r^2) r (r cos theta + r sin theta + z) dif z dif theta dif r. $

  But the integrals with $theta$ in them are going to be zero by symmetry.
  For example, the first term is
  $ int_(r=0)^1 int_(theta=0)^(2 pi) int_(z=0)^(r^2) r^2 cos theta dif z dif r dif theta
    = (int_(r=0)^1 int_(z=0)^(r^2) r^2 dif z dif r) underbrace((int_(theta=0)^(2 pi) cos theta dif theta), =0)
    = 0. $
  Similarly, the contribution of $r sin theta$ is just zero as well.
  So we are just left with
  $ int_(r=0)^1 int_(theta=0)^(2 pi) int_(z=0)^(r^2) r z dif z dif theta dif r
    = (int_(r=0)^1 int_(z=0)^(r^2) r z dif z dif r) (int_(theta=0)^(2pi) dif theta). $
  Obviously $int_(theta=0)^(2pi) dif theta = 2pi$.
  The double integral can be evaluated as
  $ int_(r=0)^1 r int_(z=0)^(r^2) z dif z dif r
    &= int_(r=0)^1 r dot [z^2/2]_(z=0)^(r^2) dif r \
    &= int_(r=0)^1 r^5/2 dif r \
    &= [r^6/12]_(r=0)^1 = 1/12. $
  Hence the final answer is
  $  1/12 dot 2 pi = #boxed[$ pi / 6 $]. #qedhere $
]

== [SIDENOTE] A rough explanation for why the divergence theorem is true

#todo[write this]

== [RECAP] All the methods for flux

== [EXER] Exercises

#exer[
  Calculate the flux of the vector field
  $bf(F) (x , y , z) = vec(x^2 y , y z^2 , e^x)$
  through the closed surface $S$ consisting of the upper hemisphere
  $z = sqrt(1 - x^2 - y^2)$ and the circular base $z = 0$, where
  $x^2 + y^2 <= 1$, using the Divergence Theorem.
] <exer-divthm-1>

#exer[
  Consider the force of gravity $bf(G)$ exerted by a point mass of mass $m$ at a point $O$.
  Show that $ nabla dot bf(G) = 0 $ at every point _except_ $O$.
] <exer-gravity-div1>

#exer[
  Suppose $cal(S)_1$ and $cal(S)_2$ are two closed surfaces that don't intersect
  and such that $cal(S)_2$ is contained inside $cal(S)_1$.
  Let $O$ be a point contained inside $cal(S)_2$.
  Consider the force of gravity $bf(G)$ exerted by a point mass of mass $m$ at $O$.
  Show that
  $ oiint_(cal(S)_1) bf(G) dot dif bf(S) = oiint_(cal(S)_2) bf(G) dot dif bf(S). $
] <exer-gravity-div2>
