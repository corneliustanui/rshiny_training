# packages
library(shiny)
library(shinydashboard)

# Define UI
ui <- dashboardPage(
  skin = "green",
  dashboardHeader(titleWidth = '300px',
                  title = "basic dashboard with sidebar"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem(text = "Home",tabName = "home",icon = icon("home")),

      menuItem(text = "Dashboard",startExpanded = FALSE, icon = icon("dashboard"),
               menuSubItem(text = "Demographics", tabName = "info1", icon = icon("people-roof")),
               menuSubItem(text = "Healthcare", tabName = "info2", icon = icon("heart-pulse")),
               menuSubItem(text = "Education", tabName = "info3", icon = icon("school"))
               )
          )
    ),
  
  dashboardBody(
    tabItems(
      tabItem("home", "Home content goes here"),
      
      tabItem("info1", "Demographics content goes here"),
      
      tabItem("info2", "Healthcare content goes here"),
      
      tabItem("info3", "Education content goes here")
    )
  )
)

# server
server <- function(input, output, session){}

# Preview the UI in the console
shinyApp(ui = ui, server = server)
