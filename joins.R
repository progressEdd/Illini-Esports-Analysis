##
new_members=read.csv("guild_activation.csv", header = T)
str(new_members)

new_members$covid=as.factor(new_members$covid)
str(new_members)

g=lm(new_memebers~., data = new_members)
summary(g)


##
joins=read.csv("guild_joins_by_source.csv", header = T)
str(joins)

joins$covid=as.factor(joins$covid)
str(joins)

g=lm(total_joins~., data = joins)
summary(g)