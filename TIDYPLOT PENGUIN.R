install.packages("palmerpenguins")
library(palmerpenguins)
penguins
View(penguins)
class(penguins)
#primero quiero contar cuántos machos y hembras hay en la base 
#se tiene que utillizar la add_count_bar 
penguins %>% 
  tidyplot(x = sex, color=sex) %>% 
  add_count_bar()

#ahora hacemos barras horizontales 
penguins %>% 
  tidyplot(y=sex, color=sex) %>% 
  add_count_bar()

#ahora quiero saber cuantos pinguinos se estudiaron por isla 
penguins %>% 
  tidyplot(x= island, color = island) %>% 
  add_count_bar()

#quiero ahora un gráfico de pastel
#se tiene que considerar que no hay argumento 
#x o y en la función tidyplot para pie o donut 
penguins %>% 
  tidyplot(color = island) %>% 
  add_pie()
#ahora se hace un gráfico de donut   
penguins %>%
  tidyplot(color = island) %>% 
  add_donut()
#se continua viendo proporciones con la variable sexo 
penguins %>%
  tidyplot(color = sex) %>%
  add_pie()
#ahora se grafica por la variable species
penguins %>%
  tidyplot(color = species) %>%
  add_pie()

#ahora haremos gráficos de violin agreagndo mediana 
#se utilizan datos de la aleta 
penguins %>%
  tidyplot(x=island, y=flipper_length_mm, color=island) %>%
  add_violin(draw_quantiles = 0.5) %>%
  add_data_points_beeswarm()
#ahora haremos gráfco de caja para los datos del pico 
penguins %>%
  tidyplot(x=island, y=bill_length_mm, color=island) %>%
  add_boxplot(draw_quantiles = 0.5) 






