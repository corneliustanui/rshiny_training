# packages
library(shiny)

# # Define basic UI without sidebar, and with column layout 
ui <- fluidPage(
  
  titlePanel("title panel: without sidebar, and with collumn layout"),
  
  column(width = 6, "Dashboard content 1 goes here"),
  
  column(width = 6, "Dashboard content 2 goes here"),
  
)

# server
server <- function(input, output, session){}

# Preview the UI in the console
shinyApp(ui = ui, server = server)
