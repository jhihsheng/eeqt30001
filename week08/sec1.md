# From the Vacuum to Entangled Pairs: SPDC, Beam Splitters, and Hong--Ou--Mandel（第一節）

## A $\chi^{(2)}$ crystal turns one photon into two

In a linear medium, modes do not talk to each other. In a non-centrosymmetric crystal
(BBO, LiNbO$_3$), the polarization has a quadratic term
(quantum_optics_beamer, "Nonlinear Optics"),

$$
P_i=\chi^{(1)}_{ij}E_j+\chi^{(2)}_{ijk}E_jE_k .
$$ (eq-w8-chi2)

The $E^{2}$ term couples a mode at $\omega$ to a mode at $2\omega$: two $\omega$ photons
can merge into one $2\omega$ photon (second-harmonic generation), and --- running the
film backwards --- one pump photon at $\omega_p$ can split into two daughter photons,
the *signal* and the *idler*. The splitting must respect energy and momentum
conservation,

$$
\omega_s+\omega_i=\omega_p ,\qquad
\mathbf{k}_s+\mathbf{k}_i=\mathbf{k}_p ,
$$ (eq-w8-phasematch)

so the pairs emerge on cones fixed by phase matching ({numref}`fig-w8-spdc`a). This is
*spontaneous parametric down-conversion* (SPDC) --- the workhorse photon-pair source of
every quantum optics laboratory.

## SPDC is parametric amplification of the vacuum

Quantize the degenerate case ($\omega_s=\omega_i=\omega$, one signal mode $a$, pump mode
$a_p$). The $\chi^{(2)}$ interaction annihilates one pump photon and creates two signal
photons, or vice versa (quantum_optics_beamer, "Generation: Parametric
Down-Conversion"):

$$
\mathcal{H}=\hbar\omega\, a^{\dagger}a+\hbar\omega_p\, a_p^{\dagger}a_p
+i\hbar\beta\chi^{(2)}\!\left(a^{2}a_p^{\dagger}-(a^{\dagger})^{2}a_p\right),
$$ (eq-w8-pdcH)

with $\beta$ a mode-overlap parameter. A strong laser pump is a coherent state
$|\alpha\rangle$ and is barely depleted, so we may replace the operator $a_p$ by the
amplitude $\alpha$. In the frame rotating at $\omega$ (on resonance, $\omega_p=2\omega$)
the evolution operator becomes

$$
U(t)=\exp\!\left[\beta\chi^{(2)}t\left(\alpha^{*}a^{2}-\alpha\,
(a^{\dagger})^{2}\right)\right]=S(\xi),\qquad \xi=2\beta\chi^{(2)}\alpha\, t ,
$$ (eq-w8-squeezeU)

which is exactly the squeeze operator
$S(\xi)=\exp[(\xi^{*}a^{2}-\xi(a^{\dagger})^{2})/2]$ of Week 7 (QO_note_5, Sec. 2.1):
squeezing *requires* the quadratic terms $a^{2},(a^{\dagger})^{2}$, i.e. a nonlinear
process. What does this amplifier act on when nothing is injected? The vacuum. **An SPDC
crystal parametrically amplifies vacuum fluctuations: entangled photon pairs are scooped
out of the vacuum. The vacuum is not only non-empty --- it is a raw material.** (Vacuum
thread, 2/4. In Week 9 squeezed vacuum becomes the input of Gaussian boson sampling; in
Week 10 it is injected into LIGO.)

Two consequences of Eq. {eq}`eq-w8-squeezeU` matter for this week. First, in the
non-degenerate case (distinct signal and idler modes $a_s,a_i$) the same algebra gives
the *two-mode* squeezed vacuum

$$
|\psi\rangle=\frac{1}{\cosh r}\sum_{n=0}^{\infty}(\tanh r)^{n}\,|n\rangle_s|n\rangle_i ,
$$ (eq-w8-tmsv)

whose photon numbers are *perfectly correlated*: detecting an idler photon heralds the
presence of exactly one signal photon (at small $r$) --- the heralded single-photon
source of Week 7's comparison table. Second, in type-II phase matching the signal and
idler are orthogonally polarized and emerge on two cones ({numref}`fig-w8-spdc`b).
Along the two directions where the cones intersect, neither photon has a definite
polarization, yet the polarizations are perfectly anti-correlated --- the pair is in the
entangled state (Kwiat et al. 1995)

$$
|\psi\rangle=\frac{1}{\sqrt{2}}\left(|H\rangle_s|V\rangle_i
+e^{i\varphi}|V\rangle_s|H\rangle_i\right).
$$ (eq-w8-bellpair)

This state --- produced at megahertz rates on a tabletop --- is the entangled pair
behind the modern photonic Bell tests of [Section 2](sec2.md) and the protocols of
[Section 3](sec3.md) (the early tests used atomic-cascade pairs; Delft's loophole-free
test used electron spins).

```{figure} ../images/spdc_scheme.svg
:name: fig-w8-spdc
:width: 94%

Spontaneous parametric down-conversion. (a) One pump photon splits into a
signal--idler pair in a $\chi^{(2)}$ crystal, constrained by energy and momentum
conservation, Eq. {eq}`eq-w8-phasematch`. (b) Type-II phase matching: the orthogonally
polarized cones intersect along two directions, where the pair is polarization
entangled, Eq. {eq}`eq-w8-bellpair`.
```

## The beam splitter in operator language

The second tool of this week is almost embarrassingly simple: a half-silvered mirror.
Classically, a beam splitter maps two incoming amplitudes onto two outgoing ones. The
quantum description replaces amplitudes by mode operators (QO_note_6, Sec. 2): labeling
the two inputs $a_0,a_1$ and the two outputs $a_2,a_3$,

$$
\begin{pmatrix} a_2\\ a_3\end{pmatrix}
=\begin{pmatrix} t' & r\\ r' & t\end{pmatrix}
\begin{pmatrix} a_0\\ a_1\end{pmatrix}
\equiv U\begin{pmatrix} a_0\\ a_1\end{pmatrix}.
$$ (eq-w8-bs)

Energy conservation forces $U$ to be unitary: $|r|^{2}+|t|^{2}=1$ and
$tr^{*}+t'^{*}r'=0$. For a symmetric beam splitter the second condition fixes the
relative phase between $t$ and $r$ to $\pm\pi/2$; we adopt the $50{:}50$ convention
$t=1/\sqrt{2}$, $r=i/\sqrt{2}$. Unitarity also guarantees that the outputs remain
independent bosonic modes, $[a_i,a_j^{\dagger}]=\delta_{ij}$: a beam splitter is not a
classical coin flip but a *unitary change of mode basis* --- nothing is lost, and
quantum coherence between the two paths is preserved.

Send in a single photon, $|0\rangle_0|1\rangle_1=a_1^{\dagger}|0\rangle$. Transforming
the creation operator with $U^{T}$ gives (QO_note_6, Sec. 2.1)

$$
a_1^{\dagger}|0\rangle\;\to\;
\left(r\,a_2^{\dagger}+t\,a_3^{\dagger}\right)|0\rangle
=r\,|1\rangle_2|0\rangle_3+t\,|0\rangle_2|1\rangle_3 ,
$$ (eq-w8-bs1photon)

an entangled state of the two output *modes*: the photon is not "in one arm or the
other", it is coherently in both. Closing the two arms with a second beam splitter (a
Mach--Zehnder interferometer with path phase $\theta$) converts this coherence into
single-photon interference, $P(D_1)=\sin^{2}\frac{\theta}{2}$,
$P(D_2)=\cos^{2}\frac{\theta}{2}$ --- one photon at a time, yet fringes appear. Keep
this in mind for Week 10: an interferometer is a machine that converts a phase into a
detection probability, and its precision is set by quantum statistics.

## Hong--Ou--Mandel: identical photons always leave together

Now the signature two-photon experiment: one photon into *each* input,
$|1\rangle_0|1\rangle_1=a_0^{\dagger}a_1^{\dagger}|0\rangle$. Transforming both creation
operators with the $50{:}50$ matrix (QO_note_6, Sec. 2.2),

$$
\begin{aligned}
a_0^{\dagger}a_1^{\dagger}|0\rangle
&\to
\frac{1}{2}\left(a_2^{\dagger}+i\,a_3^{\dagger}\right)
\left(i\,a_2^{\dagger}+a_3^{\dagger}\right)|0\rangle
=\frac{i}{2}\left[(a_2^{\dagger})^{2}+(a_3^{\dagger})^{2}\right]|0\rangle
\\[2pt]
&=\frac{i}{\sqrt{2}}\left(|2\rangle_2|0\rangle_3+|0\rangle_2|2\rangle_3\right).
\end{aligned}
$$ (eq-w8-hom)

The $|1\rangle_2|1\rangle_3$ term --- classically the most natural outcome --- is
absent. Its two contributing paths, "both photons transmit" (amplitude
$t^{2}=\tfrac12$) and "both photons reflect" (amplitude $r^{2}=-\tfrac12$), interfere
destructively. Two identical photons entering a $50{:}50$ beam splitter from opposite
sides *always exit through the same port*: the coincidence rate between the two outputs
drops to zero. This is the Hong--Ou--Mandel (HOM) effect (Hong, Ou, and Mandel 1987),
and it is a purely quantum interference of *two-photon amplitudes* --- there is no
classical wave picture for it.

The cancellation in Eq. {eq}`eq-w8-hom` assumed the two photons are *identical*: same
frequency, polarization, arrival time, and spatial mode. If their wave packets
$\phi_a,\phi_b$ are partially distinguishable, only the indistinguishable fraction
interferes, and the coincidence probability at zero delay becomes

$$
P_{\mathrm{cc}}=\frac{1}{2}\left(1-|\langle\phi_a|\phi_b\rangle|^{2}\right).
$$ (eq-w8-homdip)

Scanning the relative delay $\tau$ traces out the celebrated *HOM dip*
({numref}`fig-w8-homdip`): $P_{\mathrm{cc}}\to\frac12$ for fully distinguishable
photons (the classical random-routing value), and $P_{\mathrm{cc}}\to0$ at $\tau=0$ for
identical ones. **The depth of the HOM dip is a direct meter stick for
indistinguishability** --- which is why it is the standard benchmark for single-photon
sources, and why the dip width measures the photon coherence time.

```{figure} ../images/hom_setup.svg
:name: fig-w8-homsetup
:width: 44%

Two single photons meet at a $50{:}50$ beam splitter; a coincidence counter
monitors the two outputs.
```

```{figure} ../images/hom_dip.svg
:name: fig-w8-homdip
:width: 50%

Coincidence probability vs. relative delay, Eq. {eq}`eq-w8-homdip`: identical
photons give a dip to zero; partial distinguishability
($\mathcal{V}=|\langle\phi_a|\phi_b\rangle|^{2}=0.5$ shown) makes the dip shallower.
```

````{exercise} In-class discussion 1
:label: exer-w8-homfreq

In a HOM experiment the two photons have slightly different center frequencies.
What happens to the dip?
````

```{solution} exer-w8-homfreq
:label: solu-w8-homfreq
:class: dropdown

It becomes shallower (and, for a fixed detection bandwidth, develops a beat): the
spectral overlap $|\langle\phi_a|\phi_b\rangle|^{2}$ decreases, so by
Eq. {eq}`eq-w8-homdip` the coincidences no longer vanish. Distinguishability in *any*
degree of freedom --- frequency, polarization, timing --- fills the dip back in.
```

## The HOM dip in six lines of QuTiP

```{code-block} python
:caption: QuTiP demo — the HOM effect

from qutip import *
from numpy import pi
d = 3                                            # two modes, up to 2 photons
a = tensor(destroy(d), qeye(d)); b = tensor(qeye(d), destroy(d))
U = ((1j*pi/4)*(a.dag()*b + a*b.dag())).expm()   # 50:50 beam splitter
out = U * tensor(basis(d,1), basis(d,1))         # |1,1> in
print(expect(a.dag()*a*b.dag()*b, out))          # coincidences -> 0.0
```

```{important}
**Summary — Section 1.**
A $\chi^{(2)}$ crystal couples modes at $\omega$ and $2\omega$; pumped at $2\omega$ it
implements the squeeze operator of Week 7 and parametrically amplifies the vacuum,
emitting photon pairs that are number-correlated (heralded single photons,
Eq. {eq}`eq-w8-tmsv`) and, in type-II geometry, polarization entangled
(Eq. {eq}`eq-w8-bellpair`). A beam splitter is a unitary change of mode basis,
Eq. {eq}`eq-w8-bs`; one photon becomes a mode-entangled superposition, and two
identical photons bunch, Eq. {eq}`eq-w8-hom` --- the HOM dip whose depth measures
indistinguishability, Eq. {eq}`eq-w8-homdip`. SPDC pairs plus beam splitters are the
complete toolkit for the Bell tests and protocols that follow.
```
