### -----------------------------------------------
### -- Create an indicator variable for whether a cell is initially filled

# Library to read csv files
library(csv)

# Import data
sudoku <- read.csv("./data/sudoku.csv",colClasses=c("character","character"),
                   skip=0, nrows=100000)

# Create an empty data frame
sudoku_ind <- matrix(NA, ncol=81, nrow=nrow(sudoku))

# Break into a table
t <- Sys.time()
for (i in 1:nrow(sudoku)) {
  for (j in 1:81) {
    sudoku_ind[i,j] <- ifelse(substr(sudoku$quizzes[i],j,j)==0,0,1)
  }
}
print(Sys.time()-t)

# Save the indicator table
write.csv(sudoku_ind,file="./data/sudoku_indicators.csv")