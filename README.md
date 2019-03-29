# Tableau Code

## Overview

Before connecting a dataset to Tableau I typically have to clean and process the data to a usable form using R (or Python). The code for each Tableau project is stored in this repo.

My Tableau profile is https://public.tableau.com/profile/jonathan.drake

## Projects

### California Wine Regions

Viz: https://public.tableau.com/profile/jonathan.drake#!/vizhome/CaliforniaWineRegions/CaliforniaWineRatings

Ratings data was downloaded from Kaggle here: https://www.kaggle.com/zynicide/wine-reviews. The file used was 'winemag-data-130k-v2.csv'. I filtered for California ratings and found the 20 regions in the column 'Region_1' that had the most ratings. However, I filtered out 'California' and 'County' level ratings from the 'Region_1' column since they didn't correspond to any particular AVA. I computed the average rating for wines from each region and saved them as a csv file.

GeoJSON files for each region were downloaded from GitHub here: https://github.com/UCDavisLibrary/ava/tree/master/avas. I read each into R and collected all into a SpatialPolygonsDataFrame along with their average rating. The SpatialPolygonsDataFrame was saved as a shapefile.


### Initial Sudoku Configurations

Viz: https://public.tableau.com/profile/jonathan.drake#!/vizhome/sudoku_viz/SudokuStartingCorrelations

The initial configurations for 1 million sudokus as well as their solutions were downloaded from Kaggle here: https://www.kaggle.com/bryanpark/sudoku.

I read the sudokus from the csv file into R. I only read in the first 100,000 sudokus since it was taking too long. I converted the 'quizzes' field into 81 indicator variables: 1 if the cell was initially filled and 0 if the cell was initially empty. I found the correlation matrix for the indicator variables, but I changed the diagonal values from 1 to 0 so the colour scale would have more contrast. I converted the correlation matrix to a table to make it easier to plot in Tableau and saved the table as a csv file.


### Lego Theme Colour Visualization

Viz: https://public.tableau.com/profile/jonathan.drake#!/vizhome/lego_viz/ColorBySupertheme

I used R to create a csv file grouping themes together into 'superthemes' so their colour composition could be compared.

I also used R to create an XML file to define a custom colour palette in Tableau.



