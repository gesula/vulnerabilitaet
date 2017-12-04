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
                  min = 0,
                  max = 9,
                  value = 2),

 # Text1
      textInput(inputId = "text_klein",
                label = "Kleinster akuter Stressor",
                value = "Sreit in der Familie"),

 # Text2
 textInput(inputId = "text_mittel",
           label = "Mittlerer akuter Stressor",
           value = "Offene Rechnungen"),

 # Text3
 textInput(inputId = "text_gross",
           label = "Größter akuter Stressor",
           value = "Zusätzlicher Arbeitsauftrag")
 ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)
