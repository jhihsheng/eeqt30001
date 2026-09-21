# Shot Noise and the Standard Quantum Limit（第一節）

## Poisson statistics: the noise of independence

A laser beam delivers photons *independently*: the arrival of one tells you nothing
about the next (Week 7: $g^{(2)}(0)=1$). For independent events the photon count $n$
in a fixed window follows the Poisson distribution

$$
P(n)=e^{-\langle n\rangle}\frac{\langle n\rangle^{n}}{n!},
\qquad
(\Delta n)^2=\langle n\rangle
\;\;\Rightarrow\;\;
\Delta n=\sqrt{\langle n\rangle}.
$$ (eq-w10-poisson)

This $\sqrt{\langle n\rangle}$ is *shot noise*. In a photocurrent the same statistics
read $\langle\Delta i^2\rangle=2e\,\Delta f\,\langle i\rangle$ — white noise
proportional to the mean current. Nothing quantum has been assumed beyond graininess
plus independence — a pairing worth remembering for the end of the lecture.

(sec-w10-mzi)=
## The complete derivation: $\Delta\phi=1/\sqrt{\langle n\rangle}$

This is the only derivation in Unit 2 that we carry through every step — because
every sensor in this lecture lives or dies by it. Send a coherent state
$|\alpha\rangle$ into a Mach–Zehnder interferometer with a phase $\phi$ in one arm
({numref}`fig-w10-mzi`); the second input port carries vacuum. Week 8's beam-splitter
algebra (QO_note_6, Sec. 2.4) gives coherent states at both outputs, with intensities

$$
I_1=|\alpha|^2\sin^2\!\frac{\phi}{2},
\qquad
I_2=|\alpha|^2\cos^2\!\frac{\phi}{2},
\qquad
S(\phi)\equiv\frac{I_2-I_1}{|\alpha|^2}=\cos\phi .
$$ (eq-w10-mzisignal)

```{figure} ../images/mzi_phase_readout.svg
:name: fig-w10-mzi
:width: 58%

Phase readout with a Mach–Zehnder interferometer. The unused input port is not
idle: its vacuum fluctuations are the noise floor of the measurement.
```

Now the error propagation, done honestly:

*Step 1 — what fluctuates.* The detected counts $n_1,n_2$ are independent Poisson
variables with means $I_{1},I_{2}$ (in photons per window), so the difference
$D=n_2-n_1$ has

$$
\mathrm{Var}(D)=\mathrm{Var}(n_1)+\mathrm{Var}(n_2)=I_1+I_2=|\alpha|^2
=\langle n\rangle .
$$ (eq-w10-vard)

Note the sines and cosines add to one: the noise is *independent of* $\phi$ even
though the signal is not.

*Step 2 — noise on the normalized signal.*
$\Delta S=\Delta D/\langle n\rangle
=\sqrt{\langle n\rangle}/\langle n\rangle=1/\sqrt{\langle n\rangle}$.

*Step 3 — from signal noise to phase noise.* A fluctuation $\Delta S$ masquerades
as a phase fluctuation $\Delta S/\left|dS/d\phi\right|$ with
$dS/d\phi=-\sin\phi$:

$$
\Delta\phi=\frac{\Delta S}{|\sin\phi|}\;\;\Rightarrow\;\;\Delta\phi_{\mathrm{SQL}}=\frac{1}{\sqrt{\langle n\rangle}}\quad(\phi=\tfrac{\pi}{2})
$$ (eq-w10-sql)

The interferometer is operated at the half-fringe $\phi=\pi/2$, where the slope is
steepest. Equation {eq}`eq-w10-sql` is the *standard quantum limit* (SQL). Nothing in
the derivation invoked an uncertainty relation: the $1/\sqrt{N}$ came from
Eq. {eq}`eq-w10-vard`, i.e., from adding the variances of *independent* events.

## SQL versus Heisenberg

Read $1/\sqrt N$ for what it is: the central limit theorem. $N$ independent photons
are $N$ independent polls of the same phase, and averaging independent polls improves
as $\sqrt N$ — the same law that governs election surveys. The way past it is
therefore not a better laser but a *correlated* probe: if the $N$ photons are
entangled they can act as a single object that accumulates phase $N$ times faster, and
the ultimate scaling allowed by quantum mechanics is the *Heisenberg limit*
$\Delta\phi=1/N$ (Degen et al. 2017; [Section 2](sec2.md) makes this precise). Between
the two limits lies this week's slogan, seeded here: *when you beat the SQL, you are
not beating Heisenberg — you are beating statistical independence.*

## LIGO: replace the vacuum, lower the noise

Where does the shot noise of Eq. {eq}`eq-w10-vard` physically enter a Michelson
interferometer? Through the *dark port* ({numref}`fig-w10-ligo`) — the output kept
on a dark fringe, where "nothing" exits and, by unitarity, vacuum enters. LIGO sits
just off the dark fringe and reads the signal against the carrier as a local oscillator
(DC readout): in the shot-noise limit this gives the same $1/\sqrt{\langle n\rangle}$
scaling as the half-fringe readout of [the derivation above](#sec-w10-mzi), and the
photodiode never sees the full laser power. The dark line of this unit closes here: the
vacuum is not empty (Week 7), and its fluctuations beating against the strong carrier
are precisely the noise floor of Eqs. {eq}`eq-w10-vard`–{eq}`eq-w10-sql`. Caves' 1981
insight: nothing says the dark port must carry *ordinary* vacuum. Inject
squeezed vacuum $S(r)|0\rangle$ (Week 7's resource, produced by Week 8's parametric
amplifier) with the squeezed quadrature aligned to the phase readout, and the homodyne
signal $I_1-I_2=\sqrt2\,|\alpha|\langle X_\theta\rangle$, with
$X_\theta=(a e^{-i\theta}+a^\dagger e^{i\theta})/\sqrt2$ and $\alpha$ the
local-oscillator amplitude (in LIGO, the carrier),[^gk] carries less noise than the
SQL. GEO600 has run squeezed light continuously since 2010 (Grote et al. 2013);
Advanced LIGO since the O3 run (2019), with ≈3 dB of shot-noise reduction (2.7 dB
typical, 3.2 dB maximum) (Tse et al. 2019); the 2013 LIGO result (Aasi et al. 2013)
was a demonstration.

[^gk]: Gerry & Knight's $1/2$ quadrature convention (Sec. 7.3) gives
    $2|\alpha|\langle X(\theta)\rangle$.

```{figure} ../images/ligo_darkport.svg
:name: fig-w10-ligo
:width: 64%

The dark port is where the vacuum — and therefore the shot noise — enters a
Michelson interferometer. Replacing that vacuum with squeezed vacuum is how LIGO
measures below the SQL.
```

**Frequency-dependent squeezing.** One subtlety earns its own paragraph (and an
exam-bank slot). Squeezing the phase quadrature necessarily *anti*-squeezes the
amplitude quadrature, which pushes on the mirrors: radiation-pressure noise, dominant
at low frequency, gets *worse*. LIGO therefore rotates the squeezing angle with
frequency — a 300-m filter cavity reflects the squeezed vacuum with a
frequency-dependent phase — so that high frequencies see phase squeezing (less shot
noise) while low frequencies see amplitude squeezing (less radiation-pressure noise)
({numref}`fig-w10-fds`). This is running in O4 (Ganapathy et al. 2023): quantum noise
reduced across the whole band, not traded from one end to the other.[^sql2]

[^sql2]: Two "SQLs" circulate: ours, Eq. {eq}`eq-w10-sql`, is the coherent-state
    shot-noise limit; the gravitational-wave community's *free-mass* SQL is the optimum
    envelope of shot plus radiation-pressure noise. Fixed-angle squeezing cannot beat
    the latter; frequency-dependent squeezing can (first sub-SQL: Yu et al. 2020).

```{figure} ../images/freq_dep_squeezing.svg
:name: fig-w10-fds
:width: 55%

Why the squeezing angle must rotate with frequency (schematic noise budget, after
Ganapathy et al. 2023). Fixed-angle squeezing lowers shot noise but raises
radiation-pressure noise; frequency-dependent squeezing lowers both.
```

````{exercise} In-class discussion 1
:label: exer-w10-power

You double the laser power. How much does the phase sensitivity improve?
````

```{solution} exer-w10-power
:label: solu-w10-power
:class: dropdown

By $\sqrt2$: Eq. {eq}`eq-w10-sql` scales as $1/\sqrt{\langle n\rangle}$. That
square-root stubbornness — 100 times the power for 10 times the precision — is
why LIGO chases squeezing instead of ever-bigger lasers (and why radiation pressure
punishes the brute-force route anyway).
```

```{important}
**Summary — Section 1.**
Independent arrivals $\Rightarrow$ Poisson $\Rightarrow$
$\Delta n=\sqrt{\langle n\rangle}$, Eq. {eq}`eq-w10-poisson`. Propagating that noise
through the MZI fringe gives the unit's one complete derivation:
$\Delta\phi_{\mathrm{SQL}}=1/\sqrt{\langle n\rangle}$ at the half-fringe,
Eq. {eq}`eq-w10-sql` — a statement about statistics, not about Heisenberg. The
noise enters at the dark port, where only vacuum lives; LIGO replaces that vacuum
with squeezed vacuum, rotated with frequency (filter cavity) so shot noise and
radiation-pressure noise fall together.
```
