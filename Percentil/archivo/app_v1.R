library(shiny)
library(tidyr)
library(data.table)
library(DT)
colu<-function(fichero){
  colnames(fichero)
}



quant<-function(fichero, colu_selec){
  #fichero<-data.table::fread(exc1, sep = ";", dec = "," )
  colu<-names(fichero)
  cat("\n\nSeleccionar una de las siguientes columnas para analizar: \n\n\n")
  cat(paste0("\n",colu))
  cat("\n\n-> ")
  ###colu_selec <- readLines(con = "stdin", n = 1, encoding = "UTF-8")
  #colu_selec<-"IMP_COSTE_T"
  colu_selec<-colu[grep(colu_selec,colu)]
  
  cat("Procesando...")
  
  fichero_sorted<-fichero[order(fichero[[colu_selec]]),]
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
  t2<-unique(fichero_sorted[positions_percentil,])
  ll<-list(t1,t2)
  t1[c(colu_selec,paste0(colu_selec,"_porc"),"Percentil")]
}







ui <- fluidPage(
  
  #Add a title
  titlePanel("Percentil"),
  
  #This creates a layout with a left sidebar and main section
  sidebarLayout(
    
    #beginning of sidebar section
    #usually includes inputs
    sidebarPanel(
      
    uiOutput("selecfic"),
    uiOutput("seleccol")
    
    
    ),
    
    #beginning of main section
    mainPanel(DT::dataTableOutput("table"))
  )
  
  #Close the UI definition
)
server <- function(input, output) {
  options(shiny.maxRequestSize=1110*1024^2)
  
 
    
    output$selecfic <- renderUI({
      fileInput(
        inputId="fic",
        label="Fichero para importar",
        multiple = FALSE,
        accept = ".csv",
        width = NULL,
        buttonLabel = "Cargar...",
        placeholder = "Un fichero.",
       
      )
    })
    
    
    datab<-reactive({
    f1<-input$fic
    if(is.null(f1$datapath)){return()}
    as.data.frame(data.table::fread(f1$datapath, sep = ";", dec = "," ))
      
  })
  
  colu<-reactive({
    if(is.null(datab())){return()}
    colnames(datab())

  })
  

  

  
  output$seleccol <- renderUI({
    selectInput("variabl", label="nombre de columna", choices = colu())
  })
  
  dataf<-reactive({
    if(is.null(datab())|is.null(input$variabl)){return()}
    quant(datab(),input$variabl)
    
  })
  
  coluf<-reactive({
    if(is.null(dataf())){return()}
    colnames(dataf())
    
  })
  
  output$table <- DT::renderDataTable({

    dataf()%>% 
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
                    "}")
                )) %>% formatPercentage(c(coluf()[2], coluf()[3]), 2)
    
    
    
    
  })
}
# Run the application 
shinyApp(ui = ui, server = server)
