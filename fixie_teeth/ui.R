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
      # set the minimal and maximal width of the widgets
      style="min-width:200px;max-width:450px", 
      # define the header 
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
      # Define globally the width of sliderInput
      #  browseURL(paste0("http://stackoverflow.com/questions/16970989/",
      #                   "sliderinput-in-shiny-how-to-control-the-length-width-",
      #                   "of-the-slider-in-shiny"))
      tags$head(
        tags$style(type="text/css", ".irs {max-width: 190px;}")
      ),
      
      p("Please fill out all fields"),
      div(
        numericInput(inputId = "ratio",
                     label = "Desired gear ratio",
                     value = 2.8,
                     step = 0.1),
        style = "max-width:210px"),
            
      a(id = "toggleAdvanced", "Show/hide more input parameters", href = "#"),
      shinyjs::hidden(
        div(id = "advanced",
           splitLayout(
             
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
                        value = c(14, 21))
           ),
           
            splitLayout(
            div(numericInput(inputId = "tol",
                         label = "Tolerance",
                         value = 0.1,
                         step = 0.1), 
                style = "max-width:200px"),
            div(
            numericInput("nrow", 
                         label = "Number of rows to return",
                         value = 6),
            style = "max-width:200px")
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
      width = 5)
    )
  )
)



