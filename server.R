library(shiny)
library(tiicba)
library(DT)
library(tidyverse)

shinyServer(function(input, output) {
    
    source("R/build-cost-table.R", local = TRUE)
    source("R/build-projections.R", local = TRUE)
    source("R/build-time-savings.R", local = TRUE)

    z <- eventReactive(input$submit4, {
        cbaTable(x(), input$appraisalPeriod, input$residualValuePeriod, input$openingYear,
                 input$forecastYear, y(), input$aveVoT, input$discountRate, input$priceBaseYear)
    })
    
    k <- eventReactive(input$submit5, {
        cbaSummary(z())
    })
    
    
   output$cba <- DT::renderDataTable({
       datatable(z()) %>% 
           formatCurrency(c("undiscCosts", "discCosts", "undiscBenefits", "discBenefits"), "€")
   },
   options=list(
       paging = FALSE,
       searching = FALSE
   )
   )
   
   output$summary <- DT::renderDataTable({
       datatable(k()) %>% 
           formatCurrency(c("PVC", "PVB", "NPV"), "€") %>% 
           formatRound("BCR", digits = 1)
   },
   options=list(
       paging = FALSE,
       searching = FALSE
   )
   )
    
})
  

