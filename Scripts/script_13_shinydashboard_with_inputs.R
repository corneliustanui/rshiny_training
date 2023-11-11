# packages
library(shiny)
library(shinydashboard)

# Define UI
ui <- navbarPage(
  title = "Training Dashboard",
  
  tabPanel("Home", icon = icon("home"),
           "Home content goes here"),
  
  tabPanel("Demographics", icon = icon("dashboard"),
           
           column(width = 4,

                  h4("Text input"),
                  textInput(inputId = "name1",
                            label = "Name",
                            value = "Cornelius",
                            # value = NULL, 
                            placeholder = "Enter your first name"),
                  
                  h4("Text input(password)"),
                  passwordInput(inputId = "password", 
                                label = "Enter your password",
                                placeholder = "Enter your password"),
                  
                  h4("Long text input"),
                  textAreaInput(inputId = "story", 
                                label = "Tell me about yourself", 
                                rows = 3),
                  
                  
                  ),
           
           column(width = 4,
                  
                  h4("Numeric input"), 
                  numericInput(inputId = "ageval1",
                               label = "Age",
                               # value = 30,
                               value = NULL, 
                               min = 0,
                               max = 100,
                               step = 2
                               ), 
                  
                  h4("Slider input with immovable minimum"), 
                  sliderInput(inputId = "agerange1", 
                              label = "Age range", 
                              value = 50, 
                              min = 0, 
                              max = 100),
                  
                  h4("Slider input with movable minimum"), 
                  sliderInput(inputId = "agerange1", 
                              label = "Age range", 
                              value = c(10, 50), 
                              min = 0, 
                              max = 100)
                  ),
           column(width = 4,
                  
                  h4("Date input"), 
                  dateInput(inputId = "dob", 
                            label = "When were you born?",
                            value = "1990-02-12",
                            min = "1980-12-31",
                            max = date(),
                            #max = "2023-12-31"
                            ),
                  
                  h4("Date range input"), 
                  dateRangeInput(inputId = "holiday", 
                                 label = "When do you want to go on vacation next?")
                  )
           ),
  
  tabPanel("Healthcare", icon = icon("people-roof"),
           column(width = 4,
                  
                  h4("Select multiple"),
                  selectInput(inputId = "county", 
                              label = "What's your favourite county?", 
                              choices = c("Nairobi", "Machakos", "Kakamega", "Migori", "Uasin Gishu", "Kisumu"),
                              # selected = "Nairobi",
                              selected = NULL,
                              multiple = FALSE,
                              # multiple = FALSE
                              ),
                  
                  
                  h4("Select one"),
                  radioButtons(inputId = "animal", 
                               label = "What's your favourite animal?", 
                               choices  = c("Cat", "Dog", "Cow", "Horse", "Donkey"),
                               selected = "Cow",
                               #selected = NULL,
                               inline = FALSE
                               ),
                  
                  h4("Select one - inline"),
                  radioButtons(inputId = "animal2", 
                               label = "What's your favourite animal?", 
                               choices  = c("Cat", "Dog", "Cow", "Horse", "Donkey"),
                               selected = "Cat",
                               #selected = NULL,
                               inline = TRUE
                  ),
                  
                  h4("File input"),
                  fileInput(inputId = "uploadfile1",
                            label = "Select file",
                            placeholder = "No file selected",
                            multiple = TRUE)
                  ),
           
           column(width = 4,
                  
                  h4("Checkbox"),
                  checkboxGroupInput(inputId = "color1", 
                                     label = "What is/are your favourite color(s)?",
                                     choices = c("Red", "Blue", "Yellow", "Maroon"),
                                     selected = "Blue",
                                     inline = TRUE)
                  
                  
                  ),
           
           column(width = 4
                  )
           ),
  
  tabPanel("Education", icon = icon("heart-pulse"),
           "Education content goes here")
)

# server
server <- function(input, output, session){}

# Preview the UI in the console
shinyApp(ui = ui, server = server)
