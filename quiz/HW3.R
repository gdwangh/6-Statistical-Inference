library(datasets)
data(mtcars)

# 1
t.test(mtcars$mpg)

# 2: mean - qt(0.975,n-1)*S/sqrt(n) = 0 ，求mean
n<-9
S<-1
mn<- -qt(0.975,n-1)*S/sqrt(n)
round(mn,2)

# 3
t.test(mtcars[mtcars$cyl==4,'mpg'], mtcars[mtcars$cyl==6,'mpg'], var.equal=TRUE)

#4
treated_mean<--3
treated_sd<-1.5
treated_n<-9
placebo_mean<-1
placebo_sd<-1.8
placebo_n<-9

Sp<-((treated_n-1)*treated_sd^2+(placebo_n-1)*placebo_sd^2)/(treated_n+placebo_n-2)
Sp

