# ui.R

library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Motor Trend Cars (MPG Efficient Variables)"),
  
  sidebarPanel(
    helpText("Manual transmissions are more fuel efficient than Automatics.  Check other variables that affect mpg efficiency."),
    selectInput("variable", "Variable:",
                list("Transmission Type" = "am", 
                     "Cylinders" = "cyl", 
                     "Carborators" = "carb", 
                     "Gears" = "gear"))

  ),
  

  mainPanel(
    h3(textOutput("caption")),
    
    plotOutput("mpgPlot1")
    #h5(textOutput("mpgAnova"))
  )
))