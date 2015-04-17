header <- dashboardHeader(title="Example Tables")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("try more stuff",tabName = "tab2")
  ),
  actionButton("boxtoggle","collapse box"),
  sliderInput("controller", "Controller:",
              min = 1, max = 20, value = 15)
)

body <- dashboardBody(
  singleton(
    tags$head(tags$script(src = "message-handler.js"))
  ),
  
  tabItems(
    tabItem(tabName = "dashboard",
            box(title="example table",solidHeader = TRUE,collapsible = TRUE,id="box_1",
                width=6,
            dataTableOutput("sampleTable")
            ),
            box(title="crap its me",id="box_2",solidHeader = TRUE,collapsible = TRUE, width=6,
                h2("try it stuff here")
                )
    ),
    tabItem(tabName = "tab2",
            box(title="what ever",solidHeader = TRUE,collapsible = TRUE,id="box_3",
                width=6,
                h2("yep...")
            ),
            box(title="crap its me again",id="box_4",solidHeader = TRUE,collapsible = TRUE, width=6,
                h2("try it stuff here")
            )
    )
  )
)

dashboardPage(header, sidebar, body)