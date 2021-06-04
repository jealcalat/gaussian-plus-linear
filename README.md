**R code used in the analysis of "Similar attention and performance in female and male CD1 mice in the peak procedure"** (Eudave, Alcalá, Buriticá & dos Santos, 2021)

## Gaussian plus linear ramp

Frequently used to analyze the response function in the peak procedure. 

The equation is

<img src="https://latex.codecogs.com/svg.image?R(t)=a\times&space;e^{-0.5\big[\frac{t-t_0}{b}\big]^2}&space;&plus;&space;c\times&space;(t-t_0)&plus;d" title="R(t)=a\times e^{-0.5\big[\frac{t-t_0}{b}\big]^2} + c\times (t-t_0)+d" />

The R script `simulation_parameters` shows behavior of the free parameter _c_. 

 <img src="https://github.com/jealcalat/gaussian-plus-linear/blob/main/c.png" width="500px"/>

The R script `gauss_lin_nls` have a function to fit the Gaussian+linear model using `nlxb`, the Nash variant of the Marquardt nonlinear least squares (with instructions in spanish; sorry).

## Individual trial analysis

The function used is implemented and explained here:

[Individual trial analysis](https://github.com/jealcalat/start_stop_peak_procedure)

## FWHM

See the script `FWHM`, also see Buriticá & Alcalá, 2019, [Appendix A. Supplementary data](https://www.sciencedirect.com/science/article/abs/pii/S0376635719300816)

