# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# http://shiny.rstudio.com

library(shiny)
library(gdata)
library(shinydashboard)
library(plotly)
wakeupdemo <- read.csv("demodata.csv")

skin <- Sys.getenv("DASHBOARD_SKIN")
skin <- tolower(skin)
if (skin == "")
  skin <- "blue"
header <- dashboardHeader(title = "Space Shuttle Wakeup Calls")
sidebar <- dashboardSidebar(sidebarMenu(
  menuItem(
    "Explore by Mission",
    tabName = "explorebymission",
    icon = icon("space-shuttle")
  ),
  menuItem("Data Vis", tabName = "datavis", icon = icon("pie-chart")),
  menuItem(
    "Connections",
    tabName = "connections",
    icon = icon("exchange")
  )
))

body <- dashboardBody(tabItems(
  tabItem(
    tabName = "explorebymission",
    box(
      title = "Select Mission",
      status = "primary",
      solidHeader = TRUE,
      collapsible = FALSE,
      selectInput("dataset", "Choose a dataset:",
                  # put in options for the dropdown box
                  as.character(unique(wakeupdemo$Mission)))
    ),
    box(
      title = "Songs Played on Mission",
      status = "warning",
      solidHeader = TRUE,
      # Show a plot of the generated distribution
      mainPanel(DT::dataTableOutput("table"))
    )
  ),
  
  tabItem(tabName = "datavis",
          fluidRow(
            tabBox(
              title = "Plotly tabBox",
              id = "tabset1",
              height = "500px",
              width = "450px",
              tabPanel(
                "Bar Chart",
                h2("plotly demo"),
                box(title = "Bar Chart", status = "primary",
                    plotlyOutput('plot1'))
              ),
              
              tabPanel(
                "Pie Chart",
                h2("plotly demo"),
                box(title = "Pie Chart", status = "primary",
                    plotlyOutput('plot2'))
              )
            )
          )),
  tabItem(tabName = "connections",
          h2("Neo4j Embed Demo"))
))
ui <- dashboardPage(header, sidebar, body, skin = skin)
