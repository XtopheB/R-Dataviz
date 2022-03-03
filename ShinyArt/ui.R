#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("A beautiful rose"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("degree",
                        "Let's play around",
                        min = 1,
                        max = 5,
                        step = 0.5,
                        value = 1, 
                        animate = TRUE), 
            sliderInput(inputId ="alpha",
                        label =  "Darkness \n (depends on the number of points)", 
                        min = 0.01,
                        max = 0.2,
                        step = 0.01,
                        value = 0.05)
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("RosePlot")
        )
    )
))
