setwd("C:/Users/Brenda18/Documents/GitHub/Programacion_Actuarial_III/Caso1/specdata")
corr <- function(directorio,horizonte=0) {
    
    corfinal<- c()
        for(i in 1:332){
            if (i>=1 && i<10){
                nombre <- paste("00",i,".csv", sep="")}
            else{if(i>=10 && i< 100){
                nombre <- paste("0",i,".csv",sep="")}
            else{if(i>=100 && i< 333){
                nombre <- paste(i,".csv",sep="")}
                }
            }
        
                abrir <- read.csv(nombre) #abre los archivos asignados
        
                columna <- abrir[,2:3] #extrayendo columnas 2 y 3
                y <-complete.cases(columna) #extrayendo columnas con los casos completos(True or false)
                final <- columna[y,] # extrae las columnas completas sin los NA
                filas <- nrow(final) # cuenta los casos completos
        
        #Comparar con el horizonte
        if(filas> horizonte){ # numero de casos completos > horizonte
            sul<-c(final[,1]) # vectores con los valores de la columna sulfate
            nit <- c(final[,2]) # vectores con los valores de la columna nitrate
            
            correlacion <- cor(sul,nit)
            
            corfinal <- c(corfinal,correlacion)
        }
    }
    
    corfinal
}

#Probamos la funcion con los siguientes valores:
corr("specdata",1)
corr("specdata",250)