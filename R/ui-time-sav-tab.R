time_sav_tab <- tabPanel("Time Savings",
                         sidebarLayout(
                             sidebarPanel(
                                 actionButton("submit3", "Generate Scheme Time Savings"),
                                 br(),
                                 numericInput("ex_length",
                                              "Existing Scheme Length (km):",
                                              value = 8),
                                 numericInput("prop_length",
                                              "Proposed Scheme Length (km):",
                                              value = 10),
                                 numericInput("ex_speed",
                                              "Existing Speed Limit (kph):",
                                              value = 70),
                                 numericInput("proj_speed",
                                              "Proposed Speed Limit (kph):",
                                              value = 100),
                                 textInput("road_type",
                                           "Road Type:",
                                           value = "nat_pr"),
                                 numericInput("veh_occ",
                                              "Average Vehicle Occupancy:",
                                              value = 100),
                                 br()
                                 
                             ),
                             
                             mainPanel(DT::dataTableOutput("time"))
                             
                         ))