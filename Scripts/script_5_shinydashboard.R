# packages
library(shiny)
library(shinydashboard)

# Define UI
ui <- dashboardPage(
  skin = "green",
  dashboardHeader(titleWidth = '400px',
                  title = "basic dashboard with disabled sidebar"),
  
  dashboardSidebar(
    
    disable = TRUE
  ),
  
  dashboardBody("Dashboard content goes here")
)

# server
server <- function(input, output, session){}

# Preview the UI in the console
shinyApp(ui = ui, server = server)
