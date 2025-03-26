##########################################################

#Lectura datos de carbon

#Hay que subir los datos al PC remoto en "zona herramientas" upload
# %>% es para concatenar un comando o una funcion "Opeador "enchufar"
# para unir lineas de una misma funcion es enter para legibilidad (Salto de linea)

# Con install.packages("tidyverse") se instala el paquete en renv, pero no se carga
# Para cargar se usa library():

library(tidyverse)
library(ggExtra)

#datos de produccion carbon por pais
data_charcoal = read_csv("datasets/UNdata_Charcoal.csv", show_col_types = FALSE)


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

# Determine el número total de UE en el conjunto de datos charcoal_chh19 y charcoal_prd19
#Presentar dato en consola de resultado
print(paste0('Numero de UE (UnidEstadis) para charcoal_chh19 es ', nrow(charcoal_chh19)))
print(paste0('Numero de UE (UnidEstadis) para charcoal_prd19 es ', nrow(charcoal_prd19)))

# cuantos paises se encuentran en ambos conjuntos de datos
# $ indica que solo tome una columna de la tabla
inter_pais = intersect(charcoal_prd19$Country_Area, 
                       charcoal_chh19$Country_Area)
length(inter_pais)

# Ej3. Diga si la columna Unit es una variable o una constante para los dos conjuntos de datos.
n_distinct(charcoal_prd19$Unit)
# Tmb se puede usar length(unique(datos$Country)) esta ultima del paquete basico
print(paste0('La cant de vbles dif. de Unit en chh es: ', n_distinct(charcoal_chh19$Unit)))
print(paste0('La cant de vbles dif. de Unit en prd es: ', n_distinct(charcoal_prd19$Unit)))

# Historia de produccion

#==============================================================================
# Fundamentos del Curso Parte 1

# Creacion de Histograma de produccion
hist(charcoal_prd19$Quantity,
    main = 'Histograma de producción de carbón por países-áreas\nAño 2019',
    xlab = 'Intervalos de clase - Producción (en miles de toneladas métricas) de carbón',
    ylab = 'Frecuencia absoluta')

#Ej4 Histograma con regla de Sturges 
n = nrow(charcoal_chh19)
n_sturges = 1 + log2(n)
hist(charcoal_chh19$Quantity, breaks = round(n_sturges), col = "lightblue", border = "black",
     main = 'Histograma de consumo de carbón por países-áreas\nAño 2019',
     xlab = 'Intervalos de clase - Producción (en miles de toneladas métricas) de carbón',
     ylab = 'Frecuencia absoluta')

# Diagrama de Caja-Bigots (Box Plot)
par(mfrow=c(2,1))
hist(charcoal_prd19$Quantity,
     main = 'Histograma de producción de carbón por paises - áreas\nAño 2019 - con estadísticas resumen',
     xlab = 'Intervalos de clase - Producción (en miles de toneladas métricas) de carbón',
     ylab = 'Frecuencia absoluta',
     xlim = c(0,6500))

abline(v = max(charcoal_prd19$Quantity),col='yellow')
abline(v = mean(charcoal_prd19$Quantity),col='blue')
abline(v = min(charcoal_prd19$Quantity),col='red')

boxplot(charcoal_prd19$Quantity,horizontal = TRUE,ylim = c(0,6500),
        main = 'Boxplot (orientacíon horizontal) de producción de carbón por paises - áreas\nAño 2019',
        xlab = 'Producción (en miles de toneladas métricas) de carbón')

# Ej5 
par(mfrow=c(1,1))
boxplot(charcoal_chh19$Quantity, vertical = TRUE,ylim = c(0,6500),
        main = 'Boxplot de consumo de carbón por paises - áreas\nAño 2019',
        xlab = 'Consumo (en miles de toneladas métricas) de carbón')

#==============================================================================
# Fundamentos del Curso Parte 2

# Ejemplo en R: Gráfica de una función de densidad normal
library(ggplot2)

x <- seq(-4, 4, length = 100)
densidad <- dnorm(x, mean = 0, sd = 1)

ggplot(data.frame(x, densidad), aes(x, densidad)) +
  geom_line(color = "blue", size = 1) +
  labs(title = "Función de Densidad de Probabilidad (FDP) Normal",
       x = "Valores de X", y = "Densidad")

par(mfrow=c(2,3))
for(k in c(5,10,25,50,75,100)){
  hist(charcoal_prd19$Quantity,breaks=k,
       main = paste0('Histograma de producción de carbón\npor paises - áreas. Año 2019 - k = ',k),
       xlab = 'Intervalos de clase - Producción\n(en miles de toneladas métricas) de carbón',
       ylab = 'Frecuencia absoluta')
}


tabla=read.csv2("/Users/aosoriom/Repos/MER_AEDatos/datasets/ORI.csv") #Lee el archivo csv. Antes tuve que reemplazarle al archivo los ; por ,
MedioDia = tabla[tabla$Hora=="12:00",] #Crea tabla con la hora 12:00 solamente
# Cambio incluido por temas formato refional
MedioDia$Temperatura <- gsub(",", ".", MedioDia$Temperatura)
MedioDia$Temperatura <- as.numeric(MedioDia$Temperatura)
boxplot(MedioDia$Temperatura, horizontal = FALSE, main = "Temperatura", ylab = '°C') #punto 4

