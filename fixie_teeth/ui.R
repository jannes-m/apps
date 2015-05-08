# load shinyjs (needed for 'useShinyjs()')

library("shinyjs")

shinyUI(fluidPage(
  useShinyjs(),
  # Application title
  titlePanel(h3("Optimal teeth combination for a fixie bike")),
  fluidRow(
    column(12,
           includeMarkdown("description.md")
    )
  ),
  br(),
  br(),
  sidebarLayout(
    sidebarPanel(
      style="min-width:200px;max-width:450px", 
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
      p("Please fill out all fields"),
      div(numericInput(inputId = "ratio",
                   label = "Desired gear ratio",
                   value = 2.8,
                   step = 0.1),
          style = "max-width:210px"),
      
      
      a(id = "toggleAdvanced", "Show/hide more input parameters", href = "#"),
      shinyjs::hidden(
        div(id = "advanced",
            div(
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
            style = "min-width:230px;max-width:250px"),
            splitLayout(
            numericInput(inputId = "tol",
                         label = "Tolerance",
                         value = 0.1,
                         step = 0.1),
            numericInput("nrow", 
                         label = "Number of rows to return",
                         value = 6)           
            )
        )
      ),
      br(),
      br(),
      actionButton("button", "Calculate", icon("table"), 
                   class = "btn btn-primary btn-md"), 
      width = 6),
    
    mainPanel(
      tableOutput("tab"),
      width = 6)
    )
  )
)



