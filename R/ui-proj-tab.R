proj_tab <- tabPanel("Traffic Projections",
                 sidebarLayout(
                     sidebarPanel(
                         actionButton("submit2", "Generate Traffic Projections"),
                         br(),
                         
                         numericInput("base_yr",
                                      "Base Year:",
                                      value = 2016),
                         numericInput("base_aadt",
                                      "AADT in Base Year:",
                                      value = 18000),
                         numericInput("opening_yr",
                                      "Opening Year:",
                                      value = 2019),
                         numericInput("pc_hgv",
                                      "HGV %:",
                                      value = 0.05),
                         selectInput("region", 
                                     label = h3("Select Region:"), 
                                     choices = list("Dublin",
                                                    "Mid-East",
                                                    "Midland",
                                                    "Border",
                                                    "Mid-West",
                                                    "West",
                                                    "South-East",
                                                    "South-West"), 
                                     selected = "Mid-East"),
                         br()
                         
                     ),
                     
                     mainPanel(DT::dataTableOutput("traffic"))
                     
                 ))