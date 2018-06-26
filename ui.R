

# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(
    navbarPage(
        header = img(src="tiiLogo.jpg", height = 56.2, width = 90.8, align = "right"),
        theme = shinythemes::shinytheme("yeti"),
        title = "Simple Appraisal Tool",
        
        tabPanel("Costs",
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
        ,
        tabPanel("Traffic Projections",
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
                         textInput(
                             "region",
                             "Region:",
                             value = "Mid-East"
                         ),
                         br()
                         
                     ),
                     
                     mainPanel(DT::dataTableOutput("traffic"))
                     
                 )),
        tabPanel("Time Savings",
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
                         textInput(
                             "road_type",
                             "Road Type:",
                             value = "nat_pr"
                         ),
                         numericInput("veh_occ",
                                      "Average Vehicle Occupancy:",
                                      value = 100),
                         br()
                         
                     ),
                     
                     mainPanel(DT::dataTableOutput("time"))
                     
                 )),
        
        tabPanel("Costs & Benefits",
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
                     
                 )),
        
        tabPanel("CBA Summary",
                 sidebarLayout(
                     sidebarPanel(actionButton("submit5", "Generate CBA Summary")),
                     
                     mainPanel(DT::dataTableOutput("summary"))
                     
                 ))
        
        
    )
)
