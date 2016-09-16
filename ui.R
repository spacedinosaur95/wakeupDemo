
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(gdata)
wakeupdemo = read.csv("demodata.csv")

shinyUI(fluidPage(

  # Application title
  titlePanel("Shuttle Wakeup Songs"),


  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:", 
                  # put in options for the dropdown box
                 as.character(unique(wakeupdemo$Mission))
    )
),
    # Show a plot of the generated distribution
    mainPanel(
      DT::dataTableOutput("table")
    )
  )
))
