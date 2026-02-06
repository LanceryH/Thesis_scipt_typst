#import "@preview/muchpdf:0.1.1": *

//comment it again!
// another comment !

= Optimal photometric geometries <chapter1>

== Remote sensing

To enlight the reader on the remote sensing question treated in this chapter, the subject needs to be well introduced.
When light reflects on a surface, what can we learn from its scattering properties and why it behaves in such a way. 


== Mission context and objectives

#linebreak()

#figure(image("../../src/figures/AG15-M-2611.jpg", width: 50%), caption: [Schroter's Valley with meandering subrille, Mapping Camera Frame from Apollo 15 LRO#footnote[Lunar Reconnaissance Orbiter] (A15-M-2611) (Credit: NASA)])



=== Generalities

The Moon is the only natural satellite of Earth and has a distance of $384,400 "km"$ from it.
It also completes one orbital revolution in approximately $27.3$ days, resulting in a synchronous rotation that keeps the same Moon's hemisphere facing Earth @murray_solar_2012.
It has a mean radius of $1,737 "km"$, the Moon is approximately $3.7$ times smaller than Earth.
The lunar body has an average density of $3.34 " g.cm"^(-3)$ and a gravity of $1.62 " m.s"^(-2)$, which is almost $0.17$ times what we can experience on Earth @wieczorek_constitution_2006.
These fundamental characteristics directly influence lunar surface reflectance and photometric observations, observed from an observatory or space.

=== Moon’s surface properties <sec:surface_prop>

The Moon's surface has many very distinct morphological characteristics that play a crucial role in photometry.
These microtexture properties influence how light interacts with the surface, and perhaps are responsible for certain reflectance behaviour @hapke_theory_2012.
The lunar surface is characterized by two primary terrain types: the highlands, mostly composed of anorthositic rocks #footnote[Lunar anorthosites constitute the light-colored areas of the Moon's surface] with relatively high albedo, and the maria, extensive basaltic plains #footnote[Lunar maria are plains of flood-basaltic lava flows that formed during the Moon's early volcanic history] with significantly lower albedo @jolliff_major_2000.
This great dichotomy in surface composition creates distinct photometric signatures that are even visible to the naked eye.
In photometry, these properties are essential for modeling the interaction of light with the surface.
One key parameter is the bidirectional reflectance distribution function BRDF #footnote[Bidirectional Reflectance Distribution Function], which describes how light is reflected from the microtexture parameters, the illumination and viewing angles.
The BRDF is critical for interpreting remote sensing data, mapping compositional variations, and understanding the geological history of the Moon.
Accurate photometric analysis should also support exploration planning such as the  ARTEMIS #footnote[https://www.nasa.gov/humans-in-space/artemis/] mission and the identification of regions with potential ice deposits like the LCROSS #footnote[https://science.nasa.gov/mission/lcross/] mission.

=== Objectives

The main goal of my work has been to compare and study different mission geometry.
By looking at which geometry is the best one to characterize photometric properties, we aim to ensure the best scientific return of the mission.
The conception of geometries with various emergence points of view, target positions and light incidences allow to simulate many different mission design and therefore see the full spectrum of possibility to find which one of them gives in output robust and reliable reflectance data.
This evaluation is critical to improve the precision of future photometric models, advancing our understanding of the Moon’s surface, and supporting future exploration missions.

=== ESA Máni mission

The Máni #footnote[https://activities.esa.int/4000146824] mission is part of a recent program established by ESA #footnote[European Space Agency] to support and provide access to space missions for smaller countries.
This chapter of the thesis was developed during the mission's pre-phase A #footnote[https://www.esa.int/Science_Exploration/Space_Science/How_a_mission_is_chosen] stage, offering an opportunity for direct discussions and great returns from the scientific team on the mission requirements.
The scientific ambition is to make the first lunar mission that combines great geometry diversity and high-resolution photometry.
For ths purpose the satellite will use a multiple-pass polar orbit strategy, flying at an altitude of $50 "km"$.
This orbital configuration is specially designed for high-resolution observations ($20 "cm/pix"$) and repeated measurements across a variety of lunar terrains.
The satellite orbit has a precession of $1.03^°$ and therefore a revisit period over the same target of 2 weeks.
As a result, the estimated illumination angle shift at revisit is approximately $10^°$.

== Creation of multiples orbital geometry

=== Definition of the geometric parameters

As previously mentioned with Màni, the satellite will conduct orbital revisits over the same target to gather photometric data with various geometry (incidence and emergence angles).
For the sake of this section study, the Moon's surface was assumed as a perfect sphere, without slope.
The left side of the @fig:geometry explains the geometry through a global view.
Here, the yellow star symbol (L, for light source) represents the sub-solar point of the Sun on the surface, while the green symbol (O, for observer) represents the observer point, which is the location of the satellite and the r^°e symbol (T, for target) shows the target position.
The right side of the image provides a more detailed, localized view of the target area on the Moon’s surface, indicated by the point (T).
Here, the orientation of the normal vector $arrow(n)$ to the surface is highlighted, along with several critical angles that are essential to the photometric analysis.

- _The incidence_: ($theta_0$) angle $(arrow(n) and arrow(s))$ is the angle between the normal vector $arrow(n)$ to the surface and the incoming sunlight.
- _The emergence_: ($theta$) angle $(arrow(n) and arrow(o))$ is the angle between $arrow(n)$ and the line of sight from the satellite.
- _The phase_: ($alpha$) angle $(arrow(n) and arrow(o))$ is the angle between the direction of the incoming sunlight and the observer's line of sight.
- _The relative azimuth_: ($psi$) angle $(arrow(n) and arrow(o))$ angle defined the orientation of the satellite's view relative to the local coordinate frame on the surface.

#figure(muchpdf(read("../../src/figures/geometry.pdf", encoding: none), width: 70%), caption: [Graph representing the system coordinates and geometries used for a given scenario, the left figure represents the global configuration view with the incidence, emergence angles and the Target in red, Light in yellow and Observer in green.
The right figure represents a zoom on the normal plan from the target normal vector $arrow(n)$ with the azimuth and phase angle. #link("https://docs.google.com/drawings/d/1hpC9SLsUaUZKa5-RBPgyfpslKtOPO6_Vy2FW3yYu_8g/edit?usp=sharing")[link]]) <fig:geometry>

We created many geometries with diversified Targets across the equator, medium, and high latitudes and illumination angles to evaluate later its impact on the inversion of the reflectance to predict photometric parameters.
Therefore, to cover all possibility we made the following 15 geometries dataset.

#figure(muchpdf(read("../../src/figures/graph_geometry_5.pdf", encoding: none), width: 100%), caption: [Graph representing the satellite observations on its orbit passing over the target with a maximum emergence of 80^°. In total 5 shots are taken, 2 from the maximum emergence angles close to 80^° above and under the target latitude, 1 at nadir and 2 at an equal distance from the nadir and maximum emergence angle shot. #link("https://docs.google.com/drawings/d/1pMKtEysEfPuSP74IcIHZB0SBHWsDDLaB4pz5DWTDQ2M/edit?usp=sharing")[link]]) <fig:geometry_5>

The @fig:geometry_5 showcase how we constraint the emergence angle.
the satellite has a polar orbit at longitude $0^°$ going from $-180^°$ to $180^°$ of latitude and we only retains 5 observations for a target within the emergence range of $80^°$.
In total 5 shots are taken, 2 from the maximum emergence angles close to 80^° above and under the target latitude, 1 at nadir and 2 at an equal distance from the nadir and maximum emergence angle shot.
For this scenario, the subsolar point $L$ in yellow, was placed at a high longitude on the equator, to simulate the illumination coming from forward.
To make it more concise for the lecturer, the following  @fig:geometry_type1, @fig:geometry_type2, @fig:geometry_type3,  @fig:geometry_type4 and @fig:geometry_type5 each represents 3 geometries that has a similar illumination and emergence angle but with different Target points $T$ in red, magenta and purple that are spread out on the equator, medium, and high latitude respectively.
They represents 3x5 different geometries, later called E1, M1, H1 and E2, M2, H2 etc.

#figure(muchpdf(read("../../src/figures/geometry_type1.pdf", encoding: none), width: 80%), caption: [Graph representing 3 different mission geometry E1, M1 and H1 with Targets respectively at $(0^° "N", 5^° "E")$, $(45^° "N", 5^° "E")$ and $(70^° "N", 10^° "E")$ with an illumination coming from forward.
The Observer orbit is supposed fixed at $0^°$ of longitude, allowing the Target longitude to act has the emergence angle variation (which greatly simplify the simulation). #link("https://docs.google.com/drawings/d/1btyvu2H3pB84CQWUYd2VREAnj92nUQWgHdGVRuOX7xw/edit?usp=sharing")[link]]) <fig:geometry_type1>

#figure(muchpdf(read("../../src/figures/geometry_type2.pdf", encoding: none), width: 80%), caption: [Graph representing 3 different mission geometry E2, M2 and H2 with Targets respectively at ($0^° "N", 5^° "E"$), ($45^° "N", 5^° "E"$) and ($70^° "N", 10^° "E"$) with an illumination coming from backward.
The Observer orbit is supposed fixed at $0^°$ of longitude, allowing the Target longitude to act has the emergence angle variation (which greatly simplify the simulation). #link("https://docs.google.com/drawings/d/14S68lR6BrNUmc0L9tLUSnxdGj35CHQBZFnGEg2iXaS8/edit?usp=sharing")[link]]) <fig:geometry_type2>

#figure(muchpdf(read("../../src/figures/geometry_type3.pdf", encoding: none), width: 80%), caption: [Graph representing 3 different mission geometry E3, M3 and H3 with Targets respectively at ($0^° "N", 0^° "E"$), ($45^° "N", 0^° "E"$) and ($70^° "N", 0^° "E"$) with an illumination coming from forward.
The Observer orbit is supposed fixed at $0^°$ of longitude, allowing the Target longitude to act has the emergence angle variation (which greatly simplify the simulation). #link("https://docs.google.com/drawings/d/14yMpTa2e8AW2Jk7UDlnUBxiPiKBw3kHzeNWRNyfVZIY/edit?usp=sharing")[link]]) <fig:geometry_type3>

#figure(muchpdf(read("../../src/figures/geometry_type4.pdf", encoding: none), width: 80%), caption: [Graph representing 3 different mission geometry E4, M4 and H4 with Targets respectively at ($0^° "N", 0^° "E"$), ($45^° "N", 0^° "E"$) and ($70^° "N", 0^° "E"$) with an illumination coming from nadir.
The Observer orbit is supposed fixed at $0^°$ of longitude, allowing the Target longitude to act has the emergence angle variation (which greatly simplify the simulation). #link("https://docs.google.com/drawings/d/1zg14yjhR4tyqVraM-XImn1Dk8qtw8U3Vsk2vws4JzjU/edit?usp=sharing")[link]]) <fig:geometry_type4>

#figure(muchpdf(read("../../src/figures/geometry_type5.pdf", encoding: none), width: 80%), caption: [Graph representing 3 different mission geometry E5, M5 and H5 with Targets respectively at ($0^° "N", 5^° "E"$), ($45^° "N", 5^° "E"$) and ($70^° "N", 10^° "E"$) with an illumination coming from nadir.
The Observer orbit is supposed fixed at $0^°$ of longitude, allowing the Target longitude to act has the emergence angle variation (which greatly simplify the simulation). #link("https://docs.google.com/drawings/d/147gQM09HPN9Owi4DzHlBel1YSNDB3v8GEwsYoGa_yJc/edit?usp=sharing")[link]]) <fig:geometry_type5>

The @tab:geometries lists all the geometries made with 2 observers points of view (from nadir and on the side) and 3 different illuminations (from the left, nadir and right) across 3 different targets latitudes (at the equator, mid and high-latitude).

#figure(table(columns: 4, align: horizon, stroke: none,
  table.header(
    table.cell(
      fill: silver,
      colspan: 4,
      align: horizon,
      [*Coordinate (lon°, lat°)*])
  ),

  table.cell(
    rowspan: 16,
    fill: silver,
    align: horizon,
    rotate(-90deg, reflow: true)[
      *Observer propagated: $(0^°,-180^°)$ to $(0^°,180^°)$*
    ],
  ),

  table.cell(fill: silver.lighten(30%), [*Target*]),
  table.cell(fill: silver.lighten(30%), [*Subsolar*]),
  table.cell(fill: silver.lighten(30%), [*Name*]),

  table.cell(fill: silver.lighten(70%), [(5, 0)]),
  table.cell(fill: silver.lighten(70%), [(70, 0)]),
  table.cell(fill: silver.lighten(70%), [E1]),

  table.cell(fill: silver.lighten(30%), [(5, 0)]),
  table.cell(fill: silver.lighten(30%), [(-70, 0)]),
  table.cell(fill: silver.lighten(30%), [E2]),

  table.cell(fill: silver.lighten(70%), [(0, 0)]),
  table.cell(fill: silver.lighten(70%), [(70, 0)]),
  table.cell(fill: silver.lighten(70%), [E3]),

  table.cell(fill: silver.lighten(30%), [(0, 0)]),
  table.cell(fill: silver.lighten(30%), [(0.01, 0)]),
  table.cell(fill: silver.lighten(30%), [E4]),

  table.cell(fill: silver.lighten(70%), [(5, 0)]),
  table.cell(fill: silver.lighten(70%), [(0, 0)]),
  table.cell(fill: silver.lighten(70%), [E5]),

  table.cell(fill: silver.lighten(30%), [(5, 45)]),
  table.cell(fill: silver.lighten(30%), [(70, 0)]),
  table.cell(fill: silver.lighten(30%), [M1]),

  table.cell(fill: silver.lighten(70%), [(5, 45)]),
  table.cell(fill: silver.lighten(70%), [(-70, 0)]),
  table.cell(fill: silver.lighten(70%), [M2]),

  table.cell(fill: silver.lighten(30%), [(0, 45)]),
  table.cell(fill: silver.lighten(30%), [(70, 0)]),
  table.cell(fill: silver.lighten(30%), [M3]),

  table.cell(fill: silver.lighten(70%), [(0, 45)]),
  table.cell(fill: silver.lighten(70%), [(0.01, 0)]),
  table.cell(fill: silver.lighten(70%), [M4]),

  table.cell(fill: silver.lighten(30%), [(5, 45)]),
  table.cell(fill: silver.lighten(30%), [(0, 0)]),
  table.cell(fill: silver.lighten(30%), [M5]),

  table.cell(fill: silver.lighten(70%), [(10, 70)]),
  table.cell(fill: silver.lighten(70%), [(70, 0)]),
  table.cell(fill: silver.lighten(70%), [H1]),

  table.cell(fill: silver.lighten(30%), [(10, 70)]),
  table.cell(fill: silver.lighten(30%), [(-70, 0)]),
  table.cell(fill: silver.lighten(30%), [H2]),

  table.cell(fill: silver.lighten(70%), [(0, 70)]),
  table.cell(fill: silver.lighten(70%), [(70, 0)]),
  table.cell(fill: silver.lighten(70%), [H3]),

  table.cell(fill: silver.lighten(30%), [(0, 70)]),
  table.cell(fill: silver.lighten(30%), [(0.01, 0)]),
  table.cell(fill: silver.lighten(30%), [H4]),

  table.cell(fill: silver.lighten(70%), [(10, 70)]),
  table.cell(fill: silver.lighten(70%), [(0, 0)]),
  table.cell(fill: silver.lighten(70%), [H5]),
), caption: [Summary of all configurations used to analyze photometric responses across different latitudes, points of view and illuminations.]) <tab:geometries>


The objective is to cover a wide range of emergence and incidence angles through the geometry design to insure great reflectance inversion, since great geometry diversity helps to better understand photometry @schmidt_efficiency_2019.
The @fig:AS15-M-XXXX showcases a target with different illumination angle and therefore different reflectances.

#figure(grid(columns: 4, gutter: 4mm, image("../../src/figures/AS15-M-2170.jpg"),image("../../src/figures/AS15-M-1145.jpg"),image("../../src/figures/AS15-M-0596.jpg"),image("../../src/figures/AS15-M-0423.jpg")), caption: [Four Apollo Metric frames of the same area in Mare Imbrium each taken under different solar illumination conditions. (AS15-M-2170 containing a robotic arm, AS15-M-1145, AS15-M-0596, and AS15-M-0423) (Credit: NASA)]) <fig:AS15-M-XXXX>

=== Stacked geometries <sec:stacked_geometries>

A total of 93 geometries combinations were created, with a target at nadir, medium and high latitudes $(0^°,45^°,70^°)$ with different orbits relative longitudes $(-10^°,0^°,10^°)$.
For each target position case (E, M and H) we stacked geometries up to 5 orbit type.
For instance scenario E1, E1-E2, E1-E2-E3, but also all of them E1-E2-E3-E4-E5.
This design simulate the satellite pass-by over the target each period or more, with of course different geometry angles each time.
For the sake of the computational time, the study was limited to 5 geometries with very distinct properties.
There is in total 31 possible combinations possible.
Obviously, it is not possible to combine geometries from target at equator and mid-latitude.
Therefore, we are left with 93 total scenarios of combinations possible.
We also used later in @sec:compa_to_apolo 15 geometries from the Apollo 15 mission, observed by LRO.
This set will be called ALRO and will be used to compare Màni design strategy with the actual Apollo 15 LRO camera.

=== Orbit precession

The purpose of this section is to verify the orbit precession of $1.03^°$ to avoid any special case where we could have the same geometries at revisit.
The mission goal is to generate as many different illumination and emergence angles, to create a wide variety of data.
By default the illumination angle shifts at every orbital period, it can be calculated from the Moon's synodic period and the target revisit at nadir period of 29.53 and 27.43 days respectively, @eq:sun_shift.
The RAAN #footnote[Right Ascension of the Ascending Node] precession rate also needs to be considered, since it is a major perturbation  @eq:raan_precession.
It can be calculated from $J_2$ and basic orbital parameters, $R$, $e$ and $i$ and then added to the subsolar angle shift to approximate the total sun shift per revisit, @eq:sun_shift_tot.

$
  Delta theta_s = ((360) / (3600 times 24) times (T / (P_s · Delta Omega)) - 1 ) times 360^° = -0.0733 quad [deg · T^(-1)]
$ <eq:sun_shift>

$
  dot(X)Omega = - (3/2)J_2((R^2)/(a^2 (1 - e^2)^2)) n cos(i) (180^°/π)·T= -0.0108 quad [deg · T^(-1)]
$ <eq:raan_precession>

$
  Delta theta_t approx Delta theta_s + dot(X) Omega = -0.0841 quad [deg · T^(-1)]
$ <eq:sun_shift_tot>

The following @fig:precession describes how the illumination angle changes at each revisit (per period of revisit $T$). It clearly demonstrates how well the design is defined, with an illumination shift of 2 local hours per revisits.

#figure(grid(columns: 2, gutter: 4mm, muchpdf(read("../../src/figures/precession.pdf", encoding: none)), muchpdf(read("../../src/figures/precession.pdf", encoding: none))), caption: [The left polar plot shows the illumination angle variation at each revisit during 2 years, while the right polar plot shows the sun local hour on the moon shifting at each revisits during 2 years. #link("https://colab.research.google.com/drive/1xYFQwsLclDjDJSpZBBM1dImFIfX3E0Sr?usp=sharing")[link]]) <fig:precession>

== Creation of multiple photometries

=== Radiometric quantities

This are physical quantities used to measure electromagnetic radiation (including light), based on its energy. Examples include:

- _Radiant flux_: ($Phi$) $[J.s^(-1)]$ the total power of radiation is the energy quantity received or emitted by a surface per unit of time in all directions.
- _Irradiance_: ($E$) $[W.m^(-2)]$ power of radiation per unit area, $E=d/Phi d S$.
- _Radiant intensity_: ($I$) $[W.s r^(-1)]$ power per unit solid angle.
- _Radiance_: ($L$) $[W.m^(-2).s r^(-1)]$ the irradiance per unit solid angle,  $L=(I E)/ (pi F cos(theta_0))$.

From those quantities can be defined the reflectance function, therefore in this study the Bidirectional Reflectance Distribution Function also called BRDF was used.
It satisfies several key properties :

- Helmholtz reciprocity principle : Let ($theta_0$) and ($theta$) be respectively the directions of incidence and emergence, therefore $r(theta_0, theta)=r(theta,theta_0)$.
- Energy conservation principle : The radiant flux ($Phi$) reflected by the surface over the entire hemisphere is less than or equal to the incident flux

=== Radiatif transfert

As described by @hapke_theory_2012, it is convenient to define a quantity called the albedo factor ($gamma$) of the medium as well as the incidence cosinus ($mu_0$) and the emergence cosinus ($mu$) :

$
  gamma = sqrt(1-omega), quad mu_0=cos(theta_0), quad mu=cos(theta)
$ <eq:albedo_factor>

@chandrasekhar_radiative_1960 proposed an equation to describe radiative transfer, desrcribing the energy loss and gain as electromagnetic radiation passes through a plane-parallel layer of a material.
This material is optically inactive, meaning it has no internal sources.
It continuously scatters and absorbs radiation, and is illuminated from above by a flux $F$.
The radiance $L_e$ emerging from this same layer is described by the photon transport equation.
This equation shows that energy is conserved within the layer.
Changes in radiance in a given direction happen either because energy is absorbed or scattered away (extinction), or because radiation comes in from other directions (scattering), including directly from the source.
The local energy balance of the radiation field at a point, per unit normal surface area and per unit solid angle, between two levels $tau$ and $tau + d tau$, is written as follows @eq:albedo_factor .

$
  mu (delta L_e(tau,mu,psi))/(delta tau)=L_e(tau,mu,psi)-F/(4 pi) exp((-tau)/mu_0) P(g)-1/(4pi) integral_(-1)^(1) integral_(0)^(2 pi) omega P(g) L_e (tau^prime, mu^prime,psi^prime)d mu^prime d psi^prime
$ <eq:albedo_rad_trans>

The @eq:albedo_rad_trans is composed of the extinction, the simple diffusion and multiple diffusion functions, respectively corresponding to the first, second and last term.

=== Radiatif transfer analytic model

The expression of the semi-empirical Hapke model corresponding to the 1993 version is presented in this section.
The analytic model is derived from the radiative transfer @eq:albedo_rad_trans, while addressing the limitations of the far-field approximation, which does not apply well to dense granular media.
First, the base model assumes that light interacts with the average local properties of scattering and absorption within the volume, rather than with the exact spatial distribution of individual structures.
It begins by modeling the interaction between an incoming light beam and a single isolated particle, using the single-scattering albedo ($omega$) and the phase function ($Phi$).
Multiple scattering ($H$) is then treated separately.
Next, the model takes into account the surface effects caused by the close packing of particles.
This includes the opposition effect ($B$), surface roughness ($zeta$), and the suppression of diffraction in the single scattering term.

$
  "Ref" (theta_0, theta, alpha) = (omega)/(4 pi) " " (mu_0)/(mu_0+mu)  ([1+B(alpha)]P(alpha)+H(mu_0)H(mu)-1) quad [s r^(-1)]
$ <eq:biderec_reflectance>

In radiative transfer, the Chandrasekhar function ($H$) describes the angular distribution of the reflected rays from a medium.
It is critical for modeling multiple scattering-light that bounces more that once within a particulate surface such as regolith for our case.
In it's approach @hapke_theory_2012, Hapke uses a simplified version of Chandrasekhar’s radiative transfer theory.

$
  H(x)=( 1-[1-gamma]x[ r_0+ ( 1-r_0/2-r_0 x ) ln((1+x)/x)] )^(-1)
$ <eq:chandrasekhar>

The single-particle phase function ($p$) represents how light is scattered by a single particle as a function of the phase angle ($alpha$).

$
  P(alpha)=((1-c)(1-b^2))/((1+2 b cos(alpha)+b^2)^(1.5)) + (c(1-b^2))/((1-2b cos(alpha)+b^2)^(1.5))
$ <eq:tes>

The @eq:shadow-hiding is the Hapke shadow-hiding opposition effect function.
It's designed to model the non-linear brightening of a surface when the phase angle approach zero.
At small phase angles, the shadows cast by a surface are hidden from the observer's view.
As a results, more of the surface appears fully  illuminated, making the surface look brighter than expected from standard scattering alone.

$
  B(alpha)=B_0/(1+(1/h)tan(alpha/2))
$ <eq:shadow-hiding>

=== Surface photometry

For the surface photometry we assume to follow the Hapke model @hapke_theory_2012 described in  @eq:biderec_reflectance.
For the target surface, we set a variety of 12 photometry types using different parameters listed in @tab:photometries.
Perhaps, we have :

- _The single scattering albedo_: ($omega$) represents the fraction of incident light scattered by a single particle rather than absorbed, providing insight into the material’s reflectivity, with values ranging from 0 (completely absorbing) to 1 (completely scattering).

- _The Hapke mean slope roughness_: ($zeta$) quantifies the macroscopic roughness of a surface influencing light scattering and shadowing effects.

- _The opposition effect amplitude_: ($B_0$) describes the magnitude of the sharp brightness.

- _The asymetry_: ($b$) characterizes the angular distribution of scattered light, distinguishing isotropic ($b=0$), forward-scattering ($b>0$), and back-scattering ($b<0$) behaviors.

- _The back-scattering fraction_: ($c$) defines the proportion of light scattered back toward the source, with higher values indicating surfaces with irregular or opaque particles.

- _The opposition effect width_: ($h$) represents how sharply the brightness increases near zero phase angle.

Different photometry types also means different microtextures simulated.
Therefore the light interaction changes depending on these parameters, for example with high asymmetry  ($b$) and low back-scattering ($c$) tends to characterize smooth and clear microtexture.
While low asymmetry  ($b$) and high back-scattering ($c$) tends to characterize internal scattered grain microtexture, as shown in @fig:microtexture.

#figure(image("../../src/figures/microtexture.svg", width: 100%), caption: [ Particle phase function parameter results from experimental studies on artiﬁcial @mcguire_experimental_1995 and natural samples @souchon_experimental_2011 having varied physical properties, resulting in different photometric behaviours. #link("https://colab.research.google.com/drive/1toLfUh5RMkgAJErzTAgO7SYXw7SN2OR7?usp=sharing")[link]]) <fig:microtexture>

In @tab:photometries encompasses all the possible photometric behaviour on the lunar surface @sato_resolved_2014 as described in @sec:surface_prop.
The parameters $b_0$ and $h$ are due to the opposition effect and easily constrained at low phase angle @schmidt_efficiency_2019 .
For this particular reason, it was removed from our study and set to a constant ($0.5$).

#figure(table(columns: 5, align: horizon, stroke: none,
  table.header(
    table.cell(fill: silver, [*$omega$*]),
    table.cell(fill: silver, [*$b$* & *$c$*]),
    table.cell(fill: silver, [*$zeta$*]),
    table.cell(fill: silver, [*$B_0$*]),
    table.cell(fill: silver, [*$h$*]),
  ),
  table.cell(fill: silver.lighten(70%), [0.3]),
  table.cell(fill: silver.lighten(70%), [(0.3,0.9)]),
  table.cell(fill: silver.lighten(70%), [0]),
  table.cell(fill: silver.lighten(70%), [0.5]),
  table.cell(fill: silver.lighten(70%), [0.5]),

  table.cell(fill: silver.lighten(30%), [0.9]),
  table.cell(fill: silver.lighten(30%), [(0.3,0.9)]),
  table.cell(fill: silver.lighten(30%), [0]),
  table.cell(fill: silver.lighten(30%), [0.5]),
  table.cell(fill: silver.lighten(30%), [0.5]),

  table.cell(fill: silver.lighten(70%), [0.3]),
  table.cell(fill: silver.lighten(70%), [(0.3,0.5)]),
  table.cell(fill: silver.lighten(70%), [0]),
  table.cell(fill: silver.lighten(70%), [0.5]),
  table.cell(fill: silver.lighten(70%), [0.5]),

  table.cell(fill: silver.lighten(30%), [0.3]),
  table.cell(fill: silver.lighten(30%), [(0.9,0.1)]),
  table.cell(fill: silver.lighten(30%), [0]),
  table.cell(fill: silver.lighten(30%), [0.5]),
  table.cell(fill: silver.lighten(30%), [0.5]),

  table.cell(fill: silver.lighten(70%), [0.9]),
  table.cell(fill: silver.lighten(70%), [(0.3,0.5)]),
  table.cell(fill: silver.lighten(70%), [0]),
  table.cell(fill: silver.lighten(70%), [0.5]),
  table.cell(fill: silver.lighten(70%), [0.5]),

  table.cell(fill: silver.lighten(30%), [0.9]),
  table.cell(fill: silver.lighten(30%), [(0.9,0.1)]),
  table.cell(fill: silver.lighten(30%), [0]),
  table.cell(fill: silver.lighten(30%), [0.5]),
  table.cell(fill: silver.lighten(30%), [0.5]),

  table.cell(fill: silver.lighten(70%), [0.3]),
  table.cell(fill: silver.lighten(70%), [(0.3,0.9)]),
  table.cell(fill: silver.lighten(70%), [30]),
  table.cell(fill: silver.lighten(70%), [0.5]),
  table.cell(fill: silver.lighten(70%), [0.5]),

  table.cell(fill: silver.lighten(30%), [0.9]),
  table.cell(fill: silver.lighten(30%), [(0.3,0.9)]),
  table.cell(fill: silver.lighten(30%), [30]),
  table.cell(fill: silver.lighten(30%), [0.5]),
  table.cell(fill: silver.lighten(30%), [0.5]),

  table.cell(fill: silver.lighten(70%), [0.3]),
  table.cell(fill: silver.lighten(70%), [(0.3,0.5)]),
  table.cell(fill: silver.lighten(70%), [30]),
  table.cell(fill: silver.lighten(70%), [0.5]),
  table.cell(fill: silver.lighten(70%), [0.5]),

  table.cell(fill: silver.lighten(30%), [0.3]),
  table.cell(fill: silver.lighten(30%), [(0.9,0.1)]),
  table.cell(fill: silver.lighten(30%), [30]),
  table.cell(fill: silver.lighten(30%), [0.5]),
  table.cell(fill: silver.lighten(30%), [0.5]),

  table.cell(fill: silver.lighten(70%), [0.9]),
  table.cell(fill: silver.lighten(70%), [(0.3,0.5)]),
  table.cell(fill: silver.lighten(70%), [30]),
  table.cell(fill: silver.lighten(70%), [0.5]),
  table.cell(fill: silver.lighten(70%), [0.5]),

  table.cell(fill: silver.lighten(30%), [0.9]),
  table.cell(fill: silver.lighten(30%), [(0.9,0.1)]),
  table.cell(fill: silver.lighten(30%), [30]),
  table.cell(fill: silver.lighten(30%), [0.5]),
  table.cell(fill: silver.lighten(30%), [0.5]),
),
caption: [Summary of all configurations used to analyze photometric responses across different latitudes, points of view and illuminations.]) <tab:photometries>

By evaluating these scenarios,  we aim to better understand how reflectance behaves under different microtexture conditions, informing the optimal choice of parameters for the mission’s orbital configurations.

=== Reflectance calculus <sec:reflectance_calculus>

The bidirectional reflectance is calculated for all photometric set of parameters @tab:photometries and geometric orbit combinations @tab:geometries.
It has in inputs the photometric parameters, incidence, emergence, phase and azimuth angles, see @eq:biderec_reflectance.
The calculus is based on Hapke's photometric model @hapke_theory_2012 previously described and goes through the surface roughness corrections, shadowing effects, multiple scattering effect within particles, the opposition effect and phase function dependence.
This part of the study has for objective to simulate the reflectance received by the satellite, which we will then inverse using the geometric orbit angles to approximate photometric parameters and conclude whether or not the scenario is well suited to approximate the surface photometric parameters.
The synthetic reflectance was then combined with a measured tolerance of 10%, 5% and 2% later referred as ($sigma$) to simulate realist measurement.

== Reflectance inversion to predict photometric parameters

=== Differential Evolution of Markov Chain Monte Carlo algorithm

To retrieve the photometric parameters of a planetary surface, we use the Hapke model described in the previous section as our forward model.
This model simulates how light reflects off a dense granular surface based on physical parameters.
However, estimating these parameters from reflectance measurements is an inverse problem, which we approach using a Bayesian python framework.
The aims is to generate samples from a target probability distribution ($pi$) of the Hapke BRDF input parameters, in our case a posterior distribution in Bayesian inference, described by @eq:MC.
For that, we have the likelihood function $cal(L)(theta)=P("D"|theta)$ which tells how likely the observed data ($"D"$) is, based on a set of initial parameters ($theta$).
Also their is the prior, which is the initial belief about the parameters before seeing any data is set to a Gaussian distribution centered at zero:

$
  p(theta_i)=cal(N)(0,sigma^(2)_i)
$ <eq:G_distribution>

The evidence (also called the normalizing constant) is:

$
  P("D")=cal(L)("D"|theta).p(theta)d theta
$ <eq:evidence>

In our study and using the mc3 tool we assume independent Gaussian errors on the data points.
This leads to the likelihood function, @eq:likelihood:

$
  cal(L)(theta) prop exp(-1/2 sum_(n)^(i=1) ((y_i-f(x_i,theta))/(sigma_i))^2)
$ <eq:likelihood>

Where $y_i$ are the observed data points, $f(x_i,theta)$ is the prediction model with $x_i$ representing the geometry and $theta$ the photometric parameters, and $sigma_i$ are the uncertainties for each data point.
This expression is equivalent to minimizing the chi-square statistic.

$
  pi(theta | "D")=(cal(L)("D"|theta).p(theta))/(P("D"))
$ <eq:MC>

A Markov Chain is constructed in a way that its stationary distribution is $pi(theta)$.
At each step, with a given state $t$, given the current state $theta^{(t)}$, a candidate $theta^*$ is proposed from a proposal distribution $tilde q(.|theta^{(t)})$ and through the @eq:acceptance} it is then accepted or rejected (probability).

$
  eta = min( 1,(pi(theta^*).q(theta^((t))|theta^*))/(pi(theta^((t)).q(theta^*|theta^((t))))))
$ <eq:acceptance>

In the DE-MCMC #footnote[Differential Evolution Markov Chain Monte Carlo] method, multiple independent chains are initiated and evolve in parallel.
At each iteration, a candidate for a chain is proposed by combining two other chains, as described in @eq:DE-MCMC.

$
  x^*=x^((a))+gamma(x^((b))-x^((c)))+epsilon
$ <eq:DE-MCMC>

Here ($gamma$) is a scaling factor and ($epsilon$) is a gaussien noise.
This method enhances a better sampling efficiency in high-dimensional problems by combining multiple chains and dynamically adapting step sizes.

=== Numerical implementation

The inversion can be calculated with the Python #link("https://mc3.readthedocs.io/en/latest/index.html")[MC3] (Multi-Core Markov Chain Monte Carlo) library.
It is a powerful Python tool for Bayesian parameter estimation and model fitting, with great details on the statistic output.
It uses the MCMC method to sample the posterior probability distribution of the function parameters.
It has features like adaptive step-size tuning and Gibbs sampling @cubillos_correlated-noise_2017 to ensure that the parameter space is thoroughly explored.
MC3 provides detailed results, including posterior distributions, parameter uncertainties, and convergence quality, making it a valuable tool for a statistical analysis.

For this study, the sample function from the MC3 library was used, requiring in entry the reflectance measured and it's uncertainties, the reflectance calculus function from the @sec:reflectance_calculus with it's accompanying arguments and finally the initialization parameters for the algorithm in it self.
The sample function returns very interesting results such as, the best parameters fit, the thinned posterior distribution, the $X^2$ values for the posterior samples, the mean of the marginal posteriors for each model parameter and the standard deviation of the marginal posteriors for each model parameter.

=== Inversion results

@fig:inversion showcases the given results from the inversion method.
To evaluate the quality of the inversion algorithm over the true parameters, we refined the thinned posterior distribution by excluding the burn-in phase and filtering out unwanted data, ensuring that the goodness-of-fit metric between the model and the observed data was limited to values less than 30.
This allow to get only the final converged results that can be quantified and estimated, later used in @sec:efficiency. The following @fig:inversion represents all the reflectance posterior distribution over the phase for all shots of the scenario, here we have the combination of the orbit H1, H2, H3, H4, and H5 for $omega=0.3$, $b=0.3$, $c=0.9$, $zeta=30$, $o=0.5$, $h=0.5$, with 5 shots per orbit.

#figure(muchpdf(read("../../src/figures/inversion.pdf", encoding: none), width: 70%), caption: [Example of the fit distribution results with 25 images geometry from the combination of the orbit H1, H2, H3, H4, and H5 (5 images per orbit) for a surface photometry set by $omega=0.9$, $b=0.3$, $c=0.9$, $zeta=30$, $b_0=0.5$, $h=0.5$. The $10^5$ sample solutions are in black. The true solution is in red with an uncertainty of $sigma=10%$. The maximum likelihood is in green. The sample solution distribution, plotted in light blue, is close to the expected synthetic observation in red.]) <fig:inversion>

The typical computation time for a run is 1 minute for $100 " " 000$ samples and the data produce is around $27 "Mb"$ on a 6 cores multi-thread laptop machine. This has been run more than 1116 time to produce the following results. For each orbit type (E, M and H) and for each different noise level (10%, 5% and 2%). The following figure represents the thinned posterior distribution, without the burn-in phase dilimited where the chisq output is $>30$.
It greatly exhibits co-relation between photometric parameters, indeed it is a great tool to quickly see if a combination of geometry and photometry works well together.

#figure(muchpdf(read("../../src/figures/inversion_corner.pdf", encoding: none), width: 100%), caption: [Example of the fit distribution results with 25 images geometry from the combination of the orbit E1, E2, E3, E4, and E5 (5 images per orbit) for a surface photometry set by $omega=0.3$, $b=0.3$, $c=0.9$, $zeta=30$, $b_0=0.5$, $h=0.5$. The $10^5$ sample solutions are in black. The true solution is in red with an uncertainty of $sigma=10%$ and the lightred area represents the acceptable range ($epsilon plus.minus 10%$) used to quantify the inversion quality (see @sec:efficiency).]) <fig:inversion_corner>

=== Inversion efficiency <sec:efficiency>

To simulate a mission, we combined all the geometries and photometries to make a single data set of 1116 different scenarios. We evaluate each scenario by using the efficiency $E$ and the strategy defined in @schmidt_efficiency_2019 .

- Synthetic reflectance calculus : The reflectance corresponding to each of the 1116 different scenarios (all combinations of possible 93 geometry and 12 photometry) are computed.

- From synthetic reflectance to photometric parameters : For each of the 1116 scenario, the Bayesian inversion is performed, incorporating noise/uncertainty level (encompassing all uncertainties on the absolute reflectance level of the image) of $sigma=10%$, $5%$ and $2%$.

- Synthesis of the results : The quality of the geometric set is determined by the knowledge on the photometric parameters. This is estimated by the efficiency $E$, that is averaged among all 12 photometry.

The closer the solution to the true parameter set is, the better the estimate.
We measure the quality of the tested geometry by considering, for every parameter (for example the true parameter $omega'$), the part of the distribution $sigma(omega')$ which lies inside the interval $[sigma(omega')-epsilon, sigma(omega')+epsilon]$, where $epsilon$ is set to 10% which is relevant for a lunar science case.
Let us denote $I_(omega)=integral_(omega'-epsilon)^(omega'+epsilon)sigma(omega)d omega$.
In practice, $I_(w)$ is simply estimated by considering the proportion of samples $omega_(ell)$ that fall inside the correct interval among the $N_("samp")$ samples that were drawn.
We then consider:

$
  D_omega=-log(I_omega)
$ <eq:Kullback_Liebler_dirac>

$D_omega$ decreases with $I_omega$, equals 0 when the full distribution $sigma(omega)$ falls inside the correct interval.
The total efficiency distance $E$ of a given geometry is finally defined by the sum:

$
  E=D_omega+D_b+D_c+D_dash(theta)
$

To convert back this proxy to a probability, we just have to evaluate $e^(-E)$ that is the probability of the distribution that stands within the acceptable margin. The lowest the proxy $E$, the better constraint are the photometric parameters. We can define a threshold given the uncertainties, 50% of the posterior distribution should stand within an acceptable range.

This lead to a maximum value of $E=-log(0.5)=0.69$.

== Results

=== Simulations, best orbits and noise level

We are left with the following results from the efficiency of each scenario, characterizing the quality of the geometric configuration for the inversion of a particular surface photometry.
Results are presented for each orbit type (E, M, H) and for each noise level ($sigma$) values. (For full results, see @tab:proxy_EMH_all}).

#figure(table(columns: 7, align: horizon, stroke: none,
  table.header(
    table.cell(
      colspan: 7,
      fill: silver,
      [*Target at Equator with $epsilon = 10%$*])
  ),
  table.cell(
    rowspan: 2,
    fill: silver,
    [*Nb. \ Shots*]),
  table.cell(colspan: 2, fill: silver.lighten(70%), [$sigma = 10%$]),
  table.cell(colspan: 2, fill: silver.lighten(70%), [$sigma = 5%$]),
  table.cell(colspan: 2, fill: silver.lighten(70%), [$sigma = 2%$]),
  table.cell(fill: silver.lighten(30%), [Geometry]),
  table.cell(fill: silver.lighten(30%), [Proxy E]),
  table.cell(fill: silver.lighten(30%), [Geometry]),
  table.cell(fill: silver.lighten(30%), [Proxy E]),
  table.cell(fill: silver.lighten(30%), [Geometry]),
  table.cell(fill: silver.lighten(30%), [Proxy E]),
  table.cell(fill: silver.lighten(70%), [5]),
  table.cell(fill: silver.lighten(70%), [E2]),
  table.cell(fill: silver.lighten(70%), [3.5817]),
  table.cell(fill: silver.lighten(70%), [E2]),
  table.cell(fill: silver.lighten(70%), [3.2158]),
  table.cell(fill: silver.lighten(70%), [E2]),
  table.cell(fill: silver.lighten(70%), [2.5636]),
  table.cell(fill: silver.lighten(30%), [10]),
  table.cell(fill: silver.lighten(30%), [E2-3]),
  table.cell(fill: silver.lighten(30%), [1.7769]),
  table.cell(fill: silver.lighten(30%), [E2-3]),
  table.cell(fill: silver.lighten(30%), [1.0902]),
  table.cell(fill: silver.lighten(30%), [E2-3]),
  table.cell(fill: silver.lighten(30%), [0.4468]),
  table.cell(fill: silver.lighten(70%), [15]),
  table.cell(fill: silver.lighten(70%), [E1-2-4]),
  table.cell(fill: silver.lighten(70%), [0.7900]),
  table.cell(fill: silver.lighten(70%), [E1-2-4]),
  table.cell(fill: silver.lighten(70%), [0.3546]),
  table.cell(fill: silver.lighten(70%), [E1-2-3]),
  table.cell(fill: silver.lighten(70%), [0.1122]),
  table.cell(fill: silver.lighten(30%), [20]),
  table.cell(fill: silver.lighten(30%), [E1-2-3-4]),
  table.cell(fill: silver.lighten(30%), [0.6717]),
  table.cell(fill: silver.lighten(30%), [E1-2-3-5]),
  table.cell(fill: silver.lighten(30%), [0.2845]),
  table.cell(fill: silver.lighten(30%), [E1-2-3-4]),
  table.cell(fill: silver.lighten(30%), [0.0876]),
  table.cell(fill: silver.lighten(70%), [25]),
  table.cell(fill: silver.lighten(70%), [all]),
  table.cell(fill: silver.lighten(70%), [0.6079]),
  table.cell(fill: silver.lighten(70%), [all]),
  table.cell(fill: silver.lighten(70%), [0.2648]),
  table.cell(fill: silver.lighten(70%), [all]),
  table.cell(fill: silver.lighten(70%), [0.0852]),
), caption: [Best geometry combination per number for all photometry at Equator, with the proxy of acceptable range set to $epsilon = 10%$]) <tab:proxy_E>

#figure(table(columns: 7, align: horizon, stroke: none,
  table.header(
    table.cell(
      colspan: 7,
      fill: silver,
      [*Target at Mid latitude with $epsilon = 10%$*])
  ),
  table.cell(
    rowspan: 2,
    fill: silver,
    [*Nb. \ Shots*]),
  table.cell(colspan: 2, fill: silver.lighten(70%), [$sigma = 10%$]),
  table.cell(colspan: 2, fill: silver.lighten(70%), [$sigma = 5%$]),
  table.cell(colspan: 2, fill: silver.lighten(70%), [$sigma = 2%$]),
  table.cell(fill: silver.lighten(30%), [Geometry]),
  table.cell(fill: silver.lighten(30%), [Proxy E]),
  table.cell(fill: silver.lighten(30%), [Geometry]),
  table.cell(fill: silver.lighten(30%), [Proxy E]),
  table.cell(fill: silver.lighten(30%), [Geometry]),
  table.cell(fill: silver.lighten(30%), [Proxy E]),
  table.cell(fill: silver.lighten(70%), [5]),
  table.cell(fill: silver.lighten(70%), [M3]),
  table.cell(fill: silver.lighten(70%), [3.7549]),
  table.cell(fill: silver.lighten(70%), [M2]),
  table.cell(fill: silver.lighten(70%), [2.1260]),
  table.cell(fill: silver.lighten(70%), [M4]),
  table.cell(fill: silver.lighten(70%), [1.0458]),
  table.cell(fill: silver.lighten(30%), [10]),
  table.cell(fill: silver.lighten(30%), [M1-2]),
  table.cell(fill: silver.lighten(30%), [1.7009]),
  table.cell(fill: silver.lighten(30%), [M2-4]),
  table.cell(fill: silver.lighten(30%), [0.5603]),
  table.cell(fill: silver.lighten(30%), [M2-4]),
  table.cell(fill: silver.lighten(30%), [0.1001]),
  table.cell(fill: silver.lighten(70%), [15]),
  table.cell(fill: silver.lighten(70%), [M1-2-4]),
  table.cell(fill: silver.lighten(70%), [1.0113]),
  table.cell(fill: silver.lighten(70%), [M1-2-4]),
  table.cell(fill: silver.lighten(70%), [0.2866]),
  table.cell(fill: silver.lighten(70%), [M1-2-4]),
  table.cell(fill: silver.lighten(70%), [0.0385]),
  table.cell(fill: silver.lighten(30%), [20]),
  table.cell(fill: silver.lighten(30%), [M1-2-3-4]),
  table.cell(fill: silver.lighten(30%), [0.7207]),
  table.cell(fill: silver.lighten(30%), [M1-2-3-4]),
  table.cell(fill: silver.lighten(30%), [0.2252]),
  table.cell(fill: silver.lighten(30%), [M1-2-3-4]),
  table.cell(fill: silver.lighten(30%), [0.0262]),
  table.cell(fill: silver.lighten(70%), [25]),
  table.cell(fill: silver.lighten(70%), [all]),
  table.cell(fill: silver.lighten(70%), [0.6623]),
  table.cell(fill: silver.lighten(70%), [all]),
  table.cell(fill: silver.lighten(70%), [0.2072]),
  table.cell(fill: silver.lighten(70%), [all]),
  table.cell(fill: silver.lighten(70%), [0.0257]),
), caption: [Best geometry combination per number for all photometry at Medium latitudes, with the proxy of acceptable range set to $epsilon = 10%$]) <tab:proxy_M>


#figure(table(columns: 7, align: horizon, stroke: none,
  table.header(
    table.cell(
      colspan: 7,
      fill: silver,
      [*Target at High latitude with $epsilon = 10%$*])
  ),
  table.cell(
    rowspan: 2,
    fill: silver,
    [*Nb. \ Shots*]),
  table.cell(colspan: 2, fill: silver.lighten(70%), [$sigma = 10%$]),
  table.cell(colspan: 2, fill: silver.lighten(70%), [$sigma = 5%$]),
  table.cell(colspan: 2, fill: silver.lighten(70%), [$sigma = 2%$]),
  table.cell(fill: silver.lighten(30%), [Geometry]),
  table.cell(fill: silver.lighten(30%), [Proxy E]),
  table.cell(fill: silver.lighten(30%), [Geometry]),
  table.cell(fill: silver.lighten(30%), [Proxy E]),
  table.cell(fill: silver.lighten(30%), [Geometry]),
  table.cell(fill: silver.lighten(30%), [Proxy E]),
  table.cell(fill: silver.lighten(70%), [5]),
  table.cell(fill: silver.lighten(70%), [H4]),
  table.cell(fill: silver.lighten(70%), [1.7607]),
  table.cell(fill: silver.lighten(70%), [H4]),
  table.cell(fill: silver.lighten(70%), [0.9829]),
  table.cell(fill: silver.lighten(70%), [H4]),
  table.cell(fill: silver.lighten(70%), [0.5242]),
  table.cell(fill: silver.lighten(30%), [10]),
  table.cell(fill: silver.lighten(30%), [H2-4]),
  table.cell(fill: silver.lighten(30%), [0.6372]),
  table.cell(fill: silver.lighten(30%), [H2-4]),
  table.cell(fill: silver.lighten(30%), [0.1644]),
  table.cell(fill: silver.lighten(30%), [H2-4]),
  table.cell(fill: silver.lighten(30%), [0.0119]),
  table.cell(fill: silver.lighten(70%), [15]),
  table.cell(fill: silver.lighten(70%), [H1-2-4]),
  table.cell(fill: silver.lighten(70%), [0.4137]),
  table.cell(fill: silver.lighten(70%), [H1-2-4]),
  table.cell(fill: silver.lighten(70%), [0.0790]),
  table.cell(fill: silver.lighten(70%), [H2-3-4]),
  table.cell(fill: silver.lighten(70%), [0.0009]),
  table.cell(fill: silver.lighten(30%), [20]),
  table.cell(fill: silver.lighten(30%), [H1-2-3-4]),
  table.cell(fill: silver.lighten(30%), [0.3089]),
  table.cell(fill: silver.lighten(30%), [H1-2-3-4]),
  table.cell(fill: silver.lighten(30%), [0.0505]),
  table.cell(fill: silver.lighten(30%), [H1-2-3-4]),
  table.cell(fill: silver.lighten(30%), [0.0003]),
  table.cell(fill: silver.lighten(70%), [25]),
  table.cell(fill: silver.lighten(70%), [all]),
  table.cell(fill: silver.lighten(70%), [0.2667]),
  table.cell(fill: silver.lighten(70%), [all]),
  table.cell(fill: silver.lighten(70%), [0.0410]),
  table.cell(fill: silver.lighten(70%), [all]),
  table.cell(fill: silver.lighten(70%), [0.0003]),
), caption: [Best geometry combination per number for all photometry at High latitudes, with the proxy of acceptable range set to $epsilon = 10%$]) <tab:proxy_H>

As expected, the inversion results are better for a lower noise level $sigma=10%$ than for a higher noise level $sigma=2%$.
From @tab:proxy_E, @tab:proxy_M and @tab:proxy_H we can see that a combination of 5 orbits at $sigma=10%$ is equivalent to a single orbit combination at $sigma=2%$.
This behavior is consistent across all orbit types and photometric models, and implies that a higher SNR #footnote[Noise Signal Ratio] is greatly beneficial for the inversion process.
We can also observe an improvement in the inversion results for very bad cases, in deed the worst results at low noise level is equivalent to the best one at high level (See @tab:proxy_EMH_all).
We can therefore deduce the importance of the SNR regarding the quality of inversions.

== Comparision to Apollo 15 LRO mission <sec:compa_to_apolo>

In this section the objectif is to argument the impact of our design over the same target and number of observations compared to the LROC #footnote[Lunar Reconnaissance Orbiter Camera].

=== Apollo LROC and Máni scenario design

To recreate both datasets, the Target was set to a latitude of 26°.
The "ALRO" for Apollo LRO dataset is composed of 15 images took by the LROC with their emergence, incidence, north-incidence azimuth and north-emergence azimuth during it's mission (see @tab:geometries_ALRO).
The Apollo Mani design in return is composed of 5 different geometries (see @tab:geometries_AMANI) and a similar Target set to 26° of latitude which were combined as described in @sec:stacked_geometries.

#figure(table(columns: 4,align: horizon, stroke: none,
table.cell(fill: silver,[*$psi_i$*]),
table.cell(fill: silver,[*$theta_0$*]),
table.cell(fill: silver,[*$psi_e$*]),
table.cell(fill: silver,[*$theta$*]),
table.cell(fill: silver.lighten(70%),[93.7513]),
table.cell(fill: silver.lighten(70%),[81.5486]),
table.cell(fill: silver.lighten(70%),[347.5870]),
table.cell(fill: silver.lighten(70%),[0.2638]),
table.cell(fill: silver.lighten(30%),[96.6906]),
table.cell(fill: silver.lighten(30%),[77.3477]),
table.cell(fill: silver.lighten(30%),[181.6242]),
table.cell(fill: silver.lighten(30%),[0.7427]),
table.cell(fill: silver.lighten(70%),[108.3253]),
table.cell(fill: silver.lighten(70%),[59.6203]),
table.cell(fill: silver.lighten(70%),[196.2753]),
table.cell(fill: silver.lighten(70%),[0.4608]),
table.cell(fill: silver.lighten(30%),[116.3151]),
table.cell(fill: silver.lighten(30%),[49.3139]),
table.cell(fill: silver.lighten(30%),[358.8516]),
table.cell(fill: silver.lighten(30%),[0.1476]),
table.cell(fill: silver.lighten(70%),[131.4637]),
table.cell(fill: silver.lighten(70%),[38.6037]),
table.cell(fill: silver.lighten(70%),[101.9953]),
table.cell(fill: silver.lighten(70%),[0.3460]),
table.cell(fill: silver.lighten(30%),[179.5545]),
table.cell(fill: silver.lighten(30%),[27.6331]),
table.cell(fill: silver.lighten(30%),[243.7643]),
table.cell(fill: silver.lighten(30%),[0.1635]),
table.cell(fill: silver.lighten(70%),[204.5473]),
table.cell(fill: silver.lighten(70%),[30.0536]),
table.cell(fill: silver.lighten(70%),[352.8963]),
table.cell(fill: silver.lighten(70%),[0.1689]),
table.cell(fill: silver.lighten(30%),[229.3753]),
table.cell(fill: silver.lighten(30%),[35.2895]),
table.cell(fill: silver.lighten(30%),[150.3110]),
table.cell(fill: silver.lighten(30%),[0.3939]),
table.cell(fill: silver.lighten(70%),[227.2929]),
table.cell(fill: silver.lighten(70%),[37.3696]),
table.cell(fill: silver.lighten(70%),[78.1265]),
table.cell(fill: silver.lighten(70%),[0.1346]),
table.cell(fill: silver.lighten(30%),[250.6272]),
table.cell(fill: silver.lighten(30%),[56.8386]),
table.cell(fill: silver.lighten(30%),[84.4090]),
table.cell(fill: silver.lighten(30%),[0.8264]),
table.cell(fill: silver.lighten(70%),[253.1356]),
table.cell(fill: silver.lighten(70%),[58.1126]),
table.cell(fill: silver.lighten(70%),[313.5851]),
table.cell(fill: silver.lighten(70%),[0.6215]),
table.cell(fill: silver.lighten(30%),[264.9080]),
table.cell(fill: silver.lighten(30%),[79.1644]),
table.cell(fill: silver.lighten(30%),[96.6980]),
table.cell(fill: silver.lighten(30%),[1.0920]),
table.cell(fill: silver.lighten(70%),[265.3669]),
table.cell(fill: silver.lighten(70%),[80.0679]),
table.cell(fill: silver.lighten(70%),[139.6722]),
table.cell(fill: silver.lighten(70%),[0.1343]),
table.cell(fill: silver.lighten(30%),[265.8143]),
table.cell(fill: silver.lighten(30%),[80.9764]),
table.cell(fill: silver.lighten(30%),[261.3323]),
table.cell(fill: silver.lighten(30%),[0.9213]),
table.cell(fill: silver.lighten(70%),[266.3602]),
table.cell(fill: silver.lighten(70%),[82.8294]),
table.cell(fill: silver.lighten(70%),[269.2535]),
table.cell(fill: silver.lighten(70%),[0.1736]),
),
caption: [
  Apollo LROC 15 observations geometry angles, with $psi_i$ the notrth-incidence azimuth, $theta_0$ the incidence, $psi_e$ the north-emergence azimuth and $theta$ the emergence.
  ]) <tab:geometries_ALRO>

#figure(table(columns: 5, align: horizon, stroke: none,
  table.cell(colspan: 2, []),
  table.cell(fill: silver, colspan: 2, [*Coordinates*]),
  table.cell([]),
  table.cell([], colspan: 2),
  table.cell(fill: silver, [*Target*]),
  table.cell(fill: silver, [*Subsolar*]),
  table.cell(fill: silver, [*Name*]),
  table.cell(rowspan: 5, fill: silver, rotate(-90deg, reflow: true)[*Observer*]),
  table.cell(rowspan: 5, fill: silver, rotate(-90deg, reflow: true)[*-180 → 180*]),
  table.cell(fill: silver.lighten(70%),[(5, 26)]),
  table.cell(fill: silver.lighten(70%),[(70, 0)]),
  table.cell(fill: silver.lighten(70%),[A1]),
  table.cell(fill: silver.lighten(30%),[(5, 26)]),
  table.cell(fill: silver.lighten(30%),[(-70, 0)]),
  table.cell(fill: silver.lighten(30%),[A2]),
  table.cell(fill: silver.lighten(70%),[(0, 26)]),
  table.cell(fill: silver.lighten(70%),[(70, 0)]),
  table.cell(fill: silver.lighten(70%),[A3]),
  table.cell(fill: silver.lighten(30%),[(0, 26)]),
  table.cell(fill: silver.lighten(30%),[(0.01, 0)]),
  table.cell(fill: silver.lighten(30%),[A4]),
  table.cell(fill: silver.lighten(70%),[(5, 26)]),
  table.cell(fill: silver.lighten(70%),[(0, 0)]),
  table.cell(fill: silver.lighten(70%),[A5]),
),
caption: [
  Summary of all configurations used to analyze photometric responses, points of view and illuminations (See @tab:geometries).
  ]) <tab:geometries_AMANI>

The @fig:apollo displays the new angle ($psi_(i)$) and ($psi_(e)$) from Apollo data, used to retreive $arrow(s)$ and $arrow(o)$ (respectively the Target $->$ Light and the Target $->$ Observer vecotrs).
$R_(arrow(v))(theta)$ represents the rotation of a vector around axis $arrow(v)$ of an angle $theta$.
From this representation and the data from @tab:geometries_ALRO}, we calculated back the subsolar and emergence vectors through @eq:compa_apollo_proj} and @eq:compa_apollo_subsol}, which are essential for the code pipeline and the Hapke reflectance  model.

#figure(muchpdf(read("../../src/figures/apollo.pdf", encoding: none), width: 70%), caption: [Representation of the normal plan from the target normal vector $arrow(n)$ with the incidence ($theta_0$) and incidence-north azimuth ($psi_i$). This figure clarify how the ALRO data where converted in order to use the code pipeline and the inversion. (#link("https://docs.google.com/drawings/d/1en8QgXlp7BVN-qraXoO7j_46CpqzoGximrZyuUnXTcw/edit?usp=sharing")[link to the drawing])]) <fig:apollo>

$
  "proj"_(arrow(n)_(perp))(arrow(s))=R_(arrow(n))(psi_i) times arrow(N)
$ <eq:compa_apollo_proj>

$
  arrow(s)=R_(arrow(k))(theta_0) times arrow(k)
$ <eq:compa_apollo_subsol>

=== Comparison results

@tab:proxy_A represents the efficiency $E$ for different scenarios. For a realistic lunar microtexture, Máni is better than LRO, even with 1 single orbit (5 images of orbit A1) versus 15 images of LROC.
Given our science goal of a maximum value of $E=0.69$, the optimum Máni scenario is with 3 orbits A1+A2+A4 at $10%$ noise/uncertainty level and 2 orbits A2+A4 at $5%$ noise & uncertainty level (corresponding to $2 times 2$ pixels binning).

As an illustration of these results, @fig:distribution_Mani_A2_A4_incert_0.05_versus_ALRO_incert_0.10 to @fig:distribution_Mani_A1_A2_A4_incert_0.10_versus_ALRO_incert_0.10 presents the results for the most typical lunar photometry.
In each of these figures, on left the Máni scenario is presented in comparison with the actual LROC data.
@fig:distribution_Mani_A2_A4_incert_0.05_versus_ALRO_incert_0.10 presents 2 Máni orbits at 10% noise/uncertainty level.
@fig:distribution_Mani_A2_A4_incert_0.05_versus_ALRO_incert_0.10 presents 2 Máni orbits at 5% noise/uncertainty level (corresponding to $2 times 2$ pixels binning).

@fig:distribution_Mani_A1_A2_A4_incert_0.10_versus_ALRO_incert_0.10 presents 3 Máni orbits at 10% noise/uncertainty level.
For all those cases, the improvement of Máni is clear in comparison to the LROC. This is due to the relative small range in phase and emergence angle in the LROC observation strategy.

In addition, Máni can achieve very high phase angle (larger than 90°) which is required to fully constraint the photometric parameters, as also noticed in cite{2015_Schmidt_ICA}.
To illustrate this point, the previous photometric inversion proposed on LROC data was ASSUMING the roughness $zeta$ cite{2014_Sato_JGRP}. With Máni, we will be able to actually constrain it.

#figure(table(columns: 7, align: horizon, stroke: none,
  table.header(
    table.cell(
      colspan: 7,
      fill: silver,
      [*Target at $26^°$ of latitude with $epsilon = 10%$*])
  ),
  table.cell(
    rowspan: 2,
    fill: silver,
    [*Nb. / Shots*]),
  table.cell(colspan: 2, fill: silver.lighten(70%), [$sigma = 10%$]),
  table.cell(colspan: 2, fill: silver.lighten(70%), [$sigma = 5%$]),
  table.cell(colspan: 2, fill: silver.lighten(70%), [$sigma = 2%$]),
  table.cell(fill: silver.lighten(30%), [Geometry]),
  table.cell(fill: silver.lighten(30%), [Proxy E]),
  table.cell(fill: silver.lighten(30%), [Geometry]),
  table.cell(fill: silver.lighten(30%), [Proxy E]),
  table.cell(fill: silver.lighten(30%), [Geometry]),
  table.cell(fill: silver.lighten(30%), [Proxy E]),

  table.cell(fill: silver.lighten(70%), [15]),
  table.cell(fill: silver.lighten(70%), [ALRO]),
  table.cell(fill: silver.lighten(70%), [4.8204]),
  table.cell(fill: silver.lighten(70%), [ALRO]),
  table.cell(fill: silver.lighten(70%), [3.9648]),
  table.cell(fill: silver.lighten(70%), [ALRO]),
  table.cell(fill: silver.lighten(70%), [2.8113]),

  table.cell(fill: silver.lighten(30%), [5]),
  table.cell(fill: silver.lighten(30%), [A1]),
  table.cell(fill: silver.lighten(30%), [3.6571]),
  table.cell(fill: silver.lighten(30%), [A2]),
  table.cell(fill: silver.lighten(30%), [3.0491]),
  table.cell(fill: silver.lighten(30%), [A4]),
  table.cell(fill: silver.lighten(30%), [1.7451]),

  table.cell(fill: silver.lighten(70%), [10]),
  table.cell(fill: silver.lighten(70%), [A2-4]),
  table.cell(fill: silver.lighten(70%), [1.5995]),
  table.cell(fill: silver.lighten(70%), [A2-4]),
  table.cell(fill: silver.lighten(70%), [0.7816]),
  table.cell(fill: silver.lighten(70%), [A1-2]),
  table.cell(fill: silver.lighten(70%), [0.2071]),

  table.cell(fill: silver.lighten(30%), [15]),
  table.cell(fill: silver.lighten(30%), [A1-2-4]),
  table.cell(fill: silver.lighten(30%), [0.8335]),
  table.cell(fill: silver.lighten(30%), [A1-2-4]),
  table.cell(fill: silver.lighten(30%), [0.3158]),
  table.cell(fill: silver.lighten(30%), [A1-2-3]),
  table.cell(fill: silver.lighten(30%), [0.0808]),

  table.cell(fill: silver.lighten(70%), [20]),
  table.cell(fill: silver.lighten(70%), [A1-2-3-4]),
  table.cell(fill: silver.lighten(70%), [0.7227]),
  table.cell(fill: silver.lighten(70%), [A1-2-3-4]),
  table.cell(fill: silver.lighten(70%), [0.2660]),
  table.cell(fill: silver.lighten(70%), [A1-2-3-4]),
  table.cell(fill: silver.lighten(70%), [0.0654]),

  table.cell(fill: silver.lighten(30%), [25]),
  table.cell(fill: silver.lighten(30%), [all]),
  table.cell(fill: silver.lighten(30%), [0.6399]),
  table.cell(fill: silver.lighten(30%), [all]),
  table.cell(fill: silver.lighten(30%), [0.2432]),
  table.cell(fill: silver.lighten(30%), [all]),
  table.cell(fill: silver.lighten(30%), [0.0598]),
), caption: [Best geometry combination per number for all photometry at $26^°$ of latitude, with the proxy of acceptable range set to $epsilon = 10%$]) <tab:proxy_A>

#figure(grid(columns: 2, gutter: 4mm, muchpdf(read("../../src/figures/corner_inversion_A2_A4-0.3_0.3_0.9_30_incert_0.05.pdf", encoding: none)), muchpdf(read("../../src/figures/corner_inversion_ALRO-0.3_0.3_0.9_30_incert_0.10.pdf", encoding: none))), caption: [Inversion distribution results for the Apollo 15 target. The photometry is set to typical lunar surface $omega=0.3$, $b=0.3$, $c=0.9$, $zeta=30$, $o=0.5$, $h=0.5$.
Noise/uncertainty level is set to 5% for Máni and 10% for ALRO. Due to the uncertainties on all available data, the black distribution, representing the solution's state of information, is spread around the true value.
The $epsilon=10%$ acceptable domain is in light red.
The maximum of likelihood is in green.
(left) for 2 Máni orbit, 10 images from orbit A2+A4.
The proxy is E=1.16 ($e^(-1.16)=31.2%$ of the acceptable solutions are within 10% margin)
(right) with the 15 images from LROC.
The proxy E=2.73. ($e^(-2.73)=6.6%$ of the acceptable solutions are within 10% margin).
The improvement of Máni is clear in comparison to LROC.
This is due to the relative small range in phase angle in the LROC observation strategy, that we surpass with Máni.]) <fig:distribution_Mani_A2_A4_incert_0.05_versus_ALRO_incert_0.10>

#figure(grid(columns: 2, gutter: 4mm, muchpdf(read("../../src/figures/corner_inversion_A1_A2_A4-0.3_0.3_0.9_30_incert_0.10.pdf", encoding: none)), muchpdf(read("../../src/figures/corner_inversion_ALRO-0.3_0.3_0.9_30_incert_0.10.pdf", encoding: none))), caption: [Inversion distribution results for the Apollo 15 target.
The photometry is set to typical lunar surface $omega=0.3$, $b=0.3$, $c=0.9$, $zeta=30$, $o=0.5$, $h=0.5$. Noise/uncertainty level is set to $10%$.
Due to the uncertainties on all available data, the black distribution, representing the solution's state of information, is spread around the true value.
The $epsilon=10%$ acceptable domain is in light red. The maximum of likelihood is in green.
(left) for 3 Máni orbit, 15 images from orbit A1+A2+A4.
The proxy is E=0.72 ($e^(-0.72)=48.5%$ of the acceptable solutions are within $10%$ margin).
(right) with the 15 images from LROC.
The proxy E=2.73. ($e^(-2.73)=6.6%$ of the acceptable solutions are within $10%$ margin).
The improvement of Máni is clear in comparison to LROC.
This is due to the relative small range in phase angle in the LROC observation strategy, that we surpass with Máni.]) <fig:distribution_Mani_A1_A2_A4_incert_0.10_versus_ALRO_incert_0.10>

== Slope correction

The surface roughness can induce the emergence, incidence and azimuth angles to be rotated around the normal axis.
This results in a wrong interpretation of the global mission geometry, particularly for our design where those parameters were supposed ideal without even taking in account other perturbations (e.g., crater steep sides, etc.).
In this section, we tackle this problem to see it's impact on the inversion results.

#figure(muchpdf(read("../../src/figures/slope.pdf", encoding: none), width: 70%), caption: [Representation of the inclined normal plan from the target normal vector $arrow(n)$ with the incidence ($theta^(phi)_0$), emergence ($theta^(phi)$), azimuth ($psi_(phi)$) and the slope ($phi$) angle. (#link("https://docs.google.com/drawings/d/1Qh6232aQ6U-wa7LYQtcmm8Fz741hWQIEuUCIvrPT1xM/edit?usp=sharing")[link to the drawing])]) <fig:slope>
