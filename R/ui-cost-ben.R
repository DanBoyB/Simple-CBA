cost_ben_tab <- tabPanel("Costs & Benefits",
                         sidebarLayout(
                             sidebarPanel(
                                 actionButton("submit4", "Generate Table of Costs & Benefits"),
                                 br(),
                                 numericInput("forecastYear",
                                              "Forecast Year of Scheme:",
                                              value = 2035),
                                 numericInput("aveVoT",
                                              "Average Value of Time (€):",
                                              value = 14.03),
                                 numericInput("discountRate",
                                              "Discount Rate:",
                                              value = 0.05),
                                 br()
                                 
                             ),
                             
                             mainPanel(DT::dataTableOutput("cba"))
                             
                         ))