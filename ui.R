library(shiny)

dfw<-read.csv("dfw.csv")[-1]
#data source: http://bea.gov/iTable/index_MNC.cfm

# Define the overall UI
shinyUI(
  
  fluidPage(
    titlePanel("U.S. Direct Investment Statistics to and from Other Countries"),
    
    # Create a new Row in the UI for selectInputs
    fluidRow(
      column(4, 
             selectInput("dt", 
                         "Data Type:", 
                         c("All", 
                           unique(as.character(dfw$Data.Type))))
      ),
      column(4, 
             selectInput("dir", 
                         "Direction:", 
                         c("All", 
                           unique(as.character(dfw$Direction))))
      ),
      column(4, 
             selectInput("co", 
                         "Country:", 
                         c("All", 
                           unique(as.character(dfw$Country))))
      ),column(4, 
             selectInput("ind", 
                         "Industry:", 
                         c("All", 
                           unique(as.character(dfw$Industry))))
      ),        
      column(4, 
             selectInput("yr", 
                         "Year:", 
                         c("All", 
                           unique(as.character(dfw$Year))))
      
             )      
      
      
    ),
    # Create a new row for the table.
    fluidRow(
      dataTableOutput(outputId="table")
    )    
  )  
)