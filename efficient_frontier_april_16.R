
# Mean Variance analysis

## Efficient Frontier

### expected returns for five risky assets

m <- c(0.45,2.36, 1.29,1.99, 1.34)

### variance covariance matrix

V <- matrix(c(21.9,  8.4,  7.9, 11.3,  8.4,
              8.4, 12.2, 20.9,  7.9, 12.2, 
              7.9, 20.9, 11.3, 20.9, 13.0,
              11.3,7.9,  20.9,  6.42,  9.82,  
              8.4, 12.2,  13, 9.82 ,11.52)
            ,5,5)


# Generate portfolios

## A N by 4 matrix where N is number of portfolios

N <- 10000

w0 <- matrix(rnorm(5*N), N, 5)
rowSums(w0)
# normalize weights by dividing each row by the rowsum


W <- w0/rowSums(w0)

myMeans <- rep(0,N)
myStd <- rep(0,N)

# calculate mean and std dev for 10th portfolio

w <- W[10,]

myMeans[10] <- m %*% w

myStd[10] <- (w %*% V %*% w)^0.5

# calculuate mean and std dev for all portfolios

for(i in 1:N){
  w <- W[i,]
  
  myMeans[i] <- m %*% w
  
  myStd[i] <- (w %*% V %*% w)^0.5
}



myMeans
myStd

plot(myStd, myMeans, col="blue",pch=25,
     xlim = c(0,10), ylim = c(-10,10))

