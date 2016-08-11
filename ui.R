
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("TII Simple Appraisal Tools"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      numericInput("capCosts", 
                   "Scheme Capital Costs:",
                   value = 0),
      numericInput("costsYear",
                  "Price Year of Scheme Costs:",
                  value = format(Sys.Date(), "%Y")),
      sliderInput("appraisalPeriod",
                  "Appraisal Period:",
                  min = 1,
                  max = 30,
                  value = 30),
      sliderInput("residualValuePeriod",
                  "Residual Value Period:",
                  min = 0,
                  max = 30,
                  value = 0),
      numericInput("openingYear",
                   "Opening Year of Scheme:",
                   value = format(Sys.Date(), "%Y")),
      numericInput("forecastYear",
                   "Forecast Year of Scheme Impacts:",
                   value = 2030),
      numericInput("openTimeSav", 
                   "Opening Year Time Savings (hours):",
                   value = 0),
      numericInput("forecastTimeSav", 
                   "Forecast Year Time Savings (hours):",
                   value = 0),
      numericInput("aveVoT",
                   "Average Value of Time:",
                   value = 14.03),
      numericInput("discountRate", 
                   "Discount Rate:",
                   value = 0.05),
      numericInput("priceBaseYear", 
                   "Price Base Year:",
                   value = 0)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      tableOutput("benTable")
    )
  )
))
