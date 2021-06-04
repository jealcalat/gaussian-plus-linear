# NOTA: acentos omitidos intencionalmente
# Regresion de minimos cuadrados no lineales de la funcion gaussiana con rampa
# tasa_r ~ a * exp(-0.5 * ((bins - t0) / b)^2) + c * (bins - t0) + d
# t0 es el tiempo pico
# a + d es la tasa en pico (sumada)
# b es la desviacion estandar, pero la funcion que hice cambia el nombre a sd

# Inputs:
#     name_x: nombre de la variable en x (e.g., "bins")
#     name_y: nombre de la variable en y (e.g., "tasa_r")
#     datos:  data.frame que debe tener las columnas referenciadas en name_#
#     start_par: parametros de inicio
#     lower_par: limites inferiores de los parametros
#     upper_par: limites superiores de los parametros
#       Nota sobre parametros: dado que se usara optimizacion con restricciones,
#       los parametros estaran sujetos a limites, por debajo o por encima de los
#       cuales los parametros no pueden tomar valores. POr ejemplo, b y t0 no
#       pueden ser negativos. Deben elegirse de forma sensible
# Output:
#     Retorna un objeto de class "nls" con los parametros ajustados


robust_grid_gauss_lin_nls <- function(name_x,
                                      name_y,
                                      datos,
                                      start_par = c(a = 44, d = 20, t0 = 20, b = 10, c = 1),
                                      lower_par = c(a = 1, d = 1, t0 = 0, b = 1, c = -0.5),
                                      upper_par = c(a = 200, d = 40, t0 = 60, b = 20, c = 15),
                                      algoritmo = "random-search") {
  # termino de error name_x - t0
  error <- paste("(", name_x, "- t0)")
  gfun <- paste("a * exp(-0.5 *", "(", error, "/", "b)^2)+c*", error, "+d")
  # Funcion objetivo
  obj_fun <- as.formula(paste(name_y, gfun, sep = " ~ "))
  
  fit.nlxb <- nlxb(obj_fun,
                   data = datos,
                   start = start_par,
                   lower = lower_par,
                   upper = upper_par
  )
  #  coefs <- fit.nlxb$coefficients
  
  fit.nls <- nls2(obj_fun,
                  data = datos,
                  start = fit.nlxb$coefficients,
                  algorithm = algoritmo,
                  control = nls.control(maxiter = 10000)
  )
  fit.nls
}
