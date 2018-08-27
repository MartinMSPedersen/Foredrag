library(rgl)

mt <- matrix(runif(3e5), ncol=3, byrow=TRUE)
plot3d(mt, xlab="", ylab="", zlab="")
rgl.viewpoint(theta = -3, phi = 3, fov = 0, zoom = 0.7)



