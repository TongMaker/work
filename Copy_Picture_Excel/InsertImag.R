setwd("/Users/tongzhou/Desktop/Local/Trabajo")
library(openxlsx)


options(scipen = 100)
insertcol<-1


Row <- 1

dir.create("./RESULTADO")


libros<-list.files(path = "./ORIGINAL"  ,pattern = "^\\w+.+\\.xlsx$")

for(k in 1:length(libros)){
setwd("./ORIGINAL")
wb<-loadWorkbook(libros[k])
tab<-read.xlsx(wb,1,startRow = Row, skipEmptyRows = FALSE, colNames = FALSE)
posi<-which(!is.na(tab$X2))+Row-1

codigotabla<-paste0(tab$X2)
imagenes<-list.files("../IMAGENES")
imagenes_nombre<-trimws(gsub(".jpg|JPG|png|PNG","",imagenes))


setwd("../IMAGENES")
setRowHeights(wb, 1, rows = posi, heights = 100)
setColWidths(wb,1, cols = 1, widths = 18)
for(i in posi){
  if(codigotabla[i-Row+1] %in% imagenes_nombre){
    
    imagenposi<-which(codigotabla[i-Row+1]==imagenes_nombre)
    
    insertImage(wb,1,imagenes[imagenposi],
                width = 1.5,
                height = 1.325,
                startRow = i,
                startCol = insertcol,
                units = "in",
                dpi = 300)
  }
}
setwd("../RESULTADO")
saveWorkbook(wb,paste0("ConFoto_",libros[k]), overwrite = T)
print(getwd())
setwd("..")
}

