# packages
library(shiny)
library(shinydashboard)

# Define UI
ui <- navbarPage(
  title = "navbar-based dashboard",
  tabPanel("Home", icon = icon("home"),
           "Home content goes here"),
  
  tabPanel("Demographics", icon = icon("dashboard"),
           "Demographics content goes here"),
  
  tabPanel("Healthcare", icon = icon("people-roof"),
           "Healthcare content goes here"),
  
  tabPanel("Education", icon = icon("heart-pulse"),
           "Education content goes here")
)

# server
server <- function(input, output, session){}

# Preview the UI in the console
shinyApp(ui = ui, server = server)
