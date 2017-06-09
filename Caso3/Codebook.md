---
title: "CodeBook"
author: "Arian Yazmin Escobar Sandoval,Dulce Angélica Hernandez Quiris, Gustavo Gammaliel Rodríguez Gómez, Rosario Morales Vázquez"
date: "9 de junio de 2017"
output: html_document
---

# Reconocimiento de Actividad Humana con Celulares

### Descripción de la base de datos:

Los experimentos se han llevado a cabo con un grupo de 30 voluntarios dentro de un grupo de edad de 19-48 años. Cada persona realizó seis actividades (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) con un teléfono inteligente (Samsung Galaxy S II) en la cintura. Utilizando su acelerómetro y giroscopio incorporados, capturamos la aceleración lineal 3-axial y la velocidad angular 3-axial a una velocidad constante de 50Hz. Los experimentos se han grabado en video para etiquetar los datos manualmente. El conjunto de datos obtenido ha sido dividido aleatoriamente en dos conjuntos, donde se seleccionó el 70% de los voluntarios para generar los datos de entrenamiento y el 30% de los datos de la prueba.

Las señales de los sensores (acelerómetro y giroscopio) fueron preprocesadas aplicando filtros de ruido y luego muestreadas en ventanas correderas de 2,56 seg. Y 50% de superposición (128 lecturas / ventana). La señal de aceleración del sensor, que tiene componentes de movimiento gravitatorio y del cuerpo, se separó usando un filtro de paso bajo de Butterworth en la aceleración del cuerpo y la gravedad. Se supone que la fuerza gravitatoria sólo tiene componentes de baja frecuencia, por lo que se utilizó un filtro con una frecuencia de corte de 0,3 Hz. A partir de cada ventana, se obtuvo un vector de características calculando variables del dominio de tiempo y frecuencia. Consulte "features_info.txt" para obtener más detalles.

###Para cada registro se proporciona

- Triaxial aceleration  del acelerómetro (aceleración total) y la aceleración estimada del cuerpo.
- Triaxial angular velocity del giroscopio.
- Un vector de 561 características con variables de dominio de tiempo y frecuencia.
- Su etiqueta de actividad.
- Un identificador del sujeto que realizó el experimento.
    

###Dataset incluye los siguientes archivos:

- 'README.Rmd'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

###Los siguientes archivos están disponibles para training y test. Sus descripciones son equivalentes.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


###El conjunto de variables que se estimaron a partir de estas señales son:

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Vectores adicionales obtenidos promediando las señales en una muestra de ventana de señal. Estos se utilizan en la variable angle ():

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

La lista completa de variables de cada vector pueden verse en el archivo "features.txt"


## Cambios realizados: 

Para el propósito del programa que es:

1) Une los datos de test con los de training, para crear un solo conjunto de 

2) Extraer únicamente las medidas de media y desviación estándar de cada medición.

3) Usar nombres de actividad para describir los nombres de las actividades en la base de
datos.

4) Colocar etiquetas apropiadas en la base de datos con nombres de variables que las
describan.

5) Crear una segunda base de datos independiente con el promedio
de cada variable para cada actividad y cada sujeto.

###Únicamente cambiamos los títulos para leerlos de una mejor manera, extrayendo las medidas que tienen
media y desviación estándar, logrando lo siguiente:
    
por ejemplo:
la medida fodyBodyGyroJerkMag-meanFreq() tiene como propiedad 
el promedio, cambiamos "meanFreq" por "MeanFreq"

Estas son las terminaciones del nombre de las variables 


"mean" cambiando a  "Mean"
"t" cambiando a "Time"
"sTimed"  cambiando a "Std"
"f" cambiando a "Frequency"
"meanFreq" cambiando a "MeanFreq"
"()-X" cambiando a "(X)"
"()-Z" cambiando a "(Z)"
"-" cambiando a ".", 
"AcTimeivity" cambiando a "Activity"

El códido detallado lo pueden leer en el archivo "README.md"
