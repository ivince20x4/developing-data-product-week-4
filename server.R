#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a line plot
function(input, output) {
   
   #build a prediction model
    
    model1 <- lm(NumberofFatalities ~ Per100000Population, data = NZCrashes)
   
    model1predict <- reactive({
      NoPopulation <- input$Population
      predict(model1, newdata= data.frame(Per100000Population = NoPopulation))
    })
    
     
   # draw the line by year
    output$plot1 <- renderPlot({
      NoPopulation <- input$Population
      
       plot(NZCrashes$Per100000Population, NZCrashes$NumberofFatalities,
            xlab ="Population per 100000", ylab= "No of fatalities", xlim = c(249,773), ylim =c(232, 843))
       if(input$Model1){
         abline(model1, col="blue", lwd =2)
       }
    points(NoPopulation, model1predict(),col ="blue", pch =16, cex =2)
    })
    output$prediction1 <- renderText({
      model1predict()
    })
    }
  