voc_tab <- tabPanel("Vehicle Operating Costs",
                         sidebarLayout(
                             sidebarPanel(
                                 actionButton("submit4", "Generate Vehicle Operating Costs"),
                                 br(),
                                 selectInput("road_type", 
                                             label = h3("Select Road Type:"), 
                                             choices = list("Motorway" = "m_way",
                                                            "National Primary" = "nat_pr",
                                                            "National Secondary" = "nat_sec"),
                                             selected = "nat_pr"),
                                 br()
                                 
                             ),
                             
                             mainPanel(DT::dataTableOutput("voc"))
                             
                         ))