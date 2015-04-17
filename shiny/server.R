

server <- function(input, output, session) {
  data(iris)
  
  ####this closes all of the collapasable boxes that pop up
  session$sendCustomMessage(type = 'testmessage',
                            message = list(a = 1, b = 'text',
                                           controller = 1))
  
  output$sampleTable <- renderDataTable({
    DT::datatable(iris,filter="top",
                  options = list(
                    pageLength = 5,scrollX=TRUE
                  ))
  })
  

  
  
  
}