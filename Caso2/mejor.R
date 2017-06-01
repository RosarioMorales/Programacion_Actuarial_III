
setwd("C:/Users/Brenda18/Documents/GitHub/Programacion_Actuarial_III/Caso2/Archivos")
mejor <- function(estado,resultado){

    #Lectura de datos    
    abrirdoc <- read.csv("outcome-of-care-measures.csv", colClasses = "character") #abre el archivo
    estados <- abrirdoc[,7]     # toma la columna de los estados
    enfermedades <- c("ataque","falla","neumonia") #vector que guarda las 3 enfermedades
    
    #no me funcionó :(
    #ataque <- abrirdoc[,11 ]# toma la columna de los ataques
    #falla <- abrirdoc[,17]      # toma la columna de las fallas
    #neumonia <- abrirdoc[,23]   # toma la columna de la neumonia
    
    
    #Validacion de estado y resultado
    if(estado %in%estados == F) {stop("estado invalido")}
    if(resultado %in% enfermedades ==F){stop("enfermedad invalida")}
    
    #Regresa el nombre del hospital, dependiendo de la enfermedad que busques
    #ATAQUE
    if(resultado =="ataque"){
        t<-subset(abrirdoc,abrirdoc$State==estado) #Te abre los titulos
        t[,11]<-suppressWarnings(as.numeric(t[,11]))#Te toma solo los valores númericos
        valorbajo<-t[which.min(t[,11]),]#Saca el valor mas bajo de la columna de ataque
        
        hospital<-valorbajo[order(valorbajo$Hospital.Name , na.last = NA), ]#Ordena los nombres de los hospitales pero ya con la tasa mas baja
        nh<-hospital[1,2] #Toma el mejor hospital
    }
    #FALLA
    if(resultado =="falla"){
        t<-subset(abrirdoc,abrirdoc$State==estado) 
        t[,17]<-suppressWarnings(as.numeric(t[,17]))
        valorbajo<-t[which.min(t[,17]),]
        
        hospital<-valorbajo[order(valorbajo$Hospital.Name , na.last = NA), ]
        nh<-hospital[1,2]
    }
    #NEUMONIA
    if(resultado =="neumonia"){
        t<-subset(abrirdoc,abrirdoc$State==estado) 
        t[,23]<-suppressWarnings(as.numeric(t[,23]))
        valorbajo<-t[which.min(t[,23]),]
    
        hospital<-valorbajo[order(valorbajo$Hospital.Name , na.last = NA), ]
        nh<-hospital[1,2]
    }

    nh
}

mejor("TX","ataque")
mejor("TX","falla")
mejor("MD", "neumonia")
mejor("AL","neumonia")
mejor("BB","ataque")
mejor("NY","vkdv")