N <- 100000
randu <- matrix(0, ncol=3, nrow=N)
##Simulate from the randu random number generator
new_z <- 1

for(i in 1:N) {
  new_x <- (65539*new_z) %% 2^31
  new_y <- (65539*new_x) %% 2^31
  new_z <- (65539*new_y) %% 2^31
  randu[i,] <- c(x=new_x/2^31, y=new_y/2^31, 
                   z=new_z/2^31)
}


##Simulate from the RNG in R
g <- matrix(0, ncol=3, nrow=N)
for(i in 1:N) {
  new_x <- runif(1)
  new_y <- runif(1)
  new_z <- runif(1)
  g[i,] <- c(x_g=new_x, y_g=new_y, z_g=new_z)
}

##Plot the results

png("RANDU.png", width = 800, height = 800)

op <- par(mfrow=c(1, 2), mar=c(3,3,2,1), mgp=c(2,0.4,0), tck=-.01, cex.axis=0.9, las=1)
plot(randu[,3], 9*randu[,1] - 6*randu[,2], ylim=c(-6, 10),
     xlab="", ylab="", cex=0.5,panel.first=grid(), pch=21, bg="#5582A9",
     frame=FALSE, axes=FALSE, lwd=0.5)
title("RANDU", adj=0, cex.main=1.2, font.main=2, col.main="black")

plot(g[,3], 9*g[,1] - 6*g[,2], ylim=c(-6, 10),
     xlab="", ylab="", cex=0.5,panel.first=grid(), pch=21, bg="#5582A9",
     frame=FALSE, axes=FALSE, lwd=0.5)
title("Standard rng", adj=0, cex.main=1.2, font.main=2, col.main="black")
dev.off()

par(op)


