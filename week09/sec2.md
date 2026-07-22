---
exports:
  - format: typst
---

# The CV Route: Computing with Squeezed Vacuum（第二節）

## Switching languages

[Section 1](sec1.md) counted photons. The continuous-variable (CV) route measures
fields: the information carriers are the quadratures $X=(a+a^\dagger)/\sqrt2$ and
$P=(a-a^\dagger)/(i\sqrt2)$ of Week 7, the workhorse measurement is homodyne detection,
and the quantum resource is the squeezed vacuum $S(r)|0\rangle$ --- deterministically
produced by a pumped $\chi^{(2)}$ crystal (Week 8's parametric amplifier). No
heralding, no waiting: every pulse delivers a squeezed state. That determinism is the
CV route's opening move, and it leads to this week's installment of our running dark
line: *the input to the quantum-advantage experiments below is squeezed vacuum ---
they are, literally, computing with vacuum.*

## Gaussian boson sampling in a nutshell

Boson sampling is a quantum Galton board ({numref}`fig-w9-gbs`). In the classical
board, balls rattle through pegs and pile up in a binomial distribution --- easy to
predict. Replace the balls by *indistinguishable* photons and the pegs by a mesh of
beam splitters and phase shifters implementing a Haar-random unitary $U$ on $M$ modes,
place photon counters at the outputs, and the probability of a click pattern
$\bar n=(n_1,\dots,n_M)$ is no longer binomial: for single-photon inputs it is
proportional to $|\mathrm{Per}(U_S)|^2$, the permanent of an $N\times N$ submatrix of
$U$ selected by the pattern. Computing permanents is #P-hard, and the interference of
all $N!$ photon paths cannot be factorized, so for $N\gtrsim50$ photons no classical
computer is believed able to sample from this distribution (QO_note_6, Sec. 1).
*Gaussian* boson sampling (GBS) makes one substitution: the inputs are squeezed-vacuum
states instead of heralded single photons, and the permanent becomes the *hafnian* ---
a cousin of the permanent, just as hard --- with

$$
\Pr(\bar n)\;\propto\;\bigl|\mathrm{Haf}(A_S)\bigr|^2 ,
$$ (eq-w9-haf)

where $A_S$ is the submatrix, fixed by the click pattern, of a matrix $A$ built from
$U$ and the squeezing parameters. Because squeezed vacuum is deterministic while
heralded single photons are not, GBS is the version that scales, and it underlies
every photonic quantum-advantage demonstration to date. Boson sampling is *not* a
universal computer --- it is a minimal, purely passive experiment designed to expose
one thing: the computational power of bosonic interference.

```{figure} ../images/gbs_galton.svg
:name: fig-w9-gbs
:width: 97%

Balls $\to$ photons, pegs $\to$ beam splitters. Left: classical Galton board,
binomial output. Right: GBS --- squeezed vacuum enters a programmable interferometer
$U$; photon-number-resolved click patterns are distributed according to a #P-hard
hafnian, Eq. {eq}`eq-w9-haf`. Layout after Madsen et al., Nature **606**, 75 (2022),
Fig. 1.
```

## Milestones: Jiuzhang, Borealis, Aurora

- **Jiuzhang** (USTC, 2020): 76-photon GBS through a 100-mode interferometer --- the
  first claim of photonic quantum advantage (Zhong et al. 2020). **Jiuzhang 3.0**
  (2023) upgraded to pseudo-photon-number-resolving detection and registered up to 255
  clicks (Deng et al. 2023).
- **Borealis** (Xanadu, 2022): 216 squeezed *time-bin* modes in a dynamically
  programmable loop interferometer --- quantum advantage on a machine users could
  program over the cloud (Madsen et al. 2022).
- **Aurora** (Xanadu, 2025): 35 photonic chips linked by 13 km of fiber across four
  server racks --- not a bigger sampler but a *modular, networked* architecture aimed
  at fault tolerance (Aghaee Rad et al. 2025).

## Industry snapshot 2026

<!-- GKP one-liner only (teacher decision 2026-07-20); reference GKP 2001.
     Industry data #3 (as of 2026-07; re-verify): Xanadu GKP error-correction
     milestone 2025:
     https://thequantuminsider.com/2026/03/24/11-companies-lighting-up-the-quantum-photonics-sector/
     Industry data #4 (as of 2026-07; re-verify): Aurora system page:
     https://www.xanadu.ai/photonics/
     Industry data #5 (as of 2026-07; re-verify): Xanadu SPAC listing 2026-03,
     NASDAQ: XNDU:
     https://quantumzeitgeist.com/top-photonic-quantum-computing-companies/ -->
Xanadu's road from Borealis runs through error correction: a 2025 milestone
demonstrated optical generation of GKP states (Gottesman, Kitaev, and Preskill 2001)
--- in one sentence, the encoding that folds a continuous-variable mode into a
discrete qubit, and one sentence is all the depth we need. Then came the Aurora
modular system, and, in March 2026, a SPAC listing on NASDAQ (ticker XNDU) that made
Xanadu the second pure-play quantum company to go public after IonQ.

<!-- Industry data #6 (as of 2026-07; re-verify): Quandela/ORCA QD-source route
     and Shenzhen QBoson optical-quantum-computer factory:
     https://thequantuminsider.com/2026/03/24/11-companies-lighting-up-the-quantum-photonics-sector/
     https://www.businesswire.com/news/home/20250912049344/en/ -->
```{table} Three photonic bets, side by side
:name: tab-w9-industry
| | **PsiQuantum** | **Xanadu** | **Quandela / ORCA; China** |
|---|---|---|---|
| encoding | DV (dual rail) | CV (GBS $\to$ GKP) | DV (QD single photons); GBS |
| architecture | fusion-based lattice | modular GBS network | processors around QD sources |
| signature bet | fab-first, no prototype (GlobalFoundries) | error-corrected CV (Aurora, XNDU) | source quality; Jiuzhang line + Shenzhen QBoson factory |
```

## The honest page: what is GBS actually for?

Quantum *advantage* is a complexity statement: "no classical computer can reproduce
these samples in reasonable time." It is not a statement of *usefulness*, and the two
keep being conflated. Proposed applications --- molecular vibronic spectra, graph
problems, GBS-based machine-learning feature maps --- remain contested territory
rather than demonstrated wins. Meanwhile the classical side keeps counterattacking:
tensor-network simulators that exploit realistic photon loss have reproduced the
statistics of the largest published GBS experiments at modest cost (Oh et al. 2024),
and the cross-entropy benchmarks used to certify advantage can themselves be spoofed
(Oh, Jiang, and Fefferman 2023). The advantage frontier is real but it *moves*. This
page is the most honest one in the course: when a field is hot, the scientific skill
you need most is to keep the claims and the evidence in separate, clearly labeled
boxes.

````{exercise} In-class discussion 2
:label: exer-w9-advantage

What exactly is the difference between "quantum advantage" and "quantum usefulness"?
````

```{solution} exer-w9-advantage
:label: solu-w9-advantage
:class: dropdown

Advantage: a sampling task, chosen for hardness, done faster than the best known
classical simulation --- a complexity milestone. Usefulness: beating classical methods
on a problem somebody outside quantum computing already wants solved. Jiuzhang and
Borealis achieved the first; nobody has yet demonstrated the second, and saying so
plainly is part of doing science.
```

```{important}
**Summary — Section 2.**
The CV route computes with the quadratures of Week 7; its resource, squeezed vacuum,
is produced deterministically --- the dark line of the unit becomes literal, since GBS
machines take vacuum as input. Sampling the output of a random interferometer is
#P-hard (permanent for single photons, hafnian for squeezed inputs,
Eq. {eq}`eq-w9-haf`); Jiuzhang, Borealis, and Aurora turned that hardness into
quantum-advantage demonstrations and then into a modular, error-correction-oriented
roadmap (GKP). Advantage, however, is a complexity claim --- classical simulators
exploiting loss keep clawing experiments back, and usefulness remains an open
question.
```
