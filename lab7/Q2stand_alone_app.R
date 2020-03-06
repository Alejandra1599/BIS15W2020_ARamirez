ui <- dashboardPage(
  dashboardHeader(title = "Plot UC Admissions App"),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      box(title = "Plot Options", width = 3,
          selectInput("x", "Select X Variable", choices = c("Academic_Yr", "Campus", "Category"), 
                      selected = "Academic_Yr"),
          sliderInput("pointsize", "Select the Point Size", min = 1, max = 5, value = 2, step = 0.5)
      ), # close the first box
      box(title = "Plot of UC Admissions Data", width = 7,
          plotOutput("plot", width = "600px", height = "500px")
      ) # close the second box
    ) # close the row
  ) # close the dashboard body
) # close the ui

server <- function(input, output, session) {
  
  # the code to make the plot of iris data grouped by species
  output$plot <- renderPlot({
    ggplot(UC_admit, aes_string(x = input$x , y = "FilteredCountFR" , fill = "Ethnicity" )) + geom_bar(stat= "identity", position = "dodge")
  })
  
  # stop the app when we close it
  session$onSessionEnded(stopApp)
}


shinyApp(ui, server)
