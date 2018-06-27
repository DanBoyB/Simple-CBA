library(shiny)
library(tiicba)
library(DT)
library(tidyverse)

# Load in app UI elements
source("R/ui-costs-tab.R", local = TRUE)
source("R/ui-proj-tab.R", local = TRUE)
source("R/ui-time-sav-tab.R", local = TRUE)
source("R/ui-voc-tab.R", local = TRUE)
source("R/ui-cost-ben.R", local = TRUE)

ui <- navbarPage(
    header = img(src="tiiLogo.jpg", height = 56.2, width = 90.8, align = "right"),
    theme = shinythemes::shinytheme("yeti"),
    title = "Simple Appraisal Tool",
    costs_tab,
    proj_tab,
    time_sav_tab,
    voc_tab,
    cost_ben_tab
)

server <- function(input, output) {
    
    # Load in reactive elements
    source("R/build-cost-table.R", local = TRUE)
    source("R/build-projections.R", local = TRUE)
    source("R/build-time-savings.R", local = TRUE)
    source("R/build-veh-op-costs.R", local = TRUE)
    source("R/build-cba-table.R", local = TRUE)
    
    }

# Create App
shinyApp(ui, server)    