#***************************************************************************
#* Program Name : Global.R
#* Developer Name : Parth Shah
#* Developer Contact Details: tapswi2696@gmail.com
#* Maturity level : level 01
#* THIS CODE IS UNDER DEVELOPMENT AND NOT TESTED 
#***************************************************************************

#Remove all Details

rm(list=ls())

#Import libraries 

library(shiny)
library(shinydashboard)
library(httr)
library(rlist)
library(jsonlite)
library(tidyverse)
library(stringr)
library(DT)
library(shinycssloaders)

#Package Response
 
packages_resp <- GET(url = "https://api.library.cdisc.org/api/mdr/ct/packages",
                     add_headers("api-key" = "xxxxxxxxxxxxxxxx"))
## PRINT RESPONSE
packages_resp

## STATUS CHECK

if (packages_resp$status_code != 200)
  stop(paste0("====== CDISC API Status Seems Not Correct, your status code is : ",
              as.character(packages_resp$status_code)," =============="))

## FLAT RESPONSE IN TO DATA
packages_resp <-content(packages_resp,"text",encoding = "UTF-8")
packages_resp <-fromJSON(packages_resp, flatten = TRUE)
packages_resp_text <- packages_resp$`_links`$packages

## GET NAME OF STANDARD USING TITLE VARIABLE
packages_resp_text$standard <- toupper(x = str_extract(string = packages_resp_text$title,
                                                       pattern = "^.*(?=(Controlled Terminology))"))

## GET DATE FROM THE HREF PUBLISHED DATE
packages_resp_text$publishedDate <- stringr::str_sub(packages_resp_text$href,-10)
packages_resp_text <- packages_resp_text %>% arrange(standard, desc(publishedDate))
rm(packages_resp)
