## 범죄자 직업 현황 (2016~2019년) ####
### 0) 패키지 설치 및 로드 ####
library(gridExtra)          # 한 페이지에 여러 플롯을 배열
library(dplyr)              # 데이터 전처리
library(ggplot2)            # 시각화
library(readr)              # read_csv() 함수 사용하여 csv 읽기

### 1) 데이터 불러오기 ####
crime_job <- read_csv(file="C:/Users/Admin/Desktop/ML_Developer/R/프로젝트/file/crime_job2.csv")
str(crime_job)                            # 데이터 구조 확인
crime_job <- as.data.frame(crime_job)     # tibble 자료를 data.frame으로 변환
head(crime_job)                           # 데이터 프레임의 첫 6행 확인

### 2) 연도별 직업별 살인현황 파악: 직업 당 20건이 넘는 경우만 반영 ####
# 2016년도
murder16 <- ggplot(subset(crime_job, 년도==2016 & 살인>=20),
                   aes(x=직업, y=살인, fill=직업)) + 
  geom_bar(stat='identity') + xlab("살인자 직업 (2016년)") +
  ylim(0,100) + theme(legend.position='none')
murder16

# 2017년도
murder17 <- ggplot(subset(crime_job, 년도==2017 & 살인>=20),
                   aes(x=직업, y=살인, fill=직업)) + 
  geom_bar(stat='identity') + xlab("살인자 직업 (2017년)") +
  ylim(0,100) + theme(legend.position='none')
murder17

# 2018년도
murder18 <- ggplot(subset(crime_job, 년도==2018 & 살인>=20),
                   aes(x=직업, y=살인, fill=직업)) + 
  geom_bar(stat='identity') + xlab("살인자 직업 (2018년)") +
  ylim(0,100) + theme(legend.position='none')
murder18

# 2019년도
murder19 <- ggplot(subset(crime_job, 년도==2019 & 살인>=20),
                   aes(x=직업, y=살인, fill=직업)) + 
  geom_bar(stat='identity') + xlab("살인자 직업 (2019년)") +
  ylim(0,100) + theme(legend.position='none')
murder19

# 2016~2019년 현황을 한 영역에서 확인
grid.arrange(murder16, murder17, murder18, murder19, nrow=2, ncol=2)

### 3) 연도별 직업별 강도현황 파악: 직업 당 15건이 넘는 경우만 반영 ####
# 2016년도
robber16 <- ggplot(subset(crime_job, 년도==2016 & 강도>=15),
                   aes(x=직업, y=강도, fill=직업)) + 
  geom_bar(stat='identity') + xlab("강도 범죄자 직업 (2016년)") +
  ylim(0,250) + theme(legend.position='none')
robber16

# 2017년도
robber17 <- ggplot(subset(crime_job, 년도==2017 & 강도>=15),
                   aes(x=직업, y=강도, fill=직업)) + 
  geom_bar(stat='identity') + xlab("강도 범죄자 직업 (2017년)") +
  ylim(0,250) + theme(legend.position='none')
robber17

# 2018년도
robber18 <- ggplot(subset(crime_job, 년도==2018 & 강도>=15),
                   aes(x=직업, y=강도, fill=직업)) + 
  geom_bar(stat='identity') + xlab("강도 범죄자 직업 (2018년)") +
  ylim(0,250) + theme(legend.position='none')
robber18

# 2019년도
robber19 <- ggplot(subset(crime_job, 년도==2019 & 강도>=15),
                   aes(x=직업, y=강도, fill=직업)) + 
  geom_bar(stat='identity') + xlab("강도 범죄자 직업 (2019년)") +
  ylim(0,250) + theme(legend.position='none')
robber19

# 2016~2019년 현황을 한 영역에서 확인
grid.arrange(robber16, robber17, robber18, robber19, nrow=2, ncol=2)


### 4) 연도별 직업별 성범죄현황 파악: 직업 당 400건이 넘는 경우만 반영 ####
# 2016년도
sexual16 <- ggplot(subset(crime_job, 년도==2016 & 성범죄>=400),
                   aes(x=직업, y=성범죄, fill=직업)) + 
  geom_bar(stat='identity') + xlab("성범죄자 직업 (2016년)") +
  ylim(0,4000) + theme(legend.position='none')
sexual16

# 2017년도
sexual17 <- ggplot(subset(crime_job, 년도==2017 & 성범죄>=400),
                   aes(x=직업, y=성범죄, fill=직업)) + 
  geom_bar(stat='identity') + xlab("성범죄자 직업 (2017년)") +
  ylim(0,4000) + theme(legend.position='none')
sexual17

# 2018년도
sexual18 <- ggplot(subset(crime_job, 년도==2018 & 성범죄>=400),
                   aes(x=직업, y=성범죄, fill=직업)) + 
  geom_bar(stat='identity') + xlab("성범죄자 직업 (2018년)") +
  ylim(0,4000) + theme(legend.position='none')
sexual18

# 2019년도
sexual19 <- ggplot(subset(crime_job, 년도==2019 & 성범죄>=400),
                   aes(x=직업, y=성범죄, fill=직업)) + 
  geom_bar(stat='identity') + xlab("성범죄자 직업 (2019년)") +
  ylim(0,4000) + theme(legend.position='none')
sexual19

# 2016~2019년 현황을 한 영역에서 확인
grid.arrange(sexual16, sexual17, sexual18, sexual19, nrow=2, ncol=2)

### 5) 연도별 직업별 방화 현황 파악: 직업 당 30건이 넘는 경우만 반영 ####
# 2016년도
arson16 <- ggplot(subset(crime_job, 년도==2016 & 방화>=30),
                   aes(x=직업, y=방화, fill=직업)) + 
  geom_bar(stat='identity') + xlab("방화 범죄자 직업 (2016년)") +
  ylim(0,150) + theme(legend.position='none')
arson16

# 2017년도
arson17 <- ggplot(subset(crime_job, 년도==2017 & 방화>=30),
                   aes(x=직업, y=방화, fill=직업)) + 
  geom_bar(stat='identity') + xlab("방화 범죄자 직업 (2017년)") +
  ylim(0,150) + theme(legend.position='none')
arson17

# 2018년도
arson18 <- ggplot(subset(crime_job, 년도==2018 & 방화>=30),
                   aes(x=직업, y=방화, fill=직업)) + 
  geom_bar(stat='identity') + xlab("방화 범죄자 직업 (2018년)") +
  ylim(0,150) + theme(legend.position='none')
arson18

# 2019년도
arson19 <- ggplot(subset(crime_job, 년도==2019 & 방화>=30),
                   aes(x=직업, y=방화, fill=직업)) + 
  geom_bar(stat='identity') + xlab("방화 범죄자 직업 (2019년)") +
  ylim(0,150) + theme(legend.position='none')
arson19

# 2016~2019년 현황을 한 영역에서 확인
grid.arrange(arson16, arson17, arson18, arson19, nrow=2, ncol=2)
