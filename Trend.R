#Created December 2019
#Author: Alene Onion

#############################################################################################################################################
#############################################################################################################################################
#############################################################################################################################################
#############################################################################################################################################
#############################################################################################################################################
#read data tables
head(data)
#############################################################################################################################################
#############################################################################################################################################
#############################################################################################################################################
#############################################################################################################################################
#############################################################################################################################################

#old analyses
rmarkdown::render("Trend.TSI.Rmd")
rmarkdown::render("Trend.TSI.bylake.Rmd")
rmarkdown::render("Trend.Phosphorus.Rmd")
rmarkdown::render("Trend.Chlorophyll.Rmd")
rmarkdown::render("Trend.Secchi.Rmd")
rmarkdown::render("Trend.Temp.Rmd")
#rmarkdown::render("Chloride.Trend.Rmd") # failed because there aren't any chloride data that span 4 decades
rm(list=c('provider','slopes','temp','others'))


#2020.10.13 Kendall Tau analyses
######################################################################################
######################################################################################
#analyzes Kendall Tau for all the parameters and all dates
#includes comparison plots
#preferred analysis run
rmarkdown::render("Trend.Kendall.Seasonal.Tau.ALL.Params.All.Dates.Rmd")
######################################################################################
######################################################################################


#descriptive file for requesting data sharing
rmarkdown::render("Trend.Descriptive.Rmd")

#MSSA analysis
#To generate the reconstructed plot for one lake
rmarkdown::render("Trend.MSSA.CHLA.PHOS.COLOR.standardized")
######################################################################################
######################################################################################
#Data standardized and transformed
#restricted to only correlations with lag less than 30% of total observations
#THE LAKES SELECTION AT TOP NEEDS TO BE UPDATED
rmarkdown::render("Trend.MSSA.CHLA.PHOS.COLOR.standardized.all.Rmd")
######################################################################################
######################################################################################
#Data NOT standardized and NOT transformed
#THE LAKES SELECTION AT TOP NEEDS TO BE UPDATED
rmarkdown::render("Trend.MSSA.CHLA.PHOS.COLOR.NOTstandardized.all.Rmd")


#Regression analysis
#analysis of characteristics that are significant drivers of the temperature slopes
#I calculate the kendall seasonal tau slopes first and run it on dataset distilled to one slope per lake
#THE LAKES SELECTION AT TOP NEEDS TO BE UPDATED
rmarkdown::render("Trend.regression.temp.slopes.Rmd")
#analysis of characteristics that are significant drivers of the temperature 
#eval = FALSE is used in the plots section. Turn this off if you want plots generated
#THE LAKES SELECTION AT TOP NEEDS TO BE UPDATED
rmarkdown::render("Trend.regression.temp.Rmd")
#analysis of characteristics that are significant drivers of the temperature 
#eval = FALSE is used in the plots section. Turn this off if you want plots generated
#THE LAKES SELECTION AT TOP NEEDS TO BE UPDATED
rmarkdown::render("Trend.regression.chla.Rmd")

#selected analyses for chlA
#this analysis is a combination of:
#Trend.Kendall.Seasonal.Tau.ALL.Params.All.Dates.Rmd
#Trend.regression.chla.slopes.Rmd
#Trend.regression.chla.mssa.Rmd
#So that I can see what happens as a result of subsetting
#eval = FALSE is used in the plots section. Turn this off if you want plots generated
#for the same reason DT is commented out. Turn these on for final plot
#PLEASE NOTE, we are missing predictor data for these lakes so they were rmoved:1302CAR0062A, 1501LUC0982B
rmarkdown::render("Trend.combined.ChlA.Rmd")

#Identifying ecoregion clusters
rmarkdown::render("Ecoregions.Rmd")

#Now the same for temperature
rmarkdown::render("Trend.combined.temp.Rmd")

#March analysis of correlations
rmarkdown::render("2021.March.indexed.Rmd")
rmarkdown::render("2021.March.monthly.Rmd")


#reading in data
setwd("C:/Users/alanc/OneDrive - New York State Office of Information Technology Services/Lakes.Database/data/Current")
source("Reading.LMAS.Data.R")
setwd("C:/Users/alanc/OneDrive - New York State Office of Information Technology Services/Rscripts/Trend")

