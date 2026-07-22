# Cavity QED: Redesigning the Vacuum（第三節）

## The Jaynes–Cummings model in one page

Put a two-level atom ($|E_{v}\rangle,|E_{c}\rangle$, splitting $\hbar\omega_{cv}$) in a
cavity supporting a single mode of frequency $\omega$. With the rotating-wave
approximation, light–matter interaction reduces to the Jaynes–Cummings Hamiltonian
(QO_note_4, Sec. 4)

$$
\mathcal{H}_{\mathrm{JC}}
=\hbar\omega\,a^{\dagger}a+\frac{\hbar\omega_{cv}}{2}\sigma_{z}
 +\hbar\lambda\bigl(\sigma_{+}a+\sigma_{-}a^{\dagger}\bigr),
$$ (eq-w7-jc)

where $\lambda$ is the coupling rate set by the dipole moment and the mode's vacuum field.
Because the excitation number is conserved, the dynamics splits into $2\times2$ blocks
$\{|E_{c}\rangle|n\rangle,\;|E_{v}\rangle|n+1\rangle\}$: the atom and the cavity
coherently swap one quantum at the Rabi frequency
$2\lambda\sqrt{n+1}$ (on resonance). The eigenstates --- *dressed states* --- are
split by $2\hbar\lambda\sqrt{n+1}$.

The striking case is $n=0$: even with *no photon in the cavity*, the excited atom
oscillates, $|E_{c}\rangle|0\rangle\leftrightarrow|E_{v}\rangle|1\rangle$ --- the
*vacuum Rabi oscillation* ({numref}`fig-w7-jc`). The "empty" cavity is not empty;
its zero-point field drives the atom. (With a coherent drive the oscillations collapse
and revive --- see QO_note_4, Sec. 4.3, for this beautiful signature of field
quantization.)

```{figure} ../images/jc_rabi.svg
:name: fig-w7-jc
:width: 92%

Jaynes–Cummings Rabi oscillations, $P_e(t)=\cos^{2}\!\bigl(\lambda\sqrt{n+1}\,t\bigr)$,
for $n=0$ (vacuum) and $n=2$; the oscillation persists at $n=0$.
```

## Spontaneous emission and the Purcell effect

Fermi's golden rule says the emission rate of an excited atom is proportional to the
density of final photon states at its transition frequency
(QO_note_4, Sec. 2.2):

$$
W=\frac{\pi}{2\hbar^{2}}\,\bigl|\langle c|\mathcal H_{I}|v\rangle\bigr|^{2}\,
\rho(\omega)\,\hbar
\;\;\Longrightarrow\;\;
W_{\mathrm{free}}=\frac{\omega^{3}|d_{cv}|^{2}}{3\pi\epsilon_{0}\hbar c^{3}} ,
$$

where the free-space result uses the vacuum density of modes
$g(\omega)=\omega^{2}/\pi^{2}c^{3}$ (QO_note_2, Sec. 3.1). Read this formula the other
way around: *spontaneous emission is not a property of the atom alone*. It is
stimulated by the vacuum fluctuations of the modes around the atom --- so if you change
the modes, you change the rate. A cavity of quality factor $Q$ and mode volume $V$
concentrates the vacuum field at its resonance; the emission rate is enhanced by the
Purcell factor (Purcell, 1946; result only)

$$
F_{P}=\frac{W_{\mathrm{cav}}}{W_{\mathrm{free}}}
     =\frac{3}{4\pi^{2}}\Bigl(\frac{\lambda_{0}}{n}\Bigr)^{3}\frac{Q}{V},
$$ (eq-w7-purcell)

for an emitter on resonance and at the field maximum. Detuned from the cavity, emission is
*suppressed* instead. **Change the structure of the vacuum, and you change the
atom's fate.** Keep Eq. {eq}`eq-w7-purcell` in mind: in Week 10 we will see that
nanophotonics is precisely the engineering of $Q/V$ --- of the vacuum itself --- and that
this turns quantum-sensing limits into design parameters.

````{exercise} In-class discussion 3
:label: exer-w7-cavity

An atom is placed in a resonant cavity. Which of its properties change?
````

```{solution} exer-w7-cavity
:label: solu-w7-cavity
:class: dropdown

Its emission rate (faster on resonance, slower off resonance),
its emission direction (into the cavity mode), and even its energy levels (dressed-state
splitting). The vacuum has been redesigned around it.
```

## Detecting one photon: the SNSPD

Certifying $g^{(2)}(0)\approx0$ requires detectors that click on a single photon.
Photomultipliers (PMTs) and avalanche photodiodes (SPADs) do this with quantum
efficiencies of order $10$–$70\%$ and nanosecond timing. The current workhorse of quantum
optics is the *superconducting nanowire single-photon detector* (SNSPD): a
$\sim\!100$-nm-wide superconducting wire (NbN, NbTiN, or WSi), cooled below its critical
temperature ($\sim$1–4 K) and biased just below its critical current. One absorbed photon
creates a local hotspot, the wire momentarily turns resistive, and a voltage pulse marks
the arrival time. State-of-the-art SNSPDs combine system detection efficiency above
$90\%$ --- the record is $98.0\pm0.5\%$ at 1550 nm (Reddy et al. 2020) --- with dark-count
rates that can be pushed below 1 Hz (milli-Hz demonstrated) and timing jitter down to
$2.6$–$4.3$ ps (Korzh et al. 2020). Every experiment in Weeks 8–9 --- QKD, Bell tests,
boson sampling --- stands on these detectors.

## Coda: Glauber's photon

Roy Glauber received the 2005 Nobel Prize for the quantum theory of optical coherence ---
the theory behind $g^{(1)}$, $g^{(2)}$, and the coherent states used throughout this week.
His central insight is the one we started from: light is described by quantum states of
*modes*, and a photon is nothing more (and nothing less) than a single excitation of
one of them. **Modes first; photons second.** Next week we take two photons at a
time and let them interfere.

```{important}
**Summary — Section 3.**
JC physics: atom + cavity mode swap one quantum at rate $2\lambda\sqrt{n+1}$; vacuum Rabi
oscillations exist at $n=0$. Spontaneous emission $\propto$ density of vacuum modes
$\Rightarrow$ Purcell factor $F_{P}=\frac{3}{4\pi^{2}}(\lambda_{0}/n)^{3}Q/V$: the vacuum
is designable. SNSPDs (superconducting nanowires) detect single photons with
$>90\%$ efficiency and ps jitter, enabling all the quantum optics that follows.
```

## References（Week 7）

1. H. J. Kimble, M. Dagenais, and L. Mandel, *Photon antibunching in resonance fluorescence*, Phys. Rev. Lett. **39**, 691 (1977).
2. E. M. Purcell, *Spontaneous emission probabilities at radio frequencies*, Phys. Rev. **69**, 681 (1946).
3. M. D. Eisaman, J. Fan, A. Migdall, and S. V. Polyakov, *Invited Review: Single-photon sources and detectors*, Rev. Sci. Instrum. **82**, 071101 (2011).
4. P. Senellart, G. Solomon, and A. White, *High-performance semiconductor quantum-dot single-photon sources*, Nat. Nanotechnol. **12**, 1026 (2017).
5. D. V. Reddy, R. R. Nerem, S. W. Nam, R. P. Mirin, and V. B. Verma, *Superconducting nanowire single-photon detectors with 98% system detection efficiency at 1550 nm*, Optica **7**, 1649 (2020).
6. B. Korzh *et al.*, *Demonstration of sub-3 ps temporal resolution with a superconducting nanowire single-photon detector*, Nat. Photonics **14**, 250 (2020).
7. M. Fox, *Quantum Optics: An Introduction*, Oxford University Press (2006), Ch. 5–7.
8. C. Gerry and P. Knight, *Introductory Quantum Optics*, Cambridge University Press (2005).
