setwd("C:/Users/Brenda18/Documents/GitHub/Programacion_Actuarial_III/Caso1/specdata")
completos <- function(directorio,id = 1:332) {
    
    vecid<- c() #vector que contará los id
    vectotal <- c() #vector que contará las filas de casos completos
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
       
                columnas <- abrir[,2:3] #extraemos columnas 2 y 3
                y <-complete.cases(columnas) #extrayendo columnas con los casos completos(True or false) Vector logico
                final <- columnas[y,] # extrae los datos completos de las dos columnas
       
                filas <- nrow(final) # cuenta los casos completos
       
                vecid <- c(vecid,i) # almacena los id
                vectotal <- c(vectotal,filas) # almacena el numero de casos completos
        }
    
        tabla <- data.frame(id=vecid,nobs=vectotal) 
        tabla
}


#Probamos la funcion con los sigientes datos:
 completos("specdata",1:10)       
    