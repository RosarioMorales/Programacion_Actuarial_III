
#Reconocimiento de Actividad Humana con Celulares

####  Establece el directorio de trabajo

   setwd("C:/Users/Brenda18/Documents/GitHub/Programacion_Actuarial_III/Caso3/UCI HAR Dataset")

###Lectura de los datos.

####Concatena los nombres para abrirlos
    features<- read.table(paste("features.txt",sep = "/"),quote ="\"")
    activities_labels<- read.table(paste("activity_labels.txt",sep = "/"),quote ="\"")
    
    train <-read.table(paste("train/X_train.txt", sep="/"),quote= "\"")
    subject_train<-read.table(paste("train/subject_train.txt", sep="/"),quote= "\"")
    y_train<-read.table(paste("train/y_train.txt", sep="/"),quote= "\"")
    
    test <-read.table(paste("test/X_test.txt", sep="/"),quote= "\"")
    subject_test<-read.table(paste("test/subject_test.txt", sep="/"),quote= "\"")
    y_test<-read.table(paste("test/y_test.txt", sep="/"),quote= "\"")

###Paso 1)
#####Une los datos de test con los de training, para crear un solo conjunto de datos. 
    data <- rbind(train,test)
    volunteers <- rbind(subject_train,subject_test)[,1]
    actividades <- rbind(y_train,y_test)
    
###Paso 2)
#####Extrae unicamente las medidas de media y desviacion estandar de cada medicion. 

* Seleccionamos la columna 2 de features

        nombres <- features[,2] 
  
* Nombre a las columnas de data 

        colnames(data) <- nombres 
  
* Vector que contiene las posiciones

        a <- grep('-(mean|std)',features[,2]) 
    
####Columnas que tienen en el nombre std o mean

* Extrae las coincidencias

        stdmean <- nombres[a] 

* Hace una nueva tabla con las coincidencias

        data1<- data[,a] 
    
###Encontramos 79 columnas que tienen promedio o desviacion estandar

##Paso 3)
#####Usa nombres de actividad para describir los nombres de las actividades en la base de datos.  
 
* Seleccionamos los nombres de las actividades
    
        ac <-as.vector(activities_labels[,2]) 

###Se convierten en un vector

* En la columna de numeros aparecen ahora las actividades
  
        ad <-ac[actividades[,1]]

* Como sale un vector de caracteres lo tranformamos a un data.frame

        ap <-as.data.frame(ad) 
  
        data1 <- cbind(Activity = ad, data1)

##Paso 4)
#####Coloca etiquetas apropiadas en la base de datos con nombres de variables que las describan. 

   * colnames(data1) <- sub("mean", "Mean", colnames(data1))
   * colnames(data1) <- sub("t", "Time", colnames(data1))
   * colnames(data1) <- sub("sTimed", "Std", colnames(data1))
   * colnames(data1) <- sub("f", "Frequency", colnames(data1))
   * colnames(data1) <- sub("meanFreq", "MeanFreq", colnames(data1))
   * colnames(data1) <- sub("()-X", "(X)", colnames(data1))
   * colnames(data1) <- sub("()-Y", "(Y)", colnames(data1))
   * colnames(data1) <- sub("()-Z", "(Z)", colnames(data1))
   * colnames(data1) <- sub("-", ".", colnames(data1))
   * colnames(data1) <- sub("AcTimeivity", "Activity", colnames(data1))

##Paso 5)
#####Con los datos del paso 4, crea una segunda base de datos independiente con el promedio de cada variable para cada actividad y cada sujeto. 

* Une la columna de voluntarios al data1

        data1<-cbind(Volunteers=volunteers,data1)
        data1[1:4,1:5]
        library(dplyr)

* Por grupo de actividad y voluntarios, saca su promedio a cada uno.

        promedio <- data1 %>% group_by(Volunteers,Activity) %>% summarise_each(funs(mean))
        head(promedio)
        write.table(promedio,row.name = FALSE,file = "correr_analisis_final.txt")
        f<- read.table(paste("correr_analisis_final.txt",sep = "/"),quote ="\"")
        f
        