

server <- function(input, output, session) {
  data(iris)
  
  output$sampleTable <- renderDataTable({
    DT::datatable(iris,filter="top",
                  options = list(
                    pageLength = 5,scrollX=TRUE
                  ))
  })
}