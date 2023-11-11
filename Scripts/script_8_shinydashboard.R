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
      
      tabItem("info1", 
              column(
                width = 6,
                fluidRow(box("Demographics content 1 goes here")),
                fluidRow(box("Demographics content 2 goes here"))
              ),
              
              column(
                width = 6,
                fluidRow(box(title = "some title",
                             status = "success",
                             collapsible = FALSE,
                             solidHeader = TRUE,
                             "Demographics content 3 goes here")),
                
                fluidRow(box(title = "some title",
                             status = "warning",
                             collapsible = TRUE,
                             "Demographics content 4 goes here"))
              )
            ),
      
      tabItem("info2",
              fluidRow(
                column(width = 6, box("Healthcare content 1 goes here")),
                column(width = 6, box("Healthcare content 2 goes here"))
              ),
              
              fluidRow(
                column(width = 6, box("Healthcare content 3 goes here")),
                column(width = 6, box("Healthcare content 4 goes here"))
              )
            ),
      
      tabItem("info3", "Education content goes here")
    )
  )
)

# server
server <- function(input, output, session){}

# Preview the UI in the console
shinyApp(ui = ui, server = server)
