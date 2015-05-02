# load shinyjs (needed for 'useShinyjs()')

library("shinyjs")

shinyUI(fluidPage(
  useShinyjs(),
  tabsetPanel(
    tabPanel("Calculator",
             titlePanel(h3("Spoke Calculator")),
             sidebarLayout(
               sidebarPanel(
                 style="min-width:235px;max-width:405px", 
                 tags$head(
                   tags$style(HTML("
      @import url('//fonts.googleapis.com/css?family=Lobster');
                    
                    h3 {
                    font-family: 'Lobster';
                    font-weight: 500;
                    line-height: 1.1;
                    color: #ad1d28;
                    }
                    
                    "))
                 ),
                 p("Filling out all fields will enable the",
                   strong("Calculate"), "button:"),
                splitLayout(
                  numericInput("n", 
                               label = "Number of spokes",
                                value = ""),  
                  numericInput("erd", 
                               label = "Effective rim diameter",
                               value = "")
                 ),
                
                splitLayout(                 
                  numericInput("left_flange_d", 
                               label = "Left flange diameter",
                               value = ""),
                 
                  numericInput("right_flange_d", 
                               label = "Right flange diameter",
                               value = "")
                  ),
                 
                splitLayout(
                  numericInput("wl", 
                               label = "Hub center to left flange",
                               value = ""),
                 
                  numericInput("wr", 
                               label = "Hub center to right flange",
                               value = "")
                  ),
                a(id = "toggleAdvanced", "Show/hide more parameters"),
                hidden(
                  div(id = "advanced",
                      splitLayout(
                        numericInput("cross", 
                                     label = "Cross pattern",
                                     value = 3),
                        
                        numericInput("spoke_hole_d", 
                                     label = "Spoke hole diameter",
                                     value = 2.4,
                                     step = 0.1)
                        ),
                      splitLayout(                                            
                        numericInput("offset", 
                                     label = "Offset",
                                     value = 0), 
                        selectInput("side", label = "Choose a side", 
                                    choices = c("No offset" = "no_offset", 
                                                "Front" = "front", 
                                                "Rear" = "rear"),
                                    selected = "no_offset",
                                    width = "165")
                      )
                    
                  )
                ),
                 
                br(),
                br(),
                actionButton("button", "Calculate", icon("table"), 
                              class = "btn btn-primary btn-md"),
                width = 6),
               mainPanel(
                 br(),
                 br(),
                 br(),
                tableOutput("tab"),
                 width = 6),
               )
             ),
    tabPanel("What to measure", 
             fluidRow(
               column(2,
                      br(), 
                      img(src = "nippelsitz.png", height = 150, width = 200)
                      ),
               column(2, offset = 2,
                      br(),
                      img(src = "nabeseite.png", height = 150, width = 200)
                      ),
               column(2, offset = 2,
                      br(),
                      img(src = "nabetop.png", height = 150, width = 200)
                      )
               )
             )
    )
  )
)
  