---
exports:
  - format: typst
    id: w08sec2-pdf
    output: exports/week08-sec2.pdf
downloads:
  - id: w08sec2-pdf
    title: 本頁 PDF
---

# Bell's Theorem: From Philosophy to Measurement（第二節）

## Einstein's Moon and local realism

Take the entangled pair of Eq. {eq}`eq-w8-bellpair`. Quantum mechanics says neither
photon has a polarization before measurement, yet the two measurement outcomes are
perfectly (anti-)correlated no matter how far apart the detectors are. Einstein,
Podolsky, and Rosen (1935) found this unacceptable and proposed the "reasonable"
alternative: each photon carries hidden instructions fixed at the source (*realism*),
and nothing a distant experimenter does can influence the local outcome (*locality*).
Correlations would then be no more mysterious than two gloves packed in two boxes. For
thirty years the choice between these worldviews was considered metaphysics. Bell's
1964 discovery is that the two worldviews *disagree about measurable numbers* once the
analyzers are rotated to intermediate angles.

## From Bell (1964) to CHSH (1969)

Bell's original argument uses the singlet-type pair, for which *identical* settings
give perfect anti-correlation, $E(a,a)=-1$. In a local-realist model this forces the
hidden instructions to be exact anti-copies, $B(x,\lambda)=-A(x,\lambda)$, so that
$E(a,b)=-\int d\lambda\,\rho(\lambda)\,A(a,\lambda)A(b,\lambda)$. Take any three
settings $a,b,c$; using $A^{2}=1$,

$$
\begin{aligned}
E(a,b)-E(a,c)&=-\int d\lambda\,\rho(\lambda)\,A(a,\lambda)A(b,\lambda)
\bigl[1-A(b,\lambda)A(c,\lambda)\bigr]\\
\Longrightarrow\quad
\bigl|E(a,b)-E(a,c)\bigr|&\le 1+E(b,c),
\end{aligned}
$$ (eq-w8-bell64)

since the bracket is non-negative and $|A(a)A(b)|=1$. This is Bell's 1964 inequality
(Bell 1964). Quantum mechanics violates it: with
$E(\theta_a,\theta_b)=-\cos2(\theta_a-\theta_b)$ and angles
$(0^{\circ},30^{\circ},60^{\circ})$, the left side equals $1$ while the right side is
only $\tfrac12$.

Beautiful --- but not yet an experiment. Equation {eq}`eq-w8-bell64` leans on the
idealization $E(a,a)=-1$ *exactly*, and no real source or detector delivers perfect
anti-correlation. Clauser, Horne, Shimony, and Holt removed that assumption (CHSH
1969), producing the form every experiment actually tests. Alice measures polarization
along $a$ or $a'$ and Bob along $b$ or $b'$; each outcome is $\pm1$, and $E(a,b)$ is
the average of the product --- no perfect correlation required anywhere. Define

$$
S=E(a,b)-E(a,b')+E(a',b)+E(a',b') .
$$ (eq-w8-chsh)

In a local-realist world every photon pair carries hidden variables $\lambda$ that
predetermine all four local answers
$A(a,\lambda),A(a',\lambda),B(b,\lambda),B(b',\lambda)=\pm1$. The proof takes two
lines: for each $\lambda$,

$$
A(a,\lambda)\bigl[B(b,\lambda)-B(b',\lambda)\bigr]
+A(a',\lambda)\bigl[B(b,\lambda)+B(b',\lambda)\bigr]=\pm2 ,
$$ (eq-w8-chshproof)

because one bracket vanishes and the other is $\pm2$. Averaging over $\lambda$ gives
$|S|\le2$ --- for *every* conceivable local hidden-variable model, known or not yet
invented.

Quantum mechanics disagrees. Rotate the pair of Eq. {eq}`eq-w8-bellpair` with a wave
plate into $(|HH\rangle+|VV\rangle)/\sqrt2$; then
$E(\theta_a,\theta_b)=\cos2(\theta_a-\theta_b)$, and the settings $a=0^{\circ}$,
$b=22.5^{\circ}$, $a'=45^{\circ}$, $b'=67.5^{\circ}$ give

$$
S_{\mathrm{QM}}=2\sqrt{2}\approx2.83>2 .
$$ (eq-w8-tsirelson)

{numref}`fig-w8-chsh` shows $S$ as the settings are rotated together. The value
$2\sqrt2$ is itself a ceiling --- the *Tsirelson bound* (1980): no quantum state and no
measurement can push $|S|$ higher. Nature thus sits in a strange middle band: above
everything local realism allows, below what mere non-signaling logic would permit.

```{figure} ../images/chsh_curve.svg
:name: fig-w8-chsh
:width: 72%

CHSH parameter $S$ for the quantum state $(|HH\rangle+|VV\rangle)/\sqrt2$ with
settings $(a,a',b,b')=(0,2\theta,\theta,3\theta)$, for which
$S(\theta)=3\cos2\theta-\cos6\theta$. Local realism caps $|S|$ at $2$ (grey); quantum
mechanics reaches, but never exceeds, $2\sqrt2$ at $\theta=22.5^{\circ}$ (Tsirelson
bound, magenta).
```

````{exercise} In-class discussion 2
:label: exer-w8-s29

An experiment reports $|S|=2.9>2\sqrt2$. What would that mean?
````

```{solution} exer-w8-s29
:label: solu-w8-s29
:class: dropdown

Not merely the death of local realism: quantum mechanics *itself* would be refuted,
since no quantum state can exceed the Tsirelson bound of Eq. {eq}`eq-w8-tsirelson`.
(In practice: check the error bars and the analysis before booking a ticket to
Stockholm.)
```

## Sixty years from argument to verdict

Freedman and Clauser made the first measurement (1972); Aspect and coworkers closed in
on locality by switching the analyzers while the photons were in flight (Aspect,
Dalibard, and Roger 1982); and in 2015 three groups closed the detection and locality
loopholes simultaneously --- the Delft experiment even used entangled electron spins
1.3 km apart, heralded by photon interference (Hensen et al. 2015). Every result:
$|S|>2$, exactly as quantum mechanics predicts. The 2022 Nobel Prize went to Aspect,
Clauser, and Zeilinger for this arc. *In class we spend ~25 minutes on the official
Nobel animation and excerpts of Zeilinger's Nobel lecture; the scientific background
PDF is assigned reading.*

```{important}
**Summary — Section 2.**
Local realism --- outcomes predetermined at the source, no faster-than-light influence
--- implies Bell's 1964 inequality, Eq. {eq}`eq-w8-bell64`, under perfect
anti-correlation, and with that idealization removed, $|S|\le2$ for the CHSH
combination, Eq. {eq}`eq-w8-chsh` --- two lines of arithmetic that never mention
quantum mechanics. Entangled photon pairs violate the bound, reaching $S=2\sqrt2$ at
the optimal angles (and no more: Tsirelson). Sixty years of experiments, culminating in
the loophole-free tests of 2015 and the 2022 Nobel Prize, returned the verdict: the
world itself is nonlocally correlated.
```
