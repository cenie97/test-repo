pollutantmean <- function(directory, pollutant, id=1:332){
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
                
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
                
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
                
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)        
        
        # save the list files into a single vector
        files <- list.files("specdata", full.names = TRUE)
        
        # initialize a vector to hold pollutant data
        dat <- data.frame()
        # find all files in the specdata folder
        for(i in id){
                dat <- rbind(dat,read.csv(files[i]))
        } 
        dat1 <- dat[,pollutant]
        dat2 <- mean(dat1, na.rm=TRUE)
        return(round(dat2, 3)) 
}


# tests
#pollutantmean("specdata", "sulfate", 1:10) == 4.064
#pollutantmean("specdata", "nitrate", 70:72) == 1.706
#pollutantmean("specdata", "sulfate", 34) == 1.477
#pollutantmean("specdata", "nitrate") ==  1.703


