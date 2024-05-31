# shiny_app/ui.R

library(shiny)
library(leaflet) 

shinyUI(fluidPage(
  titlePanel("Fire Detection Data Visualizations"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("plotType", "Select Plot Type:",
                  choices = list("Time Series of Total Fire Detections" = "time_series",
                                 "Histogram of Fire Intensities" = "histogram",
                                 "Interactive Map of Fire Detections" = "map"))
    ),
    
    mainPanel(
      conditionalPanel(
        condition = "input.plotType == 'time_series'",
        plotOutput("timeSeriesPlot")
      ),
      conditionalPanel(
        condition = "input.plotType == 'histogram'",
        plotOutput("histogramPlot")
      ),
      conditionalPanel(
        condition = "input.plotType == 'map'",
        leafletOutput("mapPlot") 
      )
    )
  )
))

