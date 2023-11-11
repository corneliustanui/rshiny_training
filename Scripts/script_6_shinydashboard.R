# packages
library(shiny)
library(shinydashboard)

# Define UI
ui <- dashboardPage(
  skin = "red",
  dashboardHeader(titleWidth = '300px',
                  title = "basic dashboard with sidebar"),
  
  dashboardSidebar(
    sidebarMenu("Panel controls go here")
  ),
  
  dashboardBody("Dashboard content goes here")
)

# server
server <- function(input, output, session){}

# Preview the UI in the console
shinyApp(ui = ui, server = server)
