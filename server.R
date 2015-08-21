library(shiny)
dfw<-read.csv("dfw.csv")

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Filter data based on selections
  output$table <- renderDataTable({
    data <- dfw
    if (input$dt != "All"){
      data <- data[data$Data.Type == input$dt,]
    }
    if (input$dir != "All"){
      data <- data[data$Direction == input$dir,]
    }
    if (input$co != "All"){
      data <- data[data$Country == input$co,]
    }
    if (input$ind != "All"){
      data <- data[data$Industry == input$ind,]
    }
    if (input$yr != "All"){
      data <- data[data$Year == input$yr,]
    }
    data
   
        
  })
  
})