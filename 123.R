#필요 패키지 불러오기
library(dplyr)
library(ggplot2)
library(scales)
library(RColorBrewer)
#DB 연결
library(RJDBC)
jdbcDriver<-JDBC(driverClass = "oracle.jdbc.OracleDriver",
                 classPath = "C:\\ojdbc6.jar")
conn<-dbConnect(jdbcDriver,
                "jdbc:oracle:thin:@localhost:1521/xe", "scott","tiger")
#데이터 읽고 데이터 전처리
crime<-dbGetQuery(conn,'select * from CRIME_D')

str(crime)
crime$연도<-as.character(crime$연도
                    )
#x축 순서
reorder1<-scale_x_discrete(limits=c("월요일", "화요일", "수요일","목요일","금요일","토요일","일요일")) #x축 재정렬
#살인
crime_m<-ggplot(data=crime,aes(요일,살인,group=연도,color=연도))+
  geom_line(size=1.3)+
  geom_point(size=4)+
  geom_point(size=2,color='#FFFFFF')+
  geom_text(size=8,data=subset(crime,요일=="일요일"),aes(y=살인+3.5,label=연도),hjust=0.15)+
  reorder1
crime_m+theme_dark()+ggtitle("요일별 살인 건수")+theme(plot.title = element_text(size=15,hjust=0.5,color="darkred",face='bold'),
                                           axis.text.x = element_text(size=15,face='bold'),
                                           axis.title.x = element_blank(),
                                           axis.title.y = element_blank(),
                                           plot.margin = unit(c(1,2,1,1),"lines"),
                                           legend.position = "none")

#방화
crime_f<-ggplot(data=crime,aes(x=요일,y=방화,group=연도,color=연도))+
  geom_line(size=1.3)+
  geom_point(size=4)+
  geom_point(size=2,color='#FFFFFF')+
  geom_text(size=8,data=subset(crime,요일=="일요일"),aes(y=방화+3.5,label=연도),hjust=0.15)+
  reorder1

crime_f+theme_dark()+ggtitle("연도에 따른 요일별 방화 건수")+theme(plot.title = element_text(size=15,hjust=0.5,color="darkred",face='bold'),
                                                axis.text.x = element_text(size=15,face='bold'),
                                                axis.title.x = element_blank(),
                                                axis.title.y = element_blank(),
                                                plot.margin = unit(c(1,2,1,1),"lines"),
                                                legend.position = "none")
#강도
crime_r<-ggplot(data=crime,aes(x=요일,y=강도,group=연도,color=연도))+
  geom_line(size=1.3)+
  geom_point(size=4)+
  geom_point(size=2,color='#FFFFFF')+
  geom_text(size=8,data=subset(crime,요일=="일요일"),aes(y=강도+3.5,label=연도),hjust=0.15)+
  reorder1

crime_r+theme_dark()+ggtitle("연도에 따른 요일별 강도 건수")+theme(plot.title = element_text(size=15,hjust=0.5,color="darkred",face='bold'),
                                                axis.text.x = element_text(size=15,face='bold'),
                                                axis.title.x = element_blank(),
                                                axis.title.y = element_blank(),
                                                plot.margin = unit(c(1,2,1,1),"lines"),
                                                legend.position = "none")
#성범죄
crime_a<-ggplot(data=crime,aes(x=요일,y=성범죄,group=연도,color=연도))+
  geom_line(size=1.3)+
  geom_point(size=4)+
  geom_point(size=2,color='#FFFFFF')+
  geom_text(size=8,data=subset(crime,요일=="목요일"),aes(y=성범죄+60,label=연도),hjust=0.8)+
  reorder1

crime_a+theme_dark()+ggtitle("연도에 따른 요일별 성범죄 건수")+theme(plot.title = element_text(size=15,hjust=0.5,color="darkred",face='bold'),
                                                       axis.text.x = element_text(size=15,face='bold'),
                                                       axis.title.x = element_blank(),
                                                       axis.title.y = element_blank(),
                                                       plot.margin = unit(c(1,2,1,1),"lines"),
                                                       legend.position = "none")
