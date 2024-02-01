library(shiny)
library(shinyWidgets)
library(tidyr)
library(openxlsx)
library(data.table)
library(DT)
library(readxl)
library(ggplot2)
library(shinydashboard)




quant<-function(fichero, colu_selec, zero=TRUE){
  #fichero<-data.table::fread(exc1, sep = ";", dec = "," )
  colu<-names(fichero)
  cat("\n\nSeleccionar una de las siguientes columnas para analizar: \n\n\n")
  cat(paste0("\n",colu))
  cat("\n\n-> ")
  ###colu_selec <- readLines(con = "stdin", n = 1, encoding = "UTF-8")
  #colu_selec<-"IMP_COSTE_T"
  colu_selec<-colu[grep(colu_selec,colu)]
  
  cat("Procesando...")
  fichero[is.na(fichero)]<-0
  if(zero==TRUE){fichero<-fichero[fichero[[colu_selec]]!=0,]}
  
  fichero_sorted<-fichero[order(fichero[[colu_selec]]),]
  fichero_sorted["Numero_tramo"]<-1:nrow(fichero_sorted)
  fichero_sorted[paste0(colu_selec,"_acum")]<-cumsum(fichero_sorted[[colu_selec]])
  fichero_sorted[paste0(colu_selec,"_porc")]<-fichero_sorted[[paste0(colu_selec,"_acum")]]/sum(fichero_sorted[[colu_selec]])
  fichero_sorted["Percentil"]<-(1:nrow(fichero_sorted))/nrow(fichero_sorted)
  
  porcentajes<-c(0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45, 0.50, 0.55,
                 0.60, 0.65, 0.70, 0.75, 0.80, 0.85, 0.90, 0.95, 0.955,0.96, 0.965,
                 0.97,0.975,0.98,0.985,0.99,0.995,0.999,1)
  
  positions_porc<-c()
  for(i in 1:length(porcentajes)){
    positions_porc[i]<-which.min(abs(fichero_sorted[[paste0(colu_selec,"_porc")]]-porcentajes[i]))
  }
  
  positions_percentil<-c()
  for(i in 1:length(porcentajes)){
    positions_percentil[i]<-which.min(abs(fichero_sorted$Percentil-porcentajes[i]))
  }
  
  t1<-unique(fichero_sorted[positions_porc,])
  t1["Numero_tramo"]<-t1[["Numero_tramo"]]-c(0,t1[["Numero_tramo"]][1:(nrow(t1)-1)])
  t2<-unique(fichero_sorted[positions_percentil,])
  t2["Numero_tramo"]<-t2[["Numero_tramo"]]-c(0,t2[["Numero_tramo"]][1:(nrow(t2)-1)])
  
  
  ll<-list(t1,t2)
  list(
    t1[c(colu_selec,"Numero_tramo",paste0(colu_selec,"_porc"),"Percentil")],
    t2[c(colu_selec,"Numero_tramo","Percentil",paste0(colu_selec,"_porc"))]
  )
}



ui <- dashboardPage(
  dashboardHeader(title = "Percentil", titleWidth = 150),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Introducir una tabla", tabName = "main", icon = icon("percent"),
               
        
                   uiOutput("selecfic"),
                   uiOutput("seleccol"),
                   uiOutput("zerosele")
                 )
               )
    
  ),
  dashboardBody(
    tags$head(
      tags$style(HTML(".skin-blue .main-header .logo { background-color: orange; } .skin-blue .main-header .navbar { background-color: green; }"))
    ),
       
              fluidPage(
                
               
                  uiOutput("mainP")
                

              )
              
      
    
  )
)

server <- function(input, output) {
  options(shiny.maxRequestSize=1110*1024^2)
  #options(show.error.messages = FALSE)
  
  output$selecfic <- renderUI({
    fileInput(
      inputId="fic",
      label="Fichero para importar",
      multiple = FALSE,
      width = NULL,
      buttonLabel = "Cargar...",
      placeholder = "Un fichero."
    )
  })
  
  datab<-reactive({
    f1<-input$fic
    if(is.null(f1$datapath)){return()}
    if(grepl("\\.xlsx$",f1$datapath)){read.xlsx(f1$datapath)}
    else if(grepl("\\.csv$",f1$datapath)){as.data.frame(data.table::fread(f1$datapath, sep = ";", dec = "," ))}
  })
  
  colu<-reactive({
    if(is.null(datab())){return()}
    colnames(datab())
  })
  
  output$seleccol <- renderUI({
    selectInput("variabl", label="Nombre de columna",selected = NULL, choices = c(colu()))
  })
  
  output$zerosele <- renderUI({
    materialSwitch(inputId="zero", value = FALSE, label = h6("Excluir ceros"))
  })
  
  dataf<-reactive({
    if(is.null(datab())|is.null(input$variabl)){return()}
    quant(datab(),input$variabl,input$zero)
  })
  
  coluf<-reactive({
    req(input$fic)
    if(is.null(dataf())){return()}
    names(dataf()[[1]])
  })
  
  output$mainP <- renderUI({
    req(input$fic)
    DT::dataTableOutput("table")
  })
  
  
  output$table <- DT::renderDataTable({
    req(input$fic)
    dataf()[[1]]%>%
      datatable(extensions = c('Buttons'),
                rownames = FALSE,
                options = list(
                  
                  pageLength = 300,
                  scrollX=300,
                  dom = 'T<"clear">lBfrtip',
                  deferRender = TRUE,
                  scrollY = 700,
                  buttons =
                    list(list(
                      extend = "collection"
                      , buttons = c("pdf", "excel")
                      , text = "Export")),
                  initComplete = JS(
                    "function(settings, json) {",
                    "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                    "}")
                )) %>% formatPercentage(c(coluf()[3], coluf()[4]), 2) %>%
      formatCurrency(coluf()[1], '')
    
    
    
    
    
  })
  
  #   output$UIplot <- renderUI({
  #     req(input$fic)
  #     plotOutput("distPlot")
  #   })
  #   
  #   
  #   output$distPlot <- renderPlot({
  # 
  #     #ggplot(datab(),aes(x=input$variabl))+geom_histogram(stat="count")
  #     hist(as.numeric(datab()$input$variabl), breaks = bins, col = 'darkgray', border = 'white')
  #   })
}


# Run the application 
shinyApp(ui = ui, server = server)

