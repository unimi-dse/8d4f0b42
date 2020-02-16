library(ggplot2)
library(WDI)
library(plotly)

macrodata<-gdp('US')
#Data Visualization
#GDP growth rate of "BRICKS" countries#
DF = WDI::WDI(country=c("CN","RU","BR","ZA","IN"),
              indicator="NY.GDP.MKTP.KD.ZG",
              start=1990, end=2018)

ggplot(DF, aes(year, NY.GDP.MKTP.KD.ZG, color=country))+
  geom_line()+geom_point()+xlab("Year")+
  labs(title = "Annual GDP Growth rate (%)")+ylab("")

#Analyze the relationship between gdp growth rate and saving rate
relation<-glm(macrodata[,11]~macrodata[,7])
summary(relation)

According to the regression analysis, the saving rate has a positive effect on the gdp growth rate. For example, concerning USA,every one percent increment of saving rate adds 0.5638% to GDP growth rate.
