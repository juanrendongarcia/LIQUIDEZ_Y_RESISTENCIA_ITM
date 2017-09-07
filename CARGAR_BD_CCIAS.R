# Esta función carga la base de datos de compañias de financiameinto comercial de 2001 a 2014 y de 2015 a 2016
# La salida es una lisa con 2 elementos, el primer elemento es la BD de 2001 a 2014 (colgaap)
#El segundo elemento  es de 2015 a 2016
CARGAR_BD_CCIAS=function(){

setwd("~/LIQUIDEZ_Y_RESISTENCIA_ITM")

library(readxl)

 # Datos del 2015 al 2016
lista_01_14 <- list()

for (x in 1:168) {
  lista_01_14[[x]] <- read_excel("BASE DE DATOS CIAS DE FINANCIAMIENTO CCIAL 01 al 14.xls", sheet=x, col_names = FALSE, skip=6)
  
}

# Datos del 2015 a 2016 
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

## cambio