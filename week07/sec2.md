---
exports:
  - format: typst
    id: w07sec2-pdf
    output: exports/week07-sec2.pdf
downloads:
  - id: w07sec2-pdf
    title: 本頁 PDF
---

# Proving the Photon: The Second-Order Correlation $g^{(2)}(0)$（第二節）

## Photon-counting statistics

Modern detectors do not record a continuous intensity; they *click*. The statistics
of clicks classify light (QO_photon_stat):

- **Poissonian**, $\Delta n=\sqrt{\langle n\rangle}$: coherent light (laser).
- **Super-Poissonian**, $\Delta n>\sqrt{\langle n\rangle}$: thermal/chaotic light.
- **Sub-Poissonian**, $\Delta n<\sqrt{\langle n\rangle}$:
  *no classical explanation* --- non-classical light.

A practical warning: loss randomizes. If photons survive a lossy channel or an inefficient
detector independently with probability $\eta$, sub-Poissonian statistics degrade toward
Poissonian --- observing quantum statistics requires high collection and detection
efficiency. This motivates the SNSPD section of this chapter.

## The HBT experiment and $g^{(2)}$

Photon counting alone cannot separate "one photon at a time" from a very dim laser
(see the discussion question below). The decisive quantity is the *intensity–intensity*
correlation, measured in the Hanbury Brown–Twiss (HBT) geometry: split the beam 50:50 onto
two detectors and count coincidences ({numref}`fig-w7-hbt`). For a single mode, with the
detector-ordering of operators from Glauber's photodetection theory
(QO_note_5, Sec. 1),

$$
g^{(2)}(0)=\frac{\langle a^{\dagger}a^{\dagger}aa\rangle}
                {\langle a^{\dagger}a\rangle^{2}}
          =1+\frac{\sigma^{2}(n)-\langle n\rangle}{\langle n\rangle^{2}} .
$$ (eq-w7-g2)

$$
g^{(2)}(0)=
\begin{cases}
2 & \text{thermal light (bunching)},\\
1 & \text{coherent light (random arrivals)},\\
\dfrac{n-1}{n}\;\xrightarrow{\,n=1\,}\;0 & \text{Fock state (antibunching)}.
\end{cases}
$$ (eq-w7-g2values)

For *any* classical intensity distribution, the Cauchy–Schwarz inequality forces
$g^{(2)}(0)\ge 1$: classical waves can bunch, never antibunch. Therefore a measured
$g^{(2)}(0)<1$ has no classical explanation, and $g^{(2)}(0)\to 0$ certifies a
single-photon source. This is the experiment that finally proved the photon: resonance
fluorescence of single atoms, Kimble, Dagenais and Mandel (1977) ---
seventy years after the photoelectric effect. The photoelectric effect needs only
quantized *atoms*; antibunching needs quantized *light*.

```{figure} ../images/hbt_setup.svg
:name: fig-w7-hbt
:width: 46%

HBT setup --- beam splitter, two detectors, coincidence counter.
```

```{figure} ../images/g2_curves.svg
:name: fig-w7-g2curves
:width: 50%

$g^{(2)}(\tau)$ for thermal, coherent, and single-photon light; the shaded
region $g^{(2)}(0)<1$ is classically forbidden.
```

````{exercise} In-class discussion 1
:label: exer-w7-dimlaser

A laser is attenuated to $0.1$ photons per pulse on average.
Is it a single-photon source?
````

```{solution} exer-w7-dimlaser
:label: solu-w7-dimlaser
:class: dropdown

No. Attenuation preserves coherent-state statistics: $g^{(2)}(0)=1$, and the two-photon
probability $p_{2}\approx\langle n\rangle^{2}/2$ is nonzero. Dim is not quantum.
```

````{exercise} In-class discussion 2
:label: exer-w7-half

You measure $g^{(2)}(0)=0.5$. What is the source?
````

```{solution} exer-w7-half
:label: solu-w7-half
:class: dropdown

Non-classical (below 1), but not a perfect single-photon source: e.g. two independent
single-photon emitters ($g^{(2)}=1/2$ exactly), or one imperfect emitter with background.
```

## Try it in three lines (QuTiP)

```{code-block} python
:caption: QuTiP demo — $g^{(2)}(0)$ of Fock, coherent, and squeezed states

from qutip import *
N = 30
states = {"Fock |1>": basis(N,1), "Coherent": coherent(N,2.0),
          "Squeezed": squeeze(N,1.0)*basis(N,0)}
a = destroy(N)
for name, psi in states.items():
    g2 = expect(a.dag()*a.dag()*a*a, psi)/expect(a.dag()*a, psi)**2
    print(name, "g2(0) =", round(g2,3))
```

This is the seed of the bonus homework（見[作業章](../assignment/index.md)；Colab recommended;
worth up to $+5$ points on Midterm 2).

## Single-photon sources compared

```{table} Order-of-magnitude comparison of single-photon sources（數字 2026-07 依文獻核校；cf. Fox Ch. 5）
:name: tab-w7-sps
| Source | $g^{(2)}(0)$ (typ.) | Rate | Operating $T$ | Deterministic? |
|---|---|---|---|---|
| Attenuated laser | $1$ (always) | GHz | room | no (Poisson) |
| SPDC, heralded (Week 8) | $10^{-2}$ (best $3{\times}10^{-4}$) | 0.1–4 MHz | room | heralded |
| Quantum dot in cavity | $\sim10^{-3}$ | tens of MHz | 4–10 K | near-det. |
| NV center in diamond | $0.2$–$0.4$ | $10^{5}$–$3{\times}10^{6}$ s$^{-1}$ | room | det., poor collection |
```

The quantum-dot route is where cavity QED (next section) pays off: a cavity both
speeds up emission (Purcell effect) and funnels the photons into one collectible mode.

```{important}
**Summary — Section 2.**
Click statistics classify light; $g^{(2)}(0)=1+[\sigma^{2}(n)-\langle n\rangle]/\langle
n\rangle^{2}$ is the sharp tool: thermal 2, coherent 1, single photon 0. Classically
$g^{(2)}(0)\ge1$; antibunching is the fingerprint of the photon (1977). A dim laser is
never a single-photon source. Real sources trade off purity, rate, temperature, and
determinism.
```
