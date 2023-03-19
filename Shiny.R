library(shiny)
MG_Kedja_Grupp <- read_excel("Documents/GitHub/Useful-code/MG_Kedja_Grupp.xlsx")
colnames(MG_Kedja_Grupp) <- MG_Kedja_Grupp[2,]
Kedja <- MG_Kedja_Grupp[-c(1:3),]
Kedja[,1] <- fill.cols(Kedja[,1])
colnames(Kedja)[1:2] <- c("Kedja", "Year")

Df <- Kedja %>% 
  pivot_longer(-c(Kedja:Year))


ui <- fluidPage(
  textInput("name", "What's your name?"),
  textOutput("greeting"),
  dataTableOutput("dynamic")
)


server <- function(input, output, session) {
  output$greeting <- renderText({
    paste0("Hello ", input$name, "!")
  })
  output$dynamic <- renderDataTable(data, options = list(pageLength = 5))
}


shinyApp(ui, server)



