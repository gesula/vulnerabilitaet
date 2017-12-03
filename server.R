## Server definition ##

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    input$DOSTUFF

    # draw the histogram with the specified number of bins
    ggplot(data = faithful, aes(x = waiting)) +
      geom_histogram(bins = isolate(input$bins))
  })
})
