library(tidyverse)

datos <- read.csv2("/Users/aosoriom/Repos/MER_AEDatos/datasets/ori.csv") 
MedioDia = tabla[tabla$Hora=="12:00",] 

head(datos)

var<-c("Municipio",
       "Temperatura",
       "Velocidad_del_Viento",
       "Direccion_del_Viento",
       "Presion",
       "Punto_de_Rocio",
       "Cobertura_total_nubosa",
       "Humedad"
)

data2 <- data %>% 
  dplyr::select(all_of(var)) %>% 
  group_by(Municipio) %>% 
  summarise(Temperatura = mean(Temperatura),
            Velocidad_del_Viento = mean(Velocidad_del_Viento),
            Direccion_del_Viento = mean(Direccion_del_Viento),
            Presion = mean(Presion),
            Punto_de_Rocio = mean(Punto_de_Rocio),
            Cobertura_total_nubosa = mean(Cobertura_total_nubosa),
            Humedad = mean(Humedad)) %>% 
  ungroup()  %>% 
  remove_rownames %>% 
  drop_na(any_of("Municipio")) %>% 
  column_to_rownames(var="Municipio")

data3<-data2

ggpairs(data3)
