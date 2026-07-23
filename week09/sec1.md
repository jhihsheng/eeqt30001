---
exports:
  - format: typst
    id: w09sec1-pdf
    output: exports/week09-sec1.pdf
downloads:
  - id: w09sec1-pdf
    title: 本頁 PDF
---

# The DV Route: Measurement Replaces Interaction（第一節）

## The photonic qubit's balance sheet

```{table} The photonic qubit's balance sheet
:name: tab-w9-balance
| **Assets** | **Liability** |
|---|---|
| negligible decoherence (no charge, no rest mass, weak coupling to the environment) | **photons do not interact with each other** $\Rightarrow$ deterministic two-photon gates are unavailable |
| flies at $c$ --- communication is built in | |
| room-temperature qubit carrier | |
| compatible with silicon-photonics fabrication | |
```

Circle the right-hand column. The entire shape of photonic quantum computing --- every
architecture in this section --- is a response to that single cell.

**Why photons do not interact.** In vacuum and in linear media, Maxwell's equations are
linear: superposition is exact, and two crossing laser beams pass through each other
unchanged. (Quantum electrodynamics does permit photon--photon scattering via virtual
electron--positron pairs, but at optical energies the rate is so small it has never
been observed with light alone.) The engineering escape would be a $\chi^{(3)}$ (Kerr)
medium, where one beam shifts the phase of another --- but at the *single-photon* level
the available nonlinear phase in conventional materials falls short of the $\pi$ a gate
needs by many orders of magnitude (Kok et al. 2007). Nature does not provide a
photon--photon gate. The field had to invent one.

## Encoding one photon into one qubit

Three standard encodings of a dual-mode qubit ({numref}`fig-w9-encodings`):
polarization ($|H\rangle,|V\rangle$), *dual rail* (which path or waveguide the photon
occupies), and *time bin* (early or late slot). All three are two-mode encodings,
interconverted by polarizing beam splitters and delay lines, and everything from Week 8
applies verbatim: single-qubit gates are wave plates, beam splitters, and phase
shifters --- linear optics does arbitrary single-qubit rotations easily. Only the
*two*-qubit gate is missing.

```{figure} ../images/photon_encodings.svg
:name: fig-w9-encodings
:width: 97%

Three ways to write one qubit on one photon. In each case the logical information
lives in *which mode* the photon occupies.
```

## KLM: the measurement-induced nonlinearity

In 2001 Knill, Laflamme, and Milburn showed that linear optics *plus* ancilla photons
*plus* photon counting is enough for universal quantum computation (KLM 2001). The
trick: you cannot make two photons talk, but a measurement can. Mix the signal modes
with ancilla photons on a network of beam splitters, then detect the ancilla modes
({numref}`fig-w9-klm`). Conditioned on a particular detection pattern, the surviving
signal state has undergone a transformation that no linear network could apply
deterministically. The elementary example is the *nonlinear sign* (NS) gate,

$$
\alpha|0\rangle+\beta|1\rangle+\gamma|2\rangle
\;\longrightarrow\;
\alpha|0\rangle+\beta|1\rangle-\gamma|2\rangle ,
$$ (eq-w9-ns)

implemented with two ancilla modes --- one carrying a single photon, one in vacuum,
both detected at the output --- and success probability $1/4$; two NS gates inside a
Hong--Ou--Mandel-style interferometer give a controlled-$Z$ gate with success
probability $1/16$ (KLM 2001; Kok et al. 2007). The gate is probabilistic but
*heralded*: a specific ancilla click pattern lights up exactly when the gate worked, so
you always know.

```{figure} ../images/klm_heralded_gate.svg
:name: fig-w9-klm
:width: 80%

Measurement-induced nonlinearity. Signal qubits and ancilla photons mix in a linear
network; a coincidence of ancilla detections heralds success, and only then is the
(nonlinear) gate accepted. Layout after Kok et al., Rev. Mod. Phys. **79**, 135 (2007).
```

**The cost, and the second trick.** Cascading $1/16$ gates naively is hopeless ---
success probabilities multiply, so the yield of a deep circuit dies exponentially.
KLM's rescue is Week 8's teleportation, promoted from stunt to compiler tool: apply the
probabilistic gate *offline* to one half of an entangled resource pair, retry until it
succeeds, and only then teleport the computational qubit through the pre-gated pair.
Failures burn resource states, never data, and larger ancilla states push the
teleportation success toward one (KLM 2001). We only state the idea --- the resource
bookkeeping is beyond this course --- but the slogan deserves its first appearance
here: *measurement is not a passive readout; it is an active computational resource.*

## Cluster states: computing by measuring

Measurement-based quantum computing (MBQC) takes the slogan to its logical conclusion
(Raussendorf and Briegel 2001). First entangle a large register of qubits into a
standard *cluster state* (a lattice with controlled-$Z$ bonds between neighbors); then
compute using *only single-qubit measurements*, column by column
({numref}`fig-w9-mbqc`, left). The choice of measurement angles *is* the program;
earlier outcomes steer later measurement bases. No two-qubit gate is ever applied
during the computation --- all the entanglement was paid for up front, in the
preparation of the cluster. For photonics this is the perfect division of labor: the
hard entangling step moves into *state preparation*, where probabilistic-but-heralded
tricks are acceptable (retry until success), while the computation itself needs only
the single-photon measurements photons are best at.

```{figure} ../images/mbqc_fusion.svg
:name: fig-w9-mbqc
:width: 97%

Left: MBQC --- entangle first (bonds), then compute by measuring single qubits at
program-defined angles. Right: fusion-based construction --- small seed states are
stitched into the lattice by two-photon fusion measurements; the measured pair is
consumed and leaves a bond (after Bartolucci et al., Nat. Commun. **14**, 912 (2023)).
```

## Fusion-based quantum computing: the PsiQuantum bet

Growing one giant cluster photon-by-photon is fragile. The fusion-based architecture
(Bartolucci et al. 2023) instead mass-produces small, identical *seed states*
(few-photon entangled states, the only things a chip must generate) and stitches them
together with *fusion* measurements --- two-photon Bell-type measurements that consume
the measured pair and leave an entangling bond between the seeds
({numref}`fig-w9-mbqc`, right). A failed fusion is a *heralded erasure* at a known
location, exactly the error a fault-tolerant code handles best, so error correction is
native to the architecture rather than bolted on.

<!-- Industry data #1 (as of 2026-07; re-verify before class):
     PsiQuantum x GlobalFoundries manufacturing partnership, million-qubit
     fault-tolerant roadmap:
     https://www.businesswire.com/news/home/20250912049344/en/
     Industry data #2 (as of 2026-07; re-verify before class):
     Brisbane site (~US$0.94 billion government support) and Chicago site:
     https://thequantuminsider.com/2026/03/24/11-companies-lighting-up-the-quantum-photonics-sector/ -->
**Industry anchor.** PsiQuantum is the purest expression of this route: it builds no
small prototype at all, aiming directly at a fault-tolerant, million-qubit machine,
with chips manufactured in a commercial semiconductor fab (partnership with
GlobalFoundries) and utility-scale sites announced in Brisbane (roughly US\$0.9 billion
in Australian government support) and Chicago.[^ind] Why dare to skip the prototype?
Because the wager is not on physics milestones but on *manufacturability*: if qubits
can be printed by the same process line that already ships datacenter optical
interconnects, then scaling is a fab problem, not a laboratory problem. The contrast
with superconducting platforms is stark --- no dilution refrigerators; the photons
themselves live at room temperature, and only the single-photon detectors (Week 7's
SNSPDs) need compact few-kelvin cryostats.

[^ind]: Industry figures in this chapter are as of 2026-07 and are re-verified before
class; sources are cited in comments in the page source beside each claim.

````{exercise} In-class discussion 1
:label: exer-w9-linearity

"Photons barely interact with each other" is the liability of this whole section. Is
it the same fact as "optical fiber signals do not interfere with each other", which
telecom engineers list as an asset?
````

```{solution} exer-w9-linearity
:label: solu-w9-linearity
:class: dropdown

Yes --- both are the linearity of Maxwell's equations in the medium. One community
curses it (no two-photon gate), the other banks on it (wavelength-division
multiplexing works). Nature gave no nonlinearity at the single-photon scale; KLM's
answer is to steal one from measurement.
```

```{important}
**Summary — Section 1.**
Photons make superb single qubits (no decoherence, room temperature, fab-compatible)
but refuse to interact, so deterministic two-photon gates do not exist. KLM 2001:
linear optics + ancilla photons + photon counting yields heralded probabilistic gates,
Eq. {eq}`eq-w9-ns`, and teleportation moves the failures offline. MBQC recasts
computation as single-qubit measurements on a pre-entangled cluster state;
fusion-based architectures build that cluster from mass-produced seed states joined by
heralded fusion measurements, with fault tolerance built into the construction.
Measurement is the resource throughout.
```
