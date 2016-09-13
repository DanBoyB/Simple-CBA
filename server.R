
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(cba)

shinyServer(function(input, output) {

    x <- eventReactive(input$submit1, {
        costTable(input$costEst, input$priceBaseYear, input$openingYear, 
                 input$appraisalPeriod, input$residualValuePeriod, input$cpiBase,
                 input$cpiCostEst, input$sppf, input$spl, 
                 as.numeric(unlist(strsplit(input$costYears,","))),
                 as.numeric(unlist(strsplit(input$costProp,","))))
    })
    
    y <- eventReactive(input$submit2, {
        timeSavings(input$dmLength, input$dsLength, input$dmSpeedLimit, 
                    input$dsSpeedLimit, input$openAadt, input$forecastAadt)
    })
    
    z <- eventReactive(input$submit3, {
        cbaTable(x(), input$appraisalPeriod, input$residualValuePeriod, input$openingYear,
                 input$forecastYear, y(), input$aveVoT, input$discountRate, input$priceBaseYear)
    })
    
    k <- eventReactive(input$submit4, {
        cbaSummary(z())
    })
    
    
    output$costs <- renderTable({
        x()
    })
    
   output$time <- renderText({
       y()
   })
   
   output$cba <- renderTable({
       z()
   })
   
   output$summary <- renderTable({
       k()
   })
    
})
  

