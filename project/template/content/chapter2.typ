//#import "@preview/algo:0.3.6": algo, i, d, comment, code

= Multifractal roughness <chapter2>

== Multifractal and cascade <sec:multi_cascade>

//At the origin, the repition of something with hereditary momentum

The cascade phenomena is a quite simple process that can be underlying complex mechanism.
Indeed, cascade are the core process of redodent and turbulent processes @lovejoy_weather_2013 such as cloud structures or surface topography.
This cascade idea goes back to 1941 from Kolmogorov law @kolmogorov_local_1991 and for the $beta$-model we will see in @sec:synthetic_topo to the Novikov-Stewart model @frisch_simple_1978.
Scaling or scale invariance data, made of a repeting pattern, are usually anaylised through multifractal tools.
They offer a great way to describe behviour that follows a law through different scale, of distance in our roughness case.  
Planetary topography is clearly turbulent across distance scale or/and time, fractals are a fantastic tool to characterize them such as quiescence volcanic plains to chaotics dead river's bed, see @fig:mars_river.

#linebreak()

#figure(image("../../src/figures/mars_river_bed.jpg", width: 50%), caption: [Mars view took by the Viking Oribter. Mosaic of the Schiaparelli hemisphere of Mars projected into point perspective, a view similar to that which one would see from a spacecraft. The images were acquired in 1980 during early northern summer on Mars.]) <fig:mars_river>

From a given signal $f$ possessing self similar properties, its statistical variability can be studied across scales using structure functions.
We first define the kind of variation we are interested in like @eq:differences or @eq:Haar, which will returns a scalar per specific conditions (at time $t$, scale $Delta x$, etc.). 
For all those scalars results we are then interested to look for the global scalling property through different scales, which is what the structure function @eq:struct_fun is used for.

The scale $Delta x$ is a subdivision value of the overall signal length $L$ (outer scale), for the roughness this characteristic is a distance in meter or pixels.  
As we said, to statistically quantify how the signal varies across different scales, it is common to use a tool called structure function.
This structure function of order $q in bb(R)^+$ at scale $Delta x$ can be defined as 

$
  S_q (Delta x) = 1/(N) sum_(x=1)^(N) abs(delta_(Delta x) f(x))^q 
$ <eq:struct_fun>
where for example
$
  delta_(Delta x) f(x) = f(x+Delta x)-f(x)
$ <eq:differences>

In the structure function, the order $q$ controls the sensitivity to variation.
Indeed, small $q$ emphasis frequent and typical variations, while large $q$ amplifies rare and extreme variations.
Structure function naturally follow a power-law scaling over a range of scales.

$
  S_q (Delta x) tilde chevron.l phi_q (Delta x) chevron.r Delta x^(q H)
\
  chevron.l phi_q (Delta x) chevron.r = (L/(Delta x))^(K(q))
$


Where the turbulent flux $phi$ is a multifractal cascade, $H$ represents the rate at which mean fluctuations grow $(H >0)$ or decrease $(H < 0)$ with scale and $K(q)$ the moment scaling function describing how the moment changes with scale.
The final definition can be expressed as

$
  #box(stroke: 0.7pt, inset: 10pt, $S_q (Delta x) tilde Delta x^(xi(q)), quad xi(q)=q H-K(q)$)
$ <eq:fractality_regime>

In the simplest case, $delta_(Delta x) f(x)$ is the increment. More generally, it can be replaced by multiresolution quantities such as wavelet coefficients in @sec:haar_flux.
$N approx n/(Delta x)$ in @eq:struct_fun is the number of fluctuations available at scale $Delta x$, for a signal of total length $n$. 
In the classical quasi-Gaussian case, where $K(q) = 0$, makes $xi(q)$ linear, this regime is called monofractal. 
However, for the results of a multifractal regime, $K(q)$ is generally non linear and convex and characterizes the intermittency.
For example, in Kolmogorov's (1941) theory @kolmogorov_local_1991, $f(x)$ is the velocity, $phi$ is the energy flux $epsilon^(1/3)$ and one obtains the scaling law $xi(q)=q. 1/3$.
Empirical multifractal analysis essentially consists of estimating the scaling $xi(q)$.
These scaling exponents are commonly involved in various data analysis tasks, such as detection, identification, or classification.

Over the last 30 years, structure functions based on differences and with concave rather than linear $xi(q)$ have been successfully applied to many geophysical processes (atmospheric @lovejoy_haar_2012 and geological @landais_multifractal_2019 processes).
It turns out that the use of differences to define the fluctuations is overly (and needlessly) restrictive.
The need to define fluctuations more flexibly motivated the development of new wavelets @foufoula-georgiou_wavelet_1994 & @torrence_practical_1998, which are now the widely used.
However for geological and surface study, the classical Haar fluctuation sometimes reffered as the “poor man’s wavelet” since it reduces to simple differences, is indeed robust, easy to understand and sufficient for our purposes.

== Multiscale analysis

Planetary geomorphism shine by its variety and uniqueness, from desertic teluric planets to gaz giants. These Geological processes, at the core of planets surface and atmosphere origin, took place across huge time-space scales.
To interpret the geometrical complexity of such phenomena, we consider $phi$ the underlying turbulent flux of the topography.
A widely used method is the Fourier analysis which outline the contribution of structures of a given frequency to the total variance of the proccess @lovejoy_haar_2012.

Before 1930, the main branch of mathematics leadings to wavelets began with Joseph Fourier and his theories of frequency analysis.
He asserted that any $2 pi"-periodic"$ function $f(x)$ is the sum

$
  a_0 + sum^(infinity)_(k=1)(a_k cos(k x)+b_k sin(k x))
$

of its Fourier series. The coefficients $a_0$, $a_k$ and $b_k$ are calculated by

$
  a_0 = 1/(2 pi) integral^(2pi)_0 f(x) d x, quad a_k = 1/pi integral^(infinity)_0 f(x)cos(k x) d x, quad b_k = 1/pi integral^(infinity)_0 f(x) sin(k x) d x
$

Fourier’s assertion played an essential role in the evolution of the ideas mathematicians had about the functions. 
He opened up the door to a new functional universe.

Naturally some mathematicians began to shift from frequency analysis to the notion of scale analysis.
That is, analyzing $f(x)$ by creating mathematical structures that vary in scale see @eq:struct_fun.
In our case, multiscale analysis were conduced through an elegant new way popularized by mandelbrot called fractals which also later led to multifractals.

The first mention of wavelets see @eq:Haar (fluctuations function) appeared in an appendix to the thesis of A. Haar (1909) @haar_zur_1910. 
One property of the Haar wavelet is that it has compact support, which means that it vanishes outside of a finite interval. 
Unfortunately, Haar wavelets are not continuously differentiable which somewhat limits their applications.
However, for clarity and simplicity, real-space analysis tools are preferable.
In this section we aim at caracterizing planets surfaces roughness properties for some reasons.

=== Haar fluctuations <sec:haar_flux>

A natural way to quantify fluctuations across scales is through increments, defined in @eq:differences. 
While simple, this definition has practical limitations: it may be sensitive to noise, and it only captures differences between two points, without accounting for the average variability within the interval @sanner_scale-dependent_2022.
To address this, wavelet-based approaches have often been used. 
In particular, the Haar wavelet provides a simple and robust framework for analyzing fluctuations across scales.
Its associated fluctuation function is denotated $cal(H)$.

$
#align(center, box(stroke: 0.7pt, inset: 10pt, $cal(H)(Delta x)=frac(2,Delta x) ( f(x)+f(x+ Delta x)-2 f(x+ (Delta x) /2))$))
$ <eq:Haar>

where

$
  f(x) = sum_(i=0)^(x)(f_i- chevron.l f chevron.r)
$ <eq:cum_centered>


The average resulting fluctuations at each scale can then be statistically characterized across multiple moments, the standard method is to evaluate the $q^("th")$ statistical moments.
For $q lt.eq.slant 2$, the generalized structure are defined, with $q=2$ corresponding to the classical case. We do not consider $q>2$ since the statistical moments may all depend on the largest value in the sample, spuriously leading to linear behavior in the exponent (and diverging as the sample size increases) @gagnon_multifractal_2006.
To reused what was previously explained in @sec:multi_cascade, the structure function function is now

$
  S_q(Delta x) = chevron.l abs(cal(H)(Delta x))^q chevron.r tilde Delta x^(xi(q))
$

Note that planetary data usually contains radial and horizontal uncertainty which also needs to be acounted. This parts needs more discussion and precision, letsjust define the dependence explicitly

$
  cal(H) = A f(x) + B f(x+(Delta x)/2) + C f(x + Delta x)
  \
  A = 2/(Delta x), quad B = -4/(Delta x), quad C=2/(Delta x)
$

Propagation of the variance

$
  sigma^2_(cal(H)) = (A^2 + B^2 + C^2) sigma^2_r
  \
  sigma_(cal(H)) = (sigma_r sqrt(24)) / (Delta x)

$

However since Haar fluctuation values are not inferior to 1, and $min(sigma_(cal(H)))= 0.0122$, the radial uncertainty is clearly neglibeable. Actually for the Mars MOLA/HRSC dataset the $min(sigma_(cal(H)))= 5.6"e-7"<<1$.

Now lets look at the horizontal uncertainties, supposed the measured point at horizontal $dash(x) = x + delta x$ with $delta x$ a random variable with a standard deviation $sigma_h$.

For the following results was used planetary data from #link("https://astrogeology.usgs.gov/search/map/mars_mgs_mola_dem_463m")[Mars MOLA]#footnote[https://astrogeology.usgs.gov/search/map/mars_mgs_mola_dem_463m], #link("https://astrogeology.usgs.gov/search/map/mars_mgs_mola_mex_hrsc_blended_dem_global_200m")[Mars MOLA/HRSC]#footnote[https://astrogeology.usgs.gov/search/map/mars_mgs_mola_mex_hrsc_blended_dem_global_200m], #link("https://astrogeology.usgs.gov/search/map/mercury_messenger_global_dem_665m")[Mercury MLA USGS]#footnote[https://astrogeology.usgs.gov/search/map/mercury_messenger_global_dem_665m], Mercury MLA from BepiColombo team, #link("https://astrogeology.usgs.gov/search/map/moon_lro_lola_dem_118m")[Moon LOLA]#footnote[https://astrogeology.usgs.gov/search/map/moon_lro_lola_dem_118m], #link("https://astrogeology.usgs.gov/search/map/moon_lro_lola_selene_kaguya_tc_dem_merge_60n60s_59m")[Moon LOLA/SELENE]#footnote[https://astrogeology.usgs.gov/search/map/moon_lro_lola_selene_kaguya_tc_dem_merge_60n60s_59m]. 
The following @fig:haar_basic, @fig:horizontal_corr and @fig:horizontal_vertical used the Mars MOLA/HRSC dataset, since it is at the moment the best DEM available for Mars and Mars being the most studied planets with the Haar wavelet method. 
All results are available in @appendix.

#figure(image("../../src/figures/Haar_horiz.svg", width: 60%), caption: [Haar horizontal fluctuations results for $q in [0,2]$ at each scale $Delta x in[2,L/2]$ from Mars MOLA HRSC 200m/pix dataset. In red are the pure horizontal mean fluctuations and in black its correction based on the altitude and row index, see @eq:correction. The differences is greater at low scales meaning high latitudes are in fact important and play a crucial role in the overall surface statistic properties.]) <fig:haar_basic>


We now need to consider the case of high latitudes deformation caused by equicylindrical projection of planetary data representation. The objectif is to replace the classic pixel indexing by the real scale in meter and to keep scale homogeneity across latitudes. To do so, for each row we compute a $cos(theta)$ correction:

$
  theta = pi(1/2-i/n)
\
  Delta overline(x) = (Delta x) /(cos(theta))
$ <eq:correction>

Where $i$ is the row number and $n$ the total number of rows. Note that $Delta overline(x)$ must also be paire and respect the $Delta x$ domain defintion.
We then use this new scale parameter in the algorithm loop and if the new scale calculated for a row is bigger than the overall row length, then we skip it.


#figure(image("../../src/figures/Haar_horiz_corr.svg", width: 60%), caption: [Haar horizontal fluctuations results for $q in [0,2]$ at each scale $Delta x in[2,L/2]$ from Mars MOLA HRSC 200m/pix dataset. In red are the pure horizontal mean fluctuations and in black its correction based on the altitude and row index, see @eq:correction. The differences is greater at low scales meaning high latitudes are in fact important and play a crucial role in the overall surface statistic properties.]) <fig:horizontal_corr>

The final mean Haar evalution across scales and directions needs to be equally consider through the horizontal and vertical. 
Since the data projection is equicylindrical, the total number of fluctuations per row $n_(Delta x)$ is bigger horizontally.
Perhaps, we need to compute how many fluctuations are performed per row per scale to tackle this problem.
The "weight" or number of fluctuations $omega$ is then used in the final result @eq:haar_mean.

$
  cal(H)= chevron.l omega,{cal(H)_>,cal(H)_or} chevron.r
$ <eq:haar_mean>

Note that the $>$ symbol represents the vertical direction from left to right and $or$ the vertical direction from top to bottom. 
To perform the vertical fluctuation of a matrix array, we simply applied a transposed operation which rotate clockwise the data.

#figure(image("../../src/figures/Haar_horizvsvert.svg", width: 60%), caption: [Haar fluctuations results for $q in [0,2]$ at each scale $Delta x in[2,L/2]$ from Mars MOLA HRSC 200m/pix dataset. In blue are the horizontal fluctuation corrected (see @fig:horizontal_corr), red the vertical fluctuations and black the weighted mean.]) <fig:horizontal_vertical>

As expected, their is no significant differences between vertical and horizontal fluctuations, which confirms statistical isotropy @landais_universal_2015. 
Note that a small perturbation around $350 "km"$ occurs, which could be explained by local geological features like Valles Marineris.

#figure(image("../../src/figures/Haar_flux_study.svg", width: 60%), caption: [Haar fluctuations results for $q in [0,2]$ at each scale $Delta x in[2,L/2]$ from Mars MOLA HRSC 200m/pix dataset. Comparison between 2 regimes, monofractal $<10 "km"$ and multifractal $>10 "km"$ The gradient color corresponds to the linear fit slope coefficient.]) <fig:haar_results>

The @fig:haar_results shows very interesting results where 2 regimes are clearly identificated, the first one below $10 "km"$ is monofractal and above is multifractal.
These regimes are very distinct with a net transition chosen experimentally.
From @eq:fractality_regime we retreived for each regime the fitted parameters $alpha, C_1$ and $H$ which emphasis our suggested 2 regimes behaviour.
Note that for $C_1<2"e-3"$ we consider monofractality.

#figure(image("../../src/figures/Haar_compa_Mars.svg", width: 60%), caption: [Haar fluctuations results for $q in [0,2]$ at each scale $Delta x in[2,L/2]$ from Mars MGS+HRSC DEM at 200m/pix in red and MGS DEM at 463m/pix in red. Comparison between two haar fluctuation results over the entire DEM of Mars for different resolution]) <fig:haar_compa_mars>

From this comparison we can ensure the conservation of statistical properties within the new enhanced resolution DEM HRSC+MGS. 
At high scales the values are conserved and at low scales they are slightly higher which is exactly what we were expecting, since the new detailed DEM increase the overall mean height differences. 
This demonstrates a great tool to analyze and verify upscalling methods.
However, we also applied the same study on many different dataset and results needs to be more carefully detailed.

#figure(image("../../src/figures/Haar_compa_Mercury.svg", width: 60%), caption: [Haar fluctuations results for $q in [0,2]$ at each scale $Delta x in[2,L/2]$ from Mercury Messenger DEM from Preusker at 200m/pix in red and Messenger DEM from Becker at 665m/pix in blue. Comparison between two haar fluctuation results over the entire DEM of Mars for different resolution]) <fig:haar_compa_mercury>

Clear exemple of what we should more detailed what is hapening !!

#figure(image("../../src/figures/Haar_compa_Lune.svg", width: 60%), caption: [Haar fluctuations results for $q in [0,2]$ at each scale $Delta x in[2,L/2]$ from Mars MGS+HRSC DEM at 200m/pix and MGS DEM at 463m/pix datasets. Comparison between two haar fluctuation results over the entire DEM of Mars for different resolution]) <fig:haar_compa_moon>

== Multifractal generator

Several probability distributions can serve as potential candidates for modeling random fields. 
Among them, the Gaussiand distribution is by far the most commonly employed in the literature, owing to its mathematical simplicity and its deep connection with the central limit theorem.
The Gaussian assumption is often motivated by the underlying physics of the problem and, in many cases, allows for analytical or closed-form solutions. 
However, when the field exhibits strong intermittency or heavy-tailed behavior, Gaussian statistics become inadequate.

A class of distribution that generalizes the Gaussian while accounting for heavier tails is the Lévy $alpha$-stable family. 
Multifractal fields, in particular, with often pronounced intermittency and extreme fluctuations.
Those characteristics are commong in planetology, especially in planetary topographes such as the Valles Marineris on Mars.
To realistically generate synthetic topographies with multifractal structures, an $alpha$-stable distribution with power-law tails provides a more accurate representation of these rare and large deviations that Gaussian models fail to capture.

At the core of additive multifractal cascade models lies the requirements for an $alpha$-stable distribution.
Indeed, propagating and conserving coherent statistical properties through successive cascade levels (the so-called $alpha$-model) necessitates the use of independent, identically distributed, heavy tailed random variables that exhibit sum-stability.
This property ensures that the statistical form of the distribution remains invariant under aggregation, thereby preserving the self-similar structure of the multifractal field across scales.

=== Stable random variables generator 

In probability theory, a distribution is called stable if a linear combination of two independent random variables has in result the same distribution.
The stable distribution family, also called the Lévy $alpha$-stable distribution can easily be constructed with a numerical method (see Weron 1991 @weron_chambers-mallows-stuck_1996 for full proof) :

$
  X = S_(alpha,beta) sin(alpha (V+B_(alpha,beta)))/ (cos(V)^(1/alpha)) (cos(V-alpha(V+B_(alpha, beta)))/W)^((1-alpha)/alpha)
  \
  B_(alpha, beta) = arctan(Beta tan((pi alpha)/2))/(1-abs(1-alpha))
  \
  S_(alpha, beta)=(1+(-beta tan((pi alpha)/2))^2)^(1/(2 alpha))
$

Note that this methods is valid for $alpha in ]0,2]$ and $alpha eq.not 1$ and $beta in [-1,1]$.
Generate a random variable $V$ uniformly distributed on $(-pi/2, pi/2)$ and an independent exponential random variable $W$ with mean $lambda=1$. 

=== FIF generator

$
  Gamma_lambda (x) = C_1^(1/alpha) integral_(bb(R)^D) frac(lambda_0^alpha (d x'),abs(x - x')^(D - H)) - "var"(alpha) "log"(λ), quad quad "var"(alpha) = frac(C_1,alpha-1)
$

$
  integral_(bb(R)^D) frac(lambda_0^alpha (d x'),abs(x - x')^(D - H)) approx sum_()^(i) frac(X_i (Delta x^D),abs(x - x_i)^(D - H))
$

== Synthetic topography modeling <sec:synthetic_topo>

Synthetic topography is found in many distinct study fields, from games, agriculture up to AI image generation.
At the core of generating synthetic topography lies the fondamental use of random distribution. These distributions represents the underlying physics for different geological terrain particularity (crater, canyon, plains, mountains, etc.) and can be categorized by 2 main fractal regime as described in @tab:models. The monofractal, which is the repetition of the same pattern at each scale and the multifractal, which is a repition of a pattern evolving across different scales.

#figure(table(
  columns: 3,
  align: center,
  stroke: 0.7pt,
  table.header(
    table.cell(fill: silver, stroke: 0pt, [*Model*]),
    table.cell(fill: silver, stroke: 0pt, [*Field*]),
    table.cell(fill: silver, stroke: 0pt, [*Fractal law*])),
  table.cell(fill: silver.lighten(70%), align: horizon, stroke: 0pt,[Monofractal fLm]),
  table.cell(fill: silver.lighten(70%), align: horizon, stroke: 0pt,[$H' = H + d/alpha$ \ #box(stroke: 0.7pt, inset: 7pt, $v(underline(r))=gamma_alpha * abs(underline(r))^(-(d-H'))$)]),
  table.cell(fill: silver.lighten(70%), align: horizon, stroke: 0pt,[$xi(q)="{"^(q H, quad q<alpha)_(infinity, quad q>alpha)$]),
  table.cell(fill: silver.lighten(30%), align: horizon, stroke: 0pt,[Multifractal FIF]),
  table.cell(fill: silver.lighten(30%), align: horizon, stroke: 0pt,[$H_(alpha')=d/alpha' " | " alpha'=alpha/(alpha-1)$ \ $Gamma prop C_1^(1/alpha) gamma_alpha * abs(underline(r))^(-(d-H_(alpha^')))$ \ #box(stroke: 0.7pt, inset: 7pt, $v(underline(r))=e^Gamma*abs(underline(r))^(-(d-H))$)]),
  table.cell(fill: silver.lighten(30%), align: horizon, stroke: 0pt,[$xi(q)=q H-K(q)$]),
), caption: [A comparison of various scaling models for $v$ showing the essential similarities and differences in their mathematical structure, fractal power law. The $gamma_alpha$ term is described by the CMS #footnote[Chambers Mallows Stuck] method, $xi(q)$ a linear structure function
exponent of the field fractality]) <tab:models>

To avoid huge numerical time computing, we used the frequency domain and transformed the multifractal generation model kernel in:

$
  abs(underline(r))^(-(d-H)) arrow^("F.T") abs(underline(k))^(-H)
$

Sans restriction sur la valeur de $alpha$, une infinité de couple de paramètre (H, a) peuvent conduire aux mêmes fonctions de structures (Mezemate, 2014). 
Cette ambiguité (appelée équifinalité) n’est pas sans conséquence sur les résultats.

Dans la littérature, le modèle généralement invoqué pour décrire un comportement mul-
tifractal est le celui dit «log-normal» qui fixe ↵ =2en faisant varier C1.

La valeur du degré de multifractalité ↵ contrôle la hiérarchie des
extrêmes. La valeur maximale ↵ =2est celle qui traduit l’organisation la plus complexe
avec une large gamme de valeurs extrêmes présentes dans le champ.

Visuellement, la
topographie synthétique correspondante est composée de « montagnes » de hauteurs très
variées. Quand le degré de multifractalité baisse (↵ < 2), cette hiérarchie tend à se sim-
plifier. Les zones lisses deviennent plus homogènes et les « montagnes» se ressemblent.
La limite ↵ =0(irréaliste pour décrire la topographie) est une version continue du modèle
monofractal  qui définit une hiérarchie d’extrêmes triviale où toutes les valeurs du flux
à une résolution donnée sont égales entre elles ou nulles. Le champ est alors intermittent
mais pas multifractal
=== Deconvolution using Levy generator method

In this part we tackle the upscalling of a digital elevation model, through the height statistical conservation of a field. 
We simply started with a code to generate synthetic topography @fig:3D_field using levy-alpha stable distribution see @fig:3D_noise and then a tool that downscale the initial generated field. 
Then inverse the $e^Gamma$ value @fig:3D_noise_alpha and add n cascade @lovejoy_weather_2013 to it to mimic what could have been lower scale noise.
Finally we regenerate the topography.
The full pipeline is described here //@alg:upscalling .

$
  v(underline(r))*abs(underline(r))^((d-H))=e^Gamma
  \
  #box(stroke: 0.7pt, inset: 7pt, $log(v(underline(r))*abs(underline(r))^((d-H))) times C_1^(-1/alpha) * abs(underline(r))^((d-H_alpha')) = Gamma$)
$

To verify the validity of our model we implemented 2 new pipeline.
The first one validate the self loop of the deconvolution for an upscale set to 1. 
We start from a synthetic fractal field created from the classic method using Fourier convolution, and we inverse it back to see if we retreive the initial noise used to initialie the synthetic fractal field.
When this loop is verified, next the homogeneity in the global pipeline needs to be checked.
For that, we simply start again from a synthetic fractal field created from the classic method using Fourier convolution, then downscaled $n$ times.
This "blured" new fractal field act as the image retreived in real life, which needs to be upscaled. 
We took this downscaled fractal field and inversed it only for the first convolution @tab:models, resulting in $e^Gamma$, we will call it "alpha noise". 
From this alpha noise, can be added new cascade (we avoid recoputing the convolution in Fourier) $n$ times, resulting in a statistical similar fractfield, with new small scale features but with respect to the field nature.

This approach uses a discret numerical reconstruction (adding cascade) to a coninuous cascade made fractal field.
However, a problem occurs, due to the generation of small 2x2 noise to construct the next scale cascade. 
We see a discountinuity between each new 2x2, it feels like the overall $n+1$ cascade doesnt have a global behaviour link.
While, if we generate the noise for the $n+1$ cascade of size dim*2, we obtain way more smooth results, with coherent global behaviour.

$
  cal(P)(mu_epsilon = lambda^(gamma_+))=lambda^(-c) 
  \
  cal(P)(mu_epsilon = lambda^(gamma_-))=1-lambda^(-c) 
$


#figure(grid(columns: 2, gutter: 0mm, image("../../src/figures/graph_noise_64.svg", width: 110%), image("../../src/figures/graph_noise_32.svg", width: 110%)), caption: [BLABLABLA]) <fig:3D_noise>

#figure(grid(columns: 2, gutter: 0mm, image("../../src/figures/graph_alpha_64.svg", width: 110%), image("../../src/figures/graph_alpha_32.svg", width: 110%)), caption: [BLABLABLA]) <fig:3D_noise_alpha>

#figure(grid(columns: 2, gutter: 0mm, image("../../src/figures/graph_field_64.svg", width: 110%), image("../../src/figures/graph_field_32.svg", width: 110%)), caption: [BLABLABLA]) <fig:3D_field>

=== Fourier filtering

We discovered that by generating cascade to enhance the resolution, appears squared artefact.
This affect the result, especially for high scale variation when we reconstruct the upscaled field.
First intuition is to use a Fourier filter that remove border frequency.

#figure(grid(columns: 2, gutter: 0mm, image("../../src/figures/FourierHPF_filterS.svg", width: 100%), image("../../src/figures/FourierHPF.svg", width: 100%)), caption: [BLABLABLA]) <fig:Fourier_HPF_S>

To distinguish the added topography from the cascade method, we implemendted a Fourier filter which seperates the new frequencies corresponding to small scales smaller than the upscaling coefficient and high scales, the rest.

$
  G(omega)=1/(sqrt(1+omega^(2n)))
$ <eq:butterworth_filter>


=== Formation UQ ed SMEMAG

*Day 1:*

Theory (Hapke) $arrow$ Exp. (Photo-gonio meter) $arrow$ Model (BRDF) $arrow$ Num. (MC Inversion) $arrow$ Pred.

- [Num.] Uncertainties propagation (Many measurements)

Note: known and unknown uncertainty

- [Model] Modeling of uncertainties (Local measurement)

- [Pred.] Decision under uncertainty (Accept, reject of create uncertainties model)

Note: needs of a robust control or optimization and a sensitivity analysis

*Slide 1-4*:  VVUQ required for Haar fluctuation and MCMC Inversion

*Slide 1-8*: $xi$ is the x-absiss, $cal(P)(xi)$ the green distribution, $X$ the red line and $cal(P)(X)$ the output distribution y-ordo.

*Slide 2-2*: Theorem central lim says that N times the average tends to the true mean and the proba tends to the normal gaussian distribution

*Slide 2-11*: Symetrization of Integrand, symetrization of only the parameter we want 
$X(xi)=X(xi_1, ..., xi_N)$ which can be decomposed in $G(xi_1)+F(xi_1, ..., xi_N)$ for $xi_1$ being the dominant weight parameter

*Slide 2-2*: We can inverse the distribution and get back through the $"CDF"^(-1)$ the original law (and parameters ?)

*Slide 3-6* histograms kernel appro for true density

*Day 2:*

*MCMC* method:

${xi^((i)), quad i=1,...,N}$

transition probability $arrow$ $P_T (xi^((i+1)) divides xi^((i)))$

such that $lim_(i arrow infinity) xi^((i)) tilde cal(P)_xi$

Drawing random samples from multivariate Gaussian distribution.

$N(mu, Sigma^2), quad mu in RR^d, quad Sigma^2 in RR^(d.t)$, symetric positive matrix.

$xi = vec(xi_1, xi_2) tilde N(mu, Sigma^2)$ and $Sigma^2_(i j) = EE[xi_i xi_j]-mu_i mu_j$

We have a random number generator to draw $eta tilde N(0, 1)$

Cholesky decomposition (not robust if low values on the diag):

$Sigma^2 = L L^T arrow vec(xi_1, ..., xi_d)(omega), quad EE((xi-mu)(xi-mu)^T) = L L^T$

Eigen decomposition:

$Sigma^2 = U and U^T, quad U "is unity", quad and="dig"(lambda_i)$

*Day 3:*

Data / parameters uncertain

$D(Theta) in cal(P)(theta, xi(theta), mu(theta))$

Model (deterministic)

$cal(M)(u(theta), D(theta))=0$

Quantity of interested

$Phi(u(theta)) in cal(P)$

Polynomial Chaos expansions (Wioner 1938, Cameron and Martin 1947, Charum and spanos 1991)

Wiener: $a(theta)$ a random quantity that behaves reasonnably, then 

$
  a(theta)= lim_(N arrow infinity) a_0 Gamma_0 + sum_(i_1=0)^N a_(i_1) Gamma_1(xi_(i_1)(theta))+ sum_(i_1=0)^N sum_(i_2=i_1)^N a_(i_2) Gamma_2(xi_(i_1)(theta), xi_(i_2)(theta)) + ...
$ 
$Gamma_i$ represant a polynomial of degree $i$ and $xi_1, ..., xi_N$ are iid standard gaussian RV.

Uncertainty germ $xi_1, ..., xi_N$ $arrow$ transformed by polynomial to get approximate the initial randaum variable.

GPC pour retrouver la distribution d'un field multifractal avec un la combinaison de plusieurs differentes distribution qui aurait ou non des input independents. 
Method 1: stochastic galerkin projection (conacter olivier si des questions)

Method 2: Non intrusive