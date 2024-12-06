install.packages("tidyplots")
library(tidyplots)

study %>% #pipeline
  #indico qué datos qiuero en cada eje y el relleno 
  tidyplot(x = treatment, y = score, color = treatment) %>%
  add_mean_bar(alpha = 0.4) %>% #pido que se agregue la mediana
  add_sem_errorbar() %>% #pido el error de la mediana
  add_data_points_beeswarm()
View(study)

energy %>% 
  #pido qué datos van en cada eje 
  tidyplot(x = year, y = power, color = energy_source) %>% 
  add_barstack_absolute() #pido que el gráfico sea de barras apiladas
View(energy)

energy %>% 
  #filtro los años que me interesan
  dplyr::filter(year %in% c(2005, 2010, 2015, 2020)) %>% 
  tidyplot(y = power, color = energy_source) %>% 
  add_donut() %>% #tipo de gráfico
  split_plot(by = year) #pido que los gráficos se separen por año

energy_week %>% 
  tidyplot(x = date, y = power, color = energy_source) %>% 
  add_areastack_absolute() #tipo de gráfica 

#este es similar al anterior pero ahora se considera 
#el uso relativo
energy_week %>% 
  tidyplot(x = date, y = power, color = energy_source) %>% 
  add_areastack_relative()

study %>% 
  tidyplot(x = group, y = score, color = dose) %>% 
  add_mean_bar(alpha = 0.4) %>% 
  add_mean_dash() %>% 
  add_mean_value()
View(study)

time_course %>%
  tidyplot(x = day, y = score, color = treatment, dodge_width = 0) %>%
  add_mean_line() %>%
  add_mean_dot() %>%
  add_sem_ribbon()
View(time_course)

climate %>%
  tidyplot(x = month, y = year, color = max_temperature) %>%
  add_heatmap()
View(climate)

study %>% 
  tidyplot(x = treatment, y = score, color = treatment) %>% 
  add_boxplot() %>% 
  add_test_pvalue(ref.group = 1)


gene_expression %>% 
  dplyr::filter(external_gene_name %in% c("Apol6", "Col5a3", "Vgf", "Bsn")) %>% 
  tidyplot(x = condition, y = expression, color = sample_type) %>% 
  add_mean_dash() %>% 
  add_sem_errorbar() %>% 
  add_data_points_beeswarm() %>% 
  add_test_asterisks(hide_info = TRUE) %>% 
  remove_x_axis_title() %>% 
  split_plot(by = external_gene_name)
View(gene_expression)


study %>% 
  tidyplot(x = treatment, y = score, color = treatment) %>% 
  add_mean_bar(alpha = 0.4) %>% 
  add_sem_errorbar() %>% 
  add_data_points_beeswarm() %>% 
  view_plot(title = "Default color scheme: 'friendly'") %>% 
  adjust_colors(colors_discrete_apple) %>% 
  view_plot(title = "Alternative color scheme: 'apple'")


#puntos de datos 
View(animals)
#el data set contiene ddatos sobre animales y sus 
#pesos, dónde viven, número de patas, color, qué come
#hábitat, diurno o nocturno, velocidad yt si es de sangre
#caliente o fría 
animals %>% 
  tidyplot(x = weight, y = size) %>% 
  add_data_points()
#los puntos se sobreponenn y no se aprecian bien 
#para mejor visualización, se agrega un espacio en 
#blanco entre los puntos utilizando white_border = TRUE
animals %>% 
  tidyplot(x = weight, y = size) %>% 
  add_data_points(white_border = TRUE)

#otra forma de solucionar el problema de la superposición es 
#hacer los puntos transparentes (no totalmente solidos)
#se utiliza un alpha menor a uno que 
#es con lo que se controla l aopacidad 
animals %>% 
  tidyplot(x = weight, y = size) %>% 
  add_data_points(alpha = 0.4)

#otra forma es utilizar una forma sin relleno 
#utilizando shape
animals %>% 
  tidyplot(x = weight, y = size) %>% 
  add_data_points(shape = 1)

#los puntos de datos pueden utilizarse 
#para graficar variables discretas contra variables continuas
study %>% 
  tidyplot(x = treatment, y = score) %>% 
  add_data_points()

#para evitar el superposición se puede agregar "ruido"
#a la posición y, lo que se conoce como jitter 
study %>% 
  tidyplot(x = treatment, y = score) %>% 
  add_data_points_jitter()

#también se puede utilizar el algoritmo que mantenga
#los puntos centrados y simplemente desplace 
#los puntos potencialmente superpuestos a los lados
study %>% 
  tidyplot(x = treatment, y = score) %>% 
  add_data_points_beeswarm()

#para contar y sumar datos de puntos se utiliza 
#el dataset spendings que contiene información de fecha, 
#monto, título y categoría de gasto
spendings %>% 
  tidyplot(x = category) %>% 
  add_count_bar()
#como los títulos se superponen, se soluciona de la 
#siguiente manera, volviendo las barras horizontales 
#en vez de verticales y el conteo aparece en el 
#eje de las x 
spendings %>% 
  tidyplot(y = category) %>% 
  add_count_bar()

#otra forma de evitar la superposición es rotar 
#las etiquetas del eje de las x 
spendings %>% 
  tidyplot(x = category) %>% 
  add_count_bar() %>% 
  adjust_x_axis(rotate_labels = TRUE)

#para contestar la pregunta de cuánto ha gastado la
#familia del dataset en cada categoría, utilizamos sum 
#para la columna de amount del dataset 
spendings %>% 
  tidyplot(x = category, y = amount, color = category) %>% 
  add_sum_bar() %>% 
  adjust_x_axis(rotate_labels = TRUE)

#lo anterior hace que se tengan etiquetas en el gráfico
#además de leyenda en la derecha 
#los argumentos remove hacen esto 
spendings %>% 
  tidyplot(x = category, y = amount, color = category) %>% 
  add_sum_bar() %>% 
  adjust_x_axis(rotate_labels = TRUE) %>% 
  remove_x_axis_labels() %>% 
  remove_x_axis_title() %>% 
  remove_x_axis_ticks()

#ahora se usan los mismos datos pero para hacer 
#el gráfico lollipop utlizando bar y dot 
spendings %>% 
  tidyplot(x = category, y = amount, color = category) %>% 
  add_sum_bar(width = 0.03) %>% 
  add_sum_dot() %>% 
  add_sum_value(accuracy = 1) %>% 
  adjust_x_axis(rotate_labels = TRUE) %>% 
  remove_x_axis_labels() %>% 
  remove_x_axis_title() %>% 
  remove_x_axis_ticks()

#para agregarle el valor a las paletas 
#se utiliza el add_sum_value
spendings %>% 
  tidyplot(x = category, y = amount, color = category) %>% 
  add_sum_bar(width = 0.03) %>% 
  add_sum_dot() %>% 
  add_sum_value(accuracy = 1) %>% 
  adjust_x_axis(rotate_labels = TRUE) %>% 
  remove_x_axis_labels() %>% 
  remove_x_axis_title() %>% 
  remove_x_axis_ticks()

#heatmaps 
#son ideales para graficar variables continuas 
#en función de dos variables adicionales 
#como ejemplo se toma el dataset gene_expression 
gene_expression %>% 
  dplyr::glimpse()
View(gene_expression)
#se grafican los valores de la variable "expresión" 

gene_expression %>% 
  tidyplot(x = sample, y = external_gene_name, color = expression) %>% 
  add_heatmap()
#para evitar la superposición se incrementa la altura 
#del área del gráfico de 50 a 100 mm 
gene_expression %>% 
  tidyplot(x = sample, y = external_gene_name, color = expression) %>% 
  add_heatmap() %>%
  adjust_size(height = 100) #aumentamos el tamaño 

#algunas lineas presentan valores muy altos o muy bajos 
#se aplica una técnica clásica para reservar el 
#rango de colores para las diferencias dentro de cada fila
#esto se logra haciendo el 
#reescalamiento con valores z de cada fila de forma individual

gene_expression %>% 
  tidyplot(x = sample, y = external_gene_name, color = expression) %>% 
  add_heatmap(scale = "row") %>% #se aplica el escalamiento z
  adjust_size(height = 100)

#parece que las filas están "mezcladas" o que no están 
#acomodadas en orden por su svalores z 
#con la variable "direction" del dataset para 
#acomodar el eje de las y 
gene_expression %>% 
  tidyplot(x = sample, y = external_gene_name, color = expression) %>% 
  add_heatmap(scale = "row") %>%
  adjust_size(height = 100) %>% 
  sort_y_axis_labels(direction)

#TENDENCIA CENTRAL 
study %>% 
  tidyplot(x = treatment, y = score) %>% 
  add_data_points_beeswarm() %>% 
  add_mean_dash()

#linea y punto
time_course %>% 
  tidyplot(x = day, y = score, color = treatment, dodge_width = 0) %>% 
  add_mean_line() %>% 
  add_mean_dot()

#linea y area
time_course %>% 
  tidyplot(x = day, y = score, color = treatment, dodge_width = 0) %>% 
  add_mean_line(linewidth = 1) %>% 
  add_mean_area(alpha = 0.2)

study %>% 
  tidyplot(x = treatment, y = score) %>% 
  add_mean_bar() %>% 
  add_mean_value()

#agregar la media y la mediana juntas 
#ayuda a ver si son diferentes
study %>% 
  tidyplot(x = treatment, y = score) %>% 
  add_data_points_beeswarm(color = "grey") %>% 
  add_mean_dash(color = "orange") %>% 
  add_median_dash(color = "purple")


#DISPERSIÓN E INCERTIDUMBRE 
#se agrega información acerca de la variabilidad o dispersión 
#de los puntos de datos
#se incluye el error std de la media (sem) y la desv std (sd) 
#el rango y el intervalo de confianza del 95 
time_course %>% 
  tidyplot(x = day, y = score, color = treatment, dodge_width = 0) %>% 
  add_mean_line() %>% 
  add_mean_dot() %>% 
  add_sem_errorbar(width = 2)

#se añade un listón en vez de las lineas de grafico de caja 
time_course %>% 
  tidyplot(x = day, y = score, color = treatment, dodge_width = 0) %>% 
  add_mean_line() %>% 
  add_mean_dot() %>% 
  add_sem_ribbon() #con esto se agregó el listón 

#gráficos de violin o de caja 
study %>% 
  tidyplot(x = treatment, y = score, color = treatment) %>% 
  add_violin()

#se agrega el cuartil .5 
study %>% 
  tidyplot(x = treatment, y = score, color = treatment) %>% 
  add_violin(draw_quantiles = 0.5) %>% #aquí se agrega 
  add_data_points_beeswarm()

#gráfico de caja 
study %>% 
  tidyplot(x = treatment, y = score, color = treatment) %>% 
  add_boxplot()

#se puede ajustar la curva de los datos 
time_course %>% 
  tidyplot(x = day, y = score, color = treatment, dodge_width = 0) %>% 
  add_curve_fit()

#DUISTRIBUCIÓN 
#histograma 
energy %>% 
  tidyplot(x = power) %>% 
  add_histogram()  

#para comparar múltiples distribuciones se pueden 
#utilizar gráficas de barras o de violin 
distributions %>% 
  tidyplot(x = name, y = value) %>% 
  add_violin() %>% 
  add_data_points_beeswarm()

#proporción 
#los datos proporcionales dan información del porcentaje 
#que cada categoría individual contribuye al total 
energy %>% 
  dplyr::glimpse()
View(energy)
#gráfico de pastel 
energy %>% 
  tidyplot(color = energy_type) %>% 
  add_pie()

#para la suma de cada de los tipos de energía 
energy %>% 
  tidyplot(y = power, color = energy_type) %>% #aqui le digo qué sume
  add_donut() #tipo de gráfico 

#para barstack (apilado)
energy %>% 
  tidyplot(y = power, color = energy_type) %>% 
  add_barstack_absolute()

#para identificar más claramente las cantidades 
energy %>% 
  tidyplot(x = energy_type, y = power, color = energy_type) %>% 
  add_sum_bar() %>% 
  add_sum_value() %>% #para que muestre valores 
  reorder_x_axis_labels("Renewable") #que se ordenen de mayor a menor

#para visualizar la proporción de los datos a lo largo del tiempo 
#se utiliza barstack 
energy %>% 
  tidyplot(x = year, y = power, color = energy_type) %>% 
  add_barstack_absolute()

#para ver contribución relativa en vez de contribución absoluta 
#se utiliza add_barstack_relative()
energy %>% 
  tidyplot(x = year, y = power, color = energy_type) %>% 
  add_barstack_relative()

#de forma similar se puede hacer con gráfico de área 
energy %>% 
  tidyplot(x = year, y = power, color = energy_type) %>% 
  add_areastack_relative()


#para mostrar la evolución de la proporción de 
#contribución de energía renovable al total 
#se utiliza la gráfica de dona y se seleccionan 
#unicamente los años que nos interesan 
energy %>% 
  # downsample to 4 representative years
  dplyr::filter(year %in% c(2005, 2010, 2015, 2020)) %>% #selecciono años 
  # start plotting
  tidyplot(y = power, color = energy_type) %>% 
  add_donut() %>% 
  #indico los colores que quiero 
  adjust_colors(new_colors = c("Fossil" = "grey", 
                               "Nuclear" = "#F6C54D",
                               "Renewable" = "#4FAE62",
                               "Other" = "#C02D45")) %>%  
  split_plot(by = year) #pido que se separe por año


#datos con mayor frecuencia con el dataset energy_week 
#primero se hace valor absoluto 
energy_week %>% 
  tidyplot(date, power, color = energy_source) %>% 
  add_areastack_absolute()

#se hace lo mismo pero para relativo 
energy_week %>% 
  tidyplot(date, power, color = energy_source) %>% 
  add_areastack_relative()

#COMPARACIÓN ESTADÍSTICA 
#se usa el dataset study con los datos de pacientes 
#que recibieron placebo y quienes recibieron tratamiento 

#comparasión estadística 
study %>% 
  tidyplot(x = dose, y = score, color = group) %>% 
  add_mean_dash() %>% 
  add_sem_errorbar() %>% 
  add_data_points() %>% 
  add_test_asterisks() #indica niveles de significancia 

#con add_test_pvalue() se agrega el valor p calculado 
study %>% 
  tidyplot(x = dose, y = score, color = group) %>% 
  add_mean_dash() %>% 
  add_sem_errorbar() %>% 
  add_data_points() %>% 
  add_test_pvalue()

#si se quiere realizar otro tipode prueba estadística 
#se puede ajustar con el argumento method 
#Existe opción para Wilcoxon y Benjamini–Hochberg
study %>% 
  tidyplot(x = dose, y = score, color = group) %>% 
  add_mean_dash() %>% 
  add_sem_errorbar() %>% 
  add_data_points() %>% 
  add_test_pvalue(method = "wilcoxon", p.adjust.method = "BH")
}
#comparamos con tratamiento a como control 
study %>% 
  tidyplot(x = treatment, y = score, color = treatment) %>% 
  add_mean_dash() %>% 
  add_sem_errorbar() %>% 
  add_data_points() %>% 
  add_test_pvalue(ref.group = "A")

#se puede tener un mix de valor significativos y no significativos
gene_expression %>% 
  # filter to one gene
  dplyr::filter(external_gene_name == "Apol6") %>% 
  # start plotting
  tidyplot(x = condition, y = expression, color = sample_type) %>% 
  add_mean_dash() %>% 
  add_sem_errorbar() %>% 
  add_data_points() %>% 
  add_test_pvalue()

#se puede decidir no mostrar los valores no significativos 

gene_expression %>% 
  # filter to one gene
  dplyr::filter(external_gene_name == "Apol6") %>% 
  # start plotting
  tidyplot(x = condition, y = expression, color = sample_type) %>% 
  add_mean_dash() %>% 
  add_sem_errorbar() %>% 
  add_data_points() %>% 
  add_test_pvalue(hide.ns = TRUE) #el argumento esconder en true


#para esconder la información estadística 
#se utiliza el argumento hide_info=TRUE 
gene_expression %>% 
  # filter to one gene
  dplyr::filter(external_gene_name == "Apol6") %>% 
  # start plotting
  tidyplot(x = condition, y = expression, color = sample_type) %>% 
  add_mean_dash() %>% 
  add_sem_errorbar() %>% 
  add_data_points() %>% 
  add_test_pvalue(hide.ns = TRUE, hide_info = TRUE)

#ANOTACIONES 
study %>% 
  tidyplot(x = treatment, y = score, color = treatment) %>% 
  add_mean_dash() %>% 
  add_sem_errorbar() %>% 
  add_data_points() %>% 
  add_title("Interesting study") %>% #Título 
  #SE AGREGA LA ANOTACIÓN 
  add_caption("Here is some more detail how the study was performed")


#a veces se quiere resltar algún dato 
#codigo original 
animals %>% 
  tidyplot(x = weight, y = speed) %>% 
  add_data_points()
#codigo modificado para resaltar puntos 
animals %>% 
  tidyplot(x = weight, y = speed) %>% 
  add_data_points() %>% 
  add_data_points(data = max_rows(weight, 1), color = "red", shape = 1, size = 2) %>% 
  add_data_points(data = max_rows(speed, 1), color = "red", shape = 1, size = 2)


#para añadir los nombres o etiquetas 
#de los animales 
animals %>% 
  tidyplot(x = weight, y = speed) %>% 
  add_data_points() %>% 
  add_data_labels(label = animal)
#como las etiquetas se superponen, se utiliza 
#la función  add_data_labels_repel()
animals %>% 
  tidyplot(x = weight, y = speed) %>% 
  add_data_points() %>% 
  add_data_labels_repel(label = animal)
#con repel se hace que las etiquetas se proyecten 
#y se unan con las lineas con los puntos 
#pero la visualización no es ideal 
#así que unicamente pedimos etiquetas para los 
#3 animales más pesados y los 3 más gordos
animals %>% 
  tidyplot(x = weight, y = speed) %>% 
  add_data_points() %>% 
  add_data_labels_repel(data = max_rows(weight, 3), animal) %>% 
  add_data_labels_repel(data = max_rows(speed, 3), animal)


#para valores específicos en los ejes x y y 
animals %>% 
  tidyplot(x = weight, y = speed) %>% 
  add_reference_lines(x = 4000, y = c(100, 200)) %>% 
  add_data_points() %>% 
  add_data_labels_repel(data = max_rows(weight, 3), animal) %>% 
  add_data_labels_repel(data = max_rows(speed, 3), animal)




























