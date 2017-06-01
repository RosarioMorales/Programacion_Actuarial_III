setwd("C:/Users/Brenda18/Documents/GitHub/Programacion_Actuarial_III/Caso2/Archivos")
rankingcompleto<-function(resultado,num="mejor"){
   
#Lectura de datos
    abrirdoc <- read.csv("outcome-of-care-measures.csv", colClasses = "character") #abre el archivo
    estados <- levels(factor(abrirdoc[,7]))# toma la columna de los estados
    enfermedades <- c("ataque","falla","neumonia") #vector que guarda las 3 enfermedades
    
#Validacion de resultado
    if(resultado %in% enfermedades ==F){stop("enfermedad invalida")}

#Ubica la columna dependiendo del resultado
    if (resultado == "ataque") { col<- 11}
    if (resultado == "falla") { col<-  17}
    if (resultado == "neumonia") {col <- 23}

 vec<- vector()
    
    if(num=="mejor"){
        num<-1
    }
    separa <- split(abrirdoc,abrirdoc[,7]) #divide los elementos de un vector
    if( is.numeric(num)==T){
        for (i in 1:length(estados)) { #longitud 
            s <- separa[[i]]
            s[,col]<-suppressWarnings(as.numeric(s[,col]))
            cual <- order(s[,col],s[,2])
            hospitales <- s[cual,2]
            regresar <- hospitales[num]
            vec <- c(vec,regresar)
        }
    } else if(num=="peor") {
        num <- 1
        for (i in 1:length(estados)) {
            s <- separa[[i]]
            s[,col]<-suppressWarnings(as.numeric(s[,col]))
            cual <- order(s[,col],s[,2],decreasing = T)
            hospitales <- s[cual,2]
            regresar <- hospitales[num]
            vec <- c(vec,regresar)
        }
    }
    
    tabla <- data.frame(vec,names(separa))
    names(tabla)<-c("hospital","state")
    rownames(tabla) <- names(separa)
    tabla
    
}

head(rankingcompleto("ataque", 20), 10) 
tail(rankingcompleto("neumonia", "peor"), 3)
tail(rankingcompleto("falla"), 10) 