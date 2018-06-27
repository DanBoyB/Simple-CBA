build_projections <- eventReactive(input$submit2, {
    proj <- traffic_proj(input$base_yr,
                         input$base_aadt,
                         input$pc_hgv,
                         input$opening_yr,
                         input$region)
    
    proj
})

output$traffic <- DT::renderDataTable({
    datatable(build_projections() %>% 
                  mutate(AADT = total / 365) %>% 
                  rename(Year = year) %>% 
                  select(Year, AADT)) %>% 
        formatRound(., 1, digits = 0) %>%
        formatCurrency(., 2, digits = 0, mark = ",", currency = "")
},
options = list(
    paging = FALSE,
    searching = FALSE
))