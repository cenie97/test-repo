complete <- function(directory, id = 1:332) {
        files <- list.files("specdata", full.names = TRUE)
        dat <- data.frame()
        nobsNum <- numeric()
        for(i in id){
                dat <- read.csv(files[i])
                dat1 <- subset(dat,!is.na(dat[,2]) & !is.na(dat[,3]))
                nobsNum <- c(nobsNum, nrow(dat1))
        }
        data.frame(id = id, nobs = nobsNum)
}



# test
#source("complete.R")
#complete("specdata", 1)
#complete("specdata", c(2, 4, 8, 10, 12))
#complete("specdata", 30:25) 
#complete("specdata", 3)

#cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
#print(cc$nobs)
# Answer: 228 148 124 165 104 460 232

#cc <- complete("specdata", 54)
#print(cc$nobs)
# Answer: 219

#set.seed(42)
#cc <- complete("specdata", 332:1)
#use <- sample(332, 10)
#print(cc[use, "nobs"])
# Answer: 711 135 74 445 178 73 49 0 687 237