setwd("C:/Users/Brenda18/Documents/GitHub/Programacion_Actuarial_III/Caso1/specdata")
mediacontaminante <- function(directorio, contaminante,id = 1:332) {    

vector <- c()
    for(i in id){
        if (i>=1 && i<10){
            nombre <- paste("00",i,".csv", sep="")}
        else{if(i>=10 && i< 100){
            nombre <- paste("0",i,".csv",sep="")}
        else{if(i>=100 && i< 333){
            nombre <- paste(i,".csv",sep="")}
            }
        }
        abrir <- read.csv(nombre) #abre los archivos asignados
        columna <- abrir[,contaminante] # toma la columna asignada
        
        vector <-c(vector,columna) #guarda los valores de cada archivo para despues sacar la media
        mediaCol<- mean(vector,na.rm=T)  #Saca la media de los archivos asignados
        
    }
mediaCol
}
 
#Probamos la función con estos valores:

mediacontaminante("specdata","sulfate",5:6)
mediacontaminante("specdata","nitrate",5:6)
