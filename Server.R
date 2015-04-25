library(UsingR)

shinyServer(
    function(input, output) {
        output$newPlot <- renderPlot({

            min <- 1
            
            if(input$type == "coin") {
                max <- 2
                SimResult <- as.integer(runif(input$rolls,min,max+1) )
                heading <- " toss of a single coin"
                SimResult[SimResult == 1] <- 'Head'
                SimResult[SimResult == 2] <- 'Tail'
            }
            if(input$type == "die") {
                max <- 6
                SimResult <- as.integer(runif(input$rolls,min,max+1) )
                heading <- " rolls of a single die"
            }
            
            # draw the result and the expected value line
            barplot(summary(as.factor(SimResult)), col="lightblue")
            abline(input$rolls/max ,0, col="red")
        })
    }
)
