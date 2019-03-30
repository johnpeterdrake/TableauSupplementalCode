### -----------------------------------------------
### -- Define 'superthemes' (groupings of lego themes)

## ---------------
## - Initialization

# Library to write my csv file
library(csv)

# Read in the theme data
themes <- read.csv("./data/themes.csv")


## ---------------
## - Define superthemes

# Classic
classic_sets <- c("Classic",
                  "Classic Basic",
                  "Classic Castle",
                  "Classic Space",
                  "Classic Town")

# Dinos
dino_sets <- c("Dino",
               "Dino 2010",
               "Dino Attack",
               "Dino Island",
               "Dinosaurs",
               "Jurassic Park III",
               "Jurassic World")

# Harry Potter
hp_sets <- c("Harry Potter",
             "Chamber of Secrets",
             "Goblet of Fire",
             "Order of the Phoenix",
             "Prisoner of Azkaban",
             "Sorcerer's Stone")

# Indiana Jones
ij_sets <- c("Kingdom of the Crystal Skull",
             "Raiders of the Lost Ark",
             "Temple of Doom")

# Lord of the Rings
lotr_sets <- c("The Battle of the Five Armies",
               "The Desolation of Smaug",
               "The Fellowship of the Ring",
               "The Hobbit",
               "The Lord of the Rings",
               "The Return of the King",
               "The Two Towers")

# Pirates
pirate_sets <- c("Pirates",
                 "Pirates I",
                 "Pirates II",
                 "Pirates III",
                 "Pirates of the Caribbean")

# Sports
sport_sets <- c("Basketball",
                "Hockey",
                "Soccer",
                "Sports")

# Star Wars
starwars_sets <- c("Star Wars",
                   "Star Wars Episode 1",
                   "Star Wars Episode 2",
                   "Star Wars Episode 3",
                   "Star Wars Episode 4/5/6",
                   "Star Wars Episode 7",
                   "Star Wars Episode 8")

# Superheroes
superhero_sets <- c("Avengers",
                    "Batman",
                    "Guardians of the Galaxy",
                    "Iron Man",
                    "Marvel",
                    "Spider-Man",
                    "Spider-Man 2",
                    "Super Heroes",
                    "X-Men")


## ---------------
## - Save superthemes as a csv file

# Create a data frame with each association
sets_df <- data.frame(supertheme=character(), theme=character())

# Add in each theme
sets_df <- rbind(sets_df, unname(cbind("Classic Sets",classic_sets)))
sets_df <- rbind(sets_df, unname(cbind("Dinosaur Sets",dino_sets)))
sets_df <- rbind(sets_df, unname(cbind("Harry Potter Sets",hp_sets)))
sets_df <- rbind(sets_df, unname(cbind("Indiana Jones Sets",ij_sets)))
sets_df <- rbind(sets_df, unname(cbind("Lord of the Rings Sets",lotr_sets)))
sets_df <- rbind(sets_df, unname(cbind("Pirate Sets",pirate_sets)))
sets_df <- rbind(sets_df, unname(cbind("Sports Sets",sport_sets)))
sets_df <- rbind(sets_df, unname(cbind("Star Wars Sets",starwars_sets)))
sets_df <- rbind(sets_df, unname(cbind("Superhero Sets",superhero_sets)))
names(sets_df) <- c("supertheme","theme")

# Create an 'Other Sets' category
all_sets <- unique(themes$name)
other_sets <- NULL
for (i in 1:length(all_sets)) {
  set_name <- toString(all_sets[i])
  if (!(set_name %in% sets_df$theme)) {
    other_sets <- c(other_sets,set_name)
  }
}
other_set_df <- as.data.frame(cbind("Other Sets",sort(other_sets)))
names(other_set_df) <- names(sets_df)

# Put other sets in the df
sets_df <-rbind(sets_df, other_set_df)

# Rename and save as a csv file
write.csv(sets_df,file="./data/supersets.csv", row.names=F)
