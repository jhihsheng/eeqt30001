---
downloads:
  - file: ../assets/week09.pdf
    title: Week 9 講義 PDF（本章）
---

# Photonic Quantum Computing Platforms and Quantum Networks

**Week 9**（2026-11-03，3 lecture hours）｜[本章 PDF 講義](../assets/week09.pdf)｜投影片：E3

```{admonition} Learning objectives (Week 9)
:class: note
1. Draw up the photonic qubit's balance sheet --- why photons barely decohere and
   barely interact (Maxwell linearity) --- and explain how KLM turns *measurement* into
   an effective nonlinearity: probabilistic heralded gates, and the cluster-state
   (MBQC) and fusion-based architectures built on that idea.
2. Explain Gaussian boson sampling as "computing with squeezed vacuum": why sampling
   the output of a linear interferometer is classically hard (hafnian), recount the
   Jiuzhang--Borealis--Aurora milestones, and distinguish quantum *advantage* from
   quantum *usefulness*.
3. Explain why fiber loss plus no-cloning rules out amplifiers and forces the
   quantum-repeater architecture (segment entanglement + swapping + memories), and
   place today's demonstrations --- Micius, Delft, metro-fiber networks --- on that
   roadmap.
```

**Reading:** Kok et al., Rev. Mod. Phys. **79**, 135 (2007), Secs. I--II;
Slussarenko & Pryde, Appl. Phys. Rev. **6**, 041303 (2019). GBS context: QO_note_6,
Sec. 1. Networks: Azuma et al., Rev. Mod. Phys. **95**, 045006 (2023), Sec. I.

**Opening puzzle.** The photon is the best qubit anyone has ever found: it does not
decohere, it moves at the speed of light, and it works at room temperature --- all
because it interacts with almost nothing. But wait. Computation *requires* interaction:
a two-qubit gate is precisely one qubit changing another. How do you compute with a
particle that does not talk to anything? This week gives the field's three answers:
steal the interaction from measurement ([Section 1](sec1.md)), pick a problem where
passive interference is already enough ([Section 2](sec2.md)), and embrace the
non-interaction --- if the photon talks to nothing, nothing can stop it from carrying
quantum states across a city or up to a satellite ([Section 3](sec3.md)).
