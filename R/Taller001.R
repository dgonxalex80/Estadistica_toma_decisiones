## TALLER - 001 - INICIACION EN R / RSTUDIO


#  0. ACTIVACIÓN DE PAQUETES  --------------------------------------------------

library(readxl)
library(tidyverse)
library(RSocrata)
  
# 1. IMPORATAR DATOS --------------------------------------------------------------
  
# A. Importar datos de manera automatica  
    
# install.packages("RSocrata", dependencies = TRUE) # instalación de paquete RSocrata
library(RSocrata) # llamado de libreria
token <- "zxMsD6eXc0zlEMryRGW87Hwrz"  # token
Colombia <- read.socrata("https://www.datos.gov.co/resource/gt2j-8ykr.json", app_token = token) # lectura 
 
write_csv(Colombia, "data/Colombia.csv")
saveRDS(Colombia, file = "data/Colombia.RDS")


# B. Importar datos con la funcion data()
data(iris)  # data set iris
data(cars)  # data set cars

  
# C. Importar datos desde una carpeta local
file.choose()
Colombia<- readRDS("data/Colombia.RDS")


# Exploración de la estructura de la data

str(iris)
str(Colombia)


# indicadores de la data
summary(iris)
summary(cars)
summary(Colombia23)


# Visualización de los datos
View(Colombia)  
View(iris)

head(iris) # primeros registros
tail(iris) # ultimos registros
       

# Generación de tablas
table(Colombia$ubicacion)

# 2. AJUSTE DE LA BASE DE DATOS ------------------------------------------------


# Ver los paquetes incluidos en tidyverse
# tidyverse_packages()
# 
#  ggplot2 - construcción de gráficos     
#  purrr   - herramientas para programación funcional
#  tibble  - manejo de data frames    
#  dplyr   - manejo de datos
#  tidyr    - manejo de datos     
#  stringr  - manejo de cadenas
#  readr    - lectura de datos     
#  forcats  -  pronósticos de series de tiempo y modelos lineales

Colombia$ubicacion=str_to_lower(Colombia$ubicacion)
table(Colombia$ubicacion)

Colombia$ubicacion[Colombia$ubicacion=="n/a"]=NA
table(Colombia$ubicacion)

class(Colombia$edad)
Colombia$edad=as.integer(Colombia$edad)
class(Colombia$edad)

Colombia$sexo=str_to_lower(Colombia$sexo)
Colombia$estado=str_to_lower(Colombia$estado)
Colombia$estado[Colombia$estado=="n/a"]=NA
Colombia$recuperado=str_to_lower(Colombia$recuperado)
Colombia$recuperado[Colombia$recuperado=="n/a"]=NA

       
table(Colombia$sexo)
table(Colombia$estado)
table(Colombia$recuperado)


Colombia$fecha_reporte_web=lubridate::dmy(Colombia$fecha_reporte_web)
Colombia$fecha_de_notificaci_n=lubridate::dmy(Colombia$fecha_de_notificaci_n)
Colombia$fecha_inicio_sintomas=lubridate::dmy(Colombia$fecha_inicio_sintomas)
Colombia$fecha_diagnostico=lubridate::dmy(Colombia$fecha_diagnostico)
Colombia$fecha_recuperado=lubridate::dmy(Colombia$fecha_recuperado)
Colombia$fecha_muerte=lubridate::dmy(Colombia$fecha_muerte)

## YA ESTA LISTA LA BASE !!!! 

#  3. GUARDAR LA DATA ----------------------------------------------------------
   
write_csv(Colombia, "data/Colombia.csv")
saveRDS(Colombia, file = "data/Colombia.RDS")

## LISITO !!!!
## TENEMOS LA BASE DEL COVID.19 ACTUALIZADA Y ARREGLADA

         
# datos de CALI 

Cali=Colombia[Colombia$ciudad_municipio_nom=="CALI",]
Valle=subset(Colombia, departamento=="76")
       
 