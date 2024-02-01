library(purrr)
fun<-function(){

    options(width=120)

  n=0
  while(TRUE){
    #cat("Ruta Actual?: \n s \n n \n")
    #rutasino <- readLines(con = "stdin", n = 1, encoding = "UTF-8")
    #if(stringr::str_to_lower(rutasino) == "n"){
      cat("Ruta: \n")
      ruta <- readLines(con = "stdin", n = 1, encoding = "UTF-8")
      setwd(ruta)
    #}
    names<-list.files()
    print(names)
    
    cat("\n\n")
    cat(
"
Cambiar todos los nombres de ficheros de esta ruta:  1     
Cambiar el contenido de los ficheros:  2
Filtrar la secuencia de texto por la palabra clave: 3\n
")
    opciones <-  readLines(con = "stdin", n = 1, encoding = "UTF-8")
    if(opciones == 1){
      
      
      cat("\n Patron de Nombre original: \n")
      
      old <- readLines(con = "stdin", n = 1, encoding = "UTF-8")
      
      print(stringr::str_subset(names,old[[1]]))
      
      cat("\n")
      
      cat("Patron de Nombre a cambiar: \n")
      
      new <- readLines(con = "stdin", n = 1, encoding = "UTF-8")
      
      new_names<-gsub(old[[1]][1],new[[1]][1],names)
      
      if(any(duplicated(new_names))){
        cat("Error: Exsiten nombres duplicados \n\n")
      }
      else{
      
      file.rename(names,new_names)
      
      cat("Correcto? \n s \n n \n")
      
      correcto <- readLines(con = "stdin", n = 1, encoding = "UTF-8")
      
      if(stringr::str_to_lower(correcto) == "n"){
        
        file.rename(new_names,names)
      }
      }
      
    }
    
    if(opciones == 2){
      cat("Introducir la palabra clave de los nombres de fichero:  \n\n")
      nombref <-  readLines(con = "stdin", n = 1, encoding = "UTF-8")[[1]]
      
      print(stringr::str_subset(names, nombref))
      
      fich_list<-stringr::str_subset(stringr::str_subset(names, nombref),"\\.[:alpha:]+$")
      fichs<-purrr::map(fich_list,readr::read_file)

      cat("Formato Original:  \n\n")
      print(stringr::str_sub(fichs, 1, 500))

      if(!any(stringr::str_detect(fich_list,
          "\\.SAS|\\.sas|\\.R|\\.r|\\.TXT|\\.txt|\\.LOG|\\.log|\\.SH|\\.sh|\\.PY|\\.py"))){
      fichs_frame<-purrr::map(fich_list,~readr::read_delim(.,show_col_types=FALSE,col_names = FALSE,progress = FALSE))
      cat("Formato BBDD:  \n\n")
      
      fichs_frame_print<-purrr::map(fichs_frame, ~head(as.data.frame(.)))
      names(fichs_frame_print)<-fich_list
      print(fichs_frame_print)
      }

      
      #print(nombref)
      #print(fich)
      cat("Patron original: \n")
      
      old <- readLines(con = "stdin", n = 1, encoding = "UTF-8")[[1]]
      
      
      
      cat("\n")
      cat("\n\n Patron a cambiar: \n")
      
      new <- readLines(con = "stdin", n = 1, encoding = "UTF-8")[[1]]

      
      fichs_cambio<-purrr::map(fichs,~stringr::str_replace_all(.,old,new))
      #print(stringr::str_sub(fich_cambio, 1, 1000))
     cat("Formato Original:  \n\n")
      print(stringr::str_sub(fichs_cambio, 1, 500))
      print(6)
      if(!any(stringr::str_detect(fich_list,"\\.SAS|\\.sas|\\.R|\\.r|\\.TXT|\\.txt|\\.LOG|\\.log|\\.SH|\\.sh|\\.PY|\\.py"))){
      cat("Formato BBDD:  \n\n")
      fichsnuevo_frame<-purrr::map(fichs_cambio,~readr::read_delim(.,show_col_types=FALSE,col_names = FALSE,progress = FALSE))
      fichsnuevo_frame_print<-purrr::map(fichsnuevo_frame, ~head(as.data.frame(.)))
      names(fichsnuevo_frame_print)<-fich_list
      print(fichsnuevo_frame_print)
      }
      
      n<-n+1
      dir.create(paste0(getwd(),"/Ficheros Cambiados ",nombref,"_",n))
      setwd(paste0(getwd(),"/Ficheros Cambiados ",nombref,"_",n))
      purrr::walk2(fichs_cambio,fich_list,
                   ~readr::write_file(.x,.y, append = FALSE))
      setwd("..")
    }
    
    
    
    
    

    if(opciones == 3){

      #setwd("P:/BRM_RTDM_PRD/RC_GENERAL/RC_GENERAL2570000V001/RULES SET GENERADO con R/programa_automatico_tarifa/OUTPUT_TZHZHO01_20230113_154347/All_Output_together")
      cat("Introducir la palabra clave de los nombres de fichero:  \n\n")
      #nombref="sas"
      nombref <-  readLines(con = "stdin", n = 1, encoding = "UTF-8")[[1]]

      print(stringr::str_subset(names, nombref))

      fich_list<-stringr::str_subset(stringr::str_subset(names, nombref),"\\.[:alpha:]+$")
      fichs<-purrr::map(fich_list,readr::read_file)
      purrr::walk(fichs,cat)
      
      #separador = "\\);"
      #contiene = "ActiviEpig"
      cat("Introducir un separador de la secuencia de texto\n\n")
      separador <-  readLines(con = "stdin", n = 1, encoding = "UTF-8")[[1]]

      if(grepl("[)|(|?|!|<|>|=]",separador)){separador<-paste0("\\",separador)}
      
      fichs_sep<-purrr::map(fichs, ~stringr::str_split(.,separador) %>% unlist()) %>%
        purrr::map(~paste0(.,stringr::str_remove_all(separador,"\\\\")))
      
      cat("Introducir la palabra clave para filtrar el texto\n\n")
      contiene <-  readLines(con = "stdin", n = 1, encoding = "UTF-8")[[1]]
      
      fichs_filt<-purrr::map(fichs_sep,~paste(stringr::str_subset(.,  contiene ), collapse = ""))
      
      purrr::walk(fichs_filt,cat)
      cat("\n\n")
      n<-n+1
      dir.create(paste0(getwd(),"/Ficheros Cambiados ",nombref,"_",n))
      setwd(paste0(getwd(),"/Ficheros Cambiados ",nombref,"_",n))
      purrr::walk2(fichs_filt,fich_list,
                   ~readr::write_file(.x,paste0("_",.y)))


    }
    
    
    
    cat("\n\n-------------------------Proceso Terminado----------------------------------------------------------------------\n\n")
    
    
  }
}

fun()
