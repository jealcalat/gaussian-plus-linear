# gaussian-plus-linear
Frequently used to analyze the response function in the peak procedure. 

The equation is

<img src="https://latex.codecogs.com/svg.image?R(t)=a\times&space;e^{-0.5\big[\frac{t-t_0}{b}\big]^2}&space;&plus;&space;c\times&space;(t-t_0)&plus;d" title="R(t)=a\times e^{-0.5\big[\frac{t-t_0}{b}\big]^2} + c\times (t-t_0)+d" />

The R script `simulation_parameters` shows behavior of the free parameter _c_. 

 <img src="https://github.com/jealcalat/gaussian-plus-linear/blob/main/c.png" width="500px"/>

The R script `gauss_lin_nls` have a function to fit the Gaussian+linear model using `nlxb`, the Nash variant of the Marquardt nonlinear least squares.
