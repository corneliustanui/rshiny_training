# packages
library(shiny)
library(shinydashboard)

# Define UI
ui <- navbarPage(
  title = "navbar-based dashboard",
  
  tabPanel("Home", icon = icon("home"),
           "Home content goes here"),
  
  navbarMenu("Demographics", icon = icon("dashboard"),
             tabPanel("Content 1", "Demographics content 1 goes here"),
             tabPanel("Content 2", "Demographics content 2 goes here"),
             tabPanel("Content 3", 
                      tabsetPanel(
                        tabPanel("Content 31", "Demographics content 31 goes here"),
                        tabPanel("Content 32", "Demographics content 32 goes here"),
                        tabPanel("Content 33", "Demographics content 33 goes here")
                      )
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
