# Instalar paquetes necesarios si no están instalados
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(GGally)) install.packages("GGally")

# Cargar las librerías
library(ggplot2)
library(GGally)
install.packages("dplyr")  # Solo si no está instalado
library(dplyr)  # Cargar el paquete

# Cargar dplyr y ggplot2 para facilitar el manejo de datos y visualización
if (!require(dplyr)) install.packages("dplyr")
if (!require(ggplot2)) install.packages("ggplot2")

# Convertir la base de datos a un marco de datos manejable (ejemplo)
datos <- biocheck_pig_paula

# Asegurarse de seleccionar las variables de interés
# Transformar Ind_type (categórica) a numérica
datos_cor <- datos %>%
  select(Ind_type, Global, B_Ext, B_Int) %>%
  mutate(Ind_type = as.numeric(as.factor(Ind_type)))  # Codificar Ind_type como numérica

# Crear la matriz de correlación
cor_matrix <- cor(datos_cor, use = "complete.obs")

# Mostrar la matriz de correlación
print(cor_matrix)

# Si quieres visualizarla gráficamente
library(corrplot)  # Si no está instalado: install.packages("corrplot")
corrplot(cor_matrix, method = "color", type = "upper", tl.col = "black", tl.srt = 45)


