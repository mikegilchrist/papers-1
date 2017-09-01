

dm <- runif(2, -0.5, 0.5)
deta <- runif(2, -1, 1)

s <- 1.1
phi <- seq(0.01, 10, by = 0.01)
expr <- rlnorm(1000, -(s^2)/2, s)

c.prob <- matrix(NA, ncol=3, nrow=1000)
c.prob[,1] <- exp(-dm[1] - deta[1] * phi)
c.prob[,2] <- exp(-dm[2] - deta[2] * phi)
c.prob[,3] <- 1
c.prob <- c.prob[,1:3]/rowSums(c.prob)

pdf(file = "~/Documents/Dissertation/papers/bioinformatics/dummy_cub.pdf", width = 5, height = 4.5)
log.phi <- log10(phi)
xlimit <- range(log.phi, na.rm = T)
plot(NULL, NULL, xlim=xlimit, ylim=c(-0.05,1.05), 
     xlab = "", ylab="", axes = T, lwd=2)

color <- c("darkgreen", "orange", "blue")

quantiles <- c(0, quantile(expr, probs = seq(0.05, 0.95, 0.05), na.rm = T))
mid.points <- NULL
for(i in 2:length(quantiles))
  mid.points <- c(mid.points, (quantiles[i] + quantiles[i-1])/2)

mid.prob <- matrix(NA, ncol=3, nrow=19)
mid.prob[,1] <- exp(-dm[1] - deta[1] * mid.points)
mid.prob[,2] <- exp(-dm[2] - deta[2] * mid.points)
mid.prob[,3] <- 1
mid.prob <- (mid.prob[,1:3]/rowSums(mid.prob))  + runif(19, -0.05, 0.05)

sd.val <- rep(0.1, 19) + runif(19, -0.05, 0.05)  

for(i in 1:3){
  points(log10(mid.points), mid.prob[, i], col=color[i], pch = 19)
  segments(log10(mid.points), mid.prob[, i] - sd.val[i], log10(mid.points), mid.prob[, i] + sd.val[i], col=color[i])
}

for(i in 1:3)
  lines(log.phi, c.prob[, i], col=color[i], lwd = 2)

text(mean(xlimit), 1, "Ile", cex = 1.5)
dev.off()


pdf(file = "~/Documents/Dissertation/papers/bioinformatics/dummy_expr_hist.pdf", width = 5, height = 4.5)
hist(log10(expr), lwd=2, freq = F)
lines(density(log10(expr)), lwd=2, col="blue")
dev.off()

