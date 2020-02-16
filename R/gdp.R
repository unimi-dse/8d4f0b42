#' @title Analysis of of saving rate and gdp groth rate

#' @description This is a package to analyze the macroeconomics data for a country,basing on the data from Word Bank. It also plots the growth rate of 'BRICKS' countries.
#' @return NULL

#' @examples gdp('US')

#' @export gdp

library(ggplot2)
library(WDI)
library(plotly)
#Macro data aquisition
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

