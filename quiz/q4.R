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
  2*(1-pnorm(TS, lower.tail =FALSE))
 
Q11:
  alpha/n
