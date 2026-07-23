---
exports:
  - format: typst
    id: w09sec3-pdf
    output: exports/week09-sec3.pdf
downloads:
  - id: w09sec3-pdf
    title: 本頁 PDF
---

# Quantum Networks: When Not Interacting Becomes the Point（第三節）

## The shape of the problem

Flip [Section 1](sec1.md)'s liability: a particle that talks to nothing is the perfect
courier. One obstacle remains --- loss. Telecom fiber attenuates by
$\alpha\approx0.2$ dB/km at 1550 nm, so direct transmission succeeds with probability

$$
P(L)=10^{-\alpha L/10}:
\qquad
P(500\,\mathrm{km})\approx10^{-10},
\qquad
P(1000\,\mathrm{km})\approx10^{-20}.
$$ (eq-w9-loss)

At $10^{-10}$, a 10-GHz single-photon source delivers about one photon per second; at
$10^{-20}$, one photon every ~300 years ({numref}`fig-w9-loss`; Azuma et al. 2023).
Classical telecom solves this with amplifiers every ~80 km --- measure the dying
signal, copy it louder. But Week 8 proved the no-cloning theorem: an unknown quantum
state cannot be copied, and a deterministic amplifier would be exactly a copier. So
the problem has a peculiar shape: *the signal dies with distance, and you are
forbidden to copy it.*

```{figure} ../images/fiber_loss.svg
:name: fig-w9-loss
:width: 62%

Direct transmission through telecom fiber, Eq. {eq}`eq-w9-loss`. The exponential
wall is why long-distance quantum communication needs repeaters or satellites, not
better lasers.
```

## Quantum repeaters: entanglement relays

The escape (Azuma et al. 2023) uses the two tools Week 8 handed us
({numref}`fig-w9-repeater`). Cut the distance $L$ into short segments. (1) Generate
entanglement across each segment; this is lossy and probabilistic, but each attempt is
*heralded*, and a success is parked in a *quantum memory* at each node while
neighboring segments catch up. (2) Perform a Bell-state measurement on the two
memories at a middle node --- Week 8's *entanglement swapping*, Zeilinger's technique
--- which splices two short entangled links into one long one. Repeat up the line
until Alice and Bob share one end-to-end entangled pair, then use it: teleport a qubit
or run entanglement-based QKD. Note what never happens: no quantum signal ever crosses
the full distance, and nothing is amplified. Entanglement, classical communication,
and memories replace the forbidden copier, and the resource cost scales polynomially
with $L$ instead of exponentially.

```{figure} ../images/repeater_swap.svg
:name: fig-w9-repeater
:width: 90%

A quantum repeater is an entanglement relay: entangle each short segment (heralded,
memories hold the successes), swap at the nodes, and only end-to-end entanglement ---
never the signal itself --- spans the distance. Architecture after Azuma et al.,
Rev. Mod. Phys. **95**, 045006 (2023).
```

## Textbook-grade milestones

**Micius** (2017): the Chinese satellite distributed entangled photon pairs to ground
stations 1200 km apart (Yin et al. 2017) --- beating the fiber wall by leaving the
fiber; free-space loss grows only quadratically (diffraction) rather than
exponentially, and most of the path is vacuum. **Delft** (2021--22): a three-node
network of nitrogen-vacancy processors demonstrated genuinely networked protocols ---
multi-node entanglement distribution (Pompili et al. 2021) and then teleportation
between *non-adjacent* nodes (Hermans et al. 2022), i.e., between two parties with no
direct link, exactly the repeater primitive of {numref}`fig-w9-repeater` run on real
hardware.

## In progress right now (2025--2026)

<!-- Industry data #7 (as of 2026-07; re-verify): NYU-Qunnect-Cisco three-node
     entanglement swapping on deployed commercial fiber in NYC, ~1.5 swaps/s:
     https://phys.org/news/2026-04-scientists-quantum-internet-york-city.html
     Industry data #11 (as of 2026-07; re-verify): Qunnect-Cisco metro-scale
     entanglement-swapping demonstration (2026-02):
     https://quantumzeitgeist.com/top-quantum-networking-companies/
     Industry data #8 (as of 2026-07; re-verify): Photonic Inc-TELUS teleportation
     over 30 km of deployed commercial fiber (2025):
     https://quantumzeitgeist.com/top-quantum-networking-companies/
     Industry data #9 (as of 2026-07; re-verify): Beijing-Shanghai 2000-km QKD
     backbone; EuroQCI; US DOE quantum network program:
     https://thequantuminsider.com/2026/03/09/understanding-quantum-networking-and-its-industrial-potential/
     Industry data #10 (as of 2026-07; re-verify): IonQ acquired ID Quantique
     (2025-05) and Qubitekk (2025-01):
     https://thequantuminsider.com/2026/03/09/understanding-quantum-networking-and-its-industrial-potential/ -->
None of this is future tense anymore. In New York City, a Qunnect--NYU--Cisco
collaboration ran three-node entanglement swapping over *live commercial* telecom
fiber at about 1.5 swaps per second (2026); Photonic Inc. and the carrier TELUS
teleported qubit states across 30 km of deployed fiber in a metropolitan network
(2025). At the infrastructure scale: China's 2000-km Beijing--Shanghai backbone
carries QKD traffic today (with *trusted relay* nodes --- honest caveat: that is
classical trust at each relay, not yet entanglement swapping); the EU is building
EuroQCI; the US DOE runs a national quantum-network program. And the market is
consolidating --- IonQ bought the QKD pioneer ID Quantique and the network-hardware
maker Qubitekk in 2025. Quantum networking has left the optical table and moved into
telecom conduits.

## Bridge to Week 10: the other killer application

Secrecy is not the only reason to entangle distant nodes. A network of entangled
sensors --- clocks, telescopes, gravimeters --- can beat the precision of the same
sensors operating alone; entangled atomic-clock networks and very-long-baseline
optical telescopes are stages two and three of the standard quantum-internet roadmap
(Wehner, Elkouss, and Hanson 2018). What exactly does entanglement buy a
*measurement*? What sets the precision limit in the first place, and who ordered it
--- Heisenberg or statistics? That is Week 10, where the unit's dark line closes: the
vacuum is not empty, it is a resource, it can compute --- and next week, it can be
squeezed and *designed*.

````{exercise} In-class discussion 3
:label: exer-w9-amplify

Classical repeaters amplify the signal every ~80 km. Why can't a quantum network do
the same?
````

```{solution} exer-w9-amplify
:label: solu-w9-amplify
:class: dropdown

No-cloning: a deterministic amplifier that restores an unknown qubit would be a
copier, which unitarity forbids (Week 8's two-line proof). Hence the entire
architecture of {numref}`fig-w9-repeater` --- relay *entanglement* by swapping, never
the signal by amplification. The take-away sentence of the week applies here too: the
repeater's central act, the Bell-state measurement, is measurement working as a
resource --- KLM's lesson, stretched across a continent.
```

```{important}
**Summary — Section 3.**
Fiber loss is exponential, Eq. {eq}`eq-w9-loss`, and no-cloning forbids amplification,
so quantum networks relay entanglement instead of signals: heralded segment
entanglement, quantum memories, and entanglement swapping at the nodes. Micius took
entanglement to 1200 km via satellite; Delft ran the first true three-node network
protocols; 2025--26 demonstrations moved entanglement swapping and teleportation onto
live commercial metro fiber, while trusted-relay QKD backbones, EuroQCI, and DOE
programs build out infrastructure. The same networks' second application ---
distributed quantum sensing --- is where Week 10 begins.
```

## References（Week 9）

1. E. Knill, R. Laflamme, and G. J. Milburn, *A scheme for efficient quantum computation with linear optics*, Nature **409**, 46 (2001).
2. P. Kok, W. J. Munro, K. Nemoto, T. C. Ralph, J. P. Dowling, and G. J. Milburn, *Linear optical quantum computing with photonic qubits*, Rev. Mod. Phys. **79**, 135 (2007).
3. R. Raussendorf and H. J. Briegel, *A one-way quantum computer*, Phys. Rev. Lett. **86**, 5188 (2001).
4. S. Bartolucci et al., *Fusion-based quantum computation*, Nat. Commun. **14**, 912 (2023).
5. S. Slussarenko and G. J. Pryde, *Photonic quantum information processing: A concise review*, Appl. Phys. Rev. **6**, 041303 (2019).
6. J.-S. Wu, *QO Note 6: Beam Splitter and Boson Sampling*, course notes, Sec. 1 (2026).
7. H.-S. Zhong et al., *Quantum computational advantage using photons*, Science **370**, 1460 (2020).
8. Y.-H. Deng et al., *Gaussian boson sampling with pseudo-photon-number-resolving detectors and quantum computational advantage*, Phys. Rev. Lett. **131**, 150601 (2023).
9. L. S. Madsen et al., *Quantum computational advantage with a programmable photonic processor*, Nature **606**, 75 (2022).
10. H. Aghaee Rad et al., *Scaling and networking a modular photonic quantum computer*, Nature **638**, 912 (2025).
11. D. Gottesman, A. Kitaev, and J. Preskill, *Encoding a qubit in an oscillator*, Phys. Rev. A **64**, 012310 (2001).
12. C. Oh, M. Liu, Y. Alexeev, B. Fefferman, and L. Jiang, *Classical algorithm for simulating experimental Gaussian boson sampling*, Nat. Phys. **20**, 1461 (2024).
13. C. Oh, L. Jiang, and B. Fefferman, *Spoofing cross-entropy measure in boson sampling*, Phys. Rev. Lett. **131**, 010401 (2023).
14. K. Azuma, S. E. Economou, D. Elkouss, P. Hilaire, L. Jiang, H.-K. Lo, and I. Tzitrin, *Quantum repeaters: From quantum networks to the quantum internet*, Rev. Mod. Phys. **95**, 045006 (2023).
15. J. Yin et al., *Satellite-based entanglement distribution over 1200 kilometers*, Science **356**, 1140 (2017).
16. M. Pompili et al., *Realization of a multinode quantum network of remote solid-state qubits*, Science **372**, 259 (2021).
17. S. L. N. Hermans et al., *Qubit teleportation between non-neighbouring nodes in a quantum network*, Nature **605**, 663 (2022).
18. S. Wehner, D. Elkouss, and R. Hanson, *Quantum internet: A vision for the road ahead*, Science **362**, eaam9288 (2018).
