# server.R
library("velo")

shinyServer(
  function(input, output, session) {
    # shinyjs stuff
    
    # show/hide more input parameters
    onclick("toggleAdvanced", toggle(id = "advanced", anim = TRUE))
    # only activitate the calculate button if the user has provided all 
    # necessary input parameters
    observe({
      toggleState(id = "button", 
                  condition = 
                    is.numeric(input$n) & 
                    is.numeric(input$erd) & 
                    is.numeric(input$left_flange_d) &
                    is.numeric(input$right_flange_d) &
                    is.numeric(input$wr) &
                    is.numeric(input$wl) &
                    is.numeric(input$cross) &
                    is.numeric(input$spoke_hole_d) &
                    is.numeric(input$offset))

    })


    # actual output
    output$tab <- renderTable({
      if (input$button == 0) {
        res <- as.data.frame(matrix(rep("", 15), nrow = 5))
        res[, 1] <- 0:4
        names(res) <- c("Cross pattern", "Spoke length (left)",
                        "Spoke length (right)")
        res
      } else {
        isolate({
          # doesn't work using shiny server.io
          # args <- as.list(input)
          # args <- args[-which(names(args) == "button")]
          #  do.call(calc_spoke_lengths, args)
          
         res <- plyr::ldply(0:4, function(cross) {
            calc_spoke_lengths(n = input$n,
                               erd = input$erd,
                               left_flange_d = input$left_flange_d,
                               right_flange_d = input$right_flange_d,
                               wl = input$wl,
                               wr = input$wr,
                               cross = cross,
                               spoke_hole_d = input$spoke_hole_d,
                               offset = input$offset,
                               side = input$side) 
            })
         res <- data.frame(0:4, res)
         names(res) <- c("Cross pattern", "Spoke length (left)",
                         "Spoke length (right)")
         # print the row with the desired cross-pattern in boldface
         res[input$cross + 1, ] <- sapply(res[input$cross + 1, ], function(x) {
           x <- as.character(h4(strong(x),
                                style = "font-weight: 500;
                                color: #48ca3b;"))
           x
           })
         # return the data.frame
         res
         })
       }
      }, include.rownames = FALSE, align = rep("c", 4),
      caption = "Spoke lengths for the indicated input parameters.",
      caption.placement = getOption("xtable.caption.placement", "top"), 
      caption.width = getOption("xtable.caption.width", NULL),
      # sanitize.text.function translates my strong-command into bold-face
      # see ?print.xtable for more details
      sanitize.text.function = function(x){x} )     
  }
)

# What to do next:
# 2. helpful error messages:
# http://shiny.rstudio.com/articles/validation.html

# shinyapps::showLogs
# To make the function actually work on the shiny server, I had to:
# create locally a folder which should contain all necessary packages 
# dir.create("D:/R/lib")
# .libPaths("D:/R/lib")
# install the velo package from github
# devtools::install_github("jannes-m/velo")
# devtools::install_github("daattali/shinyjs")
# deploy the app
# setwd("C:/Users/Jannes/Desktop/spoke_app")
# https://jannes-m.shinyapps.io/spoke_app/
# library(shinyapps)
# deployApp()
