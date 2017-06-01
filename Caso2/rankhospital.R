setwd("C:/Users/Brenda18/Documents/GitHub/Programacion_Actuarial_III/Caso2/Archivos")
rankhospital <- function(estado,resultado,num="mejor"){

#Lectura de datos    
    abrirdoc <- read.csv("outcome-of-care-measures.csv", colClasses = "character") #abre el archivo
    estados <- abrirdoc[,7]     # toma la columna de los estados
    enfermedades <- c("ataque","falla","neumonia") #vector que guarda las 3 enfermedades

#Validacion de estado y resultado
    if(estado %in% estados == F) {stop("estado invalido")}
    if(resultado %in% enfermedades ==F){stop("enfermedad invalida")}
        
#Regresa el nombre del hospital comparando(mejor,peor, numero)
        if (resultado == "ataque") { col<- 11}
        if (resultado == "falla") { col<-  17}
        if (resultado == "neumonia") {col <- 23}
        
        s<-subset(abrirdoc,abrirdoc$State==estado) #Te abre el archivos y busca el titulo indicado
        s[,col]<-suppressWarnings(as.numeric(s[,col])) #Te toma solo los valores numéricos
        
        if(num == "peor"){
            valor<-s[which.max(s[,col]),] #Obtiene el valor mas alto
            hospital<-valor[order(valor$Hospital.Name , na.last = NA), ]
            nh<-hospital[1,2] #Toma el mejor hospital
            nh
        }else if(num== "mejor"){
            valor<-s[which.min(s[,col]),] #Obtiene el valor mas bajo
            hospital<-valor[order(valor$Hospital.Name , na.last = NA), ]
            nh<-hospital[1,2] #Toma el peor hospital
            nh
        } else {
            valor<- s[(s[,col]),]
            cual <- order(s[,col],s[,2])#Obtiene un numero
            hospitales <- s[cual,2]
            regresar <- hospitales[num]
            regresar
        }
    }

rankhospital("TX", "falla", 4)
rankhospital("MD", "ataque", "peor")
rankhospital("MN", "ataque", 5000)