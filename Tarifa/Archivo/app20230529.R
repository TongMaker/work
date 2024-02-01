library(shiny)
library(shinyWidgets)
library(shinydashboard)
library(openxlsx, quietly = T)
library(DT)
#library(tidyverse)
library(dplyr,  warn.conflict = FALSE, quietly = TRUE)
library(stringr,warn.conflict = FALSE, quietly = TRUE)
library(purrr,  warn.conflict = FALSE, quietly = TRUE)
library(tidyr,  warn.conflict = FALSE, quietly = TRUE)
library(readr,  warn.conflict = FALSE, quietly = TRUE)
options(encoding = "UTF-8")
options(scipen = 100)
options(warn=-1)





ui <- dashboardPage(
  
  dashboardHeader(title = img(src="LOGO.jpg", height = 39, align = "center"),
                  titleWidth = 300,
                   tags$li(
                     a(
                       strong("AUTOTARIFA - HERRAMIENTA (SAS REAL TIME)"),
                       height = 39,
                       href = "https://lprd-sasmitp01.caser.local:8343/SASLogon/login?service=https%3A%2F%2Flprd-sasmitp01.caser.local%3A8343%2FSASDecisionManager%2Fj_spring_cas_security_check",
                       title = "",
                       target = "_blank"
                     ),
                     class = "dropdown"
                   )
                   
                   ),


  #dashboardHeader(title = "AUTOTARIFA", titleWidth = 150),
  dashboardSidebar( 
    width = 300,
    sidebarMenu(
      
      #d97307
      
      HTML(paste0(
        "<br>",
        "<tr>",
        "<b><p style = 'text-align: center; color:white;'><big>ACTUARIAL NO VIDA</a></big></p></b>",
        "<tr>",
        "<br>"
      )),
      menuItem("CARPETA RT Input", tabName = "main", icon = icon("arrow-up-from-bracket"),
               uiOutput("selecarpfic")
               ),
      menuItem("CARPETA RT Generador", tabName = "main", icon = icon("pen"),
               uiOutput("diroutcarpUI"),
               uiOutput("EjecutarcarpUI"),
               progressBar(id = "progresscarp", value = 0, display_pct = T),
               uiOutput("subirsascomcarpUI"),
               progressBar(id = "progress_CTcarp", value = 0, display_pct = T),
               uiOutput("downloadsascarpUI")
      ),
      
               
      menuItem("VOCABULARIO Input", tabName = "main", icon = icon("arrow-up-from-bracket"),
               uiOutput("selevocafic")

      ),
      menuItem(" VOCABULARIO Generador", tabName = "main", icon = icon("pen"),
               uiOutput("diroutvocaUI"),
               uiOutput("EjecutarvocaUI"),
               progressBar(id = "progressvoca", value = 0, display_pct = T),
               uiOutput("subirsascomvocaUI"),
               progressBar(id = "progress_CTvoca", value = 0, display_pct = T),
               uiOutput("downloadsasvocaUI")
      ),
      menuItem("RULE SET Input", tabName = "main", icon = icon("arrow-up-from-bracket"),
               uiOutput("seleinit"),
               uiOutput("seletari"),
               uiOutput("Alls")
               ),
      
      menuItem("RULE SET Generador", tabName = "main", icon = icon("pen"),
               uiOutput("diroutput"),
               uiOutput("Ejecutar"),
               progressBar(id = "progress", value = 0, display_pct = T),
               uiOutput("patrones"),
               uiOutput("Allfiles"),
               uiOutput("subirsascoms"),
               progressBar(id = "progress_CT", value = 0, display_pct = T),
               uiOutput("downloadSASUI")
      ),
      menuItem("RULE SET FORMULA Input", tabName = "main", icon = icon("arrow-up-from-bracket"),
               uiOutput("seleformulafic")
              ),
      menuItem("RULE SET FORMULA Generador", tabName = "main", icon = icon("pen"),
               uiOutput("diroutformulaUI"),
               uiOutput("EjecutarformulaUI"),
               progressBar(id = "progressformula", value = 0, display_pct = T),
               uiOutput("patronesformula"),
               uiOutput("Allfilesformula"),
               uiOutput("subirsascomformulaUI"),
               progressBar(id = "progress_CTformula", value = 0, display_pct = T),
               uiOutput("downloadSASformulaUI")
      ),
      
      menuItem("RULE FLOW Input", tabName = "main", icon = icon("arrow-up-from-bracket"),
               uiOutput("seleflowfic")
            ),

      menuItem("RULE FLOW Generador", tabName = "main", icon = icon("pen"),
               uiOutput("diroutflowUI"),
               uiOutput("EjecutarflowUI"),
               progressBar(id = "progressflow", value = 0, display_pct = T),
               uiOutput("patronesflow"),
               uiOutput("Allfilesflow"),
               uiOutput("subirsascomflowUI"),
               progressBar(id = "progress_CTflow", value = 0, display_pct = T),
               uiOutput("downloadSASflowUI")
               ),
      
      menuItem("Plantilla de Ficheros", tabName = "main", icon = icon("download"),
               uiOutput("downloadINITUI"),
               uiOutput("downloadTARIFAUI"),
               uiOutput("downloadformulaUI"),
               uiOutput("downloadcarpUI"),
               uiOutput("downloadvocaUI"),
               uiOutput("downloadflowUI")
               ),
      menuItem("Ayuda", tabName = "main", icon = icon("question")
      )
    )
    
  ),
  dashboardBody(
    tags$script(HTML("$('body').addClass('fixed');")),
    skin = "blue",

    tags$head(
      tags$style(HTML(".skin-blue .main-header .logo { background-color: white; }
                       .skin-blue .main-header .logo:hover { background-color: white; }
                       .skin-blue .main-header .navbar { background-color: #016136; }
                       .skin-blue .main-sidebar { background-color: #016136;}
                       .skin-blue .main-sidebar .sidebar .sidebar-menu a{ background-color: #016136; color: white;}
                       .skin-blue .main-sidebar .sidebar .sidebar-menu:hover{background-color: #016136;color: white; }
                       .skin-blue .main-sidebar .sidebar .sidebar-menu .treeview a:hover { background-color:#016136 ;color:#d97307; bold; }
                       .skin-blue .main-sidebar .sidebar .sidebar-menu .treeview{background-color:#016136;color: #d97307; }
                       .skin-blue .main-sidebar .sidebar .sidebar-menu .treeview .treeview-menu { background-color: #d97307 ;color:white;}
                       .skin-blue .main-header .navbar .sidebar-toggle{ background-color: #016136; color: white; }
                       .skin-blue .main-header .navbar .sidebar-toggle:hover{background-color:  #016136;color: orange; }
                       .content-wrapper, .right-side {background-color: white; }
                       .progress-bar{background-color:#3c763d;}
                       "
                      )),
  
    ),
   
    fluidPage(
      
      tabsetPanel(type = "tabs",
                  id="inTabset",
                  tabPanel("CARPETA RT",DT::dataTableOutput("carptabla")),
                  tabPanel("VOCABULARIOS", DT::dataTableOutput("vocatabla")),
                  tabPanel("RULE SET COBERTURA", uiOutput("selesht")),
                  tabPanel("RULE SET FORMULA CSVs", uiOutput("selefileformula")),
                  tabPanel("RULE SET CSVs", uiOutput("selefile")),
                  tabPanel("RULE FLOW CSVs", uiOutput("selefileflow"))
    )
  )
)
)



server <- function(input, output, session) {

    options(shiny.maxRequestSize=1110*1024^2)
  ruta_inicial<-getwd()

  
  
##################################CARPETAS###############################################################
##################################CARPETAS###############################################################

  
  
  output$selecarpfic <- renderUI({
    fileInput(
      inputId="carpfic",
      label="Importar Excel de Carpetas",
      multiple = FALSE,
      width = NULL,
      buttonLabel = "Cargar...",
      placeholder = "CARPETA.xlsx"
    )
  })
 
  
  
  MAIN_FOLDER<-reactive({if (!is.null(input$carpfic)){as.character(read.xlsx(input$carpfic$datapath, colNames = F, rows = 1:2, cols = 2) %>% unlist)}})
  FOLDERS<-reactive({if (!is.null(input$carpfic)){as.character(read.xlsx(input$carpfic$datapath, colNames = F, cols = 2, startRow = 4) %>% unlist)}})
  FOLDERS_PATH<-eventReactive(input$carpfic,{paste(MAIN_FOLDER()[1],MAIN_FOLDER()[2],FOLDERS(), sep = "/")})
  FOLDER_T<-eventReactive(input$carpfic,{data.frame(FOLDERS=FOLDERS(), FOLDERS_PATH = FOLDERS_PATH())})
  
  output$carptabla<-DT::renderDataTable({
    FOLDER_T()%>%
      datatable(extensions = c('Buttons'),
                options = list(
                  pageLength = 500,
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
                    "$(this.api().table().header()).css({'background-color': '#016136', 'color': '#fff'});",
                    "}")
                )
      )
  })
  
  
  observeEvent(input$carpfic, {
    updateTabsetPanel(session, "inTabset",selected = "CARPETA RT")
  })

  #By default the exportation directory is your desktop
  output$diroutcarpUI<-
    renderUI({
      textInput(inputId= "diroutcarp", label= "Directorio de Exportación",
                value = paste0("C:/Users/",Sys.getenv("USERNAME"),"/Desktop"))
    })


  output$EjecutarcarpUI <-
    renderUI({req(input$carpfic)
      actionButton(inputId = "Ejecutarcarp", label = "EJECUTAR", icon = NULL)
    })

  observeEvent(input$Ejecutarcarp,{
    initdir=input$diroutcarp
    setwd(initdir)
    #====================================================================================
    updateProgressBar(session = session, id = "progresscarp", value = 0)
    #====================================================================================
    
    FOLDERS1<-c(MAIN_FOLDER()[2], FOLDERS())
    FOLDERS_PATH1<-c(paste(MAIN_FOLDER(), collapse = "/"), FOLDERS_PATH())
    
    CARP_DATA<-data.frame(FOLDER_NM = FOLDERS1,
                          FOLDER_DESC = "",
                          TOP_LEVEL_FOLDER_FLG = "N",
                          FOLDER_PATH = FOLDERS_PATH1)
    
    
    write.csv(CARP_DATA, paste0(MAIN_FOLDER()[2],".CSV"), quote = F, row.names = F)
    
    SASCODE<-paste0(
      "
  %BRM_IMPORT_FOLDER(
  CSV   =
    %STR(//CONTROL_TECNICO/",  paste0("CARPETAS_",MAIN_FOLDER()[2],".CSV"),"),
  REJECT=                  
    %STR(//CONTROL_TECNICO/", "REJ_", paste0("CARPETAS_",MAIN_FOLDER()[2],".CSV"),")
);")
    #====================================================================================
    updateProgressBar(session = session, id = "progresscarp", value = 100)
    #====================================================================================

    moment<-stringr::str_remove_all(Sys.time(),"[:punct:]") %>% stringr::str_replace("\\s+","_")
    dir.create(paste0(getwd(),"\\OUTPUT_CARP",Sys.getenv("USERNAME"),"_",moment))





    setwd(paste0(getwd(),"\\OUTPUT_CARP",Sys.getenv("USERNAME"),"_",moment))
    write.csv(CARP_DATA, paste0("CARPETAS_",MAIN_FOLDER()[2],".CSV"), quote = F, row.names = F)
    write_lines(SASCODE,paste0("CARPETAS_texto_guide",".sas"))


  })


  #action button to upload the csv files to control tecnico
  output$subirsascomcarpUI <-
    renderUI({req(MAIN_FOLDER())
      actionButton(inputId = "subirsascomcarp", label = "Subir a Control Técnico", icon = NULL)
    })


  #the function sftp to do the action of uploading
  observeEvent(input$subirsascomcarp, {
    con<-sftp::sftp_connect(server = "sftp://TZHZHO01@LPRD-SASCOMP01",
                            folder = "/CONTROL_TECNICO",
                            username = "TZHZHO01", password = "W6ndfUuz7IT62w")
    updateProgressBar(session = session, id = "progress_CTcarp", value = 0)


    sftp::sftp_upload(paste0("CARPETAS_",MAIN_FOLDER()[2],".CSV"), sftp_connection = con)
    #====================================================================================
    updateProgressBar(session = session, id = "progress_CTcarp", value = 100)
    #====================================================================================

  })

  #download button of sas script (upload Csvs content from control tecnico to SAS RT BRM)
  output$downloadsascarp <- downloadHandler(
    filename =function() {paste0("CARPETAS_texto_guide",".sas")},
    content = function(file) {

      file.copy(file.path(getwd(),paste0("CARPETAS_texto_guide",".sas")), file,overwrite = TRUE)
      utils::browseURL(paste0(getwd(),"/",paste0("CARPETAS_texto_guide",".sas")))
    }
  )

  output$downloadsascarpUI <-
    renderUI({
      downloadButton("downloadsascarp", "Código SAS Subir BRM",style = "width:80%;color: white;background-color: #d97307;")
    })
  setwd(ruta_inicial)

##################################VOCAB##################################################################
##################################VOCAB##################################################################
  


output$selevocafic <- renderUI({
  fileInput(
    inputId="vocafic",
    label="Importar Excel de Vocabulario",
    multiple = FALSE,
    width = NULL,
    buttonLabel = "Cargar...",
    placeholder = "VOCAB.xlsx"
  )
})
  
  
  observeEvent(input$vocafic, {
    updateTabsetPanel(session, "inTabset",selected = "VOCABULARIOS")
  })

  VOCAB_SHEET<-reactive({if (!is.null(input$vocafic)){read.xlsx(input$vocafic$datapath, colNames = T, startRow = 4)}})
  VOCAB_NAME<-reactive({if (!is.null(input$vocafic)){as.character(read.xlsx(input$vocafic$datapath, colNames = F, rows = 1:2, cols = 2) %>% unlist)}})
  
  
  output$vocatabla<-DT::renderDataTable({
    VOCAB_SHEET()%>%
      datatable(extensions = c('Buttons'),
                options = list(
                  pageLength = 500,
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
                    "$(this.api().table().header()).css({'background-color': '#016136', 'color': '#fff'});",
                    "}")
                )
      )
  })
  
  
  
  
  #By default the exportation directory is your desktop
  output$diroutvocaUI<-
    renderUI({
      textInput(inputId= "diroutvoca", label= "Directorio de Exportación",
                value = paste0("C:/Users/",Sys.getenv("USERNAME"),"/Desktop"))
    })
  
  
  output$EjecutarvocaUI <-
    renderUI({req(input$vocafic)
      actionButton(inputId = "Ejecutarvoca", label = "EJECUTAR", icon = NULL)
    })
  
  observeEvent(input$Ejecutarvoca,{
    initdir=input$diroutvoca
    setwd(initdir)
    #====================================================================================
    updateProgressBar(session = session, id = "progressvoca", value = 0)
    #====================================================================================
    VOCA_DATA<-transmute(VOCAB_SHEET(),
                         VOCAB_NM = VOCAB_NAME()[2],
                         VOCAB_SHORT_DESC = "",
                         VOCAB_ENTITY_NM = VOCAB_SHEET()[[2]],
                         VOCAB_ENTITY_SHORT_DESC = "",
                         VOCAB_TERM_NM = VOCAB_SHEET()[[1]],
                         VOCAB_TERM_SHORT_DESC = "",
                         VOCAB_TERM_DATA_TYPE_TXT = VOCAB_SHEET()[[3]],
                         VOCAB_TERM_DOMAIN_TYPE_TXT = "Discrete",
                         VOCAB_TERM_DOMAIN_TXT = "",
                         VOCAB_TERM_INPUT_EXCLUDE_FLG = VOCAB_SHEET()[[4]],
                         VOCAB_TERM_OUTPUT_EXCLUDE_FLG = VOCAB_SHEET()[[5]],
                         FOLDER_PATH = VOCAB_NAME()[1]
    )
    #====================================================================================
    updateProgressBar(session = session, id = "progressvoca", value = 100)
    #====================================================================================
    
    moment<-stringr::str_remove_all(Sys.time(),"[:punct:]") %>% stringr::str_replace("\\s+","_")
    dir.create(paste0(getwd(),"\\OUTPUT_VOCAB",Sys.getenv("USERNAME"),"_",moment))
    
    
    SASCODE<-paste0(
      "
  %BRM_IMPORT_VOCABULARY (
  CSV   =
    %STR(//CONTROL_TECNICO/",  paste0("VOCABULARIO_",VOCAB_NAME()[2],".CSV"),"),
  REJECT=                  
    %STR(//CONTROL_TECNICO/", "REJ_", paste0("VOCABULARIO_",VOCAB_NAME()[2],".CSV"),")
);")
    
    
    
    setwd(paste0(getwd(),"\\OUTPUT_VOCAB",Sys.getenv("USERNAME"),"_",moment))
    write.csv(VOCA_DATA, paste0("VOCABULARIO_",VOCAB_NAME()[2],".CSV"), quote = F, row.names = F)
    write_lines(SASCODE,paste0("VOCABULARIO_texto_guide",".sas"))
    
    
  })
  
  
  #action button to upload the csv files to control tecnico
  output$subirsascomvocaUI <-
    renderUI({req(VOCAB_SHEET())
      actionButton(inputId = "subirsascomvoca", label = "Subir a Control Técnico", icon = NULL)
    })
  
  
  #the function sftp to do the action of uploading
  observeEvent(input$subirsascomvoca, {
    con<-sftp::sftp_connect(server = "sftp://TZHZHO01@LPRD-SASCOMP01",
                            folder = "/CONTROL_TECNICO",
                            username = "TZHZHO01", password = "W6ndfUuz7IT62w")
    updateProgressBar(session = session, id = "progress_CTvoca", value = 0)
    
    
      sftp::sftp_upload(paste0("VOCABULARIO_",VOCAB_NAME()[2],".CSV"), sftp_connection = con)
      #====================================================================================
      updateProgressBar(session = session, id = "progress_CTvoca", value = 100)
      #====================================================================================
    
  })
  
  #download button of sas script (upload Csvs content from control tecnico to SAS RT BRM) 
  output$downloadsasvoca <- downloadHandler(
    filename =function() {paste0("VOCABULARIO_texto_guide",".sas")},
    content = function(file) {
      
      file.copy(file.path(getwd(),paste0("VOCABULARIO_texto_guide",".sas")), file,overwrite = TRUE)
      utils::browseURL(paste0(getwd(),"/",paste0("VOCABULARIO_texto_guide",".sas")))
    }
  )
  
  output$downloadsasvocaUI <-
    renderUI({
      downloadButton("downloadsasvoca", "Código SAS Subir BRM",style = "width:80%;color: white;background-color: #d97307;")
    })
setwd(ruta_inicial)
###############################RULE_SET##################################################################
###############################RULE_SET##################################################################
  
 #INIT file input 
  output$seleinit <- renderUI({
    fileInput(
      inputId="init",
      label="Importar Fichero INIT",
      multiple = FALSE,
      width = NULL,
      buttonLabel = "Cargar...",
      placeholder = "INIT.xlsx"
    )
  })
 #TARIFA file input
  output$seletari <- renderUI({
    fileInput(
      inputId="tari",
      label="Importar Fichero TARIFA",
      multiple = FALSE,
      width = NULL,
      buttonLabel = "Cargar...",
      placeholder = "Tarifa.xlsx"
    )
  })
  
  
  observeEvent(input$tari, {
    updateTabsetPanel(session, "inTabset",selected = "RULE SET COBERTURA")
  })
  
#select all box for excel sheet
  output$Alls <- renderUI({
    req(input$tari)
    
    awesomeCheckbox(
      inputId = "All",
      label = "Seleccionar Todo", 
      value = FALSE
    )
  })

  # output$Allfiles <- renderUI({
  #   req(input$tari)
  #   
  #   awesomeCheckbox(
  #     inputId = "All",
  #     label = "Seleccionar Todo", 
  #     value = FALSE
  #   )
  # })
 
  #Reading data from INIT.xlsx
  REALTIME_PATH <- reactive({if (!is.null(input$init)){read.xlsx(input$init$datapath, colNames = FALSE, cols = 2, rows = 1)[[1]]}})
  REALTIME_FILE <- reactive({if (!is.null(input$init)){read.xlsx(input$init$datapath, colNames = FALSE, cols = 4, rows = 1)[[1]]}})
  REALTIME_VOCA <- reactive({if (!is.null(input$init)){read.xlsx(input$init$datapath, colNames = FALSE, cols = 6, rows = 1)[[1]]}})
  var_g <- reactive({if (!is.null(input$init)) {read.xlsx(input$init$datapath, cols = 2:5, rows = 3:4)}})
  var_p <- reactive({if (!is.null(input$init)) {read.xlsx(input$init$datapath, cols = 2:5, rows = 6:1000)}})
  cob_g <- reactive({if (!is.null(input$init)) {read.xlsx(input$init$datapath, cols = 8:9, rows = 3:4)}})
  cob_p <- reactive({if (!is.null(input$init)) {read.xlsx(input$init$datapath, cols = 8:9, rows = 6:1000)}})
  
  #loading Tarifa.xlsx
  excel <- reactive({
    if (!is.null(input$tari)) {
      loadWorkbook(input$tari$datapath)
    }
  })
  
  #reading Tarifa.xlsx sheetnames
  shn <- reactive({
    if (!is.null(input$tari)) {sheets(excel())}
  })
  
  #output to show all excel sheetnames as checkbox requiring shn() reactive function
  output$selesht <-
    renderUI({req(shn())
    checkboxGroupButtons(
      inputId = "sht",
      label = "Cobertura", 
      choices = shn(),
      justified = T,
      individual=F,
      width = '200px',
      direction = "vertical"
    )
  })
#updating excel sheets Checkbox depending on the status of "All"
  observeEvent(input$All, {
    updateCheckboxGroupButtons(
      session = session,
      inputId = "sht",
      selected = character(0)
    )
  })

  all_selected <- reactiveVal(TRUE)
  
  observeEvent(input$All, {
    if (all_selected()) {
      updateCheckboxGroupButtons(
        session = session,
        inputId = "sht",
        selected = character(0)
      )
      all_selected(FALSE)
    } else {
      updateCheckboxGroupButtons(
        session = session,
        inputId = "sht",
        selected = shn()
      )
      all_selected(TRUE)
    }
  })

  #By default the exportation directory is your desktop
  output$diroutput<-
    renderUI({

      textInput(inputId= "dirout", label= "Directorio de Exportación",
                value = paste0("C:/Users/",Sys.getenv("USERNAME"),"/Desktop"))
    })


  
  #Button of execution requiring shn()
output$Ejecutar <-
  renderUI({req(shn())
    actionButton(inputId = "Ejec", label = "EJECUTAR", icon = NULL)
 })





observeEvent(input$Ejec, {
  updateTabsetPanel(session, "inTabset",selected = "RULE SET CSVs")
})

# the main function to create the SASRT CSVs
  observeEvent(input$Ejec,{
    excel=excel()
    selecc=str_trim(paste(input$sht,collapse="|")) 
    REALTIME_PATH=REALTIME_PATH()
    REALTIME_FILE=REALTIME_FILE()
    REALTIME_VOCA=REALTIME_VOCA()
    var_g=var_g()
    var_p=var_p()
    cob_g=cob_g()
    cob_p=cob_p()
    initdir=input$dirout
    
    #====================================================================================
    updateProgressBar(session = session, id = "progress", value = 0)
    #====================================================================================
    
    options(encoding = "UTF-8")
    options(scipen = 100)
    shn<-sheets(excel)

    moment<-stringr::str_remove_all(Sys.time(),"[:punct:]") %>% stringr::str_replace("\\s+","_")
    
    setwd(initdir)
    
    
    posi_sh<-rep(TRUE,length(shn))
    
    
    if(selecc != ""|selecc != "todo"){
      posi_sh<-str_detect(shn, paste0("^",selecc,"$"))
      cat("\n")
      print(noquote(sheets(excel)[posi_sh]))
    }
    
    
    sh_df<-data.frame(SHEETNAME=sheets(excel)[posi_sh])
    cobname<-left_join(sh_df,cob_p, by="SHEETNAME") %>%
      mutate(cobname=case_when(is.na(RT_FOLDER_NAME)~SHEETNAME,
                               TRUE~RT_FOLDER_NAME
      )) %>% .[[3]]
    sh<-sh_df[[1]]
    
    #sas text list 
    list_total<-list()
    #table list para almacenar todos los contenidos de csv y concadenarlos en uno mismo.
    list_table<-list()
    
    #setwd("..")
    
    dir.create(paste0(getwd(),"\\OUTPUT_",Sys.getenv("USERNAME"),"_",moment))
    
    setwd(paste0(".\\OUTPUT_",Sys.getenv("USERNAME"),"_",moment))
    
    outputpath<-getwd()
    
    #salida<-"P:\\BRM_RTDM_PRD\\RC_GENERAL\\RC_GENERAL2570000V001\\RULES SET GENERADO con R"
    for(g in 1:length(sh)){
      #====================================================================================
      updateProgressBar(session = session, id = "progress", value = (g/length(sh))*100)
      #====================================================================================
      #print(paste0(g,". ", sh[g], "  listo"))
      dir.create(paste0(getwd(),"/",cobname[g]))
      tabla<-read.xlsx(excel,sh[g], cols=1:4, colNames = FALSE, skipEmptyCols = FALSE)
      for(i in 1:nrow(tabla)){
        if(is.na(tabla$X1[i])){
          tabla$X1[i]<-tabla$X1[i-1]
        }
      }
      #eliminar las filas incompletas
      tabla<-tabla %>% filter(!(is.na(.[[2]])|is.na(.[[4]])))
      #una vez leido las tablas en cada hoja se reconoce las columnas 2 y 3 como caracteres
      #se transforma a todos los que han detectado que tienen valores de letra y que no empieza con 0
      #a numeric o double.
      tabla_sp<-tabla %>% split(.$X1) %>% discard(~.$X1[1]=="Primas") %>%
        map(function(x){
          if(all(!str_detect(x$X2,"^0(?=\\d+)|^[:alpha:]+"))){
            x$X2<-as.double(x$X2)
            x$X3<-as.double(x$X3)
          }
          x
        })
      
      tcol<-c("RULE_SET_SK",	"RULE_SET_NM",	"RULE_SET_DESC",	"VOCAB_NM",	"RULE_SET_PATH",
              "RULE_NM",	"RULE_DESC",	"RULE_SEQ_NO",	"CONDITIONAL_NM",	"RECORD_RULE_FIRED_FLG",	
              "EXPRESION_ORDER_1",	"EXPRESION_TYPE_1",	"LHS_TERM_1",	"EXPRESION_1",	
              "EXPRESION_ORDER_2",	"EXPRESION_TYPE_2",	"LHS_TERM_2",	"EXPRESION_2",
              "EXPRESION_ORDER_FINAL",	"EXPRESION_TYPE_FINAL",	"LHS_TERM_FINAL",	"EXPRESION_FINAL")
      tabla_fac_list<-list()
      for(i in 1:length(tabla_sp)){
        tabla_fac<-tabla_sp[i]
        TF_var_p<-var_p[[1]] %in% names(tabla_fac)
        var_name<-ifelse(any(TF_var_p),var_p[[2]][TF_var_p],names(tabla_fac))
        fac_g<-var_g$FACTOR_NAME %>% str_split("\\+") %>% unlist() %>% .[1]
        fac_name<-ifelse(any(TF_var_p),var_p[[3]][TF_var_p],paste0(fac_g,names(tabla_fac)))
        
        
        tabla_rt<-data.frame(array(dim = c(nrow(tabla_fac[[1]]),length(tcol)))) %>% 
          set_names(tcol) %>% 
          mutate(RULE_SET_NM=names(tabla_fac),
                 #!!!!!!!!!!!!!!!!!!RC no es generico!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                 #ya cabiado
                 VOCAB_NM=REALTIME_VOCA,
                 RULE_SET_PATH=paste0(REALTIME_PATH,"/",cobname[g]),
                 RULE_NM=paste0("Nombre predeterminado de la regla  ",1:(nrow(tabla_fac[[1]]))),
                 RULE_SEQ_NO=1:(nrow(tabla_fac[[1]])),
                 CONDITIONAL_NM=c("if",rep("elseif",nrow(tabla_fac[[1]])-1)),
                 RECORD_RULE_FIRED_FLG="Y",
                 EXPRESION_ORDER_1=1,
                 EXPRESION_TYPE_1="CONDITION",
                 LHS_TERM_1=var_name,
                 EXPRESION_1=paste0("<=",tabla_fac[[1]]$X3),
                 EXPRESION_ORDER_FINAL=1,
                 EXPRESION_TYPE_FINAL="ACTION",
                 LHS_TERM_FINAL=fac_name,
                 EXPRESION_FINAL= tabla_fac[[1]]$X4# %>% as.numeric() %>% round(4)#%>% as.character()
          )
        #si la tabla de formato tiene valores en las dos columnas 2ª y 3ª como de intervalos, se asigna "<=" delante del primer valor de intervalo 
        if(!is.na(tabla_fac[[1]]$X2[1]) & !is.na(tabla_fac[[1]]$X3[1]) & !any(str_detect(tabla_fac[[1]]$X4,"\\|"))){
          tabla_rt$EXPRESION_1=paste0("<=",as.numeric(tabla_fac[[1]]$X3))
          tabla_rt$EXPRESION_FINAL=tabla_fac[[1]]$X4 %>% as.numeric() %>% round(4)
        }
        #si la tabla de formato solo tiene valores en la 2ª columna, se cogeria el valor de esa columna 
        if(any(is.na(tabla_fac[[1]]$X2[1]), is.na(tabla_fac[[1]]$X3[1]))){
          if(is.numeric(tabla_fac[[1]]$X2[1])){
            tabla_rt$EXPRESION_1=tabla_fac[[1]]$X2
          }
          else if(is.character(tabla_fac[[1]]$X2[1])){
            tabla_rt$EXPRESION_1<-paste0("'",str_trim(tabla_fac[[1]]$X2),"'")
          }
          tabla_rt$EXPRESION_FINAL=tabla_fac[[1]]$X4 %>% as.numeric() %>% round(4)
        }
        #si la tabla de formato es de Pregunta y ademas solo tiene valor en la 2ª columna añadimos otra linea para else de realtime
        if(is.na(tabla_fac[[1]]$X3[1]) & str_starts(tabla_fac[[1]]$X1[1],"P_")){
          num_rows<-nrow(tabla_rt)
          tabla_rt[num_rows+1,]<-tabla_rt[num_rows,]
          regla_num<-str_extract(tabla_rt$RULE_NM[num_rows],"\\d") %>% as.numeric()
          tabla_rt$RULE_SEQ_NO[num_rows+1]<-regla_num+1
          tabla_rt$RULE_NM[num_rows+1]<-paste0(str_extract(tabla_rt$RULE_NM[num_rows],"[[:alpha:]|\\s]+"),regla_num+1) 
          tabla_rt$EXPRESION_1[num_rows+1]<-"._"
          tabla_rt$EXPRESION_FINAL[num_rows+1]<-1
        }
        #anadimos el round para redondear en sas
        if(any(str_detect(tabla_fac[[1]]$X4,"\\|"))){
          tabla_rt$EXPRESION_FINAL=tabla_fac[[1]]$X4 %>% 
            str_split("\\|") %>% 
            map(~paste0(tabla_fac[[1]]$X1[1],"*",.[1],"+",.[2]) %>%
                  str_replace_all(",","\\.") %>% 
                  str_replace("\\+-","-")
                
            ) %>% unlist() 
        }
        
        #si la tabla es de IndLimAgregado, asignamos condiciones solo para "1","2",">=3"
        if(any(TF_var_p)){
          if(!is.na(var_p[[4]][TF_var_p])){
            tabla_rt$EXPRESION_1<-str_split(var_p[[4]][TF_var_p],",") %>% unlist()
          }
        }
        
        tabla_fac_list[[names(tabla_fac)]]<-tabla_rt
        
        
        TablaCSV<-map(tabla_fac_list, function(tocsv){
          tablaCSV1 <- tocsv %>% 
            mutate(RULE_SET_SK=".",
                   RULE_SET_DESC="",
                   RULE_DESC="",
                   LHS_TERM=LHS_TERM_1,
                   EXPRESSION=EXPRESION_1,
                   EXPRESSION_ORDER=1,
                   EXPRESSION_TYPE=EXPRESION_TYPE_1) %>% 
            select(RULE_SET_SK,RULE_SET_NM,RULE_SET_DESC,VOCAB_NM,	RULE_SET_PATH,	RULE_NM,
                   RULE_DESC,	RULE_SEQ_NO,	CONDITIONAL_NM,	RECORD_RULE_FIRED_FLG,	LHS_TERM,	
                   EXPRESSION,	EXPRESSION_ORDER,	EXPRESSION_TYPE)
          
          tablaCSV2 <- tocsv %>% 
            mutate(RULE_SET_SK=".",
                   RULE_SET_DESC="",
                   RULE_DESC="",
                   LHS_TERM=LHS_TERM_FINAL,
                   EXPRESSION=EXPRESION_FINAL,
                   EXPRESSION_ORDER=1,
                   EXPRESSION_TYPE=EXPRESION_TYPE_FINAL) %>% 
            select(RULE_SET_SK,RULE_SET_NM,RULE_SET_DESC,VOCAB_NM,	RULE_SET_PATH,	RULE_NM,
                   RULE_DESC,	RULE_SEQ_NO,	CONDITIONAL_NM,	RECORD_RULE_FIRED_FLG,	LHS_TERM,	
                   EXPRESSION,	EXPRESSION_ORDER,	EXPRESSION_TYPE)
          
          tablaCSV<-rbind(tablaCSV1,tablaCSV2) %>% arrange(RULE_SEQ_NO)  
          tablaCSV
          
        })
      }
      list_table[[g]]<-do.call(rbind,TablaCSV)
      
      texto<-list()
      
      setwd(paste0(".\\",cobname[g]))
      for(k in 1:length(tabla_fac_list)){
        wb_out<-createWorkbook()
        sheet<-"RULE_SET"
        addWorksheet(wb_out,sheetName = sheet)
        writeData(wb_out, sheet, tabla_fac_list[[k]])
        filename<-paste0(REALTIME_FILE,"_",sh[g],"_",cobname[g],"_",names(tabla_fac_list)[k])
        saveWorkbook(wb_out, paste0(filename,".xlsx"),overwrite = T)
        write.csv(TablaCSV[[k]], paste0(filename,".CSV"), quote = F, row.names = F)
        texto[[k]]<-paste0("
  *",names(tabla_fac_list)[k],";
    
  %BRM_IMPORT_RULESET (
  CSV   =
    %STR(//CONTROL_TECNICO/",filename,".CSV","),
  REJECT=                  
    %STR(//CONTROL_TECNICO/",filename,".CSV)
);")
        
      }
      textos<-paste0(texto %>% unlist(), collapse = " \n ")
      write_lines(textos,paste0(sh[g],"_texto_guide",".sas"))
      list_total[g]<-textos
      cat(noquote(paste0(" ",format(paste0(format(paste0(g,". ") ,width = 5), sh[g]), width = 30), "  LISTO \n")))
      
      setwd("..")
      
      
    }
    
    AllCSVtables<-do.call(rbind,list_table)
    textos_total<-paste0(list_total %>% unlist(), collapse = " \n ")
    folderall_name<-"All_CSVs"
    dir.create(paste0(getwd(),"/",folderall_name))
    
    
    CSV_path<-list.files(recursive = T, pattern = "\\.CSV")
    file.copy(CSV_path,folderall_name)
    setwd(paste0(".\\",folderall_name))
    write_lines(textos_total,"textos_guide.sas")
    write.csv(AllCSVtables, paste0("total_ruleset.CSV"), quote = F, row.names = F)
    cat("\n--------------------------------TERMINADO-------------------------------------")
    cat("\n\n\n")
    cat(noquote(paste0("RUTA SALIDA: ",outputpath,"\n")))
    cat("\n")
    setwd("../../..")
    
    
    
    })
  
  
  # the select all check box for all CSV files created before
  output$Allfiles <- renderUI({
    req(input$Ejec)
    
    awesomeCheckbox(
      inputId = "Allfile",
      label = "Seleccionar Todo", 
      value = FALSE
    )
  })
  
  
  #the reactive function to get the last created output folder as work directory 
  ruta_output<-eventReactive(input$sht,{
    setwd(input$dirout)
    fs<-list.files()
    fs_sele<-str_subset(fs, "\\d{6,}$")
    fs_time<-map(fs_sele,~paste(str_extract_all(.,"\\d{3,}", simplify = F)[[1]], collapse = "")) %>% 
      unlist() %>% as.numeric()
    paste0(getwd(),"/",fs_sele[which.max(fs_time)], "/All_CSVs")
  })
  
  #the reactive function to subset the CSV files in ruta_output()
  file_output<-eventReactive(input$sht,{
    setwd(ruta_output())
    str_subset(list.files(),"CSV$|csv$")  
  })
    
  

  #the checkboxgroup to multipleselect the CSV files  
  output$selefile <-
    renderUI({req(input$Ejec,input$dirout)

      checkboxGroupButtons(
        inputId = "sfile",
        label = "", 
        choices = file_output(),
        justified = T,
        individual=F,
        direction = "vertical"
      )
    })
  
  #(502) update CSV files check boxes
  observeEvent(input$Allfile, {
    updateCheckboxGroupButtons(
      session = session,
      inputId = "sfile",
      selected = character(0)
    )
  })
  
  all_selected1 <- reactiveVal(TRUE)
  
  observeEvent(input$Allfile, {
    if (all_selected1()) {
      updateCheckboxGroupButtons(
        session = session,
        inputId = "sfile",
        selected = character(0)
      )
      all_selected1(FALSE)
    } else {
      updateCheckboxGroupButtons(
        session = session,
        inputId = "sfile",
        selected = file_output()
      )
      all_selected1(TRUE)
    }
  })
  
  
  #Input of CSVs filter by writing the key word
  output$patrones <- renderUI({
    req(input$Ejec)

    textInput(
      inputId = "patron",
      label = "Filtrar Por La palabra Clave",
      value = ""
    )
  })


  #filter of CSVs by writing the key word
  filter_CSVs<-reactive({
    if(input$patron!=""){str_subset(file_output(),input$patron)}
  })




  observeEvent(input$patron, {
    updateCheckboxGroupButtons(
      session = session,
      inputId = "sfile",
      selected = filter_CSVs()
    )
 
  })
  
  
  
  #action button to upload the csv files to control tecnico
  output$subirsascoms <-
    renderUI({req(shn())
      actionButton(inputId = "subirsascom", label = "Subir a Control Técnico", icon = NULL)
    })
  
  
  #the function sftp to do the action of uploading
  observeEvent(input$subirsascom, {
  con<-sftp::sftp_connect(server = "sftp://TZHZHO01@LPRD-SASCOMP01",
                          folder = "/CONTROL_TECNICO",
                          username = "TZHZHO01", password = "W6ndfUuz7IT62w")
  updateProgressBar(session = session, id = "progress_CT", value = 0)
  
  for(i in 1:length(input$sfile)){
  sftp::sftp_upload(input$sfile[i], sftp_connection = con)
    #====================================================================================
    updateProgressBar(session = session, id = "progress_CT", value = (i/length(input$sfile))*100)
    #====================================================================================
  }
  })
  
  #function to create DATE+TIME for naming
  moment<-eventReactive(input$sfile,{
    stringr::str_remove_all(Sys.time(),"[:punct:]") %>% stringr::str_replace("\\s+","_")
  })
  
  #download button of sas script (upload Csvs content from control tecnico to SAS RT BRM) 
  output$downloadSAS<-downloadHandler(
    filename =function() {
      paste0("texto_guide_",moment(),".sas")
    },
    content = function(file) {
    cobsubido<-map(input$sfile, ~str_split(.,"/")[[1]][length(str_split(.,"/")[[1]])]) %>% unlist()
    
    texto<-list()
   for(k in 1:length(cobsubido)){ 
    texto[[k]]<-paste0("
    
  %BRM_IMPORT_RULESET (
  CSV   =
    %STR(//CONTROL_TECNICO/",cobsubido[k],"),
  REJECT=                  
    %STR(//CONTROL_TECNICO/","REJ_",cobsubido[k],")
);")
   }
    
    textos<-paste0(texto %>% unlist(), collapse = " \n ")
   
    write_lines(textos,file)
    write_lines(textos,paste0(ruta_output(),"/texto_guide_",moment(),".sas"))
    utils::browseURL(paste0(ruta_output(),"/texto_guide_",moment(),".sas"))
    }
  )
  
  
  output$downloadSASUI <-
    renderUI({
      downloadButton("downloadSAS", "Código Para Subir a SASRT",style = "width:100%;color: white;background-color: #d97307;")
    })
  
  setwd(ruta_inicial)
  
  
  ############################_RULESETFORMULA_#########################################################################################################
  ############################_RULESETFORMULA_#########################################################################################################


  output$seleformulafic <- renderUI({
    fileInput(
      inputId="formulafic",
      label="Importar Excel de Formulas",
      multiple = FALSE,
      width = NULL,
      buttonLabel = "Cargar...",
      placeholder = "RuleSet_Formula.xlsx"
    )
  })


  observeEvent(input$formulafic, {
    updateTabsetPanel(session, "inTabset",selected = "RULE SET FORMULA CSVs")
  })

  FORMULA_SHEET<-eventReactive(input$formulafic,{if (!is.null(input$formulafic)){read.xlsx(input$formulafic$datapath, sheet = 1, colNames = F, skipEmptyRows = FALSE, skipEmptyCols = FALSE)}})

  #By default the exportation directory is your desktop
  output$diroutformulaUI<-
    renderUI({
      textInput(inputId= "diroutformula", label= "Directorio de Exportación",
                value = paste0("C:/Users/",Sys.getenv("USERNAME"),"/Desktop"))
    })

  output$EjecutarformulaUI <-
    renderUI({req(input$formulafic)
      actionButton(inputId = "Ejecutarformula", label = "EJECUTAR", icon = NULL)
    })

  momentfileformula<-eventReactive(input$formulafic,{stringr::str_remove_all(Sys.time(),"[:punct:]") %>% stringr::str_replace("\\s+","_")})

  observeEvent(input$Ejecutarformula,{
    initdir=input$diroutformula
    setwd(initdir)
    #====================================================================================
    updateProgressBar(session = session, id = "progressformula", value = 0)
    #====================================================================================
    formulasheet<-FORMULA_SHEET()
    MAIN_FOLDER<-formulasheet$X2[1]
    VERSION_FOLDER<-formulasheet$X2[2]
    MAIN_VOCA_NAME<-formulasheet$X2[3]
    SUBFOLDER<-formulasheet$X2[4:nrow(formulasheet)]
    VOCA_NAME<-formulasheet$X3[4:nrow(formulasheet)]
    FORMULAS<-formulasheet$X4[4:nrow(formulasheet)]
    
    
    
    formula_base_list<-list()
    
    for(k in 1:length(FORMULAS)){
      formu<-FORMULAS[k]
      
      cont_sent<-formu  %>%  str_split("\\s*THEN\\s+|\\s*AND\\s+|\\s*IF\\s+|\\s*ELSEIF\\s+|\\s*ELSE\\s+") %>% unlist()%>% str_trim() %>% str_subset(".") %>% str_remove_all(";")
      cont_logi<-formu %>%  str_extract_all("\\s*THEN\\s+|\\s*AND\\s+|\\s*IF\\s+|\\s*ELSEIF\\s+|\\s*ELSE\\s+") %>% unlist()%>% str_trim()
      
      cont_logi<-c(rep("ACT", length(cont_sent)-length(cont_logi)), cont_logi)
      
      cont_logi
      cha<-cont_logi
      rule_seq<-c()
      nn<-0
      for(i in 1:length(cha)){
        if(cha[i]=="IF"){nn<-nn+1; rule_seq<-c(rule_seq, nn)}
        else if(cha[i]=="ACT"){nn<-nn+1; rule_seq<-c(rule_seq, nn)}
        else if(cha[i]=="ELSEIF"){nn<-nn+1; rule_seq<-c(rule_seq,nn)}
        else if(cha[i]=="AND"){rule_seq<-c(rule_seq,nn)}
        else if(cha[i]=="THEN"){rule_seq<-c(rule_seq,nn)}
        else if(cha[i]=="ELSE"){nn<-nn+1; rule_seq<-c(rule_seq,nn)}
      }
      
      chaRT<-c()
      for(i in 1:length(cha)){
        if(cha[i]=="IF"){chaRT<-c(chaRT, "if")}
        else if(cha[i]=="ACT"){chaRT<-c(chaRT, "if")}
        else if(cha[i]=="AND"){chaRT<-c(chaRT, chaRT[i-1])}
        else if(cha[i]=="ELSEIF"){chaRT<-c(chaRT, "elseif")}
        else if(cha[i]=="THEN"){chaRT<-c(chaRT, chaRT[i-1])}
        else if(cha[i]=="ELSE"){chaRT<-c(chaRT, "elseif")}
      }
      
      a1<-cont_sent[2]
      a1<-cont_sent[1]
      sentence<-a1
      condition_sentence<-function(logi, sentence){
        
        if(logi %in% c("IF","ELSEIF","AND")){
          asent1<-sentence %>% str_extract("(\\s*.+\\s*)(?=[:symbol:])") %>% str_trim()
          asent2aux<-sentence %>% str_extract("(?<=[:symbol:])(\\s*.+\\s*)") %>% str_trim()
          asymbol<-sentence %>% str_extract("[:symbol:]") %>% str_trim()
          asent2<-paste0(asymbol,asent2aux)
        }
        else if(logi %in% c("ACT","THEN", "ELSE")){
          
          asent1<-sentence %>% str_extract("(\\s*.+\\s*)(?=[:symbol:])") %>% str_trim()
          asent2<-sentence %>% str_extract("(?<=[:symbol:])(\\s*.+\\s*)") %>% str_trim()
        }
        
        c(asent1, asent2)  
      }
      
      condition_sentence("IF", cont_sent[1])
      
      condtion_sentence_comb<-do.call(rbind, map2(cont_logi, cont_sent, condition_sentence))
      
      formula_base_list[[k]]<-data.frame(
        RULE_SET_SK = ".",
        RULE_SET_NM = VOCA_NAME[k],
        RULE_SET_DESC = "",
        VOCAB_NM = MAIN_VOCA_NAME,
        RULE_SET_PATH = paste(MAIN_FOLDER, VERSION_FOLDER, SUBFOLDER[k], sep = "/"),
        RULE_NM = paste0("Regla_",rule_seq),
        RULE_DESC = "",
        RULE_SEQ_NO = rule_seq,
        CONDITIONAL_NM = chaRT,
        RECORD_RULE_FIRED_FLG = ifelse(cont_logi=="ACT","N","Y"),
        LHS_TERM = condtion_sentence_comb[,1],
        EXPRESSION = ifelse(str_detect(condtion_sentence_comb[,2],"round"), paste0('"',condtion_sentence_comb[,2],'"'),condtion_sentence_comb[,2]),
        EXPRESSION_ORDER = 1,
        EXPRESSION_TYPE = ifelse(cont_logi %in% c("ACT", "THEN", "ELSE"),"ACTION", "CONDITION")
      )
      
    }
    
    
    #====================================================================================
    updateProgressBar(session = session, id = "progressformula", value = 25)
    #====================================================================================
    
   
  
    SASCODE<-map(formula_base_list, ~paste0(
      "

  %BRM_IMPORT_RULESET (
  CSV   =
    %STR(//CONTROL_TECNICO/", paste(VERSION_FOLDER,.$RULE_SET_NM[1],"RULESET_FORMULA.CSV", sep="_"),"),
  REJECT=
    %STR(//CONTROL_TECNICO/", "REJ_",paste(VERSION_FOLDER,.$RULE_SET_NM[1],"RULESET_FORMULA.CSV", sep="_"),")
);"))


    SASCODES<-paste(SASCODE %>% unlist(), collapse = " \n ")


    moment<-momentfileformula()
    dir.create(paste0(getwd(),"\\OUTPUT_RULESET_FORMULA",Sys.getenv("USERNAME"),"_",moment))
    setwd(paste0(getwd(),"\\OUTPUT_RULESET_FORMULA",Sys.getenv("USERNAME"),"_",moment))
    walk(formula_base_list, ~write.csv(.,paste(VERSION_FOLDER,.$RULE_SET_NM[1],"RULESET_FORMULA.CSV", sep="_"), quote = F, row.names = F))
    #====================================================================================
    updateProgressBar(session = session, id = "progressformula", value = 75)
    #====================================================================================

    write_lines(SASCODES,paste0(VERSION_FOLDER,"_RULESET_FORMULA_texto_guide",moment,".sas"))

    #====================================================================================
    updateProgressBar(session = session, id = "progressformula", value = 100)
    #====================================================================================


  })



  output$Allfilesformula <- renderUI({
    req(input$Ejecutarformula)

    awesomeCheckbox(
      inputId = "Allfileformula",
      label = "Seleccionar Todo",
      value = FALSE
    )
  })

  file_output_formula<-eventReactive(input$Ejecutarformula,{
    str_subset(list.files(),"CSV$|csv$")
  })


  #the checkboxgroup to multipleselect the CSV files
  output$selefileformula <-
    renderUI({req(momentfileformula())

      checkboxGroupButtons(
        inputId = "sfileformula",
        label = "",
        choices = file_output_formula(),
        justified = T,
        individual=F,
        direction = "vertical"
      )
    })

  #update CSV files check boxes
  observeEvent(input$Allfileformula, {
    updateCheckboxGroupButtons(
      session = session,
      inputId = "sfileformula",
      selected = character(0)
    )
  })

  all_selected1formula <- reactiveVal(TRUE)

  observeEvent(input$Allfileformula, {
    if (all_selected1formula()) {
      updateCheckboxGroupButtons(
        session = session,
        inputId = "sfileformula",
        selected = character(0)
      )
      all_selected1formula(FALSE)
    } else {
      updateCheckboxGroupButtons(
        session = session,
        inputId = "sfileformula",
        selected = file_output_formula()
      )
      all_selected1formula(TRUE)
    }
  })


  #Input of CSVs filter by writing the key word
  output$patronesformula <- renderUI({
    req(input$Ejecutarformula)

    textInput(
      inputId = "patronformula",
      label = "Filtrar Por La palabra Clave",
      value = ""
    )
  })


  #filter of CSVs by writing the key word
  filter_CSVs_formula<-reactive({
    if(input$patronformula!=""){str_subset(file_output_formula(),input$patronformula)}
  })




  observeEvent(input$patronformula, {
    updateCheckboxGroupButtons(
      session = session,
      inputId = "sfileformula",
      selected = filter_CSVs_formula()
    )

  })



  #action button to upload the csv files to control tecnico
  output$subirsascomformulaUI <-
    renderUI({req(input$formulafic)
      actionButton(inputId = "subirsascomformula", label = "Subir a Control Técnico", icon = NULL)
    })


  #the function sftp to do the action of uploading
  observeEvent(input$subirsascomformula, {
    con<-sftp::sftp_connect(server = "sftp://TZHZHO01@LPRD-SASCOMP01",
                            folder = "/CONTROL_TECNICO",
                            username = "TZHZHO01", password = "W6ndfUuz7IT62w")
    updateProgressBar(session = session, id = "progress_CTformula", value = 0)

    for(i in 1:length(input$sfileformula)){
      sftp::sftp_upload(input$sfileformula[i], sftp_connection = con)
      #====================================================================================
      updateProgressBar(session = session, id = "progress_CTformula", value = (i/length(input$sfileformula))*100)
      #====================================================================================
    }
  })

  #function to create DATE+TIME for naming
  momentformula<-eventReactive(input$sfileformula,{
    stringr::str_remove_all(Sys.time(),"[:punct:]") %>% stringr::str_replace("\\s+","_")
  })

  #download button of sas script (upload Csvs content from control tecnico to SAS RT BRM)
  output$downloadSASformula<-downloadHandler(
    filename =function() {
      paste0("texto_guide_",momentformula(),".sas")
    },
    content = function(file) {
      cobsubido<-map(input$sfileformula, ~str_split(.,"/")[[1]][length(str_split(.,"/")[[1]])]) %>% unlist()

      texto<-list()
      for(k in 1:length(cobsubido)){
        texto[[k]]<-paste0("

  %BRM_IMPORT_RULESET (
  CSV   =
    %STR(//CONTROL_TECNICO/",cobsubido[k],"),
  REJECT=
    %STR(//CONTROL_TECNICO/","REJ_",cobsubido[k],")
);")
      }

      textos<-paste(texto %>% unlist(), collapse = " \n ")

      write_lines(textos,file)
      write_lines(textos,paste0("texto_guide_",momentformula(),".sas"))
      utils::browseURL(paste0("texto_guide_",momentformula(),".sas"))
    }
  )


  output$downloadSASformulaUI <-
    renderUI({
      downloadButton("downloadSASformula", "Código Para Subir a SASRT",style = "width:100%;color: white;background-color: #d97307;")
    })


  setwd(ruta_inicial)


  
############################_RULE_FLOW_#########################################################################################################
############################_RULE_FLOW_#########################################################################################################
  
  
  output$seleflowfic <- renderUI({
    fileInput(
      inputId="flowfic",
      label="Importar Excel de Rule Flow",
      multiple = FALSE,
      width = NULL,
      buttonLabel = "Cargar...",
      placeholder = "Rule Flow.xlsx"
    )
  })
  
  
  observeEvent(input$flowfic, {
    updateTabsetPanel(session, "inTabset",selected = "RULE FLOW CSVs")
  })
  
  FLOW_SHEET<-eventReactive(input$flowfic,{if (!is.null(input$flowfic)){read.xlsx(input$flowfic$datapath, sheet = 1, colNames = F, skipEmptyRows = FALSE, skipEmptyCols = FALSE)}})
  
  #By default the exportation directory is your desktop
  output$diroutflowUI<-
    renderUI({
      textInput(inputId= "diroutflow", label= "Directorio de Exportación",
                value = paste0("C:/Users/",Sys.getenv("USERNAME"),"/Desktop"))
    })
  
  output$EjecutarflowUI <-
    renderUI({req(input$flowfic)
      actionButton(inputId = "Ejecutarflow", label = "EJECUTAR", icon = NULL)
    })
  
  momentfileflow<-eventReactive(input$flowfic,{stringr::str_remove_all(Sys.time(),"[:punct:]") %>% stringr::str_replace("\\s+","_")})

  observeEvent(input$Ejecutarflow,{
    initdir=input$diroutflow
    setwd(initdir)
    #====================================================================================
    updateProgressBar(session = session, id = "progressflow", value = 0)
    #====================================================================================
    flowsheet<-FLOW_SHEET()
    MAIN_FOLDER <- flowsheet$X2[1]
    VERSION_FOLDER <- flowsheet$X2[2]
    VOCAB_NAME<- flowsheet$X2[3]
    RULE_FLOW_NAME <- as.character(flowsheet[5,2:ncol(flowsheet)])
    RULE_FLOW_FOLDER <- as.character(flowsheet[6,2:ncol(flowsheet)])
    
    RULE_FLOW_PATH <- paste(MAIN_FOLDER,VERSION_FOLDER, RULE_FLOW_FOLDER, sep = "/")
    RULE_SET_PATH <- paste(MAIN_FOLDER,VERSION_FOLDER, RULE_FLOW_FOLDER, sep = "/")
    RULE_FLOW_NM_L <- paste(VERSION_FOLDER, RULE_FLOW_NAME, sep = "_")
    
    PATH_NM<-flowsheet[7:nrow(flowsheet),2:ncol(flowsheet)]
    names(PATH_NM)<-RULE_SET_PATH
    
    FLOW_NM<-flowsheet[7:nrow(flowsheet),2:ncol(flowsheet)]
    names(FLOW_NM)<-RULE_FLOW_NM_L
    
    
    FNAME_SNAME<-gather(FLOW_NM,key="FNAME", value = "SNAME") %>% filter(!is.na(SNAME))
    FPATH_SNAME<-gather(PATH_NM,key="FPATH", value = "SNAME") %>% filter(!is.na(SNAME)) %>% select(-SNAME)
    
    RULE_FLOW_FILE<-cbind(FNAME_SNAME,FPATH_SNAME) %>%
      mutate(RULE_FLOW_SK = ".",
             RULE_FLOW_NM = FNAME,
             RULE_FLOW_SHORT_DESC = "",
             RULE_FIRED_OUTPUT_FLG = "N",
             RULE_SET_SECTION_CODE = "main",
             INCLUDE_NODE_OBJECT_FLG = "Y",
             RULE_FLOW_PATH = FPATH,
             RULE_SET_NM = SNAME,
             RULE_SET_PATH = FPATH,
             VOCAB_NM = VOCAB_NAME,
             BY_TERM = "",
      ) %>% 
      select(-FNAME,-SNAME,-FPATH) %>% 
      group_by(RULE_FLOW_PATH) %>% 
      mutate(ORDER = 1:n())
    
    FLOWS<-unique(RULE_FLOW_FILE$RULE_FLOW_NM)
    FLOWS_SPLIT<-map(FLOWS, ~filter(RULE_FLOW_FILE,RULE_FLOW_NM==.))
    #====================================================================================
    updateProgressBar(session = session, id = "progressflow", value = 25)
    #====================================================================================
    SASCODE<-map(FLOWS_SPLIT, ~paste0(
      "
      
  %BRM_IMPORT_RULE_FLOW (
  CSV   =
    %STR(//CONTROL_TECNICO/", paste0(.$RULE_FLOW_NM[1],"_RULE_FLOW.CSV"),"),
  REJECT=                  
    %STR(//CONTROL_TECNICO/", "REJ_",paste0(.$RULE_FLOW_NM[1],"_RULE_FLOW.CSV"),")
);"))
    
    
    SASCODES<-paste("options ibufsize=32760 ; \n", paste(SASCODE %>% unlist(), collapse = " \n "))
    
    
    moment<-momentfileflow()
    dir.create(paste0(getwd(),"\\OUTPUT_FLOW",Sys.getenv("USERNAME"),"_",moment))
    setwd(paste0(getwd(),"\\OUTPUT_FLOW",Sys.getenv("USERNAME"),"_",moment))
    walk(FLOWS_SPLIT, ~write.csv(., paste0(.$RULE_FLOW_NM[1],"_RULE_FLOW.CSV"), quote = F, row.names = F))
    #====================================================================================
    updateProgressBar(session = session, id = "progressflow", value = 75)
    #====================================================================================
    
    write_lines(SASCODES,paste0(VERSION_FOLDER,"_RULE_FLOW_texto_guide",".sas"))
    
    #====================================================================================
    updateProgressBar(session = session, id = "progressflow", value = 100)
    #====================================================================================
    
    
  })
  

  
  output$Allfilesflow <- renderUI({
    req(input$Ejecutarflow)
    
    awesomeCheckbox(
      inputId = "Allfileflow",
      label = "Seleccionar Todo", 
      value = FALSE
    )
  })
  
  file_output_flow<-eventReactive(input$Ejecutarflow,{
    #setwd(paste0(getwd(),"\\OUTPUT_FLOW",Sys.getenv("USERNAME"),"_",momentfileflow()))
    str_subset(list.files(),"CSV$|csv$")  
  })
  
  
  #the checkboxgroup to multipleselect the CSV files  
  output$selefileflow <-
    renderUI({req(momentfileflow())
      
      checkboxGroupButtons(
        inputId = "sfileflow",
        label = "", 
        choices = file_output_flow(),
        justified = T,
        individual=F,
        direction = "vertical"
      )
    })
  
  #update CSV files check boxes
  observeEvent(input$Allfileflow, {
    updateCheckboxGroupButtons(
      session = session,
      inputId = "sfileflow",
      selected = character(0)
    )
  })
  
  all_selected1flow <- reactiveVal(TRUE)
  
  observeEvent(input$Allfileflow, {
    if (all_selected1flow()) {
      updateCheckboxGroupButtons(
        session = session,
        inputId = "sfileflow",
        selected = character(0)
      )
      all_selected1flow(FALSE)
    } else {
      updateCheckboxGroupButtons(
        session = session,
        inputId = "sfileflow",
        selected = file_output_flow()
      )
      all_selected1flow(TRUE)
    }
  })
  
  
  #Input of CSVs filter by writing the key word
  output$patronesflow <- renderUI({
    req(input$Ejecutarflow)
    
    textInput(
      inputId = "patronflow",
      label = "Filtrar Por La palabra Clave",
      value = ""
    )
  })
  
  
  #filter of CSVs by writing the key word
  filter_CSVs_flow<-reactive({
    if(input$patronflow!=""){str_subset(file_output_flow(),input$patronflow)}
  })
  
  
  
  
  observeEvent(input$patronflow, {
    updateCheckboxGroupButtons(
      session = session,
      inputId = "sfileflow",
      selected = filter_CSVs_flow()
    )
    
  })
  
  
  
  #action button to upload the csv files to control tecnico
  output$subirsascomflowUI <-
    renderUI({req(input$flowfic)
      actionButton(inputId = "subirsascomflow", label = "Subir a Control Técnico", icon = NULL)
    })
  
  
  #the function sftp to do the action of uploading
  observeEvent(input$subirsascomflow, {
    con<-sftp::sftp_connect(server = "sftp://TZHZHO01@LPRD-SASCOMP01",
                            folder = "/CONTROL_TECNICO",
                            username = "TZHZHO01", password = "W6ndfUuz7IT62w")
    updateProgressBar(session = session, id = "progress_CTflow", value = 0)
    
    for(i in 1:length(input$sfileflow)){
      sftp::sftp_upload(input$sfileflow[i], sftp_connection = con)
      #====================================================================================
      updateProgressBar(session = session, id = "progress_CTflow", value = (i/length(input$sfileflow))*100)
      #====================================================================================
    }
  })
  
  #function to create DATE+TIME for naming
  momentflow<-eventReactive(input$sfileflow,{
    stringr::str_remove_all(Sys.time(),"[:punct:]") %>% stringr::str_replace("\\s+","_")
  })
  
  #download button of sas script (upload Csvs content from control tecnico to SAS RT BRM) 
  output$downloadSASflow<-downloadHandler(
    filename =function() {
      paste0("texto_guide_",momentflow(),".sas")
    },
    content = function(file) {
      cobsubido<-map(input$sfileflow, ~str_split(.,"/")[[1]][length(str_split(.,"/")[[1]])]) %>% unlist()
      
      texto<-list()
      for(k in 1:length(cobsubido)){ 
        texto[[k]]<-paste0("
    
  %BRM_IMPORT_RULE_FLOW (
  CSV   =
    %STR(//CONTROL_TECNICO/",cobsubido[k],"),
  REJECT=                  
    %STR(//CONTROL_TECNICO/","REJ_",cobsubido[k],")
);")
      }
      
      textos<-paste0("options ibufsize=32760 ; \n", paste(texto %>% unlist(), collapse = " \n "))
      
      write_lines(textos,file)
      write_lines(textos,paste0("texto_guide_",momentflow(),".sas"))
      utils::browseURL(paste0("texto_guide_",momentflow(),".sas"))
    }
  )
  
  
  output$downloadSASflowUI <-
    renderUI({
      downloadButton("downloadSASflow", "Código Para Subir a SASRT",style = "width:100%;color: white;background-color: #d97307;")
    })
  
  
  setwd(ruta_inicial)
  
  
  
  
  ############################_PLANTILLA_#########################################################################################################
  ############################_PLANTILLA_#########################################################################################################
  
  
  
  
  output$downloadINIT <- downloadHandler(
    filename =function() {paste0("INIT",str_replace_all(Sys.Date(),"-","_"),".xlsx")},
    content = function(file) {
      file.copy(file.path(ruta_inicial,'www','INIT.xlsx'), file,overwrite = TRUE)
    }
  )
  output$downloadINITUI <-
    renderUI({
      downloadButton("downloadINIT", "Plantilla INIT",style = "width:80%;color: white;background-color: #d97307;")
    })
  
  
  
  output$downloadTARIFA <- downloadHandler(
    filename =function() {paste0("Tarifa",str_replace_all(Sys.Date(),"-","_"),".xlsx")},
    content = function(file) {
      file.copy(file.path(ruta_inicial,'www','Tarifa_prueba.xlsx'), file,overwrite = TRUE)
    }
  )
  
  output$downloadTARIFAUI <-
    renderUI({
      downloadButton("downloadTARIFA", "Plantilla TARIFA",style = "width:80%;color: white;background-color: #d97307;")
    })
  
  
  
  output$downloadformula <- downloadHandler(
    filename =function() {paste0("Plantilla_Formula",str_replace_all(Sys.Date(),"-","_"),".xlsx")},
    content = function(file) {
      file.copy(file.path(ruta_inicial,'www','plantilla_formula_especial.xlsx'), file,overwrite = TRUE)
    }
  )
  
  output$downloadformulaUI <-
    renderUI({
      downloadButton("downloadformula", "Plantilla Formula Especial",style = "width:80%;color: white;background-color: #d97307;")
    })
  
  
  
  output$downloadcarp <- downloadHandler(
    filename =function() {paste0("Plantilla_Carpeta",str_replace_all(Sys.Date(),"-","_"),".xlsx")},
    content = function(file) {
      file.copy(file.path(ruta_inicial,'www','plantilla_carpeta.xlsx'), file,overwrite = TRUE)
    }
  )
  
  output$downloadcarpUI <-
    renderUI({
      downloadButton("downloadcarp", "Plantilla Carpeta",style = "width:80%;color: white;background-color: #d97307;")
    })
  
  
  
  output$downloadvoca <- downloadHandler(
    filename =function() {paste0("Plantilla_Vocabulario",str_replace_all(Sys.Date(),"-","_"),".xlsx")},
    content = function(file) {
      file.copy(file.path(ruta_inicial,'www','plantilla_vocab.xlsx'), file,overwrite = TRUE)
    }
  )
  
  output$downloadvocaUI <-
    renderUI({
      downloadButton("downloadvoca", "Plantilla Vocabulario",style = "width:80%;color: white;background-color: #d97307;")
    })
  
  
  
  output$downloadflow <- downloadHandler(
    filename =function() {paste0("Plantilla_Flujo",str_replace_all(Sys.Date(),"-","_"),".xlsx")},
    content = function(file) {
      file.copy(file.path(ruta_inicial,'www','plantilla_rule_flow.xlsx'), file,overwrite = TRUE)
    }
  )
  
  output$downloadflowUI <-
    renderUI({
      downloadButton("downloadflow", "Plantilla Flujo",style = "width:80%;color: white;background-color: #d97307;")
    })
  
  
  
  
}



# Run the application 
shinyApp(ui = ui, server = server)
