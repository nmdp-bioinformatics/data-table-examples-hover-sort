

server <- function(input, output, session) {
  data(iris)
  
  ####this closes all of the collapasable boxes that pop up
  session$sendCustomMessage(type = 'testmessage',
                            message = list())
  

  
  output$sampleTable <- renderDataTable({
    
    ####specify the jquery eq to be equal to the table row element (starts at zero)
    
    DT::datatable(iris, callback = JS("table.on('mouseover','td',function (event) {",
                                               "var colIdx = table.cell(this).index().column;",
                                               "var rowIdx = table.cell(this).index().row;",
                                               "console.log(rowIdx);",
                                        "if ( colIdx === 3 ) {",
                                        "$(this).qtip({",
                                        "overwrite: false,",
                                        "content: rowIdx.toString(),",
                                        "position: {",
                                        "my: 'right center',",
                                        "at: 'left center',",
                                        "target: this",
                                        "},",
                                        "show: {",
                                        "event: event.type,",
                                        "ready: true",
                                        "},",
                                        "hide: {",
                                        "fixed: true",
                                        "}",
                                        "}, event);",
                                        "}",
                                        "})")
    )
  })
  

  
  
  
}