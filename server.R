## Server definition ##


shinyServer(function(input, output) {



  output$distPlot <- renderPlot(height = 600, {

    data <- rbind(data,
                  tibble(
                    x = rep(c(1, 2, 3), each = input$vulnerabilitaet),
                    y = "2"
                  ))


    data$x <- factor(data$x, levels = c(1, 2, 3),
                     labels = c(input$text_klein, input$text_mittel, input$text_gross))


    # base
    ggplot(data = data, aes(x = x, fill = x, alpha = y)) +
      geom_bar() +
      scale_y_continuous(breaks = c(0, 20), minor_breaks = 0,
                         labels = c("niedrig", "hoch"), limits = c(0, 21)) +
      geom_segment(data = NULL, aes(x = .1, y = 0, xend = .1, yend = 20.5),
                   arrow = arrow(length = unit (.2, "cm")), size = .05, color = "grey") +
      labs(
        y = "Belastungs-/ Stressniveau",
        x = "Akute Stressoren"
      ) +
      # Angstschwelle
      geom_hline(linetype = 2, size = 1, color = "darkred", yintercept =
                   ifelse(
                     input$schwelle > input$vulnerabilitaet,
                     input$schwelle,
                     input$vulnerabilitaet +1
                     ))+
      geom_text(aes(x = 0, label = "Angstschwelle",
                    vjust = -1, hjust = -.25), color = "darkred", y =
                ifelse(
                  input$schwelle > input$vulnerabilitaet,
                  input$schwelle,
                  input$vulnerabilitaet +1
                )) +
      # Farbe
      scale_fill_manual(values =
                          ifelse(
                            data %>% group_by(x) %>% tally() %>% select(n) > input$schwelle,
                            "red",
                            "darkblue"
                            )) +
      guides(fill = F, alpha = F) +
    # Füllung
      geom_hline(yintercept = input$vulnerabilitaet, linetype = 1, size = 1, color = "black") +
      geom_text(aes(x = 0, y = input$vulnerabilitaet, vjust = 1.5, hjust = -.25), color = "black",
                    label = ifelse(
                      input$vulnerabilitaet < 5,
                      "Niedrige Vulnerabilität",
                      "Hohe Vulnerabilität"
                    )) +
      scale_alpha_manual(values = c("1" = .5, "2" = 0))
  })
})



# isolate(input$schwelle)
