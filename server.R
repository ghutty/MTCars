# server.R

library(shiny)
library(datasets)
library(caret)
library(ggplot2)

mtcarsdata <- mtcars
mtcarsdata$cyl <- factor(mtcarsdata$cyl)
mtcarsdata$am <- factor(ifelse(mtcarsdata$am == 0, "Automatic", "Manual"))
mtcarsdata$vs <- factor(mtcarsdata$vs)
mtcarsdata$gear <- factor(mtcarsdata$gear)
mtcarsdata$carb <- factor(mtcarsdata$carb)

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  output$caption <- renderText({
    formulaText()
  })

  output$mpgPlot1 <- renderPlot({
    boxplot(as.formula(formulaText()), data = mtcarsdata, notch=FALSE, xlab = input$variable, ylab = "MPG",
            main = "MPG (Miles Per Gallon)", varwidth = TRUE, col = c("orange","blue","red","green","yellow","purple"))
    #legend("topright",inset=.1, title="MPG (Mile Per Gallon)", input$variable,
    #       fill=c("orange","blue","red","green"), horiz=TRUE)
  })
  #output$mpgAnova <- renderText({
  #  t.test(as.formula(formulaText()), data = mtcarsdata)
  #})
})