# packages
library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(stringr)
library(shinyWidgets)
library(shinycssloaders)
library(plotly)

# load data
STIData <- readRDS("./Data/Clean STI Data.rds")

# Define UI
ui <- navbarPage(
  title = "Training Dashboard",
  
  tabPanel("Home", icon = icon("home"),
           
           "The data used in this app is displayed below",
           
           downloadButton("download_STIData", label = "Download csv"),
           
           DTOutput("data_description") %>% 
             withSpinner(type = 6, 
                         size = 0.5,
                         color = "#FFAD00")),
  
  tabPanel("Demographics", icon = icon("dashboard"),
           
           column(width = 2,
                  
                  pickerInput(inputId = "LEVELOFEDUCATION", 
                              label = "What is your highest level of education?", 
                              choices = unique(STIData$LEVELOFEDUCATION),
                              selected = unique(STIData$LEVELOFEDUCATION)[1],
                              multiple = FALSE
                  ),
                  
                  pickerInput(inputId = "MARITALSTATUS", 
                              label = "What is your marital status?", 
                              choices = unique(STIData$MARITALSTATUS),
                              selected = unique(STIData$MARITALSTATUS)[1],
                              multiple = FALSE
                  ),
                  
                  checkboxGroupInput(
                    inputId = "USEDCONDOM",
                    label = "Did you use condom?",
                    choices = unique(STIData$USEDCONDOM), 
                    selected = unique(STIData$USEDCONDOM), 
                    inline = TRUE
                  )
           ),
           
           column(width = 5,
                  
                  plotlyOutput("plot1") %>% 
                    withSpinner(type = 6, 
                                size = 0.5,
                                color = "#FFAD00")
           ),
           
           column(width = 5,
                  
                  DTOutput("summary_data1") %>% 
                    withSpinner(type = 6, 
                                size = 0.5,
                                color = "#FFAD00")
           )
      )
)


# server
server <- function(input, output, session){
  
  # data description
  output$data_description <- renderDataTable(
    server = FALSE, {
      DT::datatable(
        data = STIData,
        filter = "top",
        rownames = FALSE,
        selection = "single"
      )
    }
  )
  
  # download STIData
  output$download_STIData <- downloadHandler(
    filename = function() {
      paste("STIData_", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      write.csv(STIData, file, row.names = FALSE)
    }
  )
  
  
  # filter_1: level of education and marital status 
  filter_1 <- 
    reactive(
      {
        filter_1_reactive <- 
          STIData %>%
          filter(LEVELOFEDUCATION %in% input$LEVELOFEDUCATION) %>% 
          filter(MARITALSTATUS %in% input$MARITALSTATUS) %>% 
          filter(USEDCONDOM %in% input$USEDCONDOM) %>% 
          group_by(OCCUPATION, SEX, CASESTATUS) %>% 
          summarise(AGE = round(mean(AGE, na.rm = TRUE), 1))
        return(filter_1_reactive)
      }
    )
  
  # output table of summarized data
  output$summary_data1 <- renderDataTable(filter_1())
  
  # plot 1
  output$plot1 <- renderPlotly({ 
    plot1 <- filter_1() %>% 
      ggplot(aes(x = OCCUPATION,
                 y = AGE, 
                 fill = SEX)) +
      geom_col() +
      facet_wrap( ~ CASESTATUS, scales = "free")+
      coord_flip() +
      labs(title = "STI Status by Employment, Age and Sex", 
           x = "OCCUPATION",
           y = "AGE",
           caption = "Source: Survey Data, 2009") +
      theme(panel.border = element_blank(),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(), 
            panel.background = element_blank(),
            axis.line = element_line(colour = "black"))
    
    ggplotly(plot1)
  })
  
}

# Preview the UI in the console
shinyApp(ui = ui, server = server)
