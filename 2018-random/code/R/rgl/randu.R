library("rgl")
randu_fun <- function(B = 100, seed = 0, a = 65539, m = 2^31) {
    out <- rep(0, B)
    if (seed == 0) 
        seed <- as.numeric(format(Sys.time(), "%s"))
    out[1] <- (a * seed)%%m
    for (i in 1:(B - 1)) {
        out[i + 1] <- (a * out[i])%%m
    }
    return(out/m)
}

randu <- matrix(randu_fun(seed=1, B=300000), ncol=3, byrow=TRUE)
plot3d(randu, xlab="", ylab="", zlab="")
rgl.viewpoint(theta = -3, phi = 3, fov = 0, zoom = 0.7)



