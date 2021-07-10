#패키지 로드
install.packages("kormaps2014")
install.packages("tidyverse")
library(kormaps2014)
library(tidyverse)

#
#DB 연결
library(RJDBC)
jdbcDriver<-JDBC(driverClass = "oracle.jdbc.OracleDriver",
                 classPath = "C:\\ojdbc6.jar")
conn<-dbConnect(jdbcDriver,
                "jdbc:oracle:thin:@localhost:1521/xe", "scott","tiger")

#데이터 읽고 데이터 전처리
maps<-dbGetQuery(conn,'select * from CRIME_M')
maps
str(changeCode(kormap1))
library(mapproj)
library(ggiraphExtra)
str(maps)
unique(changeCode(kormap1)[,c(12,15)])# 전처리용 지역 코드 확인

#2019
ggChoropleth(data=subset(maps,연도==2019),aes
             (fill=살인,
               map_id=CODE,
               tooltip=발생지별),
             title="2019년도 지역별 살인통계",
             map=kormap1,
             interactive=T,)
ggChoropleth(data=subset(maps,연도==2019),aes
             (fill=강도,
               map_id=CODE,
               tooltip=발생지별),
             map=kormap1,
             title="2019년도 지역별 강도통계",
             interactive=T)
ggChoropleth(data=subset(maps,연도==2019),aes
             (fill=성폭력,
               map_id=CODE,
               tooltip=발생지별),
             map=kormap1,
             title="2019년도 지역별 성폭력통계",
             interactive=T)
ggChoropleth(data=subset(maps,연도==2019),aes
             (fill=방화,
               map_id=CODE,
               tooltip=발생지별),
             map=kormap1,
             title="2019년도 지역별 방화통계",
             interactive=T)
