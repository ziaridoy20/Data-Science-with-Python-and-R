install.packages("plotly")

library(plotly)
D <- c(0.3120639, 0.5550930, 0.2493114 ,0.9785842)


mu_s <- seq(0,1,length.out = 201)
sigmas_s <- seq(0,1,length.out = 201)

n  = 201
out <- numeric(n)
for(i in 1:n) {
  out[i] <- prod(dnorm(D, mean = mu_s[i], sd = sigmas_s[i]))}


mu_prior <- dunif(mu_s, min = 0, max = 1, log = FALSE)
sigma_prior <- dunif(sigmas_s, min = 0, max = 1, log = FALSE)
posterior = out * mu_prior * sigma_prior


plot(mu_s,posterior, type = '1',col='purple')

fig <- plot_ly(x = ~mu_s, y = ~sigmas_s,color = ~posterior, size = ~posterior)

fig
