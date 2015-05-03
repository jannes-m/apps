# load shinyjs (needed for 'useShinyjs()')

library("shinyjs")

shinyUI(fluidPage(
  useShinyjs(),
  # Application title
  titlePanel(h3("Optimal teeth combination for a fixie bike")),
  
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
      numericInput(inputId = "ratio",
                   label = "Desired gear ratio",
                   value = 2.8,
                   step = 0.1),
      
      a(id = "toggleAdvanced", "Show/hide advanced info", href = "#"),
      shinyjs::hidden(
        div(id = "advanced",
            sliderInput(inputId = "front",
                        label = "Range of chainring teeth",
                        min = 25,
                        max = 65, 
                        value = c(31, 59)
            ),
            
            sliderInput(inputId = "rear",
                        label = "Range of cogring teeth",
                        min = 10,
                        max = 30, 
                        value = c(14, 21)),
            numericInput(inputId = "tol",
                         label = "Tolerance",
                         value = 0.1,
                         step = 0.1),
            numericInput("nrow", 
                         label = "Number of rows to return",
                         value = 6)           
        )
      ),
      br(),
      br(),
      actionButton("button", "Calculate", icon("table"), 
                   class = "btn btn-primary btn-md"), 
      width = 4),
    
    mainPanel(
      br(),
      br(),
      br(),
      tableOutput("tab"),
      width = 8)
    )
  )
  )




