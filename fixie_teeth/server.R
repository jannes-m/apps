# server.R
library("velo")

shinyServer(
  function(input, output, session) {
    shinyjs::onclick("toggleAdvanced",
                     shinyjs::toggle(id = "advanced", anim = TRUE))
    
    output$tab <- renderTable({
      if (input$button == 0) {
        res <- as.data.frame(matrix(rep("", 6 * input$nrow), nrow = input$nrow))
        res[, 1] <- 1:input$nrow
        names(res) <- c("Rank", "Teeth chainring", "Teeth cogring", 
                        "Gear ratio",
                        "Skid patches single-legged", "Skid patches ambidextrous")
        res
      } else {
        isolate({          
          res <-
            calc_fixie_teeth(ratio = input$ratio, 
                                  tol = input$tol,
                                  front = input$front[1]:input$front[2],
                                  rear = input$rear[1]:input$rear[2],
                                  nrow = input$nrow)
          res <- data.frame(1:nrow(res), res)
          names(res) <- c("Rank", "Teeth chainring", "Teeth cogring",
                          "Gear ratio",
                          "Skid patches single-legged", "Skid patches ambidextrous")    
          # print the first row in boldface
          res[1, ] <- sapply(res[1, ], function(x) {
            x <- as.character(h4(strong(x),
                                 style = "font-weight: 500;
                                color: #48ca3b;"))
            x
          })
          # return the data.frame
          res
        })
      }
    }, include.rownames = FALSE, 
    align = "c",  # rep("c", 7) returned an error, don't know why
    caption = paste0("Optimal teeth combination for a given gear ratio sorted ",  
                     "decreasingly by the number of skid patches."),
    caption.placement = getOption("xtable.caption.placement", "top"), 
    caption.width = getOption("xtable.caption.width", NULL),
    # sanitize.text.function translates my strong-command into bold-face
    # see ?print.xtable for more details
    sanitize.text.function = function(x){x} )
  }
)
