library(rstan) # For STAN from R.
library(rethinking) # For ULAM from R.
set.seed(1)

# Simmulation (hidden).
prob <- 0.2
D <- rbinom(18, 1, prob = prob)

# Modeling ULAM.
model <- ulam(alist(
  D ~ dbinom(1, prob),
  prob ~ dunif(0, 1)
), data = list(D = D))

samples <- extract.samples(model)
hist(samples$prob)

# Modeling STAN.
model <- stan(model_code = "
data{
    int <lower=0> N;
    int D[N];
}
parameters{
    real<lower=0,upper=1> prob;
}
model{
    prob ~ uniform( 0 , 1 );
    D ~ binomial( 1 , prob );
}
", data = list(D = D, N = length(D)), chains = 1)

samples <- extract(model)
hist(samples$prob)
