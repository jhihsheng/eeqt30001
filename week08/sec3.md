---
exports:
  - format: typst
    id: w08sec3-pdf
    output: exports/week08-sec3.pdf
downloads:
  - id: w08sec3-pdf
    title: 本頁 PDF
---

# Quantum Communication: You Cannot Copy a Qubit（第三節）

## No-cloning in two lines

Suppose a machine could copy an *unknown* quantum state: a unitary $U$ with
$U|\psi\rangle|0\rangle=|\psi\rangle|\psi\rangle$ for every $|\psi\rangle$. Apply it to
two states $|\psi\rangle,|\phi\rangle$ and take the inner product of the two equations.
Unitarity preserves inner products, so

$$
\langle\psi|\phi\rangle=\langle\psi|\phi\rangle^{2}
\quad\Rightarrow\quad
\langle\psi|\phi\rangle\in\{0,1\} :
$$ (eq-w8-nocloning)

the machine can at best copy one fixed *orthogonal* set of states (that is just
classical copying). No device can clone arbitrary, non-orthogonal quantum states. That
is the whole proof --- and it has teeth. An eavesdropper cannot copy a qubit in flight
and forward the original untouched; and since amplification is cloning, there is no
quantum repeater-by-amplifier: extending quantum links beyond fiber attenuation
requires entanglement swapping and quantum memories (Week 9).

````{exercise} In-class discussion 3
:label: exer-w8-copy

Why exactly can an eavesdropper not copy a quantum state and resend it?
````

```{solution} exer-w8-copy
:label: solu-w8-copy
:class: dropdown

Copying an unknown state outright is forbidden by Eq. {eq}`eq-w8-nocloning`; the only
alternative is to *measure* first, but a measurement in the wrong basis disturbs the
state, and the disturbance shows up downstream as errors --- which is precisely what
BB84 exploits.
```

## BB84: a key whose security is a law of physics

Bennett and Brassard (1984) turned no-cloning into a protocol. Alice encodes random
bits in randomly chosen polarization bases: rectilinear $Z=\{|H\rangle,|V\rangle\}$ or
diagonal $X=\{|D\rangle,|A\rangle\}$ ($45^{\circ}/135^{\circ}$). Bob measures each
photon in his own random basis. Over a public channel they then reveal *bases only* and
keep the ~half of the bits where the bases agree (*sifting*); a random subsample of the
sifted key is sacrificed to estimate the error rate.

Why is eavesdropping visible? Take the simplest attack: Eve intercepts every photon,
measures in a randomly guessed basis, and resends what she found
({numref}`fig-w8-bb84`). With probability $\tfrac12$ she guesses right --- the state is
undisturbed. With probability $\tfrac12$ she guesses wrong; she resends a photon in the
wrong basis, and even when Bob's basis matches Alice's, his outcome is random: error
probability $\tfrac12$. The sifted-key error rate is therefore

$$
\mathrm{QBER}=\frac{1}{2}\times0+\frac{1}{2}\times\frac{1}{2}=25\% ,
$$ (eq-w8-qber)

a smoking gun far above any realistic channel noise. Alice and Bob abort; Eve gains a
key that is never used. (Practical systems use attenuated laser pulses rather than true
single photons --- recall Week 7: an attenuated laser is *not* a single-photon source
--- and defeat photon-number-splitting attacks with decoy states.)

```{figure} ../images/bb84_intercept.svg
:name: fig-w8-bb84
:width: 80%

Intercept--resend attack on BB84. Eve's basis guess is right half the time (no
disturbance) and wrong half the time (Bob's sifted bit is random), producing a $25\%$
error rate in the sifted key, Eq. {eq}`eq-w8-qber`.
```

## CV-QKD: keys from coherent states

BB84 lives in the DV language. Its CV twin needs no single-photon detector at all:
Alice sends *coherent states* displaced by Gaussian-distributed amounts in the
quadratures $(X,P)$ of Week 7, and Bob measures a quadrature with a homodyne detector
--- a beam splitter, a strong local-oscillator laser, and two ordinary photodiodes
(Grosshans--Grangier 2002). Security again rests on the impossibility of copying:
non-orthogonal coherent states cannot be cloned, and the uncertainty relation
$\Delta X\,\Delta P\ge\frac12$ forces any interception to add measurable noise to the
quadrature data. The attraction is engineering: CV-QKD runs on standard telecom lasers
and detectors at room temperature and coexists with classical traffic in the same
fiber; the price is heavier classical post-processing and shorter reach than the best
DV links (Usenko et al. 2026). (Homodyne detection returns, at full strength, in
Week 10 --- it is how LIGO reads out a squeezed vacuum.)

## Teleportation: moving a state without moving a particle

Can Alice send Bob an *unknown* qubit $|\psi\rangle$ without physically transmitting it
--- and without violating no-cloning? Yes, if they share one entangled pair in advance
(Bennett et al. 1993). Writing Alice's two particles (the unknown qubit and her half of
the pair) in the basis of the four maximally entangled *Bell states*, the joint state
rearranges identically into

$$
|\psi\rangle_1|\Phi^{+}\rangle_{23}
=\frac{1}{2}\sum_{k=0}^{3}
|\mathrm{Bell}_k\rangle_{12}\;\bigl(\sigma_k|\psi\rangle_3\bigr),
$$ (eq-w8-teleport)

where $\sigma_k$ are the identity and the three Pauli operators. Alice performs a
*Bell-state measurement* (BSM) on particles 1 and 2 and phones Bob the two-bit result
$k$; Bob applies $\sigma_k^{-1}$ and holds a perfect $|\psi\rangle$. Note the
bookkeeping: Alice's measurement destroys her copy (no-cloning is honored), the two
classical bits carry no information about $|\psi\rangle$ by themselves, and nothing
travels faster than light: by the *no-communication theorem*, no local operation of
Alice's can change Bob's reduced density matrix, which stays maximally mixed until the
classical message arrives. With photons, the BSM is built from
[Section 1](sec1.md) hardware: the two photons interfere on a $50{:}50$ beam splitter,
and HOM logic distinguishes two of the four Bell states --- a linear-optics BSM
therefore succeeds at most half the time. Bouwmeester et al. demonstrated photonic
teleportation in 1997; teleportation of entanglement itself (*entanglement swapping*)
is the elementary step of the quantum repeaters and networks of Week 9.

## Coda: what Bell actually constrains

Bell's theorem is often summarized as "quantum mechanics is weird". That undersells it.
The inequality $|S|\le2$ was derived without quantum mechanics; it binds *every* theory
in which outcomes are predetermined locally. The experiments say nature violates it.
**Bell's theorem constrains not quantum mechanics but all of local realism --- whatever
physics comes after quantum theory, the world it describes will remain nonlocally
correlated.** The same correlations that troubled Einstein are now infrastructure: they
certify secret keys, teleport states, and --- next week --- link quantum processors
into networks.

```{important}
**Summary — Section 3.**
Unitarity forbids copying unknown quantum states, Eq. {eq}`eq-w8-nocloning`. BB84 turns
that prohibition into key distribution: intercept--resend leaves a $25\%$ sifted-key
error rate, Eq. {eq}`eq-w8-qber`. CV-QKD does the same with coherent states, Gaussian
modulation, and homodyne readout on telecom hardware. Teleportation transfers an
unknown state using one shared entangled pair, a Bell-state measurement (a beam
splitter plus HOM interference, success $\le50\%$ with linear optics), and two
classical bits --- destroying the original, respecting relativity, and providing the
primitive behind entanglement swapping and quantum repeaters.
```

## References（Week 8）

1. J. S. Bell, *On the Einstein Podolsky Rosen paradox*, Physics Physique Fizika **1**, 195 (1964).
2. C. K. Hong, Z. Y. Ou, and L. Mandel, *Measurement of subpicosecond time intervals between two photons by interference*, Phys. Rev. Lett. **59**, 2044 (1987).
3. P. G. Kwiat, K. Mattle, H. Weinfurter, A. Zeilinger, A. V. Sergienko, and Y. Shih, *New high-intensity source of polarization-entangled photon pairs*, Phys. Rev. Lett. **75**, 4337 (1995).
4. J. F. Clauser, M. A. Horne, A. Shimony, and R. A. Holt, *Proposed experiment to test local hidden-variable theories*, Phys. Rev. Lett. **23**, 880 (1969).
5. A. Aspect, J. Dalibard, and G. Roger, *Experimental test of Bell's inequalities using time-varying analyzers*, Phys. Rev. Lett. **49**, 1804 (1982).
6. B. Hensen et al., *Loophole-free Bell inequality violation using electron spins separated by 1.3 kilometres*, Nature **526**, 682 (2015).
7. C. H. Bennett and G. Brassard, *Quantum cryptography: public key distribution and coin tossing*, in Proc. IEEE Int. Conf. on Computers, Systems and Signal Processing (Bangalore, 1984), p. 175; reprinted in Theor. Comput. Sci. **560**, 7 (2014).
8. F. Grosshans and P. Grangier, *Continuous variable quantum cryptography using coherent states*, Phys. Rev. Lett. **88**, 057902 (2002).
9. V. C. Usenko et al., *Continuous-variable quantum communication*, Rev. Mod. Phys. **98**, 015003 (2026).
10. C. H. Bennett, G. Brassard, C. Crépeau, R. Jozsa, A. Peres, and W. K. Wootters, *Teleporting an unknown quantum state via dual classical and Einstein--Podolsky--Rosen channels*, Phys. Rev. Lett. **70**, 1895 (1993).
11. D. Bouwmeester, J.-W. Pan, K. Mattle, M. Eibl, H. Weinfurter, and A. Zeilinger, *Experimental quantum teleportation*, Nature **390**, 575 (1997).
12. C. Gerry and P. Knight, *Introductory Quantum Optics* (Cambridge University Press, 2005), Ch. 6.
