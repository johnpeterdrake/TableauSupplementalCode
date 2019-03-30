### -----------------------------------------------
### -- Create a custom colour palette for Tableau

## ---------------
## - Initialization

# Library to read csv files
library(csv)

# Library to write the XML file
library(XML)

# Import all necessary data
themes <- read.csv("./data/themes.csv")
sets <- read.csv("./data/sets.csv")
inventories <- read.csv("./data/inventories.csv")
inventory_parts <- read.csv("./data/inventory_parts.csv")
colors <- read.csv("./data/colors.csv")


## ---------------
## - Only include colours that are used in an inventory

# Get a list of all the colours that are used
all_themes <- themes$id
all_sets <- unique(sets[sets$theme_id %in% all_themes,]$set_num)
all_inventories <- unique(inventories[inventories$set_num %in% all_sets,]$id)
all_parts <- unique(inventory_parts[inventory_parts$inventory_id %in% all_inventories,]$color_id)
all_colours <- unique(colors[colors$id %in% all_parts,]$rgb)


## ---------------
## - Sort the colours the way Tableau does

# Regex to find where the first letter is
first_letter <- regexpr("([A-Z]+).*$",all_colours)

# Create data frame by where the first letter is
colour_df <- data.frame(all_colours,first_letter)

# Sort first by where the first letter is, then string
colour_df$first_letter <- ifelse(colour_df$first_letter==-1,9,colour_df$first_letter)
colour_df$first_letter <- ifelse(colour_df$first_letter==1,99,colour_df$first_letter)
colour_df <- colour_df[order(colour_df$first_letter,colour_df$all_colours),]

# Redefine 'all_colours' to only include colours that are used in at least one inventory
all_colours <- colour_df$all_colours


## ---------------
## - Generate the XML file

# String that I will parse to XML later
xml_color <- "<workbook>
<preferences>
<color-palette name='JD' type='ordered sequential'>"

# Add colours to the XML string
for (i in 1:length(all_colours)) {
  new_line <- paste(c("\t\t<color>#",toString(all_colours[i]),"</color>"),collapse="")
  xml_color <- paste(xml_color,new_line,sep="")
}

# Close the tags in the XML string
xml_color <- paste(xml_color, "</color-palette></preferences></workbook>",sep="")

# Parse to XML tree
xml_color_tree <- xmlTreeParse(xml_color)

# Save as an XML doc
saveXML(xml_color_tree$doc$children$workbook,file="./Preferences.tps")
