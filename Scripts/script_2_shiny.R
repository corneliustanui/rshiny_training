# packages
library(shiny)

# Define basic UI with sidebar
ui <- fluidPage(
  titlePanel("title panel: basic UI with sidebar"),
  
  sidebarLayout(
    sidebarPanel("sidebar panel"),
    mainPanel("Dashboard content goes here")
  )
)

# server
server <- function(input, output, session){}

# Preview the UI in the console
shinyApp(ui = ui, server = server)

