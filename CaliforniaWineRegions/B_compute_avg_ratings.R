### -----------------------------------------------
### -- Compute the average ratings for each region

# Library to read csv files
library(csv)

# Read in the wine cali file
wine_cali_sub <- read.csv("./data/reviews/wine_cali_subset.csv")

# Recreate the wine_region_list
wine_region_list <- sort(names(summary(wine_cali_sub$region_1)))

# wine_region_codes are the names of the GeoJSON files in the GitHub repo:
# https://github.com/UCDavisLibrary/ava/tree/master/avas
wine_region_codes <- c("alexander_valley",
                       "anderson_valley",
                       "los_carneros",
                       "central_coast",
                       "dry_creek_valley",
                       "edna_valley",
                       "livermore_valley",
                       "lodi",
                       "napa_valley",
                       "paso_robles",
                       "russian_river_valley",
                       "rutherford",
                       "santa_cruz_mountains",
                       "santa_lucia_highlands",
                       "santa_maria_valley",
                       "santa_ynez_valley",
                       "sierra_foothills",
                       "sonoma_coast",
                       "sonoma_valley",
                       "sta__rita_hills")

# ID for each region
wine_region_id <- 1:length(wine_region_codes)

# Create a data frame with average ratings for each region
region_data <- data.frame(wine_region_id)
region_data$region_code <- wine_region_codes
region_data$region_name <- wine_region_list
names(region_data) <- c("region_id","region_code","region_name")

# Insert a new column with average rating
for (i in 1:nrow(region_data)) {
  region <- toString(region_data[i,"region_name",])
  ratings <- wine_cali_sub[wine_cali_sub$region_1==region,"points"]
  region_data[i,"avg_rating"] <- mean(ratings)
}

# Save output as a csv file
write.csv(region_data,file="./data/reviews/region_data.csv",row.names=F)