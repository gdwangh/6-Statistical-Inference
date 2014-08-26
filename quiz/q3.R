# Q1
n<-9
mn<-1100
S<-30
mn + c(-1,1)*qt(0.975, n-1)*S/sqrt(n)

# Q2， 已知：mean + qt(0.975,n-1)*S/sqrt(n) = 0， 求S
mn<- -2
n<-9
S<-(0-mn)*sqrt(n)/qt(0.975,n-1)
S

# Q4
new_mean<-3
new_S2<-0.6
new_n<-10
old_mean<-5
old_S2<-0.68
old_n<-10

Sp<-sqrt(((new_n-1)*new_S2+(old_n-1)*old_S2)/(new_n+old_n-2))
new_mean - old_mean + c(-1,1)*qt(0.975, new_n+old_n-2)*Sp*sqrt(1/new_n+1/old_n)

# Q6

new_mean<-4
new_S2<-0.5^2
new_n<-100
old_mean<-6
old_S2<-2^2
old_n<-100

Sp<-sqrt(((new_n-1)*new_S2+(old_n-1)*old_S2)/(new_n+old_n-2))
old_mean - new_mean + c(-1,1)*qnorm(0.975)*Sp*sqrt(1/new_n+1/old_n)

# Q7
treated_mean<--3
treated_sd<-1.5
treated_n<-9
placebo_mean<-1
placebo_sd<-1.8
placebo_n<-9

Sp<-sqrt(((treated_n-1)*treated_sd^2+(placebo_n-1)*placebo_sd^2)/(treated_n+placebo_n-2))
treated_mean - placebo_mean + c(-1,1)*qt(0.95, treated_n+placebo_n-2)*Sp*sqrt(1/treated_n+1/placebo_n)
