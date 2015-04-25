text <- paste("This is a simulation of Coin tosses and Die rollings.  ",
              "You can choose how many tosses/rolls you want by using the slider.",
              "The graph shows the results of the simulation along with a red line ",
              "which idicates the expected value.")

shinyUI(pageWithSidebar(
    headerPanel("Coin tosses / Die rolling simulation"),

    sidebarPanel(
        
        p(text),
        
        # Use RadioButtons to choose between a Coin and Die
        radioButtons("type", "Choose Coin or Die simulation:",
                     c("Coin toss" = "coin",
                       "Die roll" = "die")),
        
        # Use Slider to choose how many tosses / Rolls
        sliderInput('rolls', 'How many tosses/rolls', 
                    value = 10, min = 10, max = 1000, step = 10,),

        # Create links to ui.R and Server.R on GitHub
        helpText(HTML("Here is a link to the <a href = \"https://github.com/GauiGud/DevelopingDataProducts/blob/master/ui.R\">ui.R file</a>")),
        helpText(HTML("Here is a link to the <a href = \"https://github.com/GauiGud/DevelopingDataProducts/blob/master/Server.R\">Server.R file</a>"))        
    ),
    mainPanel(
        plotOutput('newPlot')
    )
))
