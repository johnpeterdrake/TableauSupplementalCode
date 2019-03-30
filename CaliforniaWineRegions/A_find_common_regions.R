### -----------------------------------------------
### -- Determine appropriate regions to show

# Library to read csv files
library(csv)

# Read in the reviews
wine_reviews <- read.csv("./data/reviews/winemag-data-130k-v2.csv")

# Only use California data
wine_cali <- wine_reviews[wine_reviews$province=="California",]

# Get the top 20 real wine regions
#  Note: I don't use the 'California' region or individual counties since they don't have shapefiles
wine_region_list <- sort(names(summary(wine_cali[wine_cali$region_1!="California" & !(grepl("County",wine_cali$region_1)),]$region_1)[1:20]))

# Create a subset of the wine_cali data frame
wine_cali_sub <- wine_cali[wine_cali$region_1 %in% wine_region_list,]

# Write the subset to a csv file
write.csv(wine_cali_sub,file="./data/reviews/wine_cali_subset.csv",row.names=F)