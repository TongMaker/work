
library(shiny)
library(shinyWidgets)
library(shinydashboard)
library(openxlsx, quietly = T)
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
    sidebarMenu(
      
      #d97307
      
      HTML(paste0(
        "<br>",
        "<tr>",
        "<b><p style = 'text-align: center; color:white;'><big>ACTUARIAL NO VIDA</a></big></p></b>",
        "<tr>",
        "<br>"
      )),

      menuItem("Cargar Inputs", tabName = "main", icon = icon("arrow-up-from-bracket"),
               uiOutput("seleinit"),
               uiOutput("seletari"),
               uiOutput("Alls")
        
      ),
      menuItem("Directorio Salida", tabName = "main", icon = icon("pen"),
               uiOutput("diroutput"),
               uiOutput("Ejecutar"),
               progressBar(id = "progress", value = 0, display_pct = T)
               ),
      
      menuItem("Plantilla de Ficheros", tabName = "main", icon = icon("download"),
               uiOutput("downloadINITUI"),
               uiOutput("downloadTARIFAUI")
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
      
      
      uiOutput("selesht")
    )
    
    
    
  )
)



server <- function(input, output, session) {

    options(shiny.maxRequestSize=1110*1024^2)
  
  
  
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
  
  output$Alls <- renderUI({
    req(input$tari)
    
    awesomeCheckbox(
      inputId = "All",
      label = "Seleccionar Todo", 
      value = FALSE
    )
  })

 
  
  REALTIME_PATH <- reactive({if (!is.null(input$init)){read.xlsx(input$init$datapath, colNames = FALSE, cols = 2, rows = 1)[[1]]}})
  REALTIME_FILE <- reactive({if (!is.null(input$init)){read.xlsx(input$init$datapath, colNames = FALSE, cols = 4, rows = 1)[[1]]}})
  
  var_g <- reactive({if (!is.null(input$init)) {read.xlsx(input$init$datapath, cols = 2:5, rows = 3:4)}})
  var_p <- reactive({if (!is.null(input$init)) {read.xlsx(input$init$datapath, cols = 2:5, rows = 6:1000)}})
  cob_g <- reactive({if (!is.null(input$init)) {read.xlsx(input$init$datapath, cols = 8:9, rows = 3:4)}})
  cob_p <- reactive({if (!is.null(input$init)) {read.xlsx(input$init$datapath, cols = 8:9, rows = 6:1000)}})
  
  excel <- reactive({
    if (!is.null(input$tari)) {
      loadWorkbook(input$tari$datapath)
    }
  })
  
  
  shn <- reactive({
    if (!is.null(input$tari)) {sheets(excel())}
  })
  

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

  output$diroutput<-
    renderUI({

      textInput(inputId= "dirout", label= "Directorio de Exportación",
                value = paste0("C:/Users/",Sys.getenv("USERNAME"),"/Desktop"))
    })


  
  

  
  
  
  
  
  
output$Ejecutar <-
  renderUI({req(shn())
    actionButton(inputId = "Ejec", label = "EJECUTAR", icon = NULL)
 })



  # writecsv<-reactive({
  #   req(input$Ejec)
  #   if(input$Ejec<1){
  #   write.xlsx(data(),"C:\\Users\\TZHZHO01\\Desktop\\OUTPUT_TZHZHO01_20230421_111151\\m.xlsx")
  #   #tarifa(excel(),input$sht, REALTIME_PATH(), REALTIME_FILE(), var_g(), var_p(), cob_g(), cob_p(),input$dirout)
  #   }
  # 
  # })

# output$progressUI <-
#   renderUI({req(input$Ejec)
#     progressBar(id = "progress", value = 0, display_pct = T)
#   })


  observeEvent(input$Ejec,{
    excel=excel()
    selecc=str_trim(paste(input$sht,collapse="|")) 
    REALTIME_PATH=REALTIME_PATH()
    REALTIME_FILE=REALTIME_FILE()
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
      posi_sh<-str_detect(shn, selecc)
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
                 VOCAB_NM=REALTIME_PATH %>% str_extract("\\w+(?=/)"),
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
  
  
  output$downloadINIT <- downloadHandler(
    filename =function() {paste0("INIT",str_replace_all(Sys.Date(),"-","_"),".xlsx")},
    content = function(file) {
      file.copy(file.path(getwd(),'www','INIT.xlsx'), file,overwrite = TRUE)
    }
  )
  
  
  
  output$downloadTARIFA <- downloadHandler(
    filename =function() {paste0("Tarifa",str_replace_all(Sys.Date(),"-","_"),".xlsx")},
    content = function(file) {
      file.copy(file.path(getwd(),'www','Tarifa.xlsx'), file,overwrite = TRUE)
    }
  )

  output$downloadINITUI <-
    renderUI({
      downloadButton("downloadINIT", "Plantilla INIT",style = "width:80%;color: white;background-color: #d97307;")
    })
  
  
  output$downloadTARIFAUI <-
    renderUI({
      downloadButton("downloadTARIFA", "Plantilla TARIFA",style = "width:80%;color: white;background-color: #d97307;")
    })
  
  
  
  
  
  
  
}



# Run the application 
shinyApp(ui = ui, server = server)
