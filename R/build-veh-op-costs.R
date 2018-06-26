y <- eventReactive(input$submit3, {
    dplyr::data_frame(Description = "Time savings (mins)",
                      Value = 
                          time_saving(input$ex_length, 
                                      input$prop_length,
                                      input$ex_speed, 
                                      input$proj_speed) * 60 * 60)
    
    fuel <- fuel_cost_km(speed = c(1:150),
                         fuel_cons_param = fuel_cons_param,
                         fuel_split = tiicba::fuel_split,
                         fuel_cost_2011 = tiicba::fuel_cost_2011,
                         road_type = input$road_type)
    
    non_fuel <- nonfuel_cost_km(speed = c(1:150),
                                non_fuel_param = non_fuel_param,
                                road_type = input$road_type)
    
    # veh_op <- veh_op_costs(opening_yr = input$opening_yr,
    #                        appr_period = input$appr_period,
    #                        resid_period = input$resid_period,
    #                        disc_rate = input$disc_rate,
    #                        price_base_yr = input$price_base_yr,
    #                        ave_veh_occ = input$veh_occ,
    #                        traffic_proj = proj,
    #                        speed_ex = input$ex_speed,
    #                        speed_prop = input$proj_speed,
    #                        fuel_costs = fuel,
    #                        non_fuel_costs = non_fuel) %>% 
    #     summarise(benefits = sum(disc_costs))
    
})

output$time <- DT::renderDataTable({
    datatable(y()) 
    # %>% 
    #     formatRound(.,1, digits = 0) %>% 
    #     formatRound(.,2, digits = 0)
})