

server <- function(input, output, session) {
  data(iris)
  
  output$sampleTable <- renderDataTable({
    DT::datatable(iris,filter="top",
                  options = list(
                    pageLength = 5,scrollX=TRUE
                  ))
  })
  
  observe({
    session$sendCustomMessage(type = 'testmessage',
                              message = list(a = 1, b = 'text',
                                             controller = 1))
  })
}