## ui definition ##

fluidPage(theme = shinytheme(theme = "sandstone"),


  # Application title
  titlePanel("Vulnerabilitäts-Stress-Modell"),

  # Sidebar with a slider input for Angstschwelle

  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "schwelle",
                  "Angstschwelle:",
                  min = 1,
                  max = 21,
                  value = 12),

 #     actionButton("DOSTUFF", label = "GO FOR GOLD")

      sliderInput(inputId = "vulnerabilitaet",
                  "Vulnerabilität:",
                  min = 1,
                  max = 9,
                  value = 2)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)
