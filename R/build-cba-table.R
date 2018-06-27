build_cba_table <- eventReactive(input$submit5, {
    
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
    
    costs <- reactiveValues(
        ct = cost_table(input$cost_est, 
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
    )
    
    time <- reactiveValues(
        tb = time_benefits(opening_yr = input$opening_yr,
                           appr_period = input$appr_period,
                           resid_period = input$resid_period,
                           disc_rate = input$disc_rate,
                           price_base_yr = input$price_base_yr,
                           ave_veh_occ = input$veh_occ,
                           traffic_proj = proj$p,
                           time_saving = ts$t)
    )
    
    voc <- reactiveValues(
        voc = veh_op_costs(opening_yr = input$opening_yr,
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
    )
    
    cost_benefit(cost_table = costs$ct,
                 time_benefits = time$tb,
                 veh_op_costs = voc$voc
                 )
})

output$cba <- DT::renderDataTable({
    datatable(build_cba_table())
})