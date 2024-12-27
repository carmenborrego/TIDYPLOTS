#alfabetas <- c(194,383,382,386,306,318)
no_lectora <- c(34, 95,107,130,111,142) 
libros <- c(112,188,149,142,109,109)
revistas <- c(53,90,88,81,50,59)
periodicos <- c(21,61,66,78,63,59)
historietas <- c(23,23,21,6,1,9)
blogs<- c(111,190,185,119,84,48)
edad <- c("18-24","25-34","35-44",
          "45-54","55-64","65+")

df <- data.frame(edad, no_lectora, libros,
                 revistas, periodicos, historietas, blogs)
library(tidyverse)
datos <- df %>%
  pivot_longer(cols = c(no_lectora, libros, revistas, 
                        periodicos, historietas, blogs),
               names_to = "Material",
               values_to = "Número")

library(tidyplots)
datos %>%
  tidyplot(x = edad, y = Número, color = Material ) %>%
  add_barstack_relative() %>%
  adjust_colors(colors_discrete_friendly) %>%
  adjust_x_axis_title(title = "Grupo de edad") %>% 
  adjust_y_axis_title(title = "Porcentaje") %>%
  adjust_legend_title(title = "Material") %>%
  adjust_font(face = "bold", fontsize = 15) %>%
  adjust_title(title = "Tipo de material leído por grupo de edad") %>%
  adjust_caption(caption ="Fuente: elaboración propia con datos de INEGI") %>%
  adjust_size(width = 130, height = 100, unit = "mm") 
  
library(readxl)
library(tidyplots)
total <- read_excel("C:/Users/carmenbs/Downloads/BLOG/LECTURA.xlsx")
colores_total <- 
  new_color_scheme(c("#4FAE62","#F6C54D"),
                   name = "my_custom_color_scheme")

total %>%
  tidyplot(y= Total, color = Categoría) %>%
  add_pie() %>% 
  adjust_colors(new_colors = colores_total) %>%
  adjust_title(title ="Poroporción de lectores y no lectores") %>%
  adjust_font(face = "bold", fontsize=15)%>%
  adjust_size(width = 100, height = 100)%>%
  adjust_caption(caption = "Fuente: elaboración propia con información de INEGI")

LECTURA <- read_excel("C:/Users/carmenbs/Downloads/BLOG/LECTURA.xlsx", 
                      sheet = "Total_edades")

lectura_p <- LECTURA %>%
  pivot_longer(cols = c(Lectores, No_lectores), 
               names_to = "Tipo población", 
               values_to = "Número")
lectura_p %>% 
  tidyplot(x = Grupo_edad, y = Número, color = `Tipo población`) %>%
  add_barstack_relative() %>% 
  adjust_colors(new_colors = colores_total) %>%
  adjust_title(title = "Número de lectores y no lectores por edad") %>%
  adjust_caption(caption = "Fuente: elaboración propia con información de INEGI") %>%
  adjust_font(fontsize = 10, face = "bold") %>%
  adjust_x_axis(rotate_labels = TRUE) %>%
  adjust_size(width = 100, height = 100) 

materialh<- read_excel("C:/Users/carmenbs/Downloads/BLOG/LECTURA.xlsx", 
                      sheet = "Material_hombres")
  
material_hombres <- materialh %>%
  pivot_longer(cols = c(Libros, Revistas, 
                        Periódicos, Historietas,
                        `Páginas de internet, foros o blogs`),
               names_to = "Material",
               values_to = "Porcentaje")


material_hombres %>%
  tidyplot(x = Grupo_edad, y = Porcentaje, color = Material) %>%
  add_barstack_relative()%>% 
  adjust_title(title = "Tipo de material (hombres)") %>%
  adjust_caption(caption = "Fuente: elaboración propia con información de INEGI") %>%
  adjust_font(fontsize = 10, face = "bold") %>%
  adjust_x_axis(rotate_labels = TRUE) %>%
  adjust_size(width = 100, height = 100) 


materialm <- read_excel("C:/Users/carmenbs/Downloads/BLOG/LECTURA.xlsx", 
                      sheet = "Material_mujeres")
  
material_mujeres <- materialm %>%
  pivot_longer(cols = c(Libros, Revistas, 
                        Periódicos, Historietas,
                        `Páginas de internet, foros o blogs`),
               names_to = "Material",
               values_to = "Porcentaje")
  
material_mujeres %>%
  tidyplot(x = Grupo_edad, y = Porcentaje, color = Material) %>%
  add_barstack_relative()%>% 
  adjust_title(title = "Tipo de material (mujeres)") %>%
  adjust_caption(caption = "Fuente: elaboración propia con información de INEGI") %>%
  adjust_font(fontsize = 10, face = "bold") %>%
  adjust_x_axis(rotate_labels = TRUE) %>%
  adjust_size(width = 100, height = 100) 

