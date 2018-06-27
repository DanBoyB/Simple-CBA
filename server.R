library(shiny)
library(tiicba)
library(DT)
library(tidyverse)

shinyServer(function(input, output) {
    
    source("R/build-cost-table.R", local = TRUE)
    source("R/build-projections.R", local = TRUE)
    source("R/build-time-savings.R", local = TRUE)
    source("R/build-veh-op-costs.R", local = TRUE)
    source("R/build-cba-table.R", local = TRUE)
    
    })
  

