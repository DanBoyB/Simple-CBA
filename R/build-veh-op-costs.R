build_veh_op_costs <- eventReactive(input$submit4, {
    
    proj <- reactiveValues(p = traffic_proj(input$base_yr,
                                            input$base_aadt,
                                            input$pc_hgv,
                                            input$opening_yr,
                                            input$region)
    )
    
    fuel <- reactiveValues(
        f = fuel_cost_km(speed = c(1:150),
                         fuel_cons_param = fuel_cons_param,
                         fuel_split = fuel_split,
                         fuel_cost_2011 = fuel_cost_2011,
                         road_type = input$road_type)
    )
    
    non_fuel <- reactiveValues(
        nf = nonfuel_cost_km(speed = c(1:150),
                             non_fuel_param = non_fuel_param,
                             road_type = input$road_type)
        )
        
    
    veh_op <- veh_op_costs(opening_yr = input$opening_yr,
                           appr_period = input$appr_period,
                           resid_period = input$resid_period,
                           disc_rate = input$disc_rate,
                           price_base_yr = input$price_base_yr,
                           ave_veh_occ = input$veh_occ,
                           traffic_proj = proj$p,
                           speed_ex = input$ex_speed,
                           speed_prop = input$proj_speed,
                           fuel_costs = fuel$f,
                           non_fuel_costs = non_fuel$nf) 
    })

output$voc <- DT::renderDataTable({
    datatable(build_veh_op_costs() %>% 
                  mutate(disc_costs = disc_costs * -1) %>% 
                  rename(Year = year,
                         `Discounted VOC (€)` = disc_costs))  %>% 
        formatCurrency(., 2, digits = 0, mark = ",", currency = "€")
    })