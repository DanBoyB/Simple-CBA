costs_tab <- tabPanel("Costs",
                      # Sidebar with a slider input for number of bins
                      sidebarLayout(
                          sidebarPanel(
                              actionButton("submit1", "Generate Cost Table"),
                              br(),
                              numericInput("cost_est",
                                           "Scheme Capital Cost Estimate (€):",
                                           value = 15000000),
                              numericInput("price_base_yr",
                                           "Price Base Year for Appraisal:",
                                           value = 2011),
                              numericInput("opening_yr",
                                           "Opening Year of Scheme:",
                                           value = 2019),
                              sliderInput(
                                  "appr_period",
                                  "Appraisal Period:",
                                  min = 1,
                                  max = 30,
                                  value = 30
                                  ),
                              numericInput("disc_rate",
                                           "Discount Rate:",
                                           value = 0.05),
                              sliderInput(
                                  "resid_period",
                                  "Residual Value Period:",
                                  min = 0,
                                  max = 30,
                                  value = 0
                                  ),
                              numericInput("cpi_base",
                                           "CPI for Price Base Year:",
                                           value = 103.8),
                              numericInput("cpi_cost_est",
                                           "CPI for Scheme Cost Estimate:",
                                           value = 106.0),
                              numericInput("sppf",
                                           "Shadow Price of Public Funds:",
                                           value = 1.3),
                              numericInput("spl",
                                           "Shadow Price of Labour:",
                                           value = 0.8),
                              numericInput("labour_cont",
                                           "Labour Content:",
                                           value = 0.35),
                              textInput(
                                  "cost_yrs",
                                  "List of years over which costs are incurred (seperated by comma):",
                                  "2017,2018,2019"
                                  ),
                              textInput(
                                  "cost_prop",
                                  "Proportion of costs for each year (seperated by comma):",
                                  "0.25,0.5,0.25"
                                  )
                              ),
                          
             mainPanel(DT::dataTableOutput("costs"))
         ))