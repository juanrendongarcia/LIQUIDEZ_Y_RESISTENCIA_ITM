CARGAR_BD_CCIAS=function(BD_01_14,BD_15_16){

setwd("~/LIQUIDEZ_Y_RESISTENCIA_ITM")

library(readxl)

lista_01_14 <- list()

for (x in 1:168) {
  lista_01_14[[x]] <- read_excel("BASE DE DATOS CIAS DE FINANCIAMIENTO CCIAL 01 al 14.xls", sheet=x, col_names = FALSE, skip=6)
  
}

setwd("~/LIQUIDEZ_Y_RESISTENCIA_ITM/cia de financiamiento 3")

temp = list.files(pattern="*.xls")

lista_15_16 <- list()

for (x in 1:24) {
  lista_15_16[[x]] <- read_excel(temp[x], sheet=1, col_names = FALSE)
}

Datos_CIAS=list(Datos_2001_2014=lista_01_14,Datos_2015_2016=lista_15_16)
return(Datos_CIAS)
}

Datos_CCIAS=CARGAR_BD_CCIAS()
