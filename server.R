
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)


function(input, output) {

  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    subset(wakeupdemo, Mission == input$dataset)
    }
    )
    )
}
