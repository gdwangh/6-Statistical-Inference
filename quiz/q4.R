Q1:
  
df<-data.frame(subject=c(1:5),baseline=c(140,138,150,148,135), week2=c(132,135,151,146,130))

t.test(df$baseline, df$week2, paired=TRUE,alternative="two.sided")

Q2:
S<-30
X<-1100
n<-9

fail to reject：abs(TS) < Z(1-alpha/2)
   c(-1,1) * (X - miu0) * sqrt(n) / S < qt(0.975, n-1)

miu0在如下范围内：X - c(-1,1)* qt(0.975, n-1)*S/sqrt(n)

Q3,Q4: 直接选小于0.05的。

Q5: 
  
