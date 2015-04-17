header <- dashboardHeader(title="Example Tables")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"))
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "dashboard",
            box(title="example table",solidHeader = TRUE,collapsible = TRUE,
                width=6,
            dataTableOutput("sampleTable")
            )
    )
  )
)

dashboardPage(header, sidebar, body)