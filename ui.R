
source("global.R")

sidebar <- dashboardSidebar(collapsed = T,
                            sidebarMenu(id = "tabs",
                                        menuItem("Control Terminology",
                                                 tabName = "MENU01",
                                                 icon = tags$i(class="fa-solid fa-wand-magic-sparkles"))))

body <- dashboardBody( 
  tabItems(
    tabItem(tabName = "MENU01",
            fluidRow(
              column(width = 4,
                     shinydashboard::box(title = "Make Your Selection",
                                         status = "warning",
                                         solidHeader = T,
                                         collapsible = T,
                                         width = "auto",
                                         selectInput(inputId = "IN101",
                                                     "Select CDISC Standard",
                                                     choices = sort(unique(packages_resp_text$standard)),
                                                     selected = NULL,
                                                     selectize=T),
                                         
                                         selectInput(inputId = "IN102",
                                                     "Please Select Published Date",
                                                     choices = "",
                                                     selected = NULL,
                                                     selectize=T),
                                         uiOutput("my_variables"))),
              column(width = 8,    
                     shinydashboard::box(title = "Overview of selection",
                                         style = 'font-size:14px;',
                                         status = "info",
                                         width = "auto",
                                         height= "auto",
                                         solidHeader = TRUE,
                                         collapsible = TRUE,
                                         tags$li(textOutput("TAB.B101",inline = T)),
                                         br(),
                                         tags$li(textOutput("TAB.B102",inline = T)),
                                         br(),
                                         tags$li(textOutput("TAB.B103",inline = T)),
                                         br(),
                                         tags$li(textOutput("TAB.B104",inline = T)),
                                         br(),
                                         tags$li(textOutput("TAB.B105",inline = T)),
                                         br(),
                                         tags$li(textOutput("TAB.B106",inline = T)),
                                         br()))),
            
            fluidRow(shinydashboard::box(title = "Results",
                                         status = "danger",
                                         solidHeader = T,
                                         collapsible = T,
                                         width = "auto",
                                         DT::dataTableOutput("TAB.B107",width = "auto", height = "auto") %>% withSpinner(color="#0dc5c1",type = 1))))),
                                         br(),
                                         tags$footer("Data Source: Production CDISC library [URL:https://library.cdisc.org]"))

ui <- dashboardPage(
  dashboardHeader(title = "HandyCT", titleWidth =  "calc(100% - 44px)"),
  sidebar,
  body)