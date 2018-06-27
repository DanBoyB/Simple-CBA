build_time_savings <- eventReactive(input$submit3, {
    
    proj <- reactiveValues(p = traffic_proj(input$base_yr,
                                            input$base_aadt,
                                            input$pc_hgv,
                                            input$opening_yr,
                                            input$region)
    )
    
    ts <- reactiveValues(t = time_saving(input$ex_length, 
                                         input$prop_length,
                                         input$ex_speed, 
                                         input$proj_speed)
    )
    
    time_benefits(opening_yr = input$opening_yr,
                  appr_period = input$appr_period,
                  resid_period = input$resid_period,
                  disc_rate = input$disc_rate,
                  price_base_yr = input$price_base_yr,
                  ave_veh_occ = input$veh_occ,
                  traffic_proj = proj$p,
                  time_saving = ts$t)
                          
    })

output$time <- DT::renderDataTable({
    datatable(build_time_savings() %>% 
                  rename(Year = year,
                         `Discounted Benefits (€)` = disc_ben)) %>% 
        formatCurrency(., 2, digits = 0, mark = ",", currency = "€")
    })