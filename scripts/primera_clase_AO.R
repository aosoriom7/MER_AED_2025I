#Introduccion (Sugerencia referencia temporal para sgto del video)
#Creacion de vector de datos
datos = c(1,3,2,4,5,3,6,8,7)
# Se resumen en una tabla
frq   = table(datos)
print(frq) # se puede invocar tmb la variable directamente
# Instalacion tidyverse --> manipulacion mas facil de datos
# En remoto se debe 
install.packages("tidyverse")
library(tidyverse) 
install.packages("ggExtra")

##########################################################

#Lectura datos de carbon

#Hay que subir los datos al PC remoto en "zona herramientas" upload
# %>% es para concatenar un comando o una funcion "Opeador "enchufar"
# para unir lineas de una misma funcion es enter para legibilidad (Salto de linea)

#datos de produccion carbon por pais
data_charcoal = read_csv("UNdata_Charcoal.csv", show_col_types = FALSE)


# Presentacion datos de consumo
# charcoal_chh19 es un objeto
charcoal_chh19  = data_charcoal %>% 
  filter(Year==2019 & Commodity=="Charcoal - Consumption by households") %>%
  select(-Commodity)

# Presentacion datos de Produccion
charcoal_prd19  = data_charcoal %>% 
  filter(Year==2019 & Commodity=="Charcoal - Production") %>%
  select(-Commodity)

#Obtener datos de uno de los objetos sin crear uno nuevo
charcoal_prd19 %>% filter(Country_Area=="Colombia")

#Presentar dato en consola de resultado
print(paste0('Numero de UE (UnidEstadis) para charcoal_chh19 es ', nrow(charcoal_chh19)))

# cuantos paises se encuentran en ambos conjuntos de datos
# $ indica que solo tome una columna de la tabla
inter_pais = intersect(charcoal_prd19$Country_Area, 
                       charcoal_chh19$Country_Area)
length(inter_pais)

charcoal_prd19$Unit


  
