library(shiny)
library(factoextra)

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
  
  # Expression that generates a plot of the distribution. The expression
  # is wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically 
  #     re-executed when inputs change
  #  2) Its output type is a plot 
  #
  output$dbplot <- renderPlot({
    
    # generate an rnorm distribution and plot it
    # dist <- rnorm(input$obs)
    # hist(dist)
    plot(dk, dbscan, main = "DBSCAN", frame = FALSE)
  })
  output$kmeanplot <- renderPlot({
    
    # generate an rnorm distribution and plot it
    # dist <- rnorm(input$obs)
    # hist(dist)
    km.res <- kmeans(dc, 20, nstart = 25)
    fviz_cluster(km.res, dc, frame = FALSE, geom = "point")
  })
  output$table <- renderPlot({
    
    # generate an rnorm distribution and plot it
    # dist <- rnorm(input$obs)
    # hist(dist)
    plot(do_top$URL, do_top$Freq)
  })
  output$preference <- renderPlot({
    
    # generate an rnorm distribution and plot it
    # dist <- rnorm(input$obs)
    # hist(dist)
    ggplot(do_top,x=do_top$Freq,aes(x=factor(1),fill=factor(do_top$Freq)))+geom_bar(width = 1)+
      coord_polar(theta="y")+ggtitle("Preference Plot")+
      labs(x="",y="")+
      guides(fill=guide_legend(title = 'Preference'))
  })
})