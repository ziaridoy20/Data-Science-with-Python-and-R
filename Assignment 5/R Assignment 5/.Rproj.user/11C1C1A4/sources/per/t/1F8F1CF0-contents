D <- c(0, 0, 1, 2, 0, 2, 2, 1, 1)

lamdas <-seq(0,4,length.out = 201)

likelihood <-sapply(lamdas, function(lamda) 
  {return(prod(dpois(D, lamda)))})
prior <-dunif(lamdas, min = 0, max = 4, log = FALSE)

posterior = prior * likelihood

#sampling from a distribution
plot(lamdas,posterior, type = 'l',col='purple')

