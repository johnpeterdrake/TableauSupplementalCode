### -----------------------------------------------
### -- Download the AVA GeoJSON files

# Library to read csv files
library(csv)

# Library to download data
library(RCurl)

# Read in the region data
region_data <- read.csv("./data/reviews/region_data.csv")

# Get the urls to download
wine_region_urls <- region_data$region_code

# Download each file
for (i in 1:length(wine_region_urls)) {
  url <- paste(c("https://raw.githubusercontent.com/UCDavisLibrary/ava/master/avas/",toString(wine_region_urls[i]),".geojson"),collapse="")
  dest <- paste(c("./data/regions/",toString(wine_region_urls[i]),".geojson"),collapse="")
  download.file(url, destfile=dest, method="libcurl")
}