# packages
library(shiny)

# Define UI
ui <- fluidPage(
  
  titlePanel("title panel: basic UI with sidebar and column & row layout"),
  
  sidebarLayout(
    sidebarPanel(width = 3, 
                 "sidebar panel content"),
    
    mainPanel(
      column(
        width = 6,
        fluidRow("Dashboard content 1 goes here"),
        
        br(),
        
        fluidRow("Dashboard content 2 goes here")
      ),
      
      column(
        width = 6,
        fluidRow("Dashboard content 3 goes here"),
        
        br(),
        
        fluidRow("Dashboard content 4 goes here")
      )
    )
  )
)

# server
server <- function(input, output, session){}

# Preview the UI in the console
shinyApp(ui = ui, server = server)
