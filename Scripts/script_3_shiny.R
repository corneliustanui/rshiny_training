# packages
library(shiny)

# Define UI
ui <- fluidPage(
  
  titlePanel("title panel: basic UI with sidebar and row layout"),
  
  sidebarLayout(
    sidebarPanel("sidebar panel"),
    
    mainPanel(
      fluidRow("Dashboard content 1 goes here"),
      
      br(),
      
      fluidRow("Dashboard content 2 goes here"),
      
      br(),
      
      fluidRow(h6("Dashboard content 3 goes here"))
      
    )
  )
)

# server
server <- function(input, output, session){}

# Preview the UI in the console
shinyApp(ui = ui, server = server)
