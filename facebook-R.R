getwd()
facebookdata <- read.csv('/Users/ramku/Documents/Data Science Cisco/R-Udacity/pseudo_facebook.tsv',sep='\t')

names(facebookdata)

library(ggplot2)

qplot(x=facebookdata$dob_month)

qplot(x=facebookdata$dob_day)

qplot(x=facebookdata$dob_day) +
  scale_x_continuous(breaks=1:31) 


ggplot(data = facebookdata, aes(x = dob_day)) +
  geom_histogram(binwidth = 2) +
  scale_x_continuous(breaks = 1:31) 


ggplot(data = facebookdata, aes(x = dob_day)) +
  geom_histogram(binwidth = 1) +
  scale_x_continuous(breaks = 1:31) +
  facet_wrap(~dob_month)


qplot(x=facebookdata$friend_count)

qplot(x=facebookdata$friend_count,xlim = c(0,1000))

qplot(x=friend_count,data=facebookdata,binwidth=25) +
  scale_x_continuous(limits=c(0,1000),breaks=seq(0,1000,50)) + 
  facet_wrap(facebookdata$gender)

qplot(x=friend_count,data=facebookdata,binwidth=25) +
  scale_x_continuous(limits=c(0,1000),breaks=seq(0,1000,50)) + 
  facet_grid(gender ~ .)

#facet 

qplot(x=friend_count,data=subset(facebookdata,!is.na(gender)),binwidth=25) +
  scale_x_continuous(limits=c(0,1000),breaks=seq(0,1000,50)) + 
  facet_grid(gender ~ .)
# facet

table(facebookdata$gender)
by(facebookdata$friend_count,facebookdata$gender,summary)


# histogram of tenue with bins, color, breaks, limits, labels
qplot(x=facebookdata$tenure/365,binwidth=0.25,colour='red',xlab="Tenure",ylab="# of people") +
  scale_x_continuous(breaks=seq(1,7,1),limits=c(0,7))

# end



# histogram of facebook users by age

qplot(x=facebookdata$age)

qplot(x=facebookdata$age,binwidth=5,colour='blue',xlab="Age",ylab="# of people") +
  scale_x_continuous(breaks=seq(5,90,5),limits=c(10,80))


# end


# histogram of facebook users by friend count (using transformations)

qplot(x=facebookdata$friend_count)

qplot(x=log10(facebookdata$friend_count + 1))

qplot(x=sqrt(facebookdata$friend_count+1))

  # all plots in one plot
install.packages('gridExtra')
library(gridExtra)


p1 = qplot(x=facebookdata$friend_count)

p2 = qplot(x=log10(facebookdata$friend_count + 1))

p3 = qplot(x=sqrt(facebookdata$friend_count+1))

grid.arrange(p1,p2,p3,ncol=1)

  # ggplot (same thing as above with using ggplot)
ggplot(aes(x=friend_count),data=facebookdata) +
  geom_histogram()

p1 = ggplot(aes(x=friend_count),data=facebookdata) +
  geom_histogram()
p2 = p1 + scale_x_log10()
p3 = p1 + scale_x_sqrt()
grid.arrange(p1,p2,p3,ncol=1)

#end


# frequency polygon


ggplot(aes(x = friend_count, y = ..count../sum(..count..)), data = subset(facebookdata, !is.na(gender))) +
  geom_freqpoly(aes(color = gender), binwidth=10) +
  scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50)) +
  xlab('Friend Count') +
  ylab('Percentage of users with that friend count')


ggplot(aes(x = friend_count, y = ..count../sum(..count..)), data = subset(facebookdata, !is.na(gender))) +
  geom_freqpoly(aes(color = gender), binwidth=10) +
  scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50)) +
  xlab('Friend Count') +
  ylab('Percentage of users with that friend count')

ggplot(aes(x = www_likes), data = subset(facebookdata, !is.na(gender))) +
  geom_freqpoly(aes(color = gender)) +
  scale_x_log10()

# end

# find the likes for each of the gender and also the count

by(facebookdata$www_likes,facebookdata$gender,summary)

by(facebookdata$www_likes,facebookdata$gender,sum)

# end


# box plot



# end



qplot(x=friend_count,data=facebookdata) + 
  facet_grid(facebookdata$gender)

qplot(x=facebookdata$friend_count,xlim = c(0,1000),binwidth=25)



ggplot(aes(x = friend_count), data = facebookdata) +
  geom_histogram()