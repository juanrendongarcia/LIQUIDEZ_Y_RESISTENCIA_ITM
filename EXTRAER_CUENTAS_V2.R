
setwd("~/LIQUIDEZ_Y_RESISTENCIA_ITM/cia de financiamiento 3")

library(readxl)
temp = list.files(pattern="*.xls")

lista_A <- list()

for (x in 1:24) {
  lista_A[[x]] <- read_excel(temp[x], sheet=1, col_names = FALSE)
}





VECTOR_CUENTAS=c("100000.000000","110000.000000","110500.000000")

EXTRAER_CUENTAS_PUC=function(VECTOR_CUENTAS){
  
  
  
  i=1
  D=as.data.frame(lista_A[i])
  Q=which(D[,2] == "ACTIVO")-1 #obtener el indice de la fila donde esta ACTIVO
  D=D[Q:length(D[,1]),]
  colnames(D)<-D[1,]
  D=D[-1,]
  colnames(D)[1]<-"NUMERO_PUC"
  colnames(D)[2]<-"CUENTA"
  
  COLTE1<-subset(D, NUMERO_PUC %in% VECTOR_CUENTAS, select = c(NUMERO_PUC,CUENTA, grep("COLTEFINANCIERA",colnames(D))))
  
  
  COLTE1[,grep("COLTEFINANCIERA",colnames(COLTE1))]<-as.numeric(COLTE1[,grep("COLTEFINANCIERA",colnames(COLTE1))])
  
  
  for (i in 2:24){
    D=as.data.frame(lista_A[i])
    Q=which(D[,2] == "ACTIVO")-1 #obtener el indice de la fila donde esta ACTIVO
    D=D[Q:length(D[,1]),]
    colnames(D)<-D[1,]
    D=D[-1,]
    colnames(D)[1]<-"NUMERO_PUC"
    colnames(D)[2]<-"CUENTA"
    
    COLT<-subset(D, NUMERO_PUC %in% VECTOR_CUENTAS, select = c(grep("COLTEFINANCIERA",colnames(D))))
    
    
    COLTE1=cbind(COLTE1,COLT)
    
  }
  
  row.names(COLTE1)=COLTE1[,1]
  COLTE1=COLTE1[,-1]
  
  colnames(COLTE1)[2:25]=as.character(seq(as.Date("2015/1/1"), as.Date("2016/12/1"), "month"))
  
  return(COLTE1)
  
}




