library(readr)
library(stringr)
library(openxlsx)
library(glue)
options(scipen = 100)
#quantile_(dat=dataZ$EdadConductor1, weight=list(dataZ$c_ROB_descr, dataZ$s_ROB),0,0,vec_manual=c(0,18,23,25,27,30,33,35,40,45,48,50,52,55,58,60,65,70,75,100))
#quantile_(dataZ$EdadConductor1, list(dataZ$exp_sup_ROB),0,0,vec_manual=c(0,18,23,25,27,30,33,35,40,45,48,50,52,55,58,60,65,70,75,100))
#quantile_(dataZ$CapitalFallecimiento, list(dataZ$exp_sup_RC),0,0,vec_manual=c(-1,0,6000,12000,18000,24000,30000,60000,100000))
quantile_<-function(dat, weight, nq, rounds, vec_manual=NULL){
  
  #dat: main database column
  #weight is a list of 1 or 2 elements
  #nq: number of quantile interval
  #round: position of rounds ie: round=1: 1234->1230 round=2: 1234->1200 so on
  #vec_manual: custom interval set by user
  
  if(is.null(vec_manual)){
    tramo_quant<-round(quantile(sort(dat),seq(0,1,1/nq))/10^rounds)*10^rounds
    tramo_quant[length(tramo_quant)]<-ceiling(max(sort(dat))/10^rounds)*10^rounds
    tramo_quant<-tramo_quant[!duplicated(tramo_quant)]
  }
  else{
    tramo_quant<-vec_manual
  }
  interv<-c()
  interv_n<-c()
  num<-c()
  weig<-c()
  for(i in 2:(length(tramo_quant))){
    num<-c(num, sum(dat>tramo_quant[i-1] & dat<=tramo_quant[i], na.rm=T))
    
    if(length(weight)==2){
      weig1<-sum(weight[[1]][dat>tramo_quant[i-1] & dat<=tramo_quant[i]], na.rm=T)
      weig2<-sum(weight[[2]][dat>tramo_quant[i-1] & dat<=tramo_quant[i]], na.rm=T)
      #NAN due to 0/0
      weig<-c(weig, ifelse(weig2==0,0,weig1/weig2))
    }
    else{
      weig1<-sum(weight[[1]][dat>tramo_quant[i-1] & dat<=tramo_quant[i]], na.rm=T)
      weig<-c(weig, weig1)
    }
    interv<-c(interv,paste0(ifelse(i-1<10,paste0(0,i-1),i-1),". (",paste(tramo_quant[c(i-1,i)],collapse = ", "),"]"))
    interv_n<-c(interv_n, paste(tramo_quant[c(i-1,i)],collapse = " - "))
  }
  list(num,weig,interv,interv_n)
}


#function to set same length to each string in a vector
samelong<-function(x){
  #x: a vector of string  
  space<-max(nchar(x))-nchar(x)
  for(i in 1:length(x)){x[i]<-paste0(x[i], paste(rep(" ",space[i]),collapse = "") ) }
  x
}



cat("Processing...")
#input<-read.xlsx("F:\\MODELIZACION ADAS\\01. BBDD\\Analisis tramos\\03. Variable Numerica\\Generador Formatos\\Plantilla_tramos_DANPConCv2.xlsx")
#setwd("F:\\MODELIZACION ADAS\\01. BBDD\\Analisis tramos\\03. Variable Numerica\\Generador Formatos")

#Read excel template (interval variables & BBDD path)

init<-read.xlsx(list.files(pattern = "^\\w+.+\\.xlsx$")[1],sep.names = " ", skipEmptyCols = FALSE)

input_init<-init[1:7][1:length(na.omit(init[[1]])),]
sourcedir<-names(init)[9]
pb <- txtProgressBar(max = nrow(input_init), style = 3)
dataT<-read_delim(sourcedir,show_col_types = FALSE,locale = locale(encoding = "windows-1252"))
dataZ<-dataT

#Unique ID to subset the table with same characteristic
input_init$id<-paste(input_init[[1]],input_init[[4]], input_init[[5]], input_init[[6]])

input_list<-lapply(unique(input_init$id), function(x) input_init[input_init$id==x,][-8])
#input<-input_list[[1]]

#Loop: create the sas format with weight's distribution as comment for each small group
store<-c()
for(input in input_list){
  #print(input)
  st<-list()
  #Loop: Inside each small group run the function "quantile_" to calculate weight's distribution 
  for(k in 1:nrow(input)){
    
    if(is.na(input[k,6])){manual<-NULL}
    else{manual<-as.numeric(unlist(stringr::str_extract_all(input[k,6],"\\-*\\d+")))}
    
    if(is.na(input[k,3])){
      qq<-quantile_(dataZ[[input[k,1]]],list(dataZ[[input[k,2]]]),input[k,4],input[k,5],vec_manual=manual)
    }
    else{
      qq<-quantile_(dataZ[[input[k,1]]],list(dataZ[[input[k,2]]],dataZ[[input[k,3]]]),input[k,4],input[k,5],vec_manual=manual)
    }
    
    
    st[[k]]<-qq
    #set the weight label
    st[[k]][[5]]<-paste(na.omit(c(input[k,2],input[k,3])), collapse = "/")
    #set plot bar label
   
    st[[k]][[6]]<-sapply(round(round(qq[[2]]/(max(qq[[2]]))*20)),\(x)paste(rep("|",x),collapse = ""))
    setTxtProgressBar(pb, pb$getVal()+1)
  }
  #store of calculation of weight
  
  calc<-""
  for(i in 1:length(st)){
    calc<-paste(calc, samelong(st[[i]][[5]]),":", 
                samelong(ifelse(st[[i]][[2]]>3,round(st[[i]][[2]],2),round(st[[i]][[2]],4))),
                samelong(st[[i]][[6]]))
  }
  calc<-paste0(calc," Obs :",samelong(st[[i]][[1]]))
  #convert the last number of each interval as "high"
  lasttramo<-length(st[[1]][[4]])
  st[[1]][[4]][lasttramo]<-str_replace(st[[1]][[4]][lasttramo],"\\d+$","high")
  st[[1]][[3]][lasttramo]<-str_replace(st[[1]][[3]][lasttramo],"\\d+]$","high]")
  
  st[[1]][[4]][1]<-str_replace(st[[1]][[4]][1],"^\\-*\\d+","low")
  st[[1]][[3]][1]<-str_replace(st[[1]][[3]][1],"^\\d+\\.\\s+\\(\\-*\\d+","01. (low")
  
  form<-paste0("VALUE ",
               ifelse(stringr::str_detect(input[1,1],"\\d$"), paste0(input[1,1],"_"),input[1,1]),#if the name end in a number, add "_" at the end
               "\n\n",paste(glue("{samelong(st[[1]][[4]])} = '{samelong(st[[1]][[3]])}'   /*{calc} */"), collapse = "\n"))
  #Missingv<-ifelse(all(is.na(input$Missing_asign)),paste0("'Missing'"),paste0("'",st[[1]][[3]][sort(input$Missing_asign)[1]],"'"))
  
  Missingv<-ifelse(all(is.na(input$Missing_asign)),
         paste0("'Missing'"),
         ifelse(any(str_detect(input$Missing_asign, "[:alpha:]|[:punct:]")),
                paste0("'",sort(input$Missing_asign)[1],"'"),
                paste0("'",st[[1]][[3]][as.numeric(sort(input$Missing_asign)[1])],"'")))
  

  
  form<-paste0(form,"\n",". = ",Missingv,"\n;")
  
  
  store<-c(store,form)
}


filename<-paste0("format",str_remove_all(Sys.time(),"-|\\s|\\:"),".sas")
write_file( paste0("PROC FORMAT;\n\n\n",paste(store, collapse = "\n\n\n"),"\n\n\nRUN;"), filename)
browseURL(filename)
