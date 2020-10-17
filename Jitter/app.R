#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("How jitter helps visualizing univariate data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("Jitter",
                        "Jitter height:",
                        min = 0,
                        max = 0.2,
                        value = 0, 
                        animate = TRUE)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        set.seed(2512)
        ggplot(data= SDGPov) +
            aes(x = Poverty, y ="") +
            geom_jitter(color=SIAP.color, size=0.9, alpha=0.9,  height = input$Jitter) +
            ggtitle("Points (jitter)")+ 
            xlab(SDGPov.caption)+
            theme_tufte()
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
