---
title: "CodeBook"
author: "Arian Yazmin Escobar Sandoval,Dulce Ang�lica Hernandez Quiris, Gustavo Gammaliel Rodr�guez G�mez, Rosario Morales V�zquez"
date: "9 de junio de 2017"
output: html_document
---

# Reconocimiento de Actividad Humana con Celulares

### Descripci�n de la base de datos:

Los experimentos se han llevado a cabo con un grupo de 30 voluntarios dentro de un grupo de edad de 19-48 a�os. Cada persona realiz� seis actividades (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) con un tel�fono inteligente (Samsung Galaxy S II) en la cintura. Utilizando su aceler�metro y giroscopio incorporados, capturamos la aceleraci�n lineal 3-axial y la velocidad angular 3-axial a una velocidad constante de 50Hz. Los experimentos se han grabado en video para etiquetar los datos manualmente. El conjunto de datos obtenido ha sido dividido aleatoriamente en dos conjuntos, donde se seleccion� el 70% de los voluntarios para generar los datos de entrenamiento y el 30% de los datos de la prueba.

Las se�ales de los sensores (aceler�metro y giroscopio) fueron preprocesadas aplicando filtros de ruido y luego muestreadas en ventanas correderas de 2,56 seg. Y 50% de superposici�n (128 lecturas / ventana). La se�al de aceleraci�n del sensor, que tiene componentes de movimiento gravitatorio y del cuerpo, se separ� usando un filtro de paso bajo de Butterworth en la aceleraci�n del cuerpo y la gravedad. Se supone que la fuerza gravitatoria s�lo tiene componentes de baja frecuencia, por lo que se utiliz� un filtro con una frecuencia de corte de 0,3 Hz. A partir de cada ventana, se obtuvo un vector de caracter�sticas calculando variables del dominio de tiempo y frecuencia. Consulte "features_info.txt" para obtener m�s detalles.

###Para cada registro se proporciona

- Triaxial aceleration  del aceler�metro (aceleraci�n total) y la aceleraci�n estimada del cuerpo.
- Triaxial angular velocity del giroscopio.
- Un vector de 561 caracter�sticas con variables de dominio de tiempo y frecuencia.
- Su etiqueta de actividad.
- Un identificador del sujeto que realiz� el experimento.
    

###Dataset incluye los siguientes archivos:

- 'README.Rmd'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

###Los siguientes archivos est�n disponibles para training y test. Sus descripciones son equivalentes.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


###El conjunto de variables que se estimaron a partir de estas se�ales son:

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

Vectores adicionales obtenidos promediando las se�ales en una muestra de ventana de se�al. Estos se utilizan en la variable angle ():

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

La lista completa de variables de cada vector pueden verse en el archivo "features.txt"


## Cambios realizados: 

Para el prop�sito del programa que es:

1) Une los datos de test con los de training, para crear un solo conjunto de 

2) Extraer �nicamente las medidas de media y desviaci�n est�ndar de cada medici�n.

3) Usar nombres de actividad para describir los nombres de las actividades en la base de
datos.

4) Colocar etiquetas apropiadas en la base de datos con nombres de variables que las
describan.

5) Crear una segunda base de datos independiente con el promedio
de cada variable para cada actividad y cada sujeto.

###�nicamente cambiamos los t�tulos para leerlos de una mejor manera, extrayendo las medidas que tienen
media y desviaci�n est�ndar, logrando lo siguiente:
    
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

El c�dido detallado lo pueden leer en el archivo "README.md"
