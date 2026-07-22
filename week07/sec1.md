---
exports:
  - format: typst
---

# Quantum States of Light（第一節）

## One mode is a harmonic oscillator

Maxwell's equations in a source-free region are linear, so their solutions organize into
*eigenmodes*: field patterns that oscillate at a single frequency $\omega$, with a
shape fixed by the geometry (a plane wave in free space, a standing wave in a cavity, a
guided mode in a waveguide). The energy of one mode is quadratic in the field amplitudes
$(\mathbf{E},\mathbf{B})$ --- formally identical to the energy
$\frac{p^{2}}{2m}+\frac{m\omega^{2}x^{2}}{2}$ of a mechanical oscillator. Canonical
quantization therefore proceeds exactly as for a particle in a parabolic well: promote the
canonical pair to operators, impose the commutator, and change variables to ladder
operators (QO_note_2, Sec. 1–2). The result, for every mode,

$$
\mathcal{H}=\hbar\omega\Bigl(a^{\dagger}a+\tfrac{1}{2}\Bigr),\qquad
[a,a^{\dagger}]=1 .
$$ (eq-w7-hamil)

A *photon* is one quantum of excitation of a mode --- the $n$-th rung of that mode's
energy ladder --- not a small ball flying through space. **The mode comes first; the
photon is the mode's excitation.** Everything in this unit follows from the single algebraic
statement $[a,a^{\dagger}]=1$.

## The vacuum is not empty

The ground state $|0\rangle$ of Eq. {eq}`eq-w7-hamil` has energy $\hbar\omega/2$ and, more
importantly, *fluctuating fields*: $\langle 0|\mathbf{E}|0\rangle=0$ but
$\langle 0|\mathbf{E}^{2}|0\rangle\neq0$. These zero-point fluctuations are physical.
Summing $\hbar\omega/2$ over the modes allowed between two parallel mirrors, and comparing
with free space, yields a measurable attraction (Casimir, 1948; full derivation in
QO_note_2, Example 4),

$$
\frac{F}{A}=-\frac{\pi^{2}\hbar c}{240\,d^{4}} .
$$

The lesson to remember for the cavity-QED section and for Week 10: the vacuum has
*structure* --- which modes exist, and how strong their zero-point fields are at a
given point, depends on the boundary conditions. Structure can be engineered.

## Fock states: the DV language

The eigenstates $|n\rangle$ of $a^{\dagger}a$ (*Fock* or number states) are maximally
quantum: the field expectation value $\langle n|\mathbf{E}|n\rangle$ vanishes for every
$n$, so a Fock state carries *no phase* --- only fluctuations
(QO_note_2, Sec. 2.3). Encoding information in discrete photonic degrees of freedom
--- photon number ($|0\rangle,|1\rangle$), polarization ($|H\rangle,|V\rangle$), or path
--- is called *discrete-variable* (DV) encoding. It is conceptually clean but
experimentally expensive: single photons are hard to make and easy to lose.

## Quadratures and phase space: the CV language

The Hermitian combinations of $a$ and $a^{\dagger}$,

$$
X=\frac{a+a^{\dagger}}{\sqrt{2}},\qquad
P=\frac{a-a^{\dagger}}{i\sqrt{2}},\qquad
[X,P]=i \;\;\Rightarrow\;\; \Delta X\,\Delta P\ge\tfrac{1}{2},
$$ (eq-w7-quad)

are the dimensionless position and momentum of the mode --- the *quadratures*.[^conv]
They are continuously valued and directly measurable (by homodyne detection, Week 10), and
encoding information in them is called *continuous-variable* (CV) encoding.

[^conv]: The original lecture notes QO_note_2–5 use the convention
$X_{s}=(a+a^{\dagger})/2=X/\sqrt{2}$, $Y_{s}=P/\sqrt{2}$, for which
$[X_{s},Y_{s}]=i/2$ and $\sigma(X_{s})\sigma(Y_{s})\ge 1/4$. All statements convert by a
factor $\sqrt{2}$ per quadrature.

Phase space gives the picture. A classical oscillator is a *point* $(x,p)$ tracing a
circle as it evolves. A quantum state cannot be a point --- Eq. {eq}`eq-w7-quad` forbids
sharp $X$ and $P$ simultaneously --- so even the "most classical" quantum state is a
fuzzy blob of area $\sim\frac{1}{2}$, rotating rigidly at $\omega$
({numref}`fig-w7-phasespace`).

```{figure} ../images/ps_vacuum_coherent.svg
:name: fig-w7-phasespace
:width: 62%

Phase space in our convention, Eq. {eq}`eq-w7-quad`. A classical state is a
point tracing a circle; a quantum state is a minimum-uncertainty blob of area
$\sim\frac12$. The vacuum sits at the origin; the displacement $D(\alpha)$ shifts it
to $\alpha$ without changing its shape --- a coherent state,
$\Delta X=\Delta P=1/\sqrt2$.
```

## Coherent states: the most classical light

Which quantum state behaves like the classical field
$E_{0}\cos(\omega t+\phi)$ of a laser? Demanding
$\langle\mathbf{E}\rangle\propto$ the classical field leads to the eigenvalue problem
(QO_note_3, Sec. 2)

$$
a|\alpha\rangle=\alpha|\alpha\rangle,\qquad
|\alpha\rangle=e^{-|\alpha|^{2}/2}\sum_{n=0}^{\infty}
\frac{\alpha^{n}}{\sqrt{n!}}\,|n\rangle ,
$$

with $\alpha$ a complex number --- the dimensionless amplitude *and* phase of the
wave. Key properties:

- Photon number is Poisson-distributed,
  $p_{n}=e^{-\langle n\rangle}\langle n\rangle^{n}/n!$, with
  $\langle n\rangle=|\alpha|^{2}$ and $\Delta n=\sqrt{\langle n\rangle}$ ---
  photons in a laser beam arrive *randomly and independently*, like raindrops.
- It is a minimum-uncertainty state, $\Delta X=\Delta P=1/\sqrt{2}$: the same circular
  blob as the vacuum, displaced to $\alpha$. Indeed
  $|\alpha\rangle=D(\alpha)|0\rangle$ with the displacement operator
  $D(\alpha)=\exp(\alpha a^{\dagger}-\alpha^{*}a)$ --- and $D(\alpha)$ is exactly the
  evolution generated by a classical oscillating current (an antenna, a laser drive;
  QO_note_4, Sec. 3). A laser *displaces the vacuum*.
- Free evolution just rotates the blob: $\alpha(t)=\alpha(0)e^{-i\omega t}$.

## Squeezed states: reshaping the vacuum blob

The uncertainty product bounds the *area* of the blob, not its shape. The squeeze
operator (QO_note_5, Sec. 2)

$$
S(\xi)=\exp\Bigl(\tfrac{1}{2}\xi^{*}a^{2}-\tfrac{1}{2}\xi\,(a^{\dagger})^{2}\Bigr),
\qquad \xi=re^{i\theta},
$$

turns the circle into an ellipse: for $\theta=0$,
$\Delta X=e^{-r}/\sqrt{2}$ and $\Delta P=e^{+r}/\sqrt{2}$ --- one quadrature quieter than
the vacuum itself, at the price of the other ({numref}`fig-w7-squeezed`). Because $S(\xi)$
is quadratic in $a^{\dagger}$, generating squeezed light requires a *nonlinear*
process ($\chi^{(2)}$ parametric down-conversion, Week 8). Why care? Metrology: LIGO
injects squeezed vacuum to measure below the vacuum noise level (Week 10).

```{figure} ../images/ps_squeezed.svg
:name: fig-w7-squeezed
:width: 50%

Squeezed vacuum in phase space: one quadrature narrows to $e^{-r}/\sqrt2$ at
the price of the conjugate one; the area $\Delta X\,\Delta P=\tfrac12$ is unchanged
(dashed: the vacuum circle).
```

## DV vs. CV at a glance

```{table} DV vs. CV
:name: tab-w7-dvcv
|  | **DV (discrete)** | **CV (continuous)** |
|---|---|---|
| Basic objects | Fock states, polarization | quadratures $X,P$ |
| Qubit example | $|H\rangle,|V\rangle$; dual-rail $|01\rangle,|10\rangle$ | coherent/squeezed states; cat, GKP codes |
| Measurement | single-photon detectors | homodyne/heterodyne |
| Strength | clean logic, long-distance QKD | deterministic sources, scalable |
| Weakness | probabilistic sources, loss | noise accumulates |
```

Hybrid schemes (converting DV qubits into cat-state qubits and back) are an active research
direction (QO_note_3, introduction). This DV/CV pair of languages is the backbone of the
whole unit: Week 8 speaks mostly DV, Week 9 uses both, Week 10 mostly CV.

```{important}
**Summary — Section 1.**
Every mode of light is a harmonic oscillator: $[a,a^{\dagger}]=1$,
$\mathcal H=\hbar\omega(a^{\dagger}a+\frac12)$. The vacuum is a real physical state with
fluctuating fields (Casimir). Fock states have sharp $n$ and no phase (DV); coherent
states are displaced vacua with Poisson statistics, $\Delta n=\sqrt{\langle n\rangle}$
(the most classical light); squeezed states beat the vacuum noise in one quadrature (CV).
Phase space: point (classical) $\to$ blob of area $\sim\frac12$ (quantum).
```
