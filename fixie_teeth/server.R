# server.R
library("velo")

shinyServer(
  function(input, output, session) {
    shinyjs::onclick("toggleAdvanced",
                     shinyjs::toggle(id = "advanced", anim = TRUE))    
  }
)

# What to do next:
# 2. helpful error messages:
# http://shiny.rstudio.com/articles/validation.html

# shinyapps::showLogs
# To make the function actually work on the shiny server, I had to:
# create locally a folder which should contain all necessary packages 
# dir.create("D:/R/lib")
# .libPaths("D:/R/lib")
# install the velo package from github
# devtools::install_github("jannes-m/velo")
# devtools::install_github("daattali/shinyjs")
# deploy the app
# setwd("C:/Users/Jannes/Desktop/spoke_app")
# https://jannes-m.shinyapps.io/spoke_app/
# library(shinyapps)
# deployApp()
