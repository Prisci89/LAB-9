####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Carla Carolina Pérez Hernández (UAEH)

# T1_03_ESPACIO PRODUCTO(2) - RELACIONAMIENTO "CASO REAL": EXPORTACIONES HIDALGUENSES

# Objetivo: Estimar el relacionamiento (relatedness, proximidad, métrica de distancia entre productos)
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar nuestra matriz de datos
# 2. Calcular co ocurrencias entre lugares y productos 
# 3. Estimar el relacionamiento, teniendo como input las co ocurrencias
# 4. Graficar
# 5. Exportar los resultados para trabajarlos con cytoscape o gephi

#######################################
# practica 2: exportaciones hidalguenses #
#######################################

library (EconGeo)

#seleccionar archivo desde la ruta de su ordenador

M = as.matrix(
  read.csv("C:/Users/Usuario/OneDrive/Escritorio/DOCTORADO/DRA. CARLA-COMPLEJIDAD ECONÓMICA/LABS/LAB 9/rca_2014.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))

head (M[,1:10])
dim (M)





# co-ocurrencia entre personas/paises/estados
co_occurrence(M)





# co-ocurrencia entre productos t es transpuesta
c = co_occurrence(t(M))
#c es la matriz transpuesta
c

# estima el relacionamiento o proximidad pero normalizado, para asegurar que el numero de co ocurrencias que observamos
# es mayor al numero de co ocurrencias probables (probailidad condicional)
#tie and Surfboard puede que no esten tan relacionados, abajo de  1 no es relacionado mientras que mayor a 1 si es relacionado
r=relatedness(c)
#e es la matriz de relacionamiento
r


#exportar resultados del relacionamiento no binario



#opcional (sólo para trabajar con datos binarios)

r




library (igraph)
g1=graph_from_adjacency_matrix(r,mode = "undirected")
plot(g1)




#exportar resultados del relacionamiento binario
write.csv(r,file="reladedness.csv")
write.csv(c,file="cocurrences.csv")


#exportar resultados de co ocurrencias



