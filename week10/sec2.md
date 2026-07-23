---
exports:
  - format: typst
    id: w10sec2-pdf
    output: exports/week10-sec2.pdf
downloads:
  - id: w10sec2-pdf
    title: 本頁 PDF
---

# Parameter Estimation and Quantum Fisher Information（第二節）

## The estimation framework, and the bound we do not prove

Every sensor is the same abstract machine: a parameter $\theta$ (phase, field,
displacement) is imprinted on a probe state, $|\psi_0\rangle\to|\psi_\theta\rangle$; a
measurement produces data; an estimator turns data into $\hat\theta$. Classical
statistics assigns the data a Fisher information $F(\theta)$ and bounds any unbiased
estimator by the *Cramér--Rao* inequality --- after $\nu$ repetitions,

$$
\Delta\theta\;\ge\;\frac{1}{\sqrt{\nu\,F(\theta)}}\,.
$$ (eq-w10-crb)

We take Eq. {eq}`eq-w10-crb` as given (result only; it is theorem, not physics). The
quantum step (Braunstein and Caves 1994): maximizing $F$ over *all* measurements
permitted by quantum mechanics defines the *quantum Fisher information* $F_Q\ge F$ ---
the information content of the state itself, before any detector choices.

## Pure states: $F_Q=4(\Delta G)^2$

For this course's scope --- pure states, unitary encoding
$|\psi_\theta\rangle=e^{-i\theta G}|\psi_0\rangle$ with Hermitian generator $G$ --- the
QFI collapses to one line. Expand the overlap of neighboring states:

$$
\langle\psi_\theta|\psi_{\theta+d\theta}\rangle
=\langle e^{-i\,d\theta\,G}\rangle
=1-i\,d\theta\,\langle G\rangle-\tfrac{1}{2}d\theta^2\langle G^2\rangle
+\mathcal O(d\theta^3),
$$

so the overlap probability is
$|\langle\psi_\theta|\psi_{\theta+d\theta}\rangle|^2
=1-(\Delta G)^2 d\theta^2+\cdots$. Distinguishability of neighboring states *is*
information about $\theta$; the identification
$|\langle\psi_\theta|\psi_{\theta+d\theta}\rangle|^2\equiv
1-\tfrac{1}{4}F_Q\,d\theta^2$ gives

$$
\boxed{\;F_Q=4(\Delta G)^2\;}
\qquad\Rightarrow\qquad
\Delta\theta\ \ge\ \frac{1}{2\,\Delta G\,\sqrt{\nu}}\,.
$$ (eq-w10-fq)

The rule of the whole subject in five words: *sensitivity is generator variance*. A
state estimates $\theta$ well iff it is spread widely over the eigenvalues of whatever
operator generates $\theta$.

## Example 1 (blackboard): coherent state --- the SQL again

Phase encoding on one mode: $G=\hat n$, probe $|\alpha\rangle$. Week 7 (and QO_note_3,
Sec. 2.2): a coherent state has Poissonian number statistics,
$(\Delta n)^2=\langle n\rangle$. Therefore

$$
F_Q=4\langle n\rangle,
\qquad
\Delta\phi\ \ge\ \frac{1}{2\sqrt{\langle n\rangle}}\,.
$$ (eq-w10-fqcoh)

The $1/\sqrt{\langle n\rangle}$ scaling of [Section 1](sec1.md) reappears --- now as a
statement about the *state*, independent of any interferometer bookkeeping (constant
factors depend on the setup; the scaling does not). Classical light cannot scale
better, because Poisson variance is what independence looks like in the number basis.

## Example 2 (blackboard): N00N state --- the Heisenberg limit

Take the two-mode "all-or-nothing" state and phase encoding in arm $a$:

$$
|\mathrm{N00N}\rangle=\frac{|N,0\rangle+|0,N\rangle}{\sqrt2},
\qquad G=\hat n_a .
$$

Then $\langle G\rangle=N/2$ and $\langle G^2\rangle=N^2/2$, so
$(\Delta G)^2=N^2/4$ and

$$
F_Q=N^2,
\qquad
\Delta\phi\ \ge\ \frac{1}{N}\,.
$$ (eq-w10-fqnoon)

Heisenberg scaling, achieved: the $N$ photons behave as one object of $N$ times the
frequency (the interference fringe oscillates as $\cos N\phi$ ---
"super-resolution"). The bonus notebook, problem 3, verifies Eq. {eq}`eq-w10-fqnoon`
numerically in QuTiP for $N=2,4,6$. {numref}`fig-w10-sqlh` compares the two scalings.

```{figure} ../images/sql_heisenberg.svg
:name: fig-w10-sqlh
:width: 52%

The two scalings of phase estimation, Eqs. {eq}`eq-w10-fqcoh` and
{eq}`eq-w10-fqnoon`. The gap between them is what "quantum-enhanced sensing" means.
```

````{exercise} In-class discussion 2
:label: exer-w10-noon

If N00N states reach $1/N$, why does LIGO inject squeezed vacuum instead?
````

```{solution} exer-w10-noon
:label: solu-w10-noon
:class: dropdown

Loss. Lose a single photon from a N00N state and the environment learns which arm
held all $N$ --- the superposition collapses and *all* phase information dies. At
LIGO-scale losses the N00N advantage is gone entirely, while squeezed vacuum degrades
gracefully (a lossy squeezed state is a less-squeezed state). Fragility is the price
of maximal $(\Delta G)^2$; practical quantum sensing is the art of buying variance
without buying fragility.
```

## Platforms at a glance

The framework of Eq. {eq}`eq-w10-fq` is platform-blind --- pick a generator, engineer
its variance (Degen et al. 2017):

```{table} Quantum-sensing platforms
:name: tab-w10-platforms
| **platform** | **quantity (generator)** | **quantum resource** |
|---|---|---|
| NV centers in diamond | magnetic field (spin $\hat S_z$) | long-lived spins, room $T$ |
| trapped ions / lattice clocks | time--frequency ($\hat H$) | entangled ions, $10^{-18}$ clocks |
| atom interferometers | gravity, acceleration ($\hat p$) | matter-wave coherence |
| LIGO / optomechanics | displacement, strain ($\hat n$) | squeezed vacuum |
| photonic probes | phase, refractive index ($\hat n$) | N00N, squeezed, single photons |
```

```{important}
**Summary — Section 2.**
Estimation is bounded by Cramér--Rao, Eq. {eq}`eq-w10-crb` (result only); maximizing
over measurements defines $F_Q$. For pure states with unitary encoding,
$F_Q=4(\Delta G)^2$, Eq. {eq}`eq-w10-fq`: sensitivity *is* generator variance.
Coherent states give $F_Q=4\langle n\rangle$ (the SQL, restated as a property of the
state); N00N states give $F_Q=N^2$ (the Heisenberg limit) but die with one lost
photon --- which is why LIGO runs on squeezed vacuum instead. The generator, and
hence the limit, is chosen by the physics of the platform.
```
