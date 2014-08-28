Q1:
baseline<-c(140,138,150,148,135)
  week2<-c(132,135,151,146,130)
  t.test(baseline, week2, paired=TRUE, alternative="two.sided")

Q2:
  fail to reject: abs(TS)<Z(1-alpha/2)
  abs(TS) = abs((miu - miu0)/S*sqrt(n)) < Z(1-alpha/2)
  abs(1100 -miu0) < qt(0.975,9-1)/sqrt(9)*30
  miu0: 1100 + c(-1,1) * qt(0.975,9-1)/sqrt(9)*30
 
Q3:
二选一分布, 可乐比百事多，则4个里面，可乐占3和4个
  pbinom(2, size = 4, prob = 0.5, lower.tail = FALSE)
或：
  binom.test(x=3,n=4,p=0.5,alternative="greater")

Q4: 
  Poisson分布

  poisson.test(x=10, T = 1787, r = 1/100, alternative = "less")

Q5: 
treated_mean<--3
treated_sd<-1.5
treated_n<-9
placebo_mean<-1
placebo_sd<-1.8
placebo_n<-9

# 2 year = 26 * 4weeks
# Poisson分布:
  lamda<- placebo_mean - treated_mean
  t<-52*2/4
  lamda0<-lamda*t
  poisson.test(x=0, T=52*2/4, r=lamda/4, alternative="two.sided")

# 感觉有点不太对，用bootstrap抽样仿真：
B<-52*2/4
sample_treated<-rnorm(treated_n, mean=treated_mean,sd=treated_sd)
sample_placebo<-rnorm(placebo_n, mean=placebo_mean,sd=placebo_sd)
resample_treated<-matrix(sample(sample_treated, treated_n * B, replace = TRUE),B,treated_n)
resample_placebo<-matrix(sample(sample_placebo, placebo_n * B, replace = TRUE),B,placebo_n)
re_mean_treated<-apply(resample_treated, 1, mean)
re_mean_placebo<-apply(resample_placebo, 1, mean)
t.test(re_mean_treated, re_mean_placebo, alternative="two.sided",var.equal=TRUE)

# 上面是以4weeks为单位，是不是应该以2year为单位呢?
resample_treated<-sample(sample_treated, treated_n * B, replace = TRUE)
resample_placebo<-sample(sample_placebo, placebo_n * B, replace = TRUE)
t.test(resample_treated,resample_placebo,alternative="two.sided",var.equal=TRUE)

# 复杂计算：
Sp<-sqrt(((treated_n-1)*treated_sd^2+(placebo_n-1)*placebo_sd^2)/(treated_n+placebo_n-2))
ts<-treated_mean - placebo_mean /(Sp*sqrt(1/treated_n+1/placebo_n))
2*pnorm(abs(ts), lower.tail = FALSE)

# 以上都可以得到 pvalue<0.01, 但是具体的数值都不一样！！！

Q7:
  X_bar<-0.01
  S<-0.04
  n<-100
  alpha<-0.05
  miu0<-0

用定义：
  Z(1-alpha)=qt(0.95, n-1)=1.660391
  (X_bar - miu0)/S*sqrt(n) = 2.5

  power = P(Z>1.66-2.5) = P(Z>-0.84)
  pnorm(-0.84, lower.tail = FALSE)

 直接用公式：
  power.t.test(n=100, delta=X_bar-miu0, sd=S, type="one.sample", alternative = "one.sided")$power

Q8:
  power.t.test(power=0.9, delta=(0.01-0), sd=0.04, sig.level=0.05,type = "one.sample", alt = "one.sided")$n

Q10:
  n_x<-288
  n_y<-288
  miu_x<-44
  miu_y<-42.04
  S<-12

  TS<-(miu_y-miu_x)/(S*sqrt(1/n_x+1/n_y))
  2*pnorm(abs(TS),lower.tail =FALSE)

Q11:
  alpha/n
