

server <- function(input, output, session) {
  data(iris)
  
  ####this closes all of the collapasable boxes that pop up
  session$sendCustomMessage(type = 'testmessage',
                            message = list(a = 1, b = 'text',
                                           controller = 1))
  
  output$sampleTable <- renderDataTable({
    
    datatable(iris, filter='top', options = list(columnDefs = list(list(
      targets = 5,
      render = JS(
        "function(data, type, row, meta) {",
        "return type === 'display' && data.length > 6 ?",
        "'<span title=\"' + data + '\">' + data.substr(0, 6) + '...</span>' : data;",
        "}")
    ))), callback = JS('table.page(3).draw(false);'))
    
  })
  

  
  
  
}