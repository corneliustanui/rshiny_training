# packages
library(shiny)
library(shinydashboard)
library(DT)
library(dplyr)
library(lubridate)

# Define UI
ui <- navbarPage(
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
                  
                  dateInput(inputId = "dob", 
                            label = "When were you born?",
                            format = "yyyy-mm-dd",
                            value = NULL,
                            min = NULL,
                            max = NULL,
                  ),
                  
                  selectInput(inputId = "school", 
                              label = "What is your highest level of education?", 
                              choices = c("Primary", "Secondary", "Tertiary", "Other"),
                              selected = NULL,
                              multiple = FALSE
                  ),

                  textAreaInput(inputId = "story", 
                                label = "Tell me about yourself", 
                                rows = 3)
                  
                  
           ),
           
           column(width = 8,
                  tableOutput("demographics_data"),
                  
                  downloadButton("download_demo_data", label = "Download csv"),
                  downloadButton("download_demo_data2", label = "Download txt")

           )
     )
)

# server
server <- function(input, output, session){
  
  # create a basic data frame
  demo_data <- reactive({
    demogs_data <- data.frame(Name = paste(input$name1, input$name2),
                              Age = input$ageval1,
                              DOB = input$dob,
                              Education = input$school,
                              About = input$story)
    
    return(demogs_data)
    }
  )
  
  # render data into a table
  output$demographics_data <- renderTable(demo_data())
  
  
  # download data button 
  output$download_demo_data <- downloadHandler(
    filename = function() {
      paste("Demographics Data_", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      write.csv(demo_data(), file, row.names = FALSE)
    }
  )
  
  # download data button 
  output$download_demo_data2 <- downloadHandler(
    filename = function() {
      paste("Demographics Data_", Sys.Date(), ".txt", sep="")
    },
    content = function(file) {
      write.csv(demo_data(), file, row.names = FALSE)
    }
  )
  
}

# Preview the UI in the console
shinyApp(ui = ui, server = server)
