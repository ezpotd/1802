#import "@local/evan:1.0.0":*
#import "@local/svg-emoji:0.1.0": setup-emoji // only if you want to use GH names for emojis
#show: setup-emoji

#show: evan.with(
  title: [Notes for 18.02 Recitation 6],
  subtitle: [18.02 Recitation MW9],
  author: "Evan Chen",
  date: [23 September 2024],
)

#quote(attribution: [Clara Oswald, in Doctor Who])[Run, you clever boy, and remember.]

This handout (and any other DLC's I write) are posted at
#url("https://web.evanchen.cc/1802.html").

- Optional midterm review, 4-270, Thu 4:30pm-6:30pm. Led by me, Vinjay, and Sebastian.
- Please fill out the survey at #url("https://forms.gle/AsXPweCbJ1Nvzp3k7") when you can.
- I made a Discord server. If you didn't get the link emailed to you, ask me to join.
- Remember that September 30 is the last day to switch sections freely on Canvas.

= It's a miracle that multiplication in $CC$ has geometric meaning

Let $CC$ denote the set of complex numbers (just as $RR$ denotes the real numbers).
It's important that realize that, *until we add in complex multiplication,
$CC$ is just an elaborate $RR^2$ cosplay*.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Concept], [For $RR^2$], [For $CC$]),
    [Notation], [$bf(v)$], [$z$],
    [Components], [$vec(x, y)$], [$x + y i$],
    [Length], [Length $|bf(v)|$], [Abs val $|z|$],
    [Direction], [(slope, maybe?)], [argument $theta$],
    [Length $1$], [unit vector], [$e^(i theta) = cos theta + i sin theta$],
    [Multiply], [_NONE_], [✨ $z_1 z_2$ ✨]
  ),
  kind: table
)

- All the way back in R01, when I warned you about type safety,
  I repeatedly stressed you that you *cannot multiply two vectors in $RR^n$ to get another vector*.
  You had a "dot product", but it spits out a number.
  (Honestly, you shouldn't think of dot product as a "product"; the name sucks.)

- Of course, the classic newbie mistake (which you better not make on your midterm)
  is to define a product on vectors component-wise:
  why can't $vec(x_1, dots.v, x_n)$ and $vec(y_1, dots.v, y_n)$ have "product"
  $vec(x_1 y_1, dots.v, x_n y_n)$?
  Well, in 18.02, every vector definition needed a corresponding geometric picture
  for us to consider it worthy of attention (see table at start of `r03.pdf`).
  This definition has no geometric meaning.

- However, there is a big miracle for $CC$. For complex numbers, you can define multiplication by
  $(a+b i)(c+d i) = (a c - b d) + (a d + b c) i$ and there is
  _an amazing geometric interpretation_.

Unfortunately, AFAIK there is no English word for
"complex number whose absolute value is one" (err, CNWAVIO?),
the same way there is for "unit vector".
For 18.02, we instead use
$e^(i theta) := cos theta + i sin theta$
as the "word"; whenever you see $e^(i theta)$, draw it as unit vector $cos theta + i sin theta$.

It's worth pointing out the notation $e^(i theta)$ should strike you as _nonsense_.
What meaning does it have to raise a number to an imaginary power?
Does $i^i$ have a meaning? Does $cos(i)$ have a meaning?
(If you want to know, check @i-to-the-i in the post-recitation notes.)

But for 18.02, when starting out,
I would actually think of the notation $e^(i theta)$ as a _mnemonic_,
i.e. a silly way to remember the following result:
#theorem[
  If you multiply two CNWAVIO's, you get the CNWAVIO with the angles added:
  $ e^(i theta_1) e^(i theta_2) = e^(i (theta_1 + theta_2)) <==>
    cos (theta_1 + theta_2) + i sin (theta_1 + theta_2)
    = (cos theta_1 + i sin theta_1) (cos theta_2 + i sin theta_2). $
  More generally, multiplying two complex numbers multiplies the norms and adds the angles.
] <miracle>
This is IMO the biggest miracle in all of precalculus.
Corollary: $e^(i n theta) = (e^(i theta))^n
<==> (cos theta + i sin theta)^n = cos(n theta) + i sin(n theta)$,
allows taking $n$th roots; Maulik showed $z^2 = 2i$ in class.

= Rectangular vs polar

Every complex number can be written in either
_rectangular form_ ($a+b i$ for $a,b in RR$) or _polar form_ ($r e^(i theta)$).
Depending on what you are trying to do, some forms are easier to work with than others.

#figure(
  table(
    columns: 3,
    align: left,
    table.header([Operation], [In rectangular], [In polar]),
    [$z_1 plus.minus z_2$],
      [✅ Component-wise like in $RR^2$],
      [❌ Unless $z_1$ is a real multiple of $z_2$],
    [$z_1 z_2$], [✅ Expanding], [✅ by @miracle],
    [$z_1 slash z_2$], [✅ Use $1/(c+d i) = (c - d i) / (c^2+d^2)$ trick then multiply], [✅ by @miracle],
    [$n$#super[th] root of $z_1$], [❌ Not recommended for $n > 1$], [✅ by @miracle corollary],
  ),
  kind: table
)

= Recitation problems from Prof Maulik

/ 1.: For each of the following points, convert it from Cartesian to polar or
  vice versa:
    - $(x , y) = (- sqrt(3) , 1)$
    - $(r , theta) = (3 , pi \/ 6)$
    - $(x, y) = (- sqrt(6) , - sqrt(2))$
/ 2.: Show that $sin (theta) = frac(1, 2 i) (e^(i theta) - e^(- i theta))$ and
  $cos (theta) = 1 / 2 (e^(i theta) + e^(- i theta))$. Use this to write
  $(sin (theta))^3$ in terms $sin (3 theta)$ and $sin (theta)$.
/ 3.: Consider the complex number $f (t) = frac(t + 2 i, 1 - 3 i)$ where $t$ is real.
  - Find the real and imaginary part of $f (t)$.
  - Find $overline(f (t))$ and $lr(|f (t)|)^2$.
/ 4.: Use polar form to find the fourth powers of $2 + 2 i$ and
  $- 3 + i sqrt(3)$. Graph these numbers and their fourth powers on the
  complex plane.
/ 5.: (If you have time) Consider the matrix
  $A = mat(0, - 1; 1, 0)$. In class, working with real
  numbers, this had no eigenvectors. But now we can treat it as a matrix
  with complex number entries. Find complex number eigenvalues for $A$ and
  for each one, find an eigenvector in $CC^2$, i.e. a
  two-component vector $vec(z, w)$ where $z$, $w$ are complex numbers.

#pagebreak()

= Post-recitation notes

== The importance of definitions; also $cos(i)$ and $i^i$ <i-to-the-i>

When learning mathematics, I believe definitions are actually more important than theorems.
A lot of confusion comes from not having been given careful definitions of the objects.
(See #url("https://web.evanchen.cc/handouts/NaturalProof/NaturalProof.pdf") for more on that.)

So in general any time you are confused about whether an operation is "legal" ---
and this is true in all of math, not just 18.02 ---
*the first thing to really check whether you have been given a precise definition*.
The endless Internet debates on whether $0$ is even or whether $0.999... = 1$ or whether $1/x$ is
a continuous function (hint: yes) are all examples of people who don't know
the definitions of objects they're dsicussing.

=== Real exponents, real base

With that in mind, let's fix $a > 0$ a positive real number and think about what $a^r$ should mean.

#definition[18.100][
- When $n > 0$ is an integer, then $a^n := a times ... times a$, where $a$ is repeated $n$ times.
- Then we let $a^(-n) := 1 / a^n$ for each integer $n > 0$.
- When $m/n$ is a rational number, $a^(m/n)$ means the unique $b > 0$ such that $a^m = b^n$.
  (In 18.100, one proves this $b$ is unique and does exist.)
- It's less clear what $a^x$ means when $x in RR$, like $x = sqrt(2)$ or $x = pi$.
  I think usually one takes a limit of rational numbers $q$ close to $x$
  and lets $a^x := lim_(q -> x) a^q$.
  (In 18.100, one proves this limit does in fact exist.)
] <def18100>

=== Complex exponents, real base

But when $z in CC$, what does $a^z$ mean? There's no good way to do this.

You likely don't find an answer until 18.112, but I'll tell you now.
In 18.100 you will also prove that the Taylor series
$ e^x = sum_(k >= 0) r^k / k! $
is correct, where $e := sum_(k >= 0) 1/k!$ is Euler's constant.

So then when you start 18.112, we will flip the definition on its head:

#definition[18.112][
  If $z in CC$, we _define_ $ e^z := sum_(k >= 0) z^k / k!. $
  Then for $a > 0$, we let $a^z = e^(z log a)$.
] <def18112>

To summarize: in 18.100, we defined exponents in the way you learned in grade school
and then proved there was a Taylor series. But in 18.112, you _start_ with the Taylor series
and _then_ prove that the rules in grade school you learned still applied.

And checking this consistency requires work.
Because we threw away @def18100, identities like
$ e^(z_1 + z_2) = e^(z_1) e^(z_2) " and " (e^(z_1))^(z_2) = e^(z_1 z_2)$
are no longer "free": they have to be proved rigorously too.
(To be fair, they need to be proved in 18.100 too, but there it's comparatively easier.)
I think you shouldn't be _surprised_ they're true;
we know it's true for $RR$, so it's one heck of a good guess.
But you shouldn't take these on faith.
At least get your professor to acknowledge they _require_ a (non-obvious) proof,
even if you aren't experienced enough to follow the proof yourself yet.

Anyway, if we accept this definition, then Euler's formula makes more sense:
#theorem[Euler][We have $ e^(i theta) = cos theta + i sin theta. $] <euler>
The point is that cosine and sine also have a Taylor series that is compatible with definition:
#eqn[
  $
    cos(x) &= 1 - x^2/2! + x^4/4! - x^6/6! + ... \
    sin(x) &= x - x^3/3! + x^5/5! - x^7/7! + ... .
  $
  <trig>
]
And if you put these together, you can verify @euler, up to some technical issues with infinite sums.
I think Maulik even showed this in class:
$
  cos(theta) + i sin(theta)
  &= (1 - theta^2 / 2! + theta^4 / 4! - ...) + (theta - theta^3 / 3! + theta^5 / 5! - ...) i \
  &= 1 + (theta i) + (theta i)^2 / 2! + (theta i)^3 / 3! + (theta i^4) / 4! + (theta i)^5 / 5! \
  &= e^(i theta).
$

=== Complex exponents, complex base

But what about $i^i$?
Our @def18112 above only worked for positive real numbers $a > 0$.
Here, it turns out you're out of luck.
There isn't any way to define $i^i$ in a way that makes internal sense.
The problem is that there's no way to take a single log of a complex number,
so the analogy with $log a$ breaks down.

Put another way: there's no good way to assign a value to $log(i)$,
because $e^(i pi slash 2) = e^(5 i pi slash 2) = ...$ are all equal to $i$.
You might hear this phrased "complex-valued logarithms are multivalued".
You can have some fun with this paradox:
$ i &= e^(i pi slash 2) ==> i^i = e^(- pi slash 2) \
  i &= e^(5 i pi slash 2) ==> i^i = e^(-5 pi slash 2). $
Yeah, trouble.

=== Trig functions with complex arguments

On the other hand, $cos(i)$ can be defined:
use the Taylor series @trig, like we did for $e^z$.
To spell it out:
#definition[18.112 trig definitions][
  If $z$ is a complex number, we define
  $
    cos(z) &:= 1 - z^2/2! + z^4/4! - z^6/6! + ... \
    sin(z) &:= z - z^3/3! + z^5/5! - z^7/7! + ... .
  $
] <def18112trig>

If you do this, then @def18112 implies the following identities are kosher:
#proposition[
  Under @def18112trig, we have the identities
  $ cos(z) &:= (e^(i z) + e^(-i z)) / 2 \
    sin(z) &:= (e^(i z) - e^(-i z)) / (2i). $
] <reimtrig>
#proof[
  If you write out $e^(i z) = sum (i z)^k / k!$
  and $e^(-i z) = sum (-i z)^k / k!$ and add them,
  the odd $k$'s cancel out and the even $k$'s don't, which gives you
  $ e^(i z) + e^(-i z) = 2  - 2 dot z^2/2! + 2 dot z^4/4! - 2 dot z^6/6! + ... . $
  So dividing by $2$, we see $cos(z)$ on the right-hand side, as needed.
  The argument with $sin$ is similar, but this time the even $k$'s cancel
  and you divide by $2i$ instead.
]

So for example, from @reimtrig, we conclude for example that
$ cos(i) = (e + 1/e) / 2. $
Strange but true.

== A glimpse of the future: what are 18.100 and 18.112 anyway?

First I need to tell you what analysis is.
When students in USA ask me what analysis is,
I sometimes say "calculus but you actually prove things".
But that's actually a bit backwards; it turns out that in much parts of the world,
there is no topic called "calculus".#footnote[See #url("https://web.evanchen.cc/faq-school.html#S-10").]
It would be more accurate to say calculus is analysis with proofs, theorems,
and coherent theorem statements deleted,
and it only exists in some parts of the world
(which is why mathematicians will tend to look down on it).

With that out of the way,

- 18.100 is real analysis, i.e. analysis of functions over $RR$
- 18.112 is complex analysis, i.e. analysis of functions over $CC$.

If you ever take either class, I think the thing to know about them is:

#quote(attribution: [Charles Pugh, in _Real Mathematical Analysis_])[
  Complex analysis is the good twin and real analysis is the evil one:
  beautiful formulas and elegant theorems seem to blossom spontaneously in the complex domain,
  while toil and pathology rule the reals
]

Personally, I think it's insane that MIT uses 18.100 as their "intro to proofs" topic.
(This is why 18.100 is a prerequisite for 18.701, abstract algebra, which makes no sense either.)

== TODO

#todo[To be developed further after recitation.]
