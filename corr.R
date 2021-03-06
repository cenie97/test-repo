corr <- function(directory, threshold = 0){
        files <- list.files("specdata", full.names = TRUE)
        num <- numeric()
        for (i in files) {
                data <- read.csv(i, header=T)
                com_data <- sum(complete.cases(data))
                if(com_data > threshold){
                        sulf <- data["sulfate"]
                        nitr <- data["nitrate"]
                        num <- append(num, cor(sulf,nitr, 
                                       use = "pairwise.complete.obs"))
                }
        }
        return(num)
}
        
   


###test

#cr <- corr("specdata")                
#cr <- sort(cr)                
#set.seed(868)                
#out <- round(cr[sample(length(cr), 5)], 4)
#print(out)
#0.2688  0.1127 -0.0085  0.4586  0.0447

#cr <- corr("specdata", 129)                
#cr <- sort(cr)                
#n <- length(cr)                
#set.seed(197)                
#out <- c(n, round(cr[sample(n, 5)], 4))
#print(out)
#243.0000   0.2540   0.0504  -0.1462  -0.1680   0.5969

#cr <- corr("specdata", 2000)                
#n <- length(cr)                
#cr <- corr("specdata", 1000)                
#cr <- sort(cr)
#print(c(n, round(cr, 4)))
#0.0000 -0.0190  0.0419  0.1901
