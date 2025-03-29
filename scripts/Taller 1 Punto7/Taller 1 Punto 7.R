
install.packages("tidyverse")# Aquí instalo mi propio paquete 
library(tidyverse)
install.packages("ggExtra") 

## Filtrar datos de medio dia

ori_mediodia = ORI %>% 
  filter(Hora=="12:00") %>% 
  select(Temperatura , Velocidad_del_Viento)

##Revisar si esta instalado GGextra y GGplot
##realizar el codigo para la grafica de disperción

g_base = ggplot(ori_mediodia, aes(x = Temperatura,
                                    y = Velocidad_del_Viento)) + 
  labs(title="Diagrama de dispersión de Temperatura VS Velocidad del viento") +
  xlab("Temperatura (en °C) ") + 
  ylab("Velocidad del Viento (en m/s)") + geom_smooth(method = "lm", se = FALSE, color = "red") +
  geom_point()


##Histograma marginal 
g1 = ggMarginal(g_base, type = "histogram")
g1

