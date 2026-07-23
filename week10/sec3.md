# Nanophotonics: The Limit Is a Design Parameter（第三節）

## From my research to this question

One sentence of history, then only the future. My own work --- topological photonic
lasers, non-Hermitian systems, quantum thermal radiation --- has been one long
variation on a single question: *how does structure rewrite the rules that light and
matter must obey?* This section argues that measurement precision is the next rule to
be rewritten. Two research lines have already proven, classically, that the precision
limit is not a constant of nature but a *contract between the wave and the structure
it lives in*. They optimized the light. What remains --- and what this lab intends to
do --- is to optimize the *structure*, and the *quantum emitters that live inside it*.

The bridge from [Section 2](sec2.md) is Week 7's oldest friend. The QFI is generator
variance, Eq. {eq}`eq-w10-fq`; for an emitter-based sensor the generator is built from
the light--matter coupling; and the coupling is set by the vacuum mode structure at
the emitter --- which is exactly what a cavity redesigns. The Purcell factor
$F_P=\frac{3}{4\pi^2}(\lambda_0/n)^3\,Q/V$ (Purcell 1946) was this course's first
proof that the vacuum is a design material ({numref}`fig-w10-nanobeam`; recall
Week 7's density-of-states figure). Chain the dependencies:

$$
F_Q \;\leftarrow\; \text{coupling } g \;\leftarrow\;
\text{vacuum mode structure} \;\leftarrow\; \text{nanostructure design},
$$ (eq-w10-chain)

and the conclusion reads itself: *the quantum limit is a design parameter.* The dark
line of the unit ends here --- the vacuum is not empty, it is raw material, it
computes, it can be squeezed --- and designing it is nanophotonics' home turf.

```{figure} ../images/nanobeam_stripline_annotated.png
:name: fig-w10-nanobeam
:width: 72%

The kind of object this section is about: a quantum emitter inside a
photonic-crystal nanobeam cavity, whose designed vacuum sets the coupling --- and,
through Eq. {eq}`eq-w10-chain`, the achievable $F_Q$. Microwave striplines drive the
emitter's spin; a fiber collects the photons.
```

## Act I --- two classical lines, each half of the story

**The Zheludev line: topological light as a picometric ruler.** Deeply subwavelength
features of structured light --- superoscillations, phase singularities, optical
skyrmions --- vary faster than any Fourier component of the field, and that steepness
is metrological gold: a natural ruler with tick marks far finer than the wavelength
(Zheludev and Yuan 2022). The "optical ruler" measured nanometric displacements this
way (Yuan and Zheludev 2019), and topologically structured scattering plus deep
learning has since pushed localization to the picometre scale, below thermal
fluctuations --- *picophotonics* (Liu et al. 2023). Half the story: the ruler is
exquisite, but the analysis is classical.

**The Rotter line: Fisher information as an operator.** For any linear scattering
system, ask: which input field extracts the most information about a parameter
$\theta$ buried in the medium? The answer has closed form ([the toy model
below](#sec-w10-toy)): the Fisher information is the expectation value of a Hermitian
operator built from the scattering matrix, and the optimal probe is its top
eigenvector --- the *maximum-information state* (Bouchet, Rotter, and Mosk 2021),
demonstrated to boost precision by an order of magnitude behind a disordered medium.
Two more results give the program its shape: the FI, averaged over scattering
environments, is *invariant* (Horodynski et al. 2021) --- so any enhancement must come
from *design*, never from complexity itself --- and the FI density obeys a
Poynting-like continuity equation: information *flows*, and can be steered by the
medium (Hüpfl et al. 2024). Half the story: the formalism is general, but it optimizes
the light --- the structure is given, usually disordered.

## Act II --- convergence, and the first quantum step

The two lines merged in 2026: a trilogy of joint papers (Rotter--Zheludev and
coworkers) tracks and controls the *flow* of Fisher information in picometric optical
metrology.
<!-- ★ 開課前查核: 2026 FI-flow 三部曲卷期（Southampton publication list:
     "Improving/Revealing topological features of/Controlling Fisher information
     flow in optical metrology"）補全出處後升級為正式引用。 -->
The quantum step has also been taken --- as a tutorial: from $S$ and
$\partial_\theta S$ one can build the quantum operators whose optimization jointly
shapes the spatial profile *and* the quantum state of the probe (Rachbauer et al.
2024). In parallel, quantum light has learned to survive complex media: adaptive
optics with entangled photons now works (Lib and Bromberg 2022; Cameron et al. 2024).
Look at the map, though ({numref}`fig-w10-map`): everything above sits in the
*state-end* column --- given a (usually disordered) structure, optimize what you send
in. The ancestry is distinguished --- multimode squeezed beams beat the SQL for beam
displacement in 2003 (Treps et al. 2003), and a change of measurement basis dissolved
Rayleigh's curse in 2016 (Tsang, Nair, and Lu 2016) --- but it is all the same move:
*optimize the light*.

```{figure} ../images/vacancy_map.svg
:name: fig-w10-map
:width: 76%

The state of the field, as a map. Both classical lines and the quantum first steps
optimize the *light*; the structure-and-emitter column is open. The flag is this
lab's claim.
```

(sec-w10-toy)=
## Act II½ --- the toy model: $F_\theta=\partial_\theta S^\dagger\,\partial_\theta S$

The core of the Rotter program fits on half a page --- classical linear algebra, no
quantum mechanics needed. A linear structure maps incoming mode amplitudes $\mathbf c$
(normalized, $\mathbf c^\dagger\mathbf c=1$) to outgoing ones,
$\mathbf c_{\mathrm{out}}=S(\theta)\,\mathbf c$, where $\theta$ is the parameter to
estimate (a position, a refractive index, a displacement). How strongly does the
output depend on $\theta$?

$$
\left\|\partial_\theta\,\mathbf c_{\mathrm{out}}\right\|^2
=\mathbf c^\dagger\,
\underbrace{\partial_\theta S^\dagger\,\partial_\theta S}_{
\equiv F_\theta}\,
\mathbf c\;=\;\langle F_\theta\rangle_{\mathbf c}\,.
$$ (eq-w10-ftheta)

For shot-noise-limited coherent detection the Fisher information is, up to a
detection prefactor, exactly this expectation value (Bouchet, Rotter, and Mosk 2021).
$F_\theta$ is Hermitian and positive semi-definite, so the best probe is pure
eigen-analysis: *the maximum-information state is the top eigenvector of $F_\theta$*,
and its eigenvalue is the information budget ({numref}`fig-w10-maxinfo`). All of
wavefront-shaping metrology is Eq. {eq}`eq-w10-ftheta` plus hardware. And now the
question this section exists to ask: **what is the quantum version of this eigenvalue
problem --- when the probe is not a wavefront but an emitter inside the structure,
and the object being designed is not $\mathbf c$ but $S$ itself?** Rachbauer et al.
(2024) is the first step --- and it still optimizes the state.

```{figure} ../images/maxinfo_state.svg
:name: fig-w10-maxinfo
:width: 74%

The toy model, Eq. {eq}`eq-w10-ftheta` (after Bouchet, Rotter, and Mosk 2021). A
plane wave wastes most of its light on modes that never touch the parameter
$\theta$; the top eigenvector of $F_\theta$ funnels everything onto it.
```

## Act III --- the manifesto, and three thesis seeds

Here is the claim. LDOS and Purcell enhancement have a mature theory of *physical
upper bounds* --- given a material and a volume, how large can the response be (Chao
et al. 2022). For the quantum Fisher information **no such bound theory exists**.
Nobody knows how much $F_Q$ a cubic wavelength of silicon can buy. At the same time,
$F_\theta$ hands inverse design（反向設計）a ready-made objective function ---
maximize the top eigenvalue of Eq. {eq}`eq-w10-ftheta` over *structures*, not states.
(One adjacent debate already proved the stakes: exceptional-point sensors show
diverging *response*, yet QFI analysis found the noise diverges in step --- classical
response is not quantum estimability, and QFI is the final judge (Wiersig 2014; Lau
and Clerk 2018); extending that verdict to engineered nanophotonic environments is a
sister problem to the seeds below.) Three concrete openings, each sized for a
master's thesis:

1. **Inverse design for QFI --- the structure-end dual problem** (numerical + theory;
   FMQA pipeline). The tutorial solved "given the structure, optimize the state." The
   dual --- *given the estimation target, optimize the nanostructure* --- is
   unclaimed: use the top eigenvalue of $F_\theta$ (classical warm-up, then QFI) as
   the objective of topology optimization, and ask whether a Chao-type upper bound
   exists for it (Chao et al. 2022; Bouchet, Rotter, and Mosk 2021).
2. **Quantum rulers on topological light textures** (theory + numerics). Displacement
   and rotation estimation in superoscillatory, singular, and skyrmionic fields:
   where does quantum light beat the classical FI of the picometric rulers (Yuan and
   Zheludev 2019; Liu et al. 2023), in the lineage of multimode quantum metrology
   (Treps et al. 2003; Tsang, Nair, and Lu 2016)?
3. **Generator engineering with embedded emitters** (theory + numerics). The entire
   program above probes with *injected* light. Move the probe *inside*: for an
   emitter embedded in the structure, the generator $G$ of Eq. {eq}`eq-w10-fq` is
   dictated by the vector LDOS, transverse spin, and chiral coupling of the local
   modes (Lodahl et al. 2017) --- the state-end-to-emitter-end shift of the whole
   field, and this lab's home advantage.
   <!-- 種子錨點（preprint，僅方向性參考，不作數值出處）：
        arXiv:2512.14463（波導 QED 集體 QFI）、arXiv:2605.29724（SSH 拓撲浴
        保護相位估計）、arXiv:2512.14899（共振感測器極限由相位產生子而非 Q 決定） -->

None of these has a literature to review yet --- that is the point. The groups that
proved "the limit is a contract" still negotiate on behalf of the light; someone will
negotiate for the structure, and for the emitters inside it. Join now, and you are not
entering a field; you are founding one.

````{exercise} In-class discussion 3
:label: exer-w10-limit

If the coupling --- and therefore $F_Q$ --- can be designed, is the "quantum limit"
still a limit?
````

```{solution} exer-w10-limit
:label: solu-w10-limit
:class: dropdown

Open question, on purpose. The SQL fell to squeezing; the Heisenberg limit is a
statement about $(\Delta G)^2$ at fixed resources --- but who fixes the resources
when the generator itself is designable? --- the doorway to the seeds above.
```

```{important}
**Summary — Section 3.**
$F_Q$ traces back through the coupling to the vacuum mode structure --- which
nanophotonics designs, Eq. {eq}`eq-w10-chain`; Purcell was the prototype. Classically
the case is closed: picometric rulers (Zheludev) and the eigenvalue problem
$F_\theta=\partial_\theta S^\dagger\partial_\theta S$ (Rotter), with information flow
steerable and enhancement provably a matter of design, not complexity. Everything so
far optimizes the light; the structure end (QFI-targeted inverse design, unknown
upper bounds) and the emitter end (generator engineering) are open --- the three
thesis seeds live exactly there.
```

## References（Week 10）

1. C. M. Caves, *Quantum-mechanical noise in an interferometer*, Phys. Rev. D **23**, 1693 (1981).
2. The LIGO Scientific Collaboration, *Enhanced sensitivity of the LIGO gravitational wave detector by using squeezed states of light*, Nat. Photon. **7**, 613 (2013).
3. M. Tse et al., *Quantum-enhanced Advanced LIGO detectors in the era of gravitational-wave astronomy*, Phys. Rev. Lett. **123**, 231107 (2019).
4. D. Ganapathy et al. (LIGO O4 Detector Collaboration), *Broadband quantum enhancement of the LIGO detectors with frequency-dependent squeezing*, Phys. Rev. X **13**, 041021 (2023).
5. S. L. Braunstein and C. M. Caves, *Statistical distance and the geometry of quantum states*, Phys. Rev. Lett. **72**, 3439 (1994).
6. C. L. Degen, F. Reinhard, and P. Cappellaro, *Quantum sensing*, Rev. Mod. Phys. **89**, 035002 (2017).
7. E. M. Purcell, *Spontaneous emission probabilities at radio frequencies*, Phys. Rev. **69**, 681 (1946).
8. N. I. Zheludev and G. Yuan, *Optical superoscillation technologies beyond the diffraction limit*, Nat. Rev. Phys. **4**, 16 (2022).
9. G. H. Yuan and N. I. Zheludev, *Detecting nanometric displacements with optical ruler metrology*, Science **364**, 771 (2019).
10. T. Liu et al., *Picophotonic localization metrology beyond thermal fluctuations*, Nat. Mater. **22**, 844 (2023).
11. D. Bouchet, S. Rotter, and A. P. Mosk, *Maximum information states for coherent scattering measurements*, Nat. Phys. **17**, 564 (2021).
12. M. Horodynski, D. Bouchet, M. Kühmayer, and S. Rotter, *Invariance property of the Fisher information in scattering media*, Phys. Rev. Lett. **127**, 233201 (2021).
13. J. Hüpfl et al., *Continuity equation for the flow of Fisher information in wave scattering*, Nat. Phys. **20**, 1294 (2024).
14. L. M. Rachbauer, D. Bouchet, U. Leonhardt, and S. Rotter, *How to find optimal quantum states for optical micromanipulation and metrology in complex scattering problems: tutorial*, J. Opt. Soc. Am. B **41**, 2122 (2024).
15. O. Lib and Y. Bromberg, *Quantum light in complex media and its applications*, Nat. Phys. **18**, 986 (2022).
16. P. Cameron et al., *Adaptive optical imaging with entangled photons*, Science **383**, 1142 (2024).
17. N. Treps et al., *A quantum laser pointer*, Science **301**, 940 (2003).
18. M. Tsang, R. Nair, and X.-M. Lu, *Quantum theory of superresolution for two incoherent optical point sources*, Phys. Rev. X **6**, 031033 (2016).
19. P. Lodahl et al., *Chiral quantum optics*, Nature **541**, 473 (2017).
20. P. Chao, B. Strekha, R. Kuate Defo, S. Molesky, and A. W. Rodriguez, *Physical limits in electromagnetism*, Nat. Rev. Phys. **4**, 543 (2022).
21. J. Wiersig, *Enhancing the sensitivity of frequency and energy splitting detection by using exceptional points*, Phys. Rev. Lett. **112**, 203901 (2014); experiments: W. Chen et al., Nature **548**, 192 (2017); H. Hodaei et al., Nature **548**, 187 (2017).
22. H.-K. Lau and A. A. Clerk, *Fundamental limits and non-reciprocal approaches in non-Hermitian quantum sensing*, Nat. Commun. **9**, 4320 (2018); W. Langbein, Phys. Rev. A **98**, 023805 (2018); M. Zhang et al., Phys. Rev. Lett. **123**, 180501 (2019).
