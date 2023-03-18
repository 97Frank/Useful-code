list.of.packages <- c("tidyverse",
                      "haven",
                      "expss",
                      "readxl", 
                      "writexl",
                      "officer",
                      "rvg",
                      "ggrepel", 
                      "systemfonts", 
                      "rvest", 
                      "lubridate",
                      "gridExtra",
                      "flextable",
                      "qualtRics",
                      "randomForest")



new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]


if(length(new.packages)) {
  install.packages(new.packages)
}


lapply(list.of.packages, require, character.only = TRUE)


