library(datasets)
data(mtcars)

# 3
x_bar<-mean(mtcars$mpg)
t.test(mtcars$mpg, mu=x_bar)

# 4
g_4<-mtcars[mtcars$cyl==4,"mpg"]
g_6<-mtcars[mtcars$cyl==6,"mpg"]
t.test(g_4, g_6,var.equal=FALSE, paired=FALSE,alternative="two.sided")

2*p-value<5%, reject H0 

# 5
3.0 + c(-1,1)*qnorm(0.975)*1.1/sqrt(100)

# 6
binom.test(x=55,n=100,p=0.5,alternative="greater")
pbinom(54, size = 100, prob = 0.5,lower.tail=FALSE)

# 7
poisson.test(x=15800, T = 30, r = 520, alternative = "greater")
ppois(15800-1, 520*30, lower.tail = FALSE)
p-value=0.05533 >5%, fail to reject H0

# 8
mean_a<-10
n_a<-100
mean_b<-11
n_b<-100
S<-4
ts<-(mean_b-mean_a)/S/sqrt(1/n_a+1/n_b)
pvalue<-2*pnorm(abs(ts),lower.tail = FALSE)

pvalue=0.077 > 0.05, fail to reject H0

# 10: power.t.test是for T test的，题目要求是Z
miu0<-10
miua<-11
n<-100
S<-4
alpha<-0.05
Z<-qnorm(1 - alpha)

pnorm(miu0+Z*S/sqrt(n), mean=miua, sd=S/sqrt(n), lower.tail = FALSE)
# Z: power = 0.8037649

# T-test：power=0.7989855, 所以 Z和t，结果是有差异的
power.t.test(n,delta=11-10, sd=S, type="one.sample", alternative = "one.sided")

# 11
miu0<-0
miu_a<-0.01
S<-0.04
alpha<-0.05
Z<-qnorm(1 - alpha)

# T-test 和 Z-test很接近，先用T Test获得一个大致的范围，然后再通过实验获得
power.t.test(delta=miu_a-miu0, sd=S, power=0.8,alternative="one.sided",type="one.sample")
ns<-matrix(c(98,99,100,101,102))
powers<-apply(ns, 1, function(n) {
  pnorm(miu0+Z*S/sqrt(n), mean=miu_a, sd=S/sqrt(n), lower.tail = FALSE)
})

ns<-data.frame(n=c(98,99,100,101,102))
powers<-apply(ns, 1, function(n) {
  pnorm(miu0+Z*S/sqrt(n), mean=miu_a, sd=S/sqrt(n), lower.tail = FALSE)
})
cbind(ns, powers)

取pwoers>0.8的最小值n=99

#13
g_6<-mtcars[mtcars$cyl==6,"mpg"]
g_8<-mtcars[mtcars$cyl==8,"mpg"]
t.test(g_8, g_6,var.equal=TRUE, paired=FALSE,alternative="two.sided")

Z-test:
  miu_6<-mean(g_6)
  miu_8<-mean(g_8)
  n_6<-length(g_6)
  n_8<-length(g_8)
  S_6<-sd(g_6)
  S_8<-sd(g_8)

  Z<-qnorm(1 - 0.05)
  Sp<-sqrt(((n_6-1)*S_6^2+(n_8-1)*S_8^2)/(n_6+n_8-2))
  Zs<-miu_8-miu_6/(Sp*sqrt(1/n_6 + 1/n_8))
  2*pnorm(abs(Zs), lower.tail = FALSE)


