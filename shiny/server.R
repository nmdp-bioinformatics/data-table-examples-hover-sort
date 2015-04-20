

server <- function(input, output, session) {
  data(iris)
  
  ####this closes all of the collapasable boxes that pop up
  session$sendCustomMessage(type = 'testmessage',
                            message = list())
  

  
  output$sampleTable <- renderDataTable({
    
    DT::datatable(iris, callback = JS("table.on('mouseenter','tr',function (event) {",
                                               "var check = $('td:eq(1)',this);",
                                               "console.log(check);",
                                               "$(this).qtip({",
                                               "overwrite: false,",
                                               "content: 'Hello',",
                                               "position: {",
                                               "my: 'right center',",
                                               "at: 'left center',",
                                               "target: $('td:eq(1)', this)",
                                               "},",
                                               "show: {",
                                               "event: event.type,",
                                               "ready: true",
                                               "},",
                                               "hide: {",
                                               "fixed: true",
                                               "}",
                                               "}, event);",
                                               "});")                    
                                      )
  })
  

  
  
  
}