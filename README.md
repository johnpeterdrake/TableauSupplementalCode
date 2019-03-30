# Tableau Code

## Purpose of Repository

Before connecting a dataset to Tableau I typically have to clean and process the data to a usable form using R (or Python). The code for each Tableau project is stored in this repo.

Note that each file is prefaced by a capital letter. The letter indicates the order I recommend the files are run in. Later files often require the outputs of earlier files in order to run. Also note that in order to save space I don't include any data in this repo. I've left instructions in each section explaining how to use the code.

My Tableau profile is https://public.tableau.com/profile/jonathan.drake


## Tableau Projects

### California Wine Regions

#### Overview

Wine ratings data were downloaded from Kaggle (link in instructions). I filtered for California ratings and found the 20 regions in the column 'Region_1' that had the most ratings. However, I filtered out 'California' and 'County' level ratings from the 'Region_1' column since they didn't correspond to any particular AVA. I computed the average rating for wines from each region and saved them as a csv file.

GeoJSON files for each region are downloaded using R from a UC Davis Library GitHub repo (link is in the R code). I read each into R and collected all into a SpatialPolygonsDataFrame along with their average rating. The SpatialPolygonsDataFrame was saved as a shapefile.

#### Instructions

Download the 'CaliforniaWineRegions' directory and create a folder called 'data' inside it. In the 'data' folder create three subfolders: 'regions', 'reviews', and 'shapefile'. Download the file 'winemag-data-130k-v2.csv' from https://www.kaggle.com/zynicide/wine-reviews and place it in the 'reviews' folder. Run the files in alphabetical order.

#### Final Product

https://public.tableau.com/profile/jonathan.drake#!/vizhome/CaliforniaWineRegions/CaliforniaWineRatings


### Initial Sudoku Configurations

#### Overview

The initial configurations for 1 million sudokus as well as their solutions were downloaded from Kaggle (link in instructions); however, I only used the first 100,000 since processing all 1 million took too long.

I read the sudokus from the csv file into R. I converted the 'quizzes' field into 81 indicator variables: 1 if the cell was initially filled and 0 if the cell was initially empty. I found the correlation matrix for the indicator variables, but I changed the diagonal values from 1 to 0 so the colour scale would have more contrast. I converted the correlation matrix to a table to make it easier to plot in Tableau and saved the table as a csv file.

#### Instructions

Download the 'InitialSudokuConfigurations' directory and create a folder called 'data' inside it. Download the sudoku data from https://www.kaggle.com/bryanpark/sudoku and place it in the 'data' folder. Run the files in alphabetical order.

#### Final Product

https://public.tableau.com/profile/jonathan.drake#!/vizhome/sudoku_viz/SudokuStartingCorrelations


### Lego Theme Colour Visualization

#### Overview

Lego theme, set, inventory, and piece data were downloaded from Kaggle (link below).

I used R to create a csv file grouping themes together into 'superthemes' so their colour composition could be compared. I also used R to create an XML file to define a custom colour palette in Tableau.

#### Instructions

Download the 'LegoThemeColours' directory and create a folder called 'data' inside it. Download the lego data from https://www.kaggle.com/rtatman/lego-database and place all files in the 'data' folder. Run the files in alphabetical order.

#### Final Product

https://public.tableau.com/profile/jonathan.drake#!/vizhome/lego_viz/ColorBySupertheme
