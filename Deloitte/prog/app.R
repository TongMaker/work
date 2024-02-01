#application for detecting changes of qrts dictionary
librs<-c("shinydashboard","shiny","shinyWidgets",
         "shinycssloaders","tm","pdftools","DT",
         "tidyverse")
if(any(!(librs %in% installed.packages()[,1]))){
  install.packages(librs)
}

library(shinydashboard)
library(shiny)
library(shinyWidgets)
library(shinycssloaders)
library(tm)
library(pdftools)
library(DT)
library(tidyverse)

 

ui <- dashboardPage(
  skin = "green",
 
  tags$head(tags$style(HTML("
    
        
        .skin-green .main-header .logo {
          background-color: black ;
          
        }
        .skin-green .main-header .logo:hover {
          background-color: black;
         }
        .skin-green .main-header .navbar{
          background-color: black ;
        }
        
        .skin-green .main-sidebar {
         background-color: black;
        }
        
        .skin-green .main-sidebar a:hover {
         background-color: black;
        }
        .skin-green .main-sidebar .sidebar .sidebar-menu a{
                              background-color: black;
                              color: white;
        }
        .skin-green .main-sidebar .sidebar .sidebar-menu:hover{
                              background-color: black;
                              color: white;
                              }
    
           .skin-green .main-sidebar .sidebar .sidebar-menu .treeview a:hover {
         background-color:gray0;
         color:limegreen;
           }
           
              .skin-green .main-sidebar .sidebar .sidebar-menu .treeview{
         background-color:gray0;
         color:limegreen;
           }
        
           .skin-green .main-sidebar .sidebar .sidebar-menu .treeview .treeview-menu {
         background-color:black ;
         color:gray;
           }
       
           
        .skin-green .main-header .navbar .sidebar-toggle{
                              background-color: black;
                              color: white;
       }
       .skin-green .main-header .navbar .sidebar-toggle:hover{
                              background-color: black;
                              color: limegreen;
       }
       .content-wrapper, .right-side {
            background-color: #252525;
        }
    
      "))),
    
    header = dashboardHeader( title = img(src="logo-deloitte.png", height = 50, align = "center")),
    sidebar = dashboardSidebar(
      sidebarMenu(
        tags$head(tags$style(".progress-bar{background-color:green;}")),
        menuItem("Inputs", tabName = "input", icon = icon("file-pdf"),
                 fileInput('file1',label = h6("QRT DICTIONARY 1")),
                 fileInput('file2',label = h6("QRT DICTIONARY 2"))
        ),
        menuItem("Tables Page Number", tabName = "page", icon = icon("columns"),
                 materialSwitch(inputId="action", value = FALSE, label = h6("Read pdf")),
                 menuSubItem("Available Table", tabName = "available"),
                 menuSubItem("Missing Table", tabName = "missing")),
        menuItem("Changed Tables", tabName = "changed", icon = icon("journal-whills"),
                 uiOutput("detected")%>% withSpinner(color="limegreen"),
                 menuSubItem("Detected Tables", tabName = "ct")),
        menuItem("All Tables", tabName = "Alltable", icon = icon("atlas"),
                 uiOutput("detected2")%>% withSpinner(color="limegreen"),
                 menuSubItem("All Tables", tabName = "Allt"))
      )
    ),
    body = dashboardBody(
      tags$script(HTML("$('body').addClass('fixed');")),
      
      
      
      tabItems(
        tabItem(tabName = "input",""),
        tabItem(tabName = "available",
                fluidRow(
                  column(7,
                         DT::dataTableOutput("PagesTable1")%>% withSpinner(color="limegreen")
                  )
                )
        ),
        tabItem(tabName = "missing",
                fluidRow(
                  column(7,
                         DT::dataTableOutput("PagesTable2")%>% withSpinner(color="limegreen")
                  )
                )
        ),
        tabItem(tabName = "ct",
                fluidRow(
                  
                  DT::dataTableOutput("detectedTable")%>% withSpinner(color="limegreen")
                  
                )
        ),
        tabItem(tabName = "Allt",
                fluidRow(
                  
                  DT::dataTableOutput("detectedTable2")%>% withSpinner(color="limegreen")
                  
                )
        )
        
      )
    )
  
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    
    READ_PDF<-function(uri){
        reader <- readPDF("pdftools")
        reader(elem = list(uri = uri), language = "es", id = "id1")
    }
    PDF_pages_list<-function(pdf,pdf2){
        listpdf<-content(pdf)
        listpdf2<-content(pdf2)
        
        
        #Pattern to find the table´S name at the top of the first page. (IMPORTANTE)
        Pattern_TableName<-"\\s{60,}[:alpha:]{1,3}\\d{4,}\\w\\d*\\w*"
        
        begin1<-str_detect(listpdf,Pattern_TableName)%>%which()%>%append(length(listpdf)+1)
        begin2<-str_detect(listpdf2,Pattern_TableName)%>%which() %>%append(length(listpdf2)+1)
        #information of the first pdf dictionary: table name, start pages, end pages
        allpages1<-matrix(nrow = length(begin1)-1, ncol = 2)
        allpages1[,1]<-begin1[1:(length(begin1)-1)]
        allpages1[,2]<-begin1[2:length(begin1)]-1
        info1<-as_tibble(allpages1) %>% 
            mutate(table_name=paste0(listpdf, collapse = "")%>%unlist() %>% 
                       str_extract_all(Pattern_TableName) %>% unlist() %>% 
                       str_replace_all("\r\n|\\s+","")) %>% 
            set_names(c("Start1","End1","table_name")) %>% 
            select(table_name, Start1, End1)
        
        #information of the second pdf dictionary: table name, start pages, end pages
        allpages2<-matrix(nrow = length(begin2)-1, ncol = 2)
        allpages2[,1]<-begin2[1:(length(begin2)-1)]
        allpages2[,2]<-begin2[2:length(begin2)]-1
        info2<-as_tibble(allpages2) %>% 
            mutate(table_name=paste0(listpdf2, collapse = "")%>%unlist() %>% 
                       str_extract_all(Pattern_TableName) %>% unlist() %>% 
                       str_replace_all("\r\n|\\s+","")) %>% 
            set_names(c("Start2","End2","table_name")) %>% 
            select(table_name, Start2, End2)
        #All combined
        info_all<-full_join(info1, info2, by="table_name") %>% 
            mutate(classes=str_extract(table_name,"[:alpha:]+\\d{2}"), .before=table_name)
        
        Missing_tables<-info_all%>%filter(is.na(Start1) | is.na(Start2))
        Available_tables<-info_all%>%filter(!(is.na(Start1) | is.na(Start2)))
        group_table<-Available_tables%>%split(Available_tables$classes)
        list(Missing_tables,Available_tables,group_table)
    }
    CompareDictionaries<-function(pdf,pdf2,pages1,pages2){
        #PDF1----------------------------------------------------------------------------------------------------------------------
        listpdf_content<-content(pdf)[pages1]#%>% str_remove("\\s+\\d\\.\\d{1,3}\\s*\r\n\\s*$|\\s+\\d{1,4}\\s*\r\n\\s*$|\\s+\\d\\.\\d{1,3}\\s*$|\\s+\\d{1,4}\\s*$")
        #validation_pattern<-"(?<![:|-|+])[:space:][:alpha:][:alnum:]{8}[:digit:][:space:]-(?![:space:][:alpha:][:alnum:]{8}[:digit:][:space:])"
        validation_pattern<-paste0("(?<![:|-|+])[:space:][:alpha:][:alnum:]{8}[:digit:][:space:]-(?![:space:][:alpha:][:alnum:]{8}[:digit:][:space:])",
                                   "|(?<![:|-|+])[:space:][:alpha:]+\\d+[:space:]-(?![:space:][:alpha:]+\\d+[:space:])",
                                   "|(?<![:|-|+])[:space:]regID[:space:]-(?![:space:]regID[:space:])",
                                   "|(?<![:|-|+])[:space:]Periodo[:space:]-(?![:space:]Periodo[:space:])",
                                   "|(?<![:|-|+])[:space:]TipoDEC[:space:]-(?![:space:]TipoDEC[:space:])",
                                   "|(?<![:|-|+])[:space:]Clave[:space:]-(?![:space:]Clave[:space:])",
                                   "|(?<![:|-|+])[:space:]LB[:space:]-(?![:space:]LB[:space:])",
                                   "|(?<![:|-|+])[:space:]AM[:space:]-(?![:space:]AM[:space:])",
                                   "|(?<![:|-|+])[:space:]CU[:space:]-(?![:space:]CU[:space:])",
                                   "|(?<![:|-|+])[:space:]CA[:space:]-(?![:space:]CA[:space:])",
                                   "|(?<![:|-|+])[:space:]DELEGACION[:space:]-(?![:space:]DELEGACION[:space:])",
                                   "|(?<![:|-|+])[:space:]CCAA[:space:]-(?![:space:]CCAA[:space:])")
        
        words<-paste0(listpdf_content, collapse = "")%>%
            str_replace_all("\\d\\.\\d{3}\r\n"," ") %>% #remove pages index
            str_replace_all("\\s([5-9]|\\d{2,3})\r\n"," ") %>%  #remove pages index
            str_replace_all("\r|\n"," ")%>% 
            str_replace_all("\u0084"," ")#%>% 
        #str_replace_all("[:space:]+"," ") #replace all spaces to " "
        
       
        
        allvalidation<-words%>%
            str_extract_all(validation_pattern)%>% 
            unlist()%>%str_trim() #capture all table title
        
        allparag_p<-words%>%
            str_split(validation_pattern)%>% 
            unlist()%>%str_trim() #capture all content of each title
        allparag_p[length(allparag_p)]<-allparag_p[length(allparag_p)]%>%
            str_remove_all("(VALIDACIONES|validaciones).*") #remove after "validation" of the last position of string vector
        
        allparag<-allparag_p%>%
            #str_replace_all("[:digit:][:punct:][:digit:]{3}"," ")%>%
            #str_replace_all("[:space:][:digit:]{3,}"," ")%>%
            str_replace_all("[:punct:]"," ")%>%
            #str_replace_all("^.\\_"," ")%>%
            str_replace_all("-"," ")%>%
            str_replace_all("[:space:]+"," ")%>%str_trim()
        
        allword<-allparag%>%
            map(~str_split(.," ")%>%unlist())%>%
            map(~sort(.))
        
        #PDF2----------------------------------------------------------------------------------------------------------------------
        listpdf2_content<-content(pdf2)[pages2]#%>% str_remove("\\s+\\d\\.\\d{1,3}\\s*\r\n\\s*$|\\s+\\d{1,4}\\s*\r\n\\s*$|\\s+\\d\\.\\d{1,3}\\s*$|\\s+\\d{1,4}\\s*$")
        
        words2<-paste0(listpdf2_content, collapse = "")%>%
            str_replace_all("\\d\\.\\d{3}\r\n"," ") %>% 
            str_replace_all("\\s([5-9]|\\d{2,3})\r\n"," ") %>%  
            str_replace_all("\r|\n"," ")%>%
            str_replace_all("\u0084"," ")#%>%
        #str_replace_all("[:space:]+"," ")
        
        
        allvalidation2<-words2%>%
            str_extract_all(validation_pattern)%>%
            unlist()%>%str_trim()
        
        allparag2_p<-words2%>%
            str_split(validation_pattern)%>%
            unlist()%>%str_trim()
        allparag2_p[length(allparag2_p)]<-allparag2_p[length(allparag2_p)]%>%str_remove_all("(VALIDACIONES|validaciones).*")
        
        allparag2<-allparag2_p%>%
            #str_replace_all("[:digit:][:punct:][:digit:]{3}"," ")%>%
            #str_replace_all("[:space:][:digit:]{3,}"," ")%>%
            str_replace_all("[:punct:]"," ")%>%
            #str_replace_all("^.\\_"," ")%>%
            str_replace_all("-"," ")%>%
            str_replace_all("[:space:]+"," ")%>%str_trim()
        
        allword2<-allparag2%>%
            map(~str_split(.," ")%>%unlist())%>%
            map(~sort(.))
        
        
        
        data1<-tibble(code=c(0,allvalidation), content1=allword, valid1=allparag_p)
        data2<-tibble(code=c(0,allvalidation2), content2=allword2, valid2=allparag2_p)
        
        
        result<-data1%>%
            full_join(data2,by=c("code"="code"))%>%
            mutate(check_diff=
                       case_when(
                           is.na(valid1)~"nothing valid1",
                           is.na(valid2)~"nothing valid2",
                           content2 %in% content1 & content1 %in% content2 ~ "ok",
                           TRUE ~ "different"
                       ))%>%
            select(code,valid1,valid2,check_diff)
        
        result
    }
    PDF1<-reactive({
        uri1<-input$file1
        if(is.null(uri1)){return()}
        READ_PDF(uri1$datapath)
    })
    PDF2<-reactive({
        uri2<-input$file2
        if(is.null(uri2)){return()}
        READ_PDF(uri2$datapath)
    })
    
    Pages<-reactive({
        if(is.null(PDF1())|is.null(PDF2())|input$action==FALSE){return()}
        PDF_pages_list(PDF1(),PDF2())
    })
    
    Detected_tables<-reactive({
      if(any(is.null(PDF1()),is.null(PDF2()),is.null(Pages()))){return()}
       
        p1<-pmap(as.list(Pages()[[2]][3:4]),~(.x:.y))
        p2<-pmap(as.list(Pages()[[2]][5:6]),~(.x:.y))
        tables<-pmap(list(p1,p2),~CompareDictionaries(PDF1(),PDF2(),.x,.y))
        tnames<-map(tables,~str_extract(.$valid1[1],"^[:alpha:]{1,3}\\d+\\s*\\d*\\w*"))
        NewTable<-do.call(rbind,pmap(list(tables,tnames),~mutate(.x,table_name=.y, .before = "code" )))
        
        statistic_changes<-tables%>%
            map(~list(.$valid1[1] %>% 
                          str_extract("^[:alpha:]{1,3}\\d+\\s*\\d*\\w*"),
                      sum(.$check_diff!="ok")))
      
        statistic_changes_table<-do.call(rbind,statistic_changes)%>%
            as.data.frame()%>%
            set_names("table_names","number_changes") %>% 
            mutate(number_changes=as.numeric(number_changes)) %>% 
            arrange(desc(number_changes)) %>% 
            filter(number_changes>0)
        
        filt_table<-statistic_changes_table$table_names %>% unlist()
        list(NewTable, filt_table)
    })
    
    output$PagesTable1<-DT::renderDataTable({
        Pages()[[2]]%>%
            datatable(extensions = c('Buttons'),
                      options = list(
                          pageLength = 300,
                          scrollX=300,
                          dom = 'T<"clear">lBfrtip',
                          deferRender = TRUE,
                          scrollY = 500,
                          buttons = 
                              list(list(
                                  extend = "collection"
                                  , buttons = c("csv", "excel")
                                  , text = "Export")),
                          initComplete = JS(
                            "function(settings, json) {",
                            "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                            "}")
                          )
                      )
            
    })
    
    output$PagesTable2<-DT::renderDataTable({
        Pages()[[1]]%>%
            datatable(extensions = c('Buttons'),
                      options = list(
                          pageLength = 300,
                          scrollX=300,
                          dom = 'T<"clear">lBfrtip',
                          deferRender = TRUE,
                          scrollY = 500,
                          buttons = 
                              list(list(
                                  extend = "collection"
                                  , buttons = c("csv", "excel")
                                  , text = "Export")),
                          initComplete = JS(
                            "function(settings, json) {",
                            "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                            "}")
                      )
            )
    })
    
    output$detected<-renderUI({
         pickerInput(inputId = "DetecTable",label = "changed Tables",choices =Detected_tables()[[2]])
    })
    
    output$detected2<-renderUI({
      pickerInput(inputId = "DetecTable2",label = "All tables",choices =Pages()[[2]]$table_name)
    })
    
    output$detectedTable<-DT::renderDataTable({
        
        Detected_tables()[[1]] %>%
            filter(table_name==input$DetecTable)%>%.[,-1] %>% 
            datatable(extensions = c('Buttons'),
                      options = list(
                        
                          pageLength = 300,
                          scrollX=300,
                          dom = 'T<"clear">lBfrtip',
                          deferRender = TRUE,
                          scrollY = 700,
                          buttons =
                              list(list(
                                  extend = "collection"
                                  , buttons = c("csv", "excel")
                                  , text = "Export")),
                          initComplete = JS(
                            "function(settings, json) {",
                            "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                            "}")),
                      editable = TRUE
                      ) %>% formatStyle(
                "check_diff",
                target = "row",
                backgroundColor = styleEqual(c("ok","different","nothing valid1","nothing valid2"),
                                             c("#F2FFE2","#B7B8B5","#B7B8B5","#B7B8B5"))
            )
    })
    
    output$detectedTable2<-DT::renderDataTable({
      
      Detected_tables()[[1]] %>%
        filter(table_name==input$DetecTable2)%>%.[,-1] %>% 
        datatable(extensions = c('Buttons'),
                  options = list(
                    
                    pageLength = 300,
                    scrollX=300,
                    dom = 'T<"clear">lBfrtip',
                    deferRender = TRUE,
                    scrollY = 700,
                    buttons =
                      list(list(
                        extend = "collection"
                        , buttons = c("csv", "excel")
                        , text = "Export")),
                    initComplete = JS(
                      "function(settings, json) {",
                      "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                      "}")),
                  editable = TRUE
        ) %>% formatStyle(
          "check_diff",
          target = "row",
          backgroundColor = styleEqual(c("ok","different","nothing valid1","nothing valid2"),
                                       c("#F2FFE2","#B7B8B5","#B7B8B5","#B7B8B5"))
        )
    })
    
    # output$UIdetectedTable<-renderUI({
    #     DT::dataTableOutput("detectedTable")
    # })
    # output$PagesTable1<-renderText({
    #     kable(Pages()[[2]]) %>% kable_styling("striped", full_width = F)
    # })
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)