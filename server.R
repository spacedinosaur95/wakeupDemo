# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
wakeupdemo <- read.csv("demodata.csv")

function(input, output) {
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    subset(wakeupdemo, Mission == input$dataset)
  }))
  
  output$plot1 <- renderPlotly({
    p <- plot_ly(
      x = c("1981", "1982", "1983", "1984"),
      y = c(4, 17, 25, 43),
      name = "Songs/Year",
      type = "bar"
    )
    p
  })
  
  output$plot2 <- renderPlotly({
    ds <-
      data.frame(
        labels = c("1 Category", "2 Categories", "3 Categories", "4 Categories"),
        values = c(1, 1, 5, 3)
      )
    plot_ly(ds,
            labels = labels,
            values = values,
            type = "pie") %>%
      layout(title = "Categories and Missions")
  })
}
