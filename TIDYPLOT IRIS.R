library(tidyplots)
iris
View(iris)
class(iris)
iris %>% #pipeline
  #indico qué datos qiuero en cada eje y el relleno 
  tidyplot(x = Species, y = Sepal.Length, color = Species) %>%
  add_mean_bar(alpha = 0.4) %>% #pido que se agregue la mediana
  add_sem_errorbar() %>% #pido el error de la mediana
  add_data_points_beeswarm()

iris %>% #pipeline
  #indico qué datos qiuero en cada eje y el relleno 
  tidyplot(x = Species, y = Sepal.Width, color = Species) %>%
  add_mean_bar(alpha = 0.4) %>% #pido que se agregue la mediana
  add_sem_errorbar() %>% #pido el error de la mediana
  add_data_points_beeswarm()

iris %>% #pipeline
  #indico qué datos qiuero en cada eje y el relleno 
  tidyplot(x = Species, y = Petal.Length, color = Species) %>%
  add_mean_bar(alpha = 0.4) %>% #pido que se agregue la mediana
  add_sem_errorbar() %>% #pido el error de la mediana
  add_data_points_beeswarm()

iris %>% #pipeline
  #indico qué datos qiuero en cada eje y el relleno 
  tidyplot(x = Species, y = Petal.Width, color = Species) %>%
  add_mean_bar(alpha = 0.4) %>% #pido que se agregue la mediana
  add_sem_errorbar() %>% #pido el error de la mediana
  add_data_points_beeswarm()

iris %>% 
  tidyplot(x = Species, y = Petal.Length, color = Species) %>% 
  add_violin(draw_quantiles = 0.5) %>% 
  add_data_points_beeswarm()

iris %>% 
  tidyplot(x = Species, y = Petal.Length, color = Species) %>% 
  add_boxplot()

#hagamos un diagrama de dispersión de petal lenght vs sepal lenght
iris %>% 
  tidyplot(x= Petal.Length, y = Sepal.Length) %>%
  add_data_points()
#tomando como base el código anterior, ahora queremos 
#resaltar algunos puntos en específico é
#en este caso, aquellas flores con pétalos y sépalos que 
#midan más de 5 
iris %>% 
  tidyplot(x= Petal.Length, y = ) %>%
  add_data_points() %>%
  add_data_points(data = max_rows(Sepal.Length, 5), color = "red", shape = 1, size = 2) %>% 
  add_data_points(data = max_rows(Sepal.Length, 5), color = "red", shape = 1, size = 2)

#se busca graficar ahora los nombres de las flores 
iris %>% 
  tidyplot(x = Petal.Length , y = Sepal.Length) %>% 
  add_data_points() %>% 
  add_data_labels(label = Species)
#como las etiquetas se superponen, se busca proyectarlas 
#se utiliza la funcion add_data_labels_repel() para hacerlo 
iris %>% 
  tidyplot(x = Petal.Length , y = Sepal.Length) %>% 
  add_data_points() %>% 
  add_data_labels_repel(label = Species)
#la visualización sigue sin ser óptima, así que solamente 
#haremos que se muestren las etiquetas de las flores 
#que midan más de 5cm 
#el argumento max_rows y min_rows no aceptan decimales 
#únicamente pueden poner número "redondos" 
iris %>% 
  tidyplot(x = Petal.Length, y = Sepal.Length) %>% 
  add_data_points() %>% 
  add_data_labels_repel(data = max_rows(Petal.Length, 5), Species) %>% 
  add_data_labels_repel(data = max_rows(Sepal.Length, 5), Species)

#para que nos marque ahora los mínimos 
iris %>% 
  tidyplot(x = Petal.Length, y = Sepal.Length) %>% 
  add_data_points() %>% 
  add_data_labels_repel(data = min_rows(Petal.Length, 1), Species) %>% 
  add_data_labels_repel(data = min_rows(Sepal.Length, 1), Species)

#agregamos líneas de referencia utilizando las mísmas líneas 
#de código anteriores 
iris %>% 
  tidyplot(x = Petal.Length, y = Sepal.Length) %>% 
  add_reference_lines(x = 4, y = c(6, 7)) %>% 
  add_data_points() %>% 
  add_data_labels_repel(data = min_rows(Petal.Length, 1), Species) %>% 
  add_data_labels_repel(data = min_rows(Sepal.Length, 1), Species)

#ahora agregaremos anotaciones: título y letras pequeñas 
iris %>% 
  tidyplot(x = Petal.Length, y = Sepal.Length) %>% 
  add_reference_lines(x = 4, y = c(6, 7)) %>% 
  add_data_points() %>% 
  add_data_labels_repel(data = min_rows(Petal.Length, 1), Species) %>% 
  add_data_labels_repel(data = min_rows(Sepal.Length, 1), Species) %>% 
  add_title("Iris") %>% 
  add_caption("Las flores con pétalo y sépalo más pequeños")

#agreguemos emdidas de tendencia central 
iris %>% 
  tidyplot(x = Species, y = Sepal.Length, color = Species) %>%
  add_data_points_beeswarm() %>%
  add_mean_dash() #línea con la media

iris %>% 
  tidyplot(x = Species, y = Sepal.Length, color = Species) %>%
  add_mean_bar() %>% #pido que me grafique en barras
  add_mean_value() #pido que me agregue la etiqueta de media

#ahora quiero comparar media y mediana y evaluar 
#cuándo son diferentes 
iris %>% 
  tidyplot(x = Species, y = Sepal.Length, color = Species) %>%
  add_data_points_beeswarm(color = "grey") %>%
  add_mean_dash(color = "orange") %>%
  add_median_dash(color = "purple")
#línea con la media

View(time_course)
iris %>% 
  tidyplot(x = Species, y = Sepal.Length, color = Species) %>%
  add_data_points_beeswarm(color = "grey") %>%
  add_mean_dash(color = "orange") %>%
  add_median_dash(color = "purple") %>%
  add_sem_errorbar(width = 2) #se agrega el error std de la media (sem)




  



















