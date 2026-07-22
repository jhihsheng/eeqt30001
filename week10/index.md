---
downloads:
  - file: ../assets/week10.pdf
    title: Week 10 講義 PDF（本章）
---

# Quantum Sensing: Limits, Fisher Information, and Nanophotonics

**Week 10**（2026-11-10，3 lecture hours）｜[本章 PDF 講義](../assets/week10.pdf)｜投影片：E3

```{admonition} Learning objectives (Week 10)
:class: note
1. Derive, completely, the shot-noise phase limit of an interferometer: Poisson
   statistics $\to$ error propagation $\to$ $\Delta\phi=1/\sqrt{\langle n\rangle}$;
   distinguish the standard quantum limit ($1/\sqrt N$, statistics) from the
   Heisenberg limit ($1/N$, entanglement), and explain how LIGO injects
   (frequency-dependent) squeezed vacuum at its dark port.
2. Use the quantum Fisher information: state the Cramér--Rao bound (result only),
   derive $F_Q=4(\Delta G)^2$ for pure states, and work the two canonical examples ---
   coherent state $F_Q=4\langle n\rangle$ (SQL) versus N00N state $F_Q=N^2$
   (Heisenberg), including why loss disarms the N00N advantage.
3. Articulate the design thesis of nanophotonic quantum sensing: the generator $G$ is
   set by light--matter coupling, the coupling by the vacuum mode structure, and the
   mode structure by the nanostructure --- so the quantum limit is a *design
   parameter*; map today's frontier (maximum-information states, Fisher-information
   flow) and its open structure-end and emitter-end problems.
```

**Reading:** Degen, Reinhard & Cappellaro, Rev. Mod. Phys. **89**, 035002 (2017),
Secs. I--II and the tables only. Shot-noise pieces: QO_photon_stat (Poisson pages);
QO_note_6, Sec. 2.4.

**Opening puzzle.** LIGO must resolve a strain of order $10^{-21}$: over its 4-km
arms, a length change of $\sim4\times10^{-18}$ m --- roughly $1/400$ of a proton
diameter. Today's lecture asks a single question about that feat: *who sets the
endpoint of measurement precision --- Heisenberg, or statistics?* The answer
(statistics, far more often than you think) is the key that unlocks everything else:
why squeezed light helps, what Fisher information measures, and why the precision
limit itself can be engineered.
