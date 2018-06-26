build_time_savings <- eventReactive(input$submit3, {
    dplyr::data_frame(Description = "Time savings (mins)",
                      Value = 
                          time_saving(input$ex_length, 
                                      input$prop_length,
                                      input$ex_speed, 
                                      input$proj_speed) * 60 * 60)
    })

output$time <- DT::renderDataTable({
    datatable(build_time_savings())
    })