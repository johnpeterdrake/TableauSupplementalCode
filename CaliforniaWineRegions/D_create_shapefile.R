### -----------------------------------------------
### -- Transform GeoJSON files into a single shapefile

# Library to read csv files
library(csv)

# Library for spatial data
library(rgdal)

# Read in the region data
region_data <- read.csv("./data/reviews/region_data.csv")

# Get the urls to download
wine_region_urls <- region_data$region_code
wine_region_codes <- rep(NA,times=length(wine_region_urls))
for (i in 1:length(wine_region_urls)) {
  wine_region_codes[i] <- toString(wine_region_urls[i])
}

# List of files
files <- lapply(wine_region_codes, function(f) paste(c("./data/regions/",f,".geojson"),collapse=""))

# Read in the all files
wine_region_shp <- lapply(files, function(f) readOGR(toString(f)))

# Function to extract ava_id and coords from geojson
extract_coords <- function(shp,region_id) {
  coords <- shp@polygons[[1]]@Polygons[[1]]@coords
  Pl <- Polygon(coords)
  Pls <- Polygons(list(Pl),ID=region_id)
  return(Pls)
}

# Get all polygons and put in SpatialPolygons object
Pls <- NULL
for (i in 1:length(wine_region_shp)) {
  Pls <- c(Pls,extract_coords(wine_region_shp[[i]],i))
}
SPls <- SpatialPolygons(Pls)

# Data to put in SpatialPolygonsDataFrame
sp_data <- data.frame(1:length(SPls), region_data$avg_rating, row.names=region_data$region_id)
names(sp_data) <- c("region_id","avg_rating")

# Create the SpatialPolygonsDataFrame
sp_file <- SpatialPolygonsDataFrame(SPls, sp_data)

# Write the SpatialPolygonsDataFrame to a shapefile
writeOGR(obj=sp_file, dsn="./data/shapefile", driver="ESRI Shapefile", layer="regions")