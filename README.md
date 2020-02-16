# 8d4f0b42




## Analysis of the impact of savings rate on GDP growth rate 

Description: This is a package to analyze the macroeconomics data for a country,basing on the data from Word Bank.  Users can simply input a symbol of a country which he/she is interested in to acquire the country's macroeconomics data(gdp,gdp growth rate and saving rate). For example, gdp('US') for USA and gdp('CH') for Switzerland. 

Concerning the data visualization, it takes 'BRICKS' countries as an example: it plots the growth rate of these five countries, which shows the five countris growth path from 1990 to 2018.

In addition, this package explores the the impact of savings rate on GDP growth rate basing on US's case. It applies General Linear Model and the reslults shows the saving rate has a positive effect on the gdp growth rate. For example, concerning USA,every one percent increment of saving rate adds 0.5638% to GDP growth rate.



 

Function to acquire macroeconomics data of a country
```{r cars}
Macro data aquisition
library(ggplot2)
library(WDI)
gdp<-function(symbol){
  saving <- WDI::WDI(country=symbol,
                     indicator="NY.GNS.ICTR.ZS",
                     start=1990, end=2018)
  gdp <- WDI::WDI(country=symbol,
                  indicator="NY.GDP.MKTP.CD",
                  start=1990, end=2018)
  DF = WDI::WDI(country=symbol,
                indicator="NY.GDP.MKTP.KD.ZG",
                start=1990, end=2018)
  macro<-data.frame(
    Gdp=gdp,
    Savingrate=saving,
    Growthrate=DF
  )
  print(macro)
}
```


Data Visualization:An example of 'BRICKS' countries
 
```{r pressure, echo=FALSE}
DF = WDI::WDI(country=c("CN","RU","BR","ZA","IN"),
              indicator="NY.GDP.MKTP.KD.ZG",
              start=1990, end=2018)

ggplot(DF, aes(year, NY.GDP.MKTP.KD.ZG, color=country))+
  geom_line()+geom_point()+xlab("Year")+
  labs(title = "Annual GDP Growth rate (%)")+ylab("")

#Analyze the relationship between gdp growth rate and saving rate
macrodata=gdp('US')
relation<-glm(macrodata[,11]~macrodata[,7])
summary(relation)
```
According to the regression analysis, the saving rate has a positive effect on the gdp growth rate. For example, concerning USA,every one percent increment of saving rate adds 0.5638% to GDP growth rate.
