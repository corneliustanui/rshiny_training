# packages
library(shiny)
library(shinydashboard)
library(ggplot2)

# Define UI
ui_def <- navbarPage(
  title = "Training Dashboard",
  
  tabPanel("Home", icon = icon("home"),
           "Home content goes here"),
  
  tabPanel("Demographics", icon = icon("dashboard"),
           
           column(width = 4,
                  
                  textInput(inputId = "name1",
                            label = "First Name",
                            value = NULL, 
                            placeholder = "Enter your first name"),
                  
                  textInput(inputId = "name2",
                            label = "Second Name",
                            value = NULL, 
                            placeholder = "Enter your second name"),
                  
                  
                  numericInput(inputId = "ageval1",
                               label = "Age",
                               # value = 30,
                               value = NULL, 
                               min = 0,
                               max = 100,
                               step = 2
                  ),
                  
                  radioButtons(inputId = "sex", 
                               label = "What's your sex?", 
                               choices  = c("Male", "Female", "Other"),
                               selected = NULL,
                               inline = TRUE
                  ),
                  
                  selectInput(inputId = "school", 
                              label = "What is your highest level of education?", 
                              choices = c("Primary", "Secondary", "Tertiary", "Other"),
                              selected = NULL,
                              multiple = FALSE
                  ),
                  
                  textAreaInput(inputId = "story", 
                                label = "Tell me about yourself", 
                                rows = 3),
                  
                  actionButton("submitbutton", "Submit")
                  
                  
           ),
           
           column(width = 4,
                  tableOutput("demo_data"),
                  
                  downloadButton("download_demo_data", label = "Download csv")
           ),
           
           column(width = 4,
                  plotOutput("bargraph1"),
                  
                  plotOutput("bargraph2")
                  
           )
  )
)
