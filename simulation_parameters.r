# Parameters
pars <- c(a = 44, d = 0, t0 = 20, b = 10, c = 1)
# Function Gaussian + linear ramp
gal <- function(a, bins, t0, b, c, d) {
  a * exp(-0.5 * ((bins - t0) / b)^2) + c * (bins - t0) + d
}
# Vector of values of c
cc <- c(0, 0.1, 1, 2)
# Time
bins <- seq(0, 60, 0.1)

plot(0, 0, ylim = c(0, 70), xlim = c(0, 70), col = NA, 
     xlab = expression(italic(t)), ylab = expression(italic(R~(t))))
mtext(expression(
  italic(R(t))==italic(a*e^{frac((t-t[0])^2,2*b^2)}+c*(t-t[0])+d)
))
# plot different values of c
for(i in 1:4) {
  lines(bins, 
        gal(pars["a"], 
            bins = bins, 
            d = pars['d'], 
            t0 = pars['t0'], 
            b = pars['b'], c=cc[i]),
        col = i)
}
legend('topleft',
       title = expression(italic(c)),
       legend = cc,
       col = 1:4,
       lty = 1)
