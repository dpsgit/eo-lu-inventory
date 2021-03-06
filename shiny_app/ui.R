#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(RColorBrewer)
library(sf)
library(tidyverse)
library(readxl)
library(googleway)
library(shinydashboard)

# Define UI for application that draws a histogram
ui <- dashboardPage(
  dashboardHeader(title = "East Oakland Land Use Explorer"),
  dashboardSidebar(
      selectizeInput("search_addr","Search Address",eo_parcels_sf$addr_full, selected = NULL, multiple = FALSE, options = list(create = FALSE))
  ),
  dashboardBody(
    fluidRow(
      column(
        width = 8,
        box(
          solidHeader = TRUE,
          title = "Assessor",
          tableOutput('assessor_dt'),
          width = NULL,
          collapsible = TRUE
        )
      ),
      column(
        width = 4,
        box(
          solidHeader = TRUE,
          title = "Parcel Map",
          leafletOutput("map"),
          width = NULL
        )
      )
    )
  )
)

