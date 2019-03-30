### -----------------------------------------------
### -- Find the correlations in initial configurations

# Library to read csv files
library(csv)

# Read in the indicator matrix
sudoku_ind <- read.csv("./data/sudoku_indicators.csv")

# Compute covariance matrix
correlation_matrix <- cor(sudoku_ind)[2:82,2:82]
correlation_matrix <- correlation_matrix - diag(81)

# Reshape to a nice table
nice_table <- data.frame(matrix(NA,nrow=9^4,ncol=9))
for (i in 0:8) {
  for (j in 0:8) {
    for (k in 0:8) {
      for (l in 0:8) {
        df_row <- 9^3*i+9^2*j+9*k+l+1
        mat_row <- 9*i+j+1
        mat_col <- 9*k+l+1
        corr_val <- correlation_matrix[mat_col,mat_row]
        nice_table[df_row,] <- c(ceiling((i+1)/3),ceiling((j+1)/3),ceiling((k+1)/3),ceiling((l+1)/3),
                                 i+1,j+1,k+1,l+1,
                                 corr_val)
      }
    }
  }
}

# Give useful name to columns
names(nice_table) <- c("selected_grid_row","selected_grid_col",
                       "highlighted_grid_row", "highlighted_grid_col",
                       "selected_cell_row", "selected_cell_col",
                       "highlighted_cell_row", "highlighted_cell_col",
                       "correlation")

# Save table for use in tableau
write.csv(nice_table, file="./data/sudoku_correlations.csv")