library(shiny)

source("R/ui-costs-tab.R", local = TRUE)
source("R/ui-proj-tab.R", local = TRUE)
source("R/ui-time-sav-tab.R", local = TRUE)
source("R/ui-voc-tab.R", local = TRUE)
source("R/ui-cost-ben.R", local = TRUE)

shinyUI(
    navbarPage(
        header = img(src="tiiLogo.jpg", height = 56.2, width = 90.8, align = "right"),
        theme = shinythemes::shinytheme("yeti"),
        title = "Simple Appraisal Tool",
        costs_tab,
        proj_tab,
        time_sav_tab,
        voc_tab,
        cost_ben_tab
        )
    )
