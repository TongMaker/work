library(tidyverse)
library(openxlsx)
options(scipen = 100)
setwd("F:\\MODELIZACION ADAS")
#setwd("F:\\MODELIZACION ADAS\\02. Prima Pura\\01. GeneradorUnivariable\\Provisional")
setwd("F:\\MODELIZACION ADAS\\02. Prima Pura\\01. GeneradorUnivariable\\Generacion total\\bbdd_store")
Plot_store<-"F:\\MODELIZACION ADAS\\02. Prima Pura\\01. GeneradorUnivariable\\Generacion total\\Plot_store\\"
Excel_output<-"F:\\MODELIZACION ADAS\\02. Prima Pura\\01. GeneradorUnivariable\\Generacion total\\Excel_output\\"


BDs<-list.files(pattern = "BD_Analisis_\\w+\\.csv$")
Excel_names<-paste0("Univariable_",str_extract(BDs, "(?<=\\_)[:alpha:]+(?=\\.)"),"_v2.xlsx")

#Excel_name<-"Univariable_ROB.xlsx"
#BD<-read_delim("BD_analisis_ROB.csv",show_col_types = FALSE, locale = locale(encoding = "windows-1252"))

for(i in 1:length(BDs)){
  Excel_name<-Excel_names[i]
  BD<-read_delim(BDs[i],show_col_types = FALSE, locale = locale(encoding = "windows-1252"))
  #vars<-str_subset(names(BD),"_f$")
  vars_1<-"Anio,AntiguedadVeh_f,CodTipoVeh_f,AntiguedadCarnet1_f,AntiguedadCarnet2_f,CapitalFallecimiento_f,CilindradaVeh_f,
        CZScore_f,EdadConductor1,EdadConductor1_f,EdadConductor2_f,NumeroADAS_f,NumHabitantes_f,
        PrecioFrancoFabricaVeh_f,RelPesoPotenciaVeh_f,TaraVeh_f,ValAccSonido_f,ValorTVeh_f,VelocidadVeh_f,
        ViaDelanteraVeh_f,AnchoNeumaticoVeh_f,Aceleracion0_100Veh_f,LogitudMVeh_f,DiasGrabacionEfecto_f,OrigenPol_f,
        TpoPuntoVenta_f,FrecuenciaPago_f,FormaPago_f,ClaseVeh_f,SegmentoVeh_f,TipoCombustibleVeh_f,PaisConductorAgr_f,
        PaisConductor_f,TipoCliente_f,ProvinciaRiesgo_f,ZonaRural_f,PotenciaVeh_f,Modalidad_f,PorBonusRc,PorBonusDa,
        UsoVeh_f,SegmentoVeh,PuertasVeh,PlazasVeh,NumeroADAS,
        Canal_f,AntiguedadPoliza_f,ImporteFranquicia,GrupoPotenciaVeh_f,TipoDocumento,TCP_f,EdadCond1xAntCarnet1,IdConductor2,EdadCond2xAntCarnet2,
        EdadCond1xEdadCond2,NotaGlobal,IndADAS,Capital,
        
        AEBV_f,FSD_f,ISA_f,AEB_f,LKA_f,ACC_f,PVC_f,BSW_f,AUP_f,LDW_f,EBA_f,FCW_f,DD_f,NV_f,RCTA_f,RVC_f,TSR_f,CC_f,HHA_f,AP_f,SL_f,
        AHB_f,HDC_f,HUD_f,ALA_f,CL_f,TPMS_f,RTA_f"
  vars<- str_extract_all(vars_1,"\\w+") %>% unlist()
  
  sumaria<-list()
  for(i in 1:length(vars)){
    sumaria[[i]]<-BD %>% 
      select(vars[i],Expuestos,Siniestros,Coste) %>% 
      group_by(.[1]) %>% 
      summarise(Expuestos=sum(Expuestos, na.rm = T),
                Siniestros=sum(Siniestros, na.rm = T),
                Coste = sum(Coste, na.rm=T),
                Frecuencia = ifelse(Expuestos==0,0,Siniestros/Expuestos),
                CosteMedio = ifelse(Siniestros==0,0,Coste/Siniestros),
                PrimaPura = ifelse(Expuestos==0,0,Coste/Expuestos)
      )
    
  }
  
  #i=1
  #PLOTEXPORT
  
  
  for(i in 1:length(sumaria)){
    dd<-sumaria[[i]]
    dd[[1]]<-str_sub(dd[[1]],1,21)
    
    label1<-c("Expuestos","Frecuencia")
    scale1<-max(dd[[label1[1]]])
    scale2<-max(dd[[label1[2]]])
    scale<-scale1/scale2
    
    gg<-ggplot(dd, aes_string(x=names(sumaria[[i]])[1])) + 
      geom_bar(aes_string(y=label1[1]),fill="#d97307",stat = "identity")+
      geom_line(aes_string(y=paste0(label1[2],"*scale"), group=1),size=1, color="#016136", alpha=1)+
      geom_point(aes_string(y=paste0(label1[2],"*scale"), group=1),size=1.5, color="#016136", alpha=1)+
      scale_y_continuous(label1[1], sec.axis = sec_axis(~./(scale), name = label1[2]))+
      #theme_minimal()+
      theme_bw()+
      ggtitle(paste(label1, collapse = "_")) +
      theme(axis.text.x = element_text(angle = 60, vjust = 1, hjust=1), 
            plot.title = element_text(size=20,hjust = 0.5,vjust = 1),
            axis.text=element_text(size=12,face="bold"),
            axis.title=element_text(size=14))
    
    
    plotname<-paste0(Plot_store,names(sumaria[[i]])[1],"_",paste(label1, collapse = "_"),".png")
    ggsave(plotname, plot=gg, width = 10, height = 5, dpi = 300, limitsize = F)
    
    ################################################
    
    label2<-c("Siniestros","CosteMedio")
    scale1<-max(dd[[label2[1]]])
    scale2<-max(dd[[label2[2]]])
    scale<-scale1/scale2
    
    gg<-ggplot(dd, aes_string(x=names(sumaria[[i]])[1])) + 
      geom_bar(aes_string(y=label2[1]),fill="#d97307",stat = "identity")+
      geom_line(aes_string(y=paste0(label2[2],"*scale"), group=1),size=1, color="#016136", alpha=1)+
      geom_point(aes_string(y=paste0(label2[2],"*scale"), group=1),size=1.5, color="#016136", alpha=1)+
      scale_y_continuous(label2[1], sec.axis = sec_axis(~./(scale), name = label2[2]))+
      #theme_minimal()+
      theme_bw()+
      ggtitle(paste(label2, collapse = "_")) +
      theme(axis.text.x = element_text(angle = 60, vjust = 1, hjust=1), 
            plot.title = element_text(size=20,hjust = 0.5,vjust = 1),
            axis.text=element_text(size=12,face="bold"),
            axis.title=element_text(size=14))
    
    
    plotname<-paste0(Plot_store,names(sumaria[[i]])[1],"_",paste(label2, collapse = "_"),".png")
    ggsave(plotname, plot=gg, width = 10, height = 5, dpi = 300, limitsize = F)
    
    ################################################
    
    label3<-c("Expuestos","PrimaPura")
    scale1<-max(dd[[label3[1]]])
    scale2<-max(dd[[label3[2]]])
    scale<-scale1/scale2
    
    gg<-ggplot(dd, aes_string(x=names(sumaria[[i]])[1])) + 
      geom_bar(aes_string(y=label3[1]),fill="#d97307",stat = "identity")+
      geom_line(aes_string(y=paste0(label3[2],"*scale"), group=1),size=1, color="#016136", alpha=1)+
      geom_point(aes_string(y=paste0(label3[2],"*scale"), group=1),size=1.5, color="#016136", alpha=1)+
      scale_y_continuous(label3[1], sec.axis = sec_axis(~./(scale), name = label3[2]))+
      #theme_minimal()+
      theme_bw()+
      ggtitle(paste(label3, collapse = "_")) +
      theme(axis.text.x = element_text(angle = 60, vjust = 1, hjust=1), 
            plot.title = element_text(size=20,hjust = 0.5,vjust = 1),
            axis.text=element_text(size=12,face="bold"),
            axis.title=element_text(size=14))
    
    
    plotname<-paste0(Plot_store,names(sumaria[[i]])[1],"_",paste(label3, collapse = "_"),".png")
    ggsave(plotname, plot=gg, width = 10, height = 5, dpi = 300, limitsize = F)
  }
  #dev.off()
  
  
  wb<-createWorkbook()
  
  walk(sumaria,
       function(x){
         addWorksheet(wb, names(x)[1])
         writeData(wb, names(x)[1],x)
         showGridLines(wb, names(x)[1], showGridLines = FALSE)
         setColWidths(wb, names(x)[1], cols = 1:ncol(x), widths="20") 
         
         numf<-createStyle(numFmt = "#,##0.00")
         color1<-createStyle(fgFill = "#4c4f54", textDecoration="bold",fontColour = "white",halign="right")
         addStyle(wb, names(x)[1], style = numf, rows = 2:(nrow(x)+1), cols = 2:ncol(x), gridExpand = TRUE)
         addStyle(wb, names(x)[1], style = color1, rows = 1, cols = 1:ncol(x), gridExpand = TRUE)
         insertImage(wb,names(x)[1],paste0(Plot_store,names(x)[1],"_",paste(label1, collapse = "_"),".png"), startRow = 1, startCol = 9)
         insertImage(wb,names(x)[1],paste0(Plot_store,names(x)[1],"_",paste(label2, collapse = "_"),".png"), startRow = 17, startCol = 9)
         insertImage(wb,names(x)[1],paste0(Plot_store,names(x)[1],"_",paste(label3, collapse = "_"),".png"), startRow = 32, startCol = 9)
       })
  
  saveWorkbook(wb,paste0(Excel_output,Excel_name), overwrite = T)
  
}
#browseURL(paste0(Excel_output,Excel_name))
