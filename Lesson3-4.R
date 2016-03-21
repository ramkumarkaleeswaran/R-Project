#multiple variables - two variables. scatter plots, etc


facebookdata <- read.csv('/Users/ramku/Documents/Data Science Cisco/R-Udacity/pseudo_facebook.tsv',sep='\t')

names(facebookdata)
install.packages("ggplot2")
library("ggplot2")

qplot(x=facebookdata$age,y=facebookdata$friend_count)

# same using ggplot
ggplot(aes(x=facebookdata$age,y=facebookdata$friend_count),data=facebookdata) + geom_point() 


ggplot(aes(x=facebookdata$age,y=facebookdata$friend_count),data=facebookdata) + geom_point() +
    xlim(13,90)

ggplot(aes(x=facebookdata$age,y=facebookdata$friend_count),data=facebookdata) + geom_point(alpha=1/20) +
  xlim(13,90)


ggplot(aes(x=facebookdata$age,y=facebookdata$friend_count+1),data=facebookdata) + geom_point(alpha=1/20) +
  xlim(13,90) + 
  coord_trans(y = "sqrt")


ggplot(aes(x=facebookdata$age,y=facebookdata$friendships_initiated),data=facebookdata) + geom_point(alpha=1/20,position=position_jitter(h=0)) +
  xlim(13,90) + 
  coord_trans(y="sqrt")

# group by and dplyr
install.packages("dplyr")
library("dplyr")
age_groups = group_by(facebookdata,age)
facebookdata_fc_by_age <- summarise(age_groups,
    friend_count_mean = mean(friend_count),
    friend_count_median = median(friend_count))

head(facebookdata_fc_by_age)

fb_fc_by_age <- facebookdata %.% group_by(age) %.%
  summarise(friend_count_mean=mean(friend_count),
            friend_count_median=median(friend_count))


ggplot(aes(age,friend_count_mean),data=fb_fc_by_age) + geom_point()

ggplot(aes(age,friend_count_mean),data=fb_fc_by_age) + geom_line()


# correlation

cor.test(facebookdata$age,facebookdata$friend_count)

with(facebookdata, cor.test(age, friend_count))
#low correlation value

# now suset the data to include only valie values
with(subset(facebookdata,age<=70), cor.test(age, friend_count))

#correlation between likes
cor.test(facebookdata$www_likes_received,facebookdata$likes_received)

ggplot(aes(x=www_likes_received,y=likes_received),data=facebookdata) + geom_point()


ggplot(aes(x=www_likes_received,y=likes_received),data=facebookdata) + 
  geom_point() +
  xlim(0,quantile(facebookdata$www_likes_received,0.95)) +
  ylim(0,quantile(facebookdata$likes_received,0.95))


ggplot(aes(x=www_likes_received,y=likes_received),data=facebookdata) + 
  geom_point() +
  xlim(0,quantile(facebookdata$www_likes_received,0.95)) +
  ylim(0,quantile(facebookdata$likes_received,0.95)) +
  geom_smooth(method='lm',color='red')

