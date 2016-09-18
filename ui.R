# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# http://shiny.rstudio.com

library(shiny)
library(gdata)
library(shinydashboard)
wakeupdemo <- read.csv("demodata.csv")

skin <- Sys.getenv("DASHBOARD_SKIN")
skin <- tolower(skin)
if (skin == "")
  skin <- "blue"
header <- dashboardHeader(title = "Space Shuttle Wakeup Calls")
sidebar <- dashboardSidebar(
  menuItem("Explore by Mission", tabName = "explorebymission", icon = icon("space-shuttle")),
  menuItem("Data Vis", tabName = "datavis", icon = icon("pie-chart")),
  menuItem("Connections", tabName = "connections", icon = icon("exchange"))
)

body <- dashboardBody(
  box(
    title = "Select Mission", status = "primary", solidHeader = TRUE,
    collapsible = FALSE,
    selectInput("dataset", "Choose a dataset:",
                # put in options for the dropdown box
                as.character(unique(wakeupdemo$Mission)))
  ),
  box(
    title = "Songs Played on Mission", status = "warning", solidHeader = TRUE,
    # Show a plot of the generated distribution
    mainPanel(DT::dataTableOutput("table")))
  )
ui <- dashboardPage(header, sidebar, body, skin = skin)
# 
# shinyUI(fluidPage(
#   # Application title
#   titlePanel("Shuttle Wakeup Songs"),
#   
#   # Sidebar with a slider input for number of bins
#   sidebarLayout(sidebarPanel(
#     selectInput("dataset", "Choose a dataset:",
#                 # put in options for the dropdown box
#                 as.character(unique(wakeupdemo$Mission)))
#   ),
#   # Show a plot of the generated distribution
#   mainPanel(DT::dataTableOutput("table")))
# ))
