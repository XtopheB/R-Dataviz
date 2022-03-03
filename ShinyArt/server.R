#
# This is the server logic of a Shiny web application. 
#

library(shiny)
library(tidyverse)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$RosePlot <- renderPlot({
        
# Graphic created by Antonio Sánchez Chinchón
        # seq(-3,3,by=.01) %>%   <- a bit slow..
            seq(-3,3,by=.05) %>%
            expand.grid(x=., y=.) %>%
            ggplot(aes(x=(1-x-sin(y^input$degree)), y=(1+y-cos(x^input$degree)))) +
            geom_point(alpha=input$alpha, shape=20, size=0)+
            theme_void()+
            coord_polar()

    })

})
