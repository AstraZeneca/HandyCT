shinyServer(function(session, input, output){
  
  #step 1 choose standard
  reac01 <- reactive({
    packages_resp_text %>% filter(standard == input$IN101)
  })
 
  observe({
    pubdates <- reac01()$publishedDate
    updateSelectInput(session, "IN102","Published Date",choices = unique(sort(as.Date(pubdates, "%Y-%m-%d"),decreasing = T)))
  })
  
  #Filtered Data from Input 01 and Input 02
  reac02 <- reactive({
    reac01() %>% filter(standard == input$IN101 & publishedDate == input$IN102)
  })
  
  output$TAB.B101 <- renderText({
    if  (length(reac02()$title) > 0){
      OUT101 <- paste0("Description : ", reac02() %>% distinct(title) %>% select(title))
    }
    
    else{
      OUT101 <- paste0("Description : INFORMATION UNAVAILABLE")
    }
  })
  
  
  reac03 <- reactive({
    data_frame <- GET(url = paste0("https://api.library.cdisc.org/api",reac02()$href), add_headers("api-key" = "28b0e2189c664210870072543981265b"))
    data_frame <-content(data_frame,"text",encoding = "UTF-8")
    data_frame <-as.data.frame(fromJSON(data_frame, flatten = TRUE))
  })
  
  output$my_variables <-renderUI({
    selectInput("IN103", label = "Select Codelist",choices = sort(unique(reac03()$codelists.submissionValue)))
  })
  
  reac04 <- reactive({
    req(input$IN103)
    xyz <- reac03() %>% filter(codelists.submissionValue %in% input$IN103)
  })
  
  output$TAB.B102 <- renderText({
    OUT102 <- paste0("Codelist ConceptID : ", reac04() %>% distinct(codelists.conceptId) %>% select(codelists.conceptId))
  })
  
  output$TAB.B103 <- renderText({
    OUT103 <- paste0("Codelist Name : ", reac04() %>% distinct(codelists.name) %>% select(codelists.name))
  })
  
  output$TAB.B104 <- renderText({
    if  (length(reac04()$codelists.extensible) > 0){
      OUT104 <- paste0("Codelist Extensible : ", reac04() %>% distinct(codelists.extensible) %>%  select(codelists.extensible))
    }
    
    else{
      OUT104 <- paste0("Codelist Extensible : INFORMATION UNAVAILABLE")
    }
  })
  
  output$TAB.B105 <- renderText({
    OUT105 <- paste0("Codelist PreferTerm : ", reac04() %>% distinct(codelists.preferredTerm) %>%  select(codelists.preferredTerm))
  })
  
  output$TAB.B106 <- renderText({
    OUT106 <- paste0("Last Data Fetch  : ", paste(Sys.time()," ",Sys.timezone()))
  })
  
  
  output$TAB.B107 <- DT::renderDataTable(
    DT::datatable({
      out7 <- reac04() %>% select(codelists.terms) %>% unnest(cols = c(codelists.terms))
      out7 <- out7 %>% select(conceptId,submissionValue, preferredTerm,everything())
    }, extensions = "Buttons",
    options = list(lengthMenu = list(c(1,5,15,25,-1), c('1','5', '15','25','All')), 
                   searching = T, 
                   extensions = 'KeyTable',
                   options = list(keys = TRUE),
                   pageLength = 15,
                   language = list(zeroRecords = "Server is ready to receive requests"),
                   smart = TRUE,
                   dom = 'Blfrtip',
                   buttons = c('copy', 'pdf', 'excel'),
                   searchHighlight = TRUE, search = list(search = ''),
                   initComplete = JS("
                  function(settings, json) {
                    $(this.api().table().header()).css({
                      'background-color': '#0a0000',
                      'color': '#fff'
                    });
    }"))))
  
})





