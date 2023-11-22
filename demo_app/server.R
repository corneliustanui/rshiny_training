
# server
server_def <- function(input, output, session){
  
  
  # create a basic data frame
  demos_data <- reactiveValues(demo_data = tibble::tibble(Name = character(),
                                                          Age = numeric(),
                                                          Sex = character(),
                                                          Education = character(),
                                                          About = character()
  )
  )
  
  observeEvent(input$submitbutton, {
    
    # Adds inputs to the table
    demos_data$demo_data <- demos_data$demo_data |> tibble::add_row(Name = paste(input$name1, input$name2),
                                                                    Age = input$ageval1,
                                                                    Sex = input$sex,
                                                                    Education = input$school,
                                                                    About = input$story)
    # Clears input boxes
    updateTextInput(session, "name1", value = "")
    updateTextInput(session, "name2", value = "")
    updateNumericInput(session, "ageval1", value = NULL)
    updateRadioButtons(session, "sex", choices  = NULL, selected = NULL)
    updateSelectInput(session, "school", choices  = NULL, selected = NULL)
    updateTextAreaInput(session, "story", value = "")
  })
  
  # render data into a table
  output$demo_data <- renderTable(demos_data$demo_data)
  
  # download data button 
  output$download_demo_data <- downloadHandler(
    filename = function() {
      paste("Demographics Data_", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      write.csv(demos_data$demo_data, file, row.names = FALSE)
    }
  )
  
  # plot a graph
  output$bargraph1 <- renderPlot({ 
    bar_graph1 <- demos_data$demo_data %>% 
      ggplot(aes(x = Age, 
                 y = Education,
                 fill = Sex)) +
      geom_col() +
      labs(x = "Age",
           y = "Education",
           fill = "Sex",
           title = "Education by Age and Sex",
           caption = "Source: user data") +
      theme(panel.border = element_blank(),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(), 
            panel.background = element_blank(),
            axis.line = element_line(colour = "black"))
    
    bar_graph1
  })
  
}
