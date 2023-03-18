# Load required packages
library(dplyr)
library(stringr)
library(tidyverse)

# Load the data
data1 <- read.csv("C:/Users/osfr/Downloads/activity.csv", header = TRUE, sep = ",")

# Clean column names
names(data1) <- gsub("[^[:alnum:]]", "", tolower(names(data1)))

# Convert Datum to date format
data1$datum <- as.Date(data1$datum, format = "%m/%d/%Y")

# Clean Belopp column
data1$belopp <- gsub(",", ".", gsub("[^0-9,-]", "", data1$belopp))
data1$belopp <- as.numeric(data1$belopp)

# Remove leading/trailing white spaces in columns
data1$beskrivning <- trimws(data1$beskrivning)
data1$kortmedlem <- trimws(data1$kortmedlem)
data1$konto <- trimws(data1$konto)

# Separate the beskrivning column into two columns: Description and City
data1 <- data1 %>% 
  mutate(City = str_extract(beskrivning, "\\w+$"), # extract city name using regex
         beskrivning = str_remove(beskrivning, paste0("\\s", City, "$"))) # remove city name from description



data1$category <- NA  # Create a new column to store the categories

for (i in 1:nrow(data1)) {
  cat("Transaction description:", data1$beskrivning[i], "\n")
  cat("Transaction amount:", data1$belopp[i], "\n")
  cat("Please input the category for this transaction (press Enter when done):\n")
  category <- readline()
  data1$category[i] <- category
}

feq <- as.data.frame(table(unlist(str_split(str_trim(data1$beskrivning), pattern = " "))))

  



library(readxl)
transactions <- read_excel("C:/Users/osfr/Desktop/trans.xlsx")

summary(transactions)
