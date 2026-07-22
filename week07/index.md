---
exports:
  - format: typst
---

# Quantum States of Light: The DV and CV Languages

**Week 7**（2026-10-20，3 lecture hours）｜[本章 PDF 講義](../assets/week07.pdf)｜投影片：E3

```{admonition} Learning objectives (Week 7)
:class: note
1. Explain why each electromagnetic mode is quantized as a harmonic oscillator, and use $[a,a^{\dagger}]=1$ to compute properties of Fock, coherent, and squeezed states.
2. Draw vacuum, coherent, and squeezed states in phase space, and state the two encodings of light-based qubits (DV vs. CV).
3. Classify a light source from $g^{(2)}(0)$ (thermal 2 / coherent 1 / single photon 0) and explain why antibunching --- not the photoelectric effect --- proves the photon.
4. Describe how a cavity redesigns the vacuum (Jaynes--Cummings physics, the Purcell effect) and how an SNSPD detects a single photon.
```

**Reading:** Fox, *Quantum Optics*, Ch. 5–7. Full derivations: QO_note_2, 3, 5, and 4.

**Opening puzzle.** Textbooks say the photoelectric effect proved that light is made of
photons. It did not: a *semiclassical* theory --- quantized atoms driven by a purely
classical field --- reproduces every feature of the photoelectric effect, including the
frequency threshold. The experiment that actually certified the photon came seventy years
after Einstein: photon *antibunching*, observed in 1977 (Kimble, Dagenais, and Mandel).
This week builds the language needed to appreciate how much work it takes to prove that
light arrives "one at a time", and what non-classical light is good for.
