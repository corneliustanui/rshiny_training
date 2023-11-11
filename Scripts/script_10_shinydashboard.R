# packages
library(shiny)
library(shinydashboard)

# Define UI
ui <- navbarPage(
  title = "navbar-based dashboard",
  tabPanel("Home", icon = icon("home"),
           "Home content goes here"),
  
  tabPanel("Demographics", icon = icon("dashboard"),
           
           tabsetPanel(
             tabPanel("Content 1", "Demographics content 1 goes here"),
             tabPanel("Content 2", "Demographics content 2 goes here"),
             tabPanel("Content 3", "Demographics content 3 goes here")
             )
           ),
           
  tabPanel("Healthcare", icon = icon("people-roof"),
           "Healthcare content goes here"),
  
  tabPanel("Education", icon = icon("heart-pulse"),
           "Education content goes here")
)

# server
server <- function(input, output, session){}

# Preview the UI in the console
shinyApp(ui = ui, server = server)
