con<-sftp::sftp_connect(server = "sftp://TZHZHO01@LPRD-SASCOMP01",
                   folder = "/CONTROL_TECNICO", 
                   username = "TZHZHO01", password = "W6ndfUuz7IT62w")
sftp_connect()
setwd("C:\\Users\\TZHZHO01\\Desktop\\SETTING")
sftp_upload(c("INIT.xlsx","Tarifa_RC.xlsx"), sftp_connection = con)
sftp_delete(c("INIT.xlsx","Tarifa_RC.xlsx"), sftp_connection = con)

ff<-sftp::sftp_listfiles(sftp_connection = con)

ff[1,]

sapply(ff, function(x) as.character(x))

sftp_upload()

install.packages("cli")
devtools::install_github("stenevang/sftp")
library(sftp)
sftp::sftp_upload()