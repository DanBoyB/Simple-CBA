cost_ben_tab <- tabPanel("CBA Results",
                         sidebarLayout(
                             sidebarPanel(
                                 actionButton("submit5", "Generate CBA Summary Table"),
                                 br()
                             ),
                             
                             mainPanel(DT::dataTableOutput("cba"))
                             
                         ))