
## ~~~~~~~~~~ GLOBAL DATA ~~~~~~~~~~~ ##

# Created by: Sijia Wang
# Team: Data Analytics and Business Solutions (DABS)
# Version: 1.0
# Last modified: 2020-03-24
# Description: Global data for TBI project management dashboard

library(shiny)
library(shinyjs)
library(shinycssloaders)
library(dplyr)
library(ggplot2)
library(plotly)
library(reshape2)
library(V8)
library(readxl)
library(zoo)
library(ggpubr)
library(r2d3)

health <- read_excel("ppm_data.xlsx",sheet="Dashboard",skip=1)
progress <- read_excel("ppm_data.xlsx",sheet="Description",skip=1)
budget <- read_excel("ppm_data.xlsx",sheet="Budget",skip=1)

# Formatting for progress data
progress <- progress[!is.na(progress$Deliverables),]
progress$Planned.Start <- as.Date(progress$Planned.Start,"%d/%m/%Y",tz="UTC")
progress$Planned.End <- as.Date(progress$Planned.End,"%d/%m/%Y",tz="UTC")
progress$Actual.Start <- as.Date(progress$Actual.Start,"%d/%m/%Y",tz="UTC")
progress$Actual.End <- as.Date(progress$Actual.End,"%d/%m/%Y",tz="UTC")
progress[is.na(progress$`% Complete`),"% Complete"] <- 0
progress$Project <- na.locf(progress$Project)

# Formatting for budget data
budget <- budget[1:nrow(budget)-1,]
for(col in c("Budget","Actuals","Commitment","Anticipated","Total Forecast",
             "Variance")) {
  budget[is.na(budget[,col]),col] <- 0
}
budget$Budget <- as.integer(budget$Budget)
budget$Project <- na.locf(budget$Project)