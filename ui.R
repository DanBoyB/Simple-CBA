

# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(
    navbarPage(
        header = img(src="tiiLogo.jpg", height = 56.2, width = 90.8, align = "right"),
        theme = "bootstrap.min.css",
        title = "Simple Appraisal Tool",
        
        tabPanel("Costs",
                 # Sidebar with a slider input for number of bins
                 sidebarLayout(
                     sidebarPanel(
                         actionButton("submit1", "Generate Cost Table"),
                         br(),
                         numericInput("costEst",
                                      "Scheme Capital Cost Estimate (million €):",
                                      value = 30),
                         numericInput("priceBaseYear",
                                      "Price Base Year for Appraisal:",
                                      value = 2011),
                         numericInput("openingYear",
                                      "Opening Year of Scheme:",
                                      value = 2018),
                         sliderInput(
                             "appraisalPeriod",
                             "Appraisal Period:",
                             min = 1,
                             max = 30,
                             value = 30
                         ),
                         sliderInput(
                             "residualValuePeriod",
                             "Residual Value Period:",
                             min = 0,
                             max = 30,
                             value = 0
                         ),
                         numericInput("cpiBase",
                                      "CPI for Price Base Year:",
                                      value = 103.8),
                         numericInput("cpiCostEst",
                                      "CPI for Scheme Cost Estimate:",
                                      value = 106.6),
                         numericInput("sppf",
                                      "Shadow Price of Public Funds:",
                                      value = 1.3),
                         numericInput("spl",
                                      "Shadow Price of Labour:",
                                      value = 1.0),
                         textInput(
                             "costYears",
                             "List of years over which costs are incurred (seperated by comma):",
                             "2018,2019,2020"
                         ),
                         textInput(
                             "costProp",
                             "Proportion of costs for each year (seperated by comma):",
                             "0.3,0.5,0.2"
                         )
                         
                     ),
                     
                     mainPanel(DT::dataTableOutput("costs"))
                 ))
        ,
        tabPanel("Time Savings",
                 sidebarLayout(
                     sidebarPanel(
                         actionButton("submit2", "Generate Scheme Time Savings"),
                         br(),
                         numericInput("dmLength",
                                      "Do Minimum Scheme Length (km):",
                                      value = 10),
                         numericInput("dsLength",
                                      "Do Something Scheme Length (km):",
                                      value = 9.5),
                         numericInput("dmSpeedLimit",
                                      "Do Minimum Speed Limit (kph):",
                                      value = 60),
                         numericInput("dsSpeedLimit",
                                      "Do Something Speed Limit (kph):",
                                      value = 80),
                         numericInput("openAadt",
                                      "Opening Year AADT",
                                      value = 4500),
                         numericInput("forecastAadt",
                                      "Forecast Year AADT",
                                      value = 6000),
                         br()
                         
                     ),
                     
                     mainPanel(DT::dataTableOutput("time"))
                     
                 )),
        
        tabPanel("Costs & Benefits",
                 sidebarLayout(
                     sidebarPanel(
                         actionButton("submit3", "Generate Table of Costs & Benefits"),
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
                     sidebarPanel(actionButton("submit4", "Generate CBA Summary")),
                     
                     mainPanel(DT::dataTableOutput("summary"))
                     
                 ))
        
        
    )
)
