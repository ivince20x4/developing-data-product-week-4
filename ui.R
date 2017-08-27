#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI 
fluidPage(
  
  # Application title
  titlePanel("New Zealand Crashes"),
  
  # Sidebar with a slider input for year
  sidebarLayout(
    sidebarPanel(
       sliderInput("Population",
                   "Population per 100000",
                   249,
                   773,
                   value = 489),
       checkboxInput("Model1", "Show/Hide Model1", value = TRUE)),

    # Show a plot of the data
    mainPanel(
       plotOutput("plot1"),
       h3("Predicted Fatalities from Model1:"),
       textOutput("prediction1")
    )
  )
)

