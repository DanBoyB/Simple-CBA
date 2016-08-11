
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

    x <- reactive({
        cbaTable(input$capCosts, input$costsYear, input$appraisalPeriod, 
                 input$residualValuePeriod, input$openingYear, input$forecastYear,
                 input$openTimeSav, input$forecastTimeSav, input$aveVoT, input$discountRate,
                 input$priceBaseYear)
    })
    
    output$benTable <- renderTable({
        x()
    })
        
    })
  

