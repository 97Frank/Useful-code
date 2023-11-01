# path/to/your/scrape_tradera_title_and_price.R

# Purpose: This script scrapes the title and price of an object from a specific URL on tradera.com using R

# Load required libraries
library(rvest)
library(tidyverse)
library(stringr)

# Function to scrape the title and price using CSS selectors
scrape_title_and_price_with_css <- function(url, title_selector, price_selector, date_selector) {
  # Purpose: Scrape the title and price of an object from tradera.com using CSS selectors
  # Input: URL of the page to scrape, CSS selectors to the target elements
  # Output: Data frame containing the title and price
  
  page <- read_html(url)
  
  # Use CSS selectors to scrape the title and price
  title_data <- page %>% html_nodes(css = title_selector) %>% html_text()
  price_data <- page %>% html_nodes(css = price_selector) %>% html_text()
  date_data <- page %>% html_nodes(css = date_selector) %>% html_text()
  
  
  # Combine into a data frame
  data <- data.frame(Title = title_data, Price = price_data, Date = date_data)
  
  return(data)
}

# Main script
main <- function() {
  # Purpose: Main function to scrape the title and price of an object from tradera.com
  
  url <- "https://www.tradera.com/category/100201?fromPrice=1000"
  title_selector <- ".text-truncate-two-lines"
  price_selector <- "span[data-testid='price']"
  Image_URL <- ".item-card-image_fill-aspect-ratio__fgi0B"
  date_selector <- ".item-card-animate-time"
  Buy_Now_Label <- "span[data-testid='fixedPriceLabel']"
  Badges <- ".item-card-bottom-badges"
  
  data <- scrape_title_and_price_with_css(url, title_selector, price_selector, date_selector)
  
  # Print the scraped data
  print(data)
}

# Run the main function
d<-main()
