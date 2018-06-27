build_cost_table <- eventReactive(input$submit1, {
    cost_table(input$cost_est, 
               input$price_base_yr, 
               input$opening_yr,
               input$appr_period,
               input$disc_rate,
               input$resid_period, 
               input$cpi_base,
               input$cpi_cost_est, 
               input$sppf, 
               input$spl,
               input$labour_cont,
               as.numeric(unlist(strsplit(input$cost_yrs,","))),
               as.numeric(unlist(strsplit(input$cost_prop,","))))
})

output$costs <- DT::renderDataTable({
    datatable(build_cost_table() %>% 
                  rename(Year = year, Costs = costs),
              rownames = FALSE,
              caption = "Present Value Costs (2011) by Year"
              ) %>%
        formatCurrency("Costs", "€", digits = 0)
},
options = list(
    paging = FALSE,
    searching = FALSE
    )

)

