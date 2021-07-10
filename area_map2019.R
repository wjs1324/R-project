install.packages("RJDBC")
install.packages("rJava")
install.packages("ggplot2")
install.packages("kernlab")
install.packages("gridExtra")
install.packages("dplyr")

library(RJDBC)
library(rJava)

jdbcDriver <- JDBC(driverClass="oracle.jdbc.OracleDriver"
                   , classPath="C://ojdbc6.jar")

conn <- dbConnect(jdbcDriver, 
                  "jdbc:oracle:thin:@localhost:1521/xe", "HR", "1234")
a1 <-dbGetQuery(conn, 'select * from map')

a1$살인<-as.numeric(a1$살인)
a1$성범죄<-as.numeric(a1$성범죄)
a1$강도<-as.numeric(a1$강도)
a1$방화<-as.numeric(a1$방화)

str(a1)
View(a1)
is.na.data.frame(a1)
a1<-na.omit(a1)



library(kernlab)
library(ggplot2)
library(gridExtra)
library(dplyr)

k1 <- a1%>%
  filter(살인>=24)

s1 <- a1%>%
  filter(성범죄>=500)

t1 <- a1%>%
  filter(강도>=50)

f1 <- a1%>%
  filter(방화>=25)

b1<-ggplot(data= subset(s1,연도==2018),aes(x=성범죄 ,y=발생지별))+
  geom_col(fill ='red')+
  theme_light()+
  theme(axis.title=element_text(size=28),
        axis.text.x = element_text(size=28),
        axis.text.y = element_text(size =20))+
  labs(x = '성범죄',y = '')

c1<-ggplot(data= subset(k1,연도==2018),aes(x=살인,y=발생지별))+
  geom_col(fill='blue')+
  theme_light()+
  theme(axis.title=element_text(size=28),
        axis.text.x = element_text(size=22),
        axis.text.y = element_text(size =23))+
  labs(x = '살인',y = '')

d1<-ggplot(data= subset(t1,연도==2018),aes(x=강도 ,y=발생지별))+
  geom_col(fill = '#82067D')+
  theme_light()+
  theme(axis.title=element_text(size=28),
        axis.text.x = element_text(size=23),
        axis.text.y = element_text(size =26))+
  labs(x = '강도',y = '')

e1<-ggplot(data= subset(f1,연도==2018),aes(x=방화 ,y=발생지별))+
  geom_col(fill='green')+
  theme_light()+
  theme(axis.title=element_text(size=28),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15))+
  labs(x = '방화',y = '')

grid.arrange(b1,c1,d1,e1 , nrow =2, ncol=2)

