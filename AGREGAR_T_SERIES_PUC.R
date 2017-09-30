AGREGAR_T_SERIES_PUC=function(VECTOR_CUENTAS,
                              LISTA_HOJAS,
                              FECHA_INICIAL_SERIE,
                              FECHA_FINAL_SERIE){
  
  SERIES_DE_TIEMPO_PUC=matrix(0,length(LISTA_HOJAS),length(VECTOR_CUENTAS))  
  
  colnames(SERIES_DE_TIEMPO_PUC)=(VECTOR_CUENTAS)
  
  
  for(j in 1:length(VECTOR_CUENTAS)){
    for (i in 1:length(LISTA_HOJAS)){
      PUC_MES=(as.data.frame(LISTA_HOJAS[i])) #Se extrae cada objeto de la lista como un data frame. 
      
      PUC_MES=PUC_MES[,-length(PUC_MES)]
      
      PUC_MES_TOTAL=rowSums(PUC_MES[,2:length(PUC_MES)])
      
      #View(as.data.frame( PUC_MES_TOTAL))
      
      SERIES_DE_TIEMPO_PUC[i,VECTOR_CUENTAS[j]]=PUC_MES_TOTAL[VECTOR_CUENTAS[j]]
      
    }
  }
  
  rownames(SERIES_DE_TIEMPO_PUC)=as.character(seq(as.Date(FECHA_INICIAL_SERIE), as.Date(FECHA_FINAL_SERIE), "month"))
  
  return(SERIES_DE_TIEMPO_PUC)
}
